--[[
  Console.lua
  Version: 17.10.20
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

-- TFT REVAMPED

function DELISTO() WorldMap('Delisto') end
function KOKONORA() WorldMap('Kokonora') end

function ONEFORALL()
  for foeid in ICHARS() do
     if prefixed(foeid,'FOE_') then RPGChar.Points(foeid,"HP").Have=1 CSay("Affected: "..foeid) else CSay('Skipped: '..foeid) end
  end
end   

function IDDQD()
   Toggle('&CHEAT.GOD')
   CSay("God mode is now "..({TRUE='On',FALSE='False'})[Var.C('&CHEAT.GOD')])
end

function GOD() 
   IDDQD() 
end 
   
function MONSTERTABLE()
   MS.Run("FIELD","cons_monstertable")
end      

function AWARD(tag)
   Award(tag)
end   

function ALLHP()
  local foeid
  for foeid in ICHARS() do
    CSay("Character: "..foeid.." has "..RPGChar.Points(foeid,"HP").Have.."/"..RPGChar.Points(foeid,"HP").Maximum.." HP") 
  end
end

function MASSACRE()
  local foeid
  for foeid in ICHARS() do
      if prefixed(foeid,"FOE") then
         CSay(foeid..' is dead!!!!!')
         RPG.Points(foeid,'HP').Have=0
      end
  end
end  


function SHOWTIME()
     CSay(CVV("%GAMETIME.SECONDS").." seconds")
     CSay(CVV("%GAMETIME.MINUTES").." Minutes")
     CSay(CVV("%GAMETIME.HOURS").." hours")
     CSay(PlayTime())
end     

function RESETPLAYTIME()
  Var.Clear("%GAMETIME.HOURS")
  Var.Clear("%GAMETIME.MINUTES")
  Var.Clear("%GAMETIME.SECONDS")
  CSay("Play time reset")
end

function SAVE(file)
if LAURA.GetFlow()~="FIELD" then return CWrite("? You can only save in the field!",255,0,180) end
SaveMeta()
if (not file) or file=="" then
    -- GotoSave()
    MS.Run('FIELD','GotoSave')
    CWrite("Leaving the console now will pop-up the save screen",0,180,255) 
    return 
    end
local myfile=file
local dir = mysplit(file,"/")
if #dir==1 then myfile = "Debug/"..myfile; dir = mysplit(myfile,"/") end 
if #dir~=2 then return CWrite("? I cannot save that file. Only one directory please!",255,0,0) end
LAURA.Save(myfile)
end

function LISTCLICKABLES()
  MS.Run("FIELD","ListClickables")
end

function RELOADCHAR(ch)
  MS.Run("PARTY",'CreateChar',ch)
end  

function SETCHARPOINTS(ch,points,newhave) -- This works on both enemies as heroes providing you know their CODENAME (not the screen name).
  if RPGStat.CharExists(ch)==0 then return CSay("? That character does not exist! Try CharList to see what we have!") end
  if RPGStat.PointsExists(ch,points)==0 then return CSay("? That character does not have those points, so I cannot modify them") end
  RPGStat.Points(ch,points).Have = newhave
end


function KILLCH(ch)
  SETCHARPOINTS(ch,"HP",0)
end


function DIR()
  local f
  local hue = 0
  for f in iJCR6Dir() do
    hue = hue + 1
    if hue>=344 then hue=0 end
    Image.ColorHSV(hue,255,255)
    Console.Write(f,Image.CurrentRed,Image.CurrentGreen,Image.CurrentBlue)
  end
end


-- Test Battle (TB)
function TB_SETUP()
  CONSOLE_COMBAT = {}
  CSay('How many foes are desired?')
  local a = tonumber(LAURA.ConsoleInput())
  if (not a) or a<1 then
     Console.Write('?ERROR',255,0,0)
     CONSOLE_COMBAT = nil
     return
  end   
  CONSOLE_COMBAT.num = a   
  for i=1,a do
      CSay("Name foe #"..i)
      CONSOLE_COMBAT['FOE_'..i] = LAURA.ConsoleInput()
  end    
end  

function TB_SHOWSETUP()
  local a = mysplit(serialize("CONSOLE_COMBAT",CONSOLE_COMBAT),"\n")
  local i,l
  for i,l in ipairs(a) do
    CSay(l)
  end
end

function TB_RUN()
  ClearCombatData()
  if not CONSOLE_COMBAT then Console.Write("? I need TB_SETUP data before I can start any battle",255,0,0) end
  for k,v in spairs(CONSOLE_COMBAT) do
      CSay(k.." = "..v)
      Var.D(({ ['string']='$', ['number']='%', ['boolean']='&'})[type(v)].."COMBAT"..k,sval(v))
  end    
  StartCombat()
end  

function TB_CARDMESSAGE(message,card)
  if MS.ContainsScript("COMBAT")==0 then
      Console.Write("? Sorry, folks. Combat routine is not loaded!",255,0,0)
      return
  end 
  MS.Run("COMBAT","CardMessage",message..";"..(card or 1))
  CSay("Message "..message.." (card "..(card or 1)..")")  
end 

function TB_SHOWCHARMSG()
  if MS.ContainsScript("COMBAT")==0 then
      Console.Write("? Sorry, folks. Combat routine is not loaded!",255,0,0)
      return
  end 
  MS.Run("COMBAT",'dbg_charmsg')
end


function TB_FIGHTERS()
  if MS.ContainsScript("COMBAT")==0 then
      Console.Write("? Sorry, folks. Combat routine is not loaded!",255,0,0)
      return
  end 
  MS.Run("COMBAT",'DebugFighter')
end

function OUTTAKES()
   MS.Load("OUTTAKES",'Script/Flow/Outtakes.lua')
   LAURA.Flow('OUTTAKES')
end   

function EXPNEED(lvl)
  local l=tonumber(lvl)
  if l and l>EXP.minlevel then
      CSay( l.." requires "..EXP:ByLvl(l).." experience points" )    
  else
      for i=EXP.minlevel,EXP.maxlevel do
          CSay( i.." requires "..EXP:ByLvl(i).." experience points" )    
      end
  end    
end  

function TB_BOSS()
  ClearCombatData()
  if not CONSOLE_COMBAT then Console.Write("? I need TB_SETUP data before I can start any battle",255,0,0) end
  for k,v in spairs(CONSOLE_COMBAT) do
      CSay(k.." = "..v)
      Var.D(({ ['string']='$', ['number']='%', ['boolean']='&'})[type(v)].."COMBAT"..k,sval(v))
  end    
  StartBoss('Ty ymor syrfa',"dal Aerya")
end

function LEVELUP(a)
   local chrs
   if not(a) or a=="" then 
      chrs = {}
      for id in ICHARS() do
          if not prefixed(id,"FOE") then chrs[#chrs+1]=id end
      end
   else
      chrs = mysplit(a,",")
   end
   for ch in each(chrs) do
       if RPG.CharExists(ch)==0 then
          CSay("Character "..ch.." does not exist")
       else
          CSay("Level up (if possible) for: "..ch)
          RPG.SetStat(ch,"EXP",0)
          MS.Run("PARTY","CheckEXP",ch)
       end      
   end          
end

function STATS(ch)
  if RPG.CharExists(ch)==0 then
     Console.Write("? Character does not exist",255,0,0)
     return
  end
  for stat in each(mysplit(RPG.StatFields(ch),";")) do
      CSay(right("                     "..stat,20)..": "..RPG.Stat(ch,stat))
  end    
end

function POINTS(ch)
  if RPG.CharExists(ch)==0 then
     Console.Write("? Character does not exist",255,0,0)
     return
  end
  for stat in each(mysplit(RPG.PointsFields(ch),";")) do
      local p = RPG.Points(ch,stat)
      CSay(right("                     "..stat,20)..": "..p.Have.."/"..p.Maximum.." (min="..p.Minimum..")")
  end    
end

function SETCHARPOINTS(ch,points,value)
  if RPG.CharExists(ch)==0 then
     Console.Write("? Character does not exist",255,0,0)
     return
  end
  if RPG.PointsExists(ch,points)==0 then   
     Console.Write("? Character does not a points-field called: "..sval(points),255,0,0)
     return
  end
  RPG.Points(ch,points).Have=value
  CSay(ch.." has now on "..points.." value: "..RPG.Points(ch,points).Have)
end

function SETHP(ch,value)
  SETCHARPOINTS(ch,"HP",value)
end

function SETSTAT(ch,stat,value)
  if RPG.CharExists(ch)==0 then
     Console.Write("? Character does not exist",255,0,0)
     return
  end
  RPG.DefStat(ch,stat,Sys.Val(value))
  CSay(ch.."."..stat.."=\""..Sys.Val(value).."\"")   
end

function GIVESTATUS(ch,status)
   -- SetStatus(ch,st,dontannounce)
  if RPG.CharExists(ch)==0 then
     Console.Write("? Character does not exist",255,0,0)
     return
  end
  if not status then Console.Write("? Give what?",255,0,0) end
  if status=="" then Console.Write("? Give what?",255,0,0) end
  if upper(LAURA.GetFlow())~="COMBAT" then     
     Console.Write("? This routine can only be used in combat",255,0,0)
     return
  end   
  MS.Run('COMBAT','SetStatus',ch..";"..status)
end  


function TAGGEDOBJECTS()
  CSay('Layer: '..Maps.LayerCodeName)
  for o in KthuraEach() do
      if o.Tag~="" then CSay(o.Tag..": "..o.Kind.."  ("..o.X..","..o.Y..")") end
  end
end      

function LAYERS()
   local l = mysplit(Maps.Layers(),";")
   for cl in each(l) do CSay(cl) end   
end

function GOTOLAYER(lay,exit)
   local letsgo
   local l = mysplit(Maps.Layers(),";")
   for checklay in each(l) do
       letsgo = letsgo or checklay==lay
   end
   if not letsgo then Console.Write("? LAYER "..lay.." DOES NOT EXIST",255,0,0); return; end
   GoToLayer(lay,exit or "Start")
end

function VARS()
    local v = mysplit(Var.Vars(),";")
    for vr in each(v) do
        CSay(vr.." = "..Var.C(vr))
    end
end

function MAPDATA()
   CSay("Map    CodeName: "..Maps.CodeName)
   CSay("Layer  CodeName: "..Maps.LayerCodeName)
   CSay("Camera position: ("..Maps.CamX..","..Maps.CamY..")")
   CSay("Leader position: ("..Actors.Actor('PLAYER').X..","..Actors.Actor('PLAYER').Y..")")   
   for i=1,3 do
       if Maps.Obj.Exists('PLAYER'..i)==1 then
          local o = Actors.Actor('PLAYER'..i)
          CSay("Folower #"..i..":      ("..o.X..","..o.Y..")")
       end
   end
end          
   
function MAPSCRIPT(a,b)
    MS.Run('MAP',a,b)
    Console.Write('Ok',0,180,255)
end    
