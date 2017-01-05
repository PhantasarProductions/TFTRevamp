--[[
  Achievements.lua
  Version: 17.01.05
  Copyright (C) 2016, 2017 Jeroen Petrus Broks
  
  ===========================
  This file is part of a project related to the Phantasar Chronicles or another
  series or saga which is property of Jeroen P. Broks.
  This means that it may contain references to a story-line plus characters
  which are property of Jeroen Broks. These references may only be distributed
  along with an unmodified version of the game. 
  
  As soon as you remove or replace ALL references to the storyline or character
  references, or any termology specifically set up for the Phantasar universe,
  or any other univers a story of Jeroen P. Broks is set up for,
  the restrictions of this file are removed and will automatically become
  zLib licensed (see below).
  
  Please note that doing so counts as a modification and must be marked as such
  in accordance to the zLib license.
  ===========================
  zLib license terms:
  This software is provided 'as-is', without any express or implied
  warranty.  In no event will the authors be held liable for any damages
  arising from the use of this software.
  Permission is granted to anyone to use this software for any purpose,
  including commercial applications, and to alter it and redistribute it
  freely, subject to the following restrictions:
  1. The origin of this software must not be misrepresented; you must not
     claim that you wrote the original software. If you use this software
     in a product, an acknowledgment in the product documentation would be
     appreciated but is not required.
  2. Altered source versions must be plainly marked as such, and must not be
     misrepresented as being the original software.
  3. This notice may not be removed or altered from any source distribution.
]]
-- @USEDIR Script/Netwerk
-- @USE /SCRIPT/USE/SPECIFIC/SCROLLER.LUA

-- @DEFINE ACH_VAL_DEBUG

achievementscript = true

achoutput = {}

RatingByType = {Bronze=5,Silver=10,Gold=20,Platinum=50}

iCheck = Image.Load('GFX/Achievements/Check.png')


function Validate()   
   valid = {}
   rating = { total = 0, have = 0, procent = 0}
   local show = { Always = function(k,a) return true end, Never = function(k,a) return false end, Achieved = function(k,a) return Achieved[k]~=nil end}
   for k,a in pairs(achievements) do
       local allow = true       
       allow = allow and a['skill'..skill]
       if CVV("&NEWGAMEPLUS") then allow = allow and a.NewGamePlus else allow = allow and a.NormalGame end
       allow = allow and show[a.Show](k,a)
       -- @IF ACH_VAL_DEBUG
       CSay('- Validating '..k..' resulted into '..sval(allow))
       CSay('  = Available for skill '..skill..' > '..sval(a['skill'..skill]))
       CSay('  = New Game Plus > '..sval(CVV('&NEWGAMEPLUS')).."/"..sval(a.NewGamePlus))
       CSay('  = Normal Game > '..sval(a.NormalGame))
       -- @FI
       if allow then 
         valid[k] = a 
         rating.total = rating.total + RatingByType[a.Type]
         if achieved[k] then rating.total = rating.total + RatingByType[a.Type] end
         end  
   end
   CSay("Achievements revalidated >> "..serialize('rating',rating))
end


function GALE_OnLoad()
   achievements = JINC("Script/JINC/Big/Achievements.lua")
   Achieved = Achieved or {}
   achieved = Achieved
   AchIcons = {}
   -- The next table will only work when the required networks are loaded. If not, nothing will be added to it.
   Netwerk = {}
   -- @IF *GAMEJOLT
   Netwerk['Game Jolt'] = { link = GameJoltAchievements, award =   GJ.Award }
   -- @FI
   -- @IF *ANNA
   Netwerk.Anna         = { link = AnnaAchievements,     award = Anna.Award }
   -- @FI
   Validate()
end



function Synchronize()
    for t,_ in spairs(Achieved) do
        for key,dat in spairs(Netwerk) do
            CSay(" = Synchronzing '"..achievements[t].Title.."' on "..key)
            Console.Show()
            Console.Flip()
            dat.award(dat.link[tag])
        end
    end
    CSay('All Done - Hit any key to close this program')
    Console.Show()
    Console.Flip()
    repeat
        INP.Grab()
        for i=1,255 do 
            if INP.KeyH(i)==1 then os.exit() end
        end
    until false        -- Dirty code straight from hell this line, but it works... OK?          
end


