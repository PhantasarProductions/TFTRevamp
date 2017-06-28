--[[
**********************************************
  
  CH4_Dungeon_Z_NostramantuMansion.lua
  (c) Jeroen Broks, 2017, All Rights Reserved.
  
  This file contains material that is related 
  to a storyline that is which is strictly
  copyrighted to Jeroen Broks.
  
  This file may only be used in an unmodified
  form with an unmodified version of the 
  software this file belongs to.
  
  You may use this file for your study to see
  how I solved certain things in the creation
  of this project to see if you find valuable
  leads for the creation of your own.
  
  Mostly this file comes along with a project
  that is for most part released under an
  open source license and that means that if
  you use that code with this file removed
  from it, you can use it under that license.
  Please check out the other files to find out
  which license applies.
  This file comes 'as-is' and in no possible
  way the author can be held responsible of
  any form of damages that may occur due to 
  the usage of this file
  
  
 **********************************************
 
version: 17.06.28
]]

--[[

   Notes
   EndDoor -- Door to open to go to Nostramantu (barrier)
   Confrontation -- Zone leading to Nostramantu (point of no-return

]]


-- @DEFINE DEUR_NUMMERS

local function InitRandomDoors()
   local r
   entries = {}
   exits   = {}
   doors = {entries=entries,exits=exits}
   for i = 1, 9 do
       timeout=10000
       repeat
           r=rand(1,9)
           timeout=timeout-1
           assert(timeout>0,"Timeout on mansion room entry #"..i)
       until not entries[r] entries[r]=i   
       timeout=10000
       repeat
           r=rand(1,9)
           timeout=timeout-1
           assert(timeout>0,"Timeout on mansion room exit #"..i)
       until not exits[r] exits[r]=i   
   end 
   CSay("doors initialized")
   CSay(serialize('doors',doors))
end

local function GT(d) GoToLayer('corridor','Start'..d) end
local function LV(d) GoToLayer('lobby','Ex'..d) end

-- @IF DEUR_NUMMERS
function MAP_FLOW()
    if Maps.LayerCodeName~='corridor' then return end
    for i=1,9 do
        local o = Maps.Obj.Obj('NPC_Deur'..i)
        local x = o.x - Maps.CamX
        local y = o.y - Maps.CamY
        local c = i*27
        DarkText(i,x,y,2,1,255-c,180,c)
        DarkText(entries[i],x,y,2,0,c,0,255-c)
    end
end
-- @FI


local function KEnter(r)
      local n = entries[r] 
      GoToLayer('k'..n,"Start")
      if not Done('&DONE.NOSMANSION.ENTERED.k'..n) then
         for ch in each({'Jake_Human','Marrilona','Dandor','HandoStillor'}) do RPG.IncStat(ch,'EXP',-6000/skill) end
      end
end           

function NPC_Deur1() KEnter(1) end
function NPC_Deur2() KEnter(2) end
function NPC_Deur3() KEnter(3) end
function NPC_Deur4() KEnter(4) end
function NPC_Deur5() KEnter(5) end
function NPC_Deur6() KEnter(6) end
function NPC_Deur7() KEnter(7) end
function NPC_Deur8() KEnter(8) end
function NPC_Deur9() KEnter(9) end

local function KExit()
   local i = Sys.Val(right(Maps.LayerCodeName,1))
   local n = exits[i]
   GoToLayer('corridor','x'..n)
end   
   
function NPC_EndDoor()
   local go=true
   for i=1,8 do 
       local IH = ItemHave("ZZKEY_NOSTRACOIN"..i)
       go=go and IH>0
       CSay("Coin #"..i.."; Have="..IH.." go = "..sval(go))
   end    
   if not go then
      MapText("NOEND")
   else
      MapText("TOEND")
      Maps.Obj.Kill('EndDoor')
   end      
end   

local function GoNos() GoToLayer('nos','Start') end 

function StartNos()
    RPG.Points('FOE_2','HP').Minimum=1
end

function NPC_Nostramantu()
   PartyPop('Nos')
   MapText('CONFRONTATION')
   -- Init Fight
  ClearCombatData()
   Var.D("$COMBAT.FOE_1","Reg/Nemesis")
  Var.D("$COMBAT.FOE_2","Boss/Nostramantu2")
  Var.D('$COMBAT.POSFOE_2',"CENTER")
  Var.D("$COMBAT.FOE_3","Reg/Nemesis")      
  Var.D("$COMBAT.MUSIC","Music/Special Boss/PlayTillDeath_(Nostramantu).ogg")
  Var.D("$COMBAT.ARENA","nostramantu.png")
  Var.D("$COMBAT.STARTEVENT","MAP,StartNos")
  StartBoss("The Final Confrontation With","Nostramantu",255,180,0)   
  Schedule('MAP','PostFinalBoss')    
end   

function PostFinalBoss()
    assert(false,"Sorry, no more yet")
end    

function GALE_OnLoad()
  InitRandomDoors()
  ZA_Enter('ManaCave',function() LoadMap('CH4_DUNGEON_MANACAVE') GoToLayer('#020','Einde') end)
  ZA_Enter('Rechts',GT,'Rechts')
  ZA_Enter('Links',GT,'Links')
  ZA_Enter('ToLinks',LV,'Links')
  ZA_Enter('ToLobbyRechts',LV,'Rechts')
  ZA_Enter('KExit',KExit)
  ZA_Enter('StopMusic',StopMusic)
  ZA_Enter('Confrontation',GoNos)
  MapHide('Secret')
end  
