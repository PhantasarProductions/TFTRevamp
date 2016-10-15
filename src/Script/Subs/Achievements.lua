--[[
  Achievements.lua
  Version: 16.10.15
  Copyright (C) 2016 Jeroen Petrus Broks
  
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

achievementscript = true

achoutput = {}



function GALE_OnLoad()
   achievements =  JINC("Script/JINC/Big/Achievements.lua")
   Achieved = Achieved or {}
   AchIcons = {}
   -- The next table will only work when the required networks are loaded. If not, nothing will be added to it.
   Netwerk = {}
   -- @IF *GAMEJOLT
   Netwerk.GameJolt = { link = GameJoltAchievements, award =   GJ.Award }
   -- @FI
   -- @IF *ANNA
   Netwerk.Anna     = { link = AnnaAchievements,     award = Anna.Award }
   -- @FI
end


function Award(tag)
    -- Does this achievement actually exist?
    assert(achievements[tag],"There is no achievement named '"..tag.."'")
    -- Achieve stuff
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
                                  
end

function AchFlip() -- Will be called by the flipping routine
    local remove = {}
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
end