function Award(tag)
    -- Does this achievement actually exist?
    assert(achievements[tag],"There is no achievement named '"..tag.."'")
    -- Achieve stuff
    if Achieved[tag] then return end -- Let's not achieve again, what we already achieved.
    Achieved[tag] = Time.Date()..";  "..Time.Time()
    CSay("- Awarded: "..tag)
    CSay("  = "..Achieved[tag])
    -- Contact the networks if available
    for key,dat in spairs(Netwerk) do
        CSay(" = Contacting "..key)
        dat.award(dat.link[tag])
    end
    -- Creating the output!    
    local high = SH + 500
    for ao in each(achoutput) do
        if ao>high - 100 then high = ao + 100 end
    end
    achoutput[#achoutput+1] = {
                                   tag  = tag,
                                   y    = high,
                                   d    = achievements[tag],
                                   fnsh = 20,
                                   fnds = 10
                              }
    Validate()                              
end

function AchFlip() -- Will be called by the flipping routine
    local remove = {}
    Image.SetAlphaPC(100)
    for i,a in pairs(achoutput) do
        a.y = a.y - 1
        if a.y<-200 then remove[#remove+1]=i end -- Removing immediately does not work very well during iteration in Lua.
        Box(100,a.y,SW-200,50,nil,{x=100,y=a.y})
        Image.Font('Fonts/Coolvetica.ttf',a.fnsh); if Image.Textwidth(a.d.Title)      >SW-250 then a.fnsh = a.fnsh - 1 end -- Out the borders protections
        DarkText(a.d.Title      ,125,a.y+5,0,0,255,255,255)
        Image.Font('Fonts/Coolvetica.ttf',a.fnds); if Image.Textwidth(a.d.Description)>SW-250 then a.fnds = a.fnds - 1 end -- Out the borders protections
        DarkText(a.d.Description,125,a.y+30,0,0,255,180,0)        
    end
    for r in each(remove) do achoutput[r] = nil end -- For this reason NO ipairs, but pairs above!!!
    white()
end

function AchList(argstring)
   local myargf = loadstring('return { '..argstring..' }')
   local myarg  = myargf()
   Scroller(myarg.tag,myarg.x,myarg.y,myarg.w,myarg.h)
   local y = 5
   local c = 200 + (math.sin(Time.MSecs()/100)*55)
   local down = scrollers[myarg.tag].down
   for k,data in spairs(valid) do
       if Achieved[k] then
          white()
          if not data.icon then -- Load icon if we don't have one yet 
             if y-down<myarg.h and y-down>-50 then -- (to save time, only load  and show icons if they are actually shown in the screen range)
                data.icon = iCheck -- Use checkbox for default.
                local f = 'GFX/achievements/'..k..".png"
                if JCR6.Exists(f)==1 then data.icon = Image.Load(f) end 
             end
          else
             Image.Show(data.icon,10,y)   
          end
          Image.Font('Fonts/Coolvetica.ttf',10)
          DarkText(Achieved[k],myarg.w-10,y+42,1,1,180,255,0)
       end
       data.hfs = data.hfs or 20; Image.Font('Fonts/Coolvetica.ttf',data.hfs); if Image.TextWidth(data.Title      )>myarg.w-10 then data.hfs=data.hfs-1 end
       DarkText(data.Title      ,45,y+00,0,0,255,255,255)
       data.dfs = data.dfs or 10; Image.Font('Fonts/Coolvetica.ttf',data.dfs); if Image.TextWidth(data.Description)>myarg.w-10 then data.dfs=data.dfs-1 end
       DarkText(data.Description,45,y+25,0,0,255,180,0)
       color(c,c,c)
       Image.Line(5,y+40,myarg.w-5,y+40)
       y = y + 45
       ScrollMax(myarg.tag,y)
   end
   EndScroller(myarg.tag)
end 


function AchByKill()
  local num = CVV('%KILLS')
  for k,data in spairs(valid) do
      if prefixed(k,"KILL") then 
         local kill = Sys.Val(right(k,#k-4))
         if num>kill then Award(k) end
       end  
  end
end  

function AchByVictories()
  local num = CVV('%VICTORIES')
  for k,data in spairs(valid) do
      if prefixed(k,"VIC") then 
         local kill = Sys.Val(right(k,#k-3))
         if num>kill then Award(k) end
       end  
  end
end  
