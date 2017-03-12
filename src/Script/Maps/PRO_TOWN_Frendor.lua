--[[
**********************************************
  
  PRO_TOWN_Frendor.lua
  (c) Jeroen Broks, 2016, 2017, All Rights Reserved.
  
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
 
version: 17.03.11
]]

-- @USE /Script/Use/Specific/EndOfPrologue.lua

--[[
      Item Shop:    Alberta
      Wand Shop:    Aelvindor
      Weapon Shop:  Michiel
      Inn:          Yrromani
]]


-- FandaZone
function FandaZone()
   local fanda = Maps.Obj.Exists("NPC_FandaloraOutside")
   Maps.Obj.Obj('FandaEnter').Impassible=fanda
   Maps.Obj.Obj("FandaEnter").ForcePassible=1-fanda
   Maps.Remap() 
   CSay("Fanda = "..sval(fanda)..";\nzone.impassible = "..Maps.Obj.Obj('FandaEnter').Impassible.."; zone.force = "..Maps.Obj.Obj("FandaEnter").ForcePassible)
end

-- General
function MapMusic()
   if not (Done("&DONE.VANDAR.OPENING_Fandalora") or CVV('$WMCHAT')=='FAIRYJAKE') then 
      CSay("Skip the music for now. Let Fandalora speak first.")
   else
      OriMapMusic()
   end   
   -- FandaZone()
end


function MasterFandalora()
  local need = 5 * skill
  local jake = 0
  local marrilona = 0
  for i=1,5 do
      if i>1 and RPG.PointsExists("Jake_Human","SK_LVL_"..i)==1 then jake      = jake      + RPG.Points("Jake_Human","SK_LVL_"..i).Have end
      if         RPG.PointsExists("Marrilona" ,"SK_LVL_"..i)==1 then marrilona = marrilona + RPG.Points("Marrilona","SK_LVL_"..i).Have end      
  end 
  local amarrilona = marrilona / 5
  local ajake      = jake      / 4
  CSay("Fandalora requires: "..need)
  CSay("Marrilona has:      "..amarrilona)
  CSay("Jake has:           "..ajake)
  if not CVV("&MASTER.FANDALORA") then
     MapText('FANDALORAMASTERNOMASTERYET')
     if need>amarrilona and need>ajake then MapText('FANDALORAMASTERNOTREADY') return end
  end
  Master('Fandalora')
end


function ExitHouse()
   if CVV("&DONE.PARTY.DANDORJOINED") then
      GoToLayer('town','exitfrom_'..Maps.LayerCodeName)
      return
   end
   EH()
end

-- Inside Fandalora's house

function NPC_Fandalora()
  if (not CVV("&DONE.PARTY.DANDORJOINED")) then
     MapText("FANDALORA_PROLOGUE")
     return
  end
  MasterFandalora()
end

function NPC_YanneeInside()
  if not Done("&DONE.YANNEE.PROLOGUE.SPOKEN") then MapText("YANNEE_PROLOGUE1") else MapText("YANNEE_PROLOGUE2") end
end



function HappyBirthday()
   MapText('JARIG')
   MapMusic()
end   

-- Elder's house
function EldersHouse()
    MapText('OFF2ELDER')
    GoToLayer('elder','Marrilona')
    StopMusic()
    DrawScreen(); Flip()
    Time.Sleep(150)
    MapText('ELDER_PROLOGUE')
    LoadMap('PRO_DUNGEON_MAGIC')
    GoToLayer('#001','Start')
end EH = EldersHouse -- Needed for outline fooling.

function Elder2Boss()
    MapText('ELDER_WARNING')
    Schedule("MAP","PostBoss_Marrilona")
    ClearCombatData()
    Var.D("$COMBAT.FOE_1","Boss/Dwarf")
    Var.D("$COMBAT.POSFOE_1","CENTER")
    Var.D("$COMBAT.MUSIC","Music/Boss/BrutalSong.ogg")
    Var.D("$COMBAT.ARENA","Forest.png")
    Var.D("$COMBAT.STARTEVENT","MAP,DwarfBossStart")
    StartBoss("Hungry Fellow","Dwarf")    
end    

function DwarfBossStart()
    RPG.Points('FOE_1','HP').Minimum = 1
    MapText('STARTDWARFBOSS','FLOW_COMBAT')
end

-- End prologue
function PostBoss_Marrilona()
    Music('Sys/Silence.ogg')
    GoToLayer('black','Start')
    MapText('ELDER_OPENEYES')
    GoToLayer('marrilona','MarrilonaBed')
    local Nostramantu = Maps.Obj.Obj('Nostramantu')
    local Marrilona   = Actors.Actor('PLAYER')
    local NosSpot     = Maps.Obj.Obj('NosSpot')
    Nostramantu.R = 255
    Nostramantu.G = 255
    Nostramantu.B = 255
    Nostramantu.X = NosSpot.X
    Nostramantu.Y = NosSpot.Y
    MapText('ELDER_ENDPROLOGUE')
    EndOfPrologue('Marrilona')
    --Sys.Error("End of prologue not yet done. Hang on, folks!")
end

-- Treason
function Treason()
    Music('Scenario/We Got Trouble.ogg')
    Shift('Fairy')
    MapText('TREASON')
    Maps.Obj.Kill('ELDER_OUTSIDE',1) -- We won't see him again... Byebye! ;) (Fandalora can remain here. We'll see him again on the next visit!)
    GoToLayer('harryhub','Spot')
    PartyPop('Harry','West')
    Maps.CamX=96
    MapText('HARRY1')
    repeat
      TurnPlayer('West')
      Cls()
      Maps.CamX = Maps.CamX - 1
      DrawScreen()
      ShowParty()
      Flip()
    until Maps.CamX<=0
    TurnPlayer('West')
    MapText('HARRY2') 
    Var.D('$WMCHAT','HELL')
    WorldMap_Unlock('CH1HELL')
    WorldMap_Lock('CH1FRENDOR') -- This will now be locked until the Forbidden Library has been completed.
    Schedule("MAP","Treason_PostBoss")
    
    -- Harry as a boss
    ClearCombatData()
    Var.D("$COMBAT.FOE_1","Boss/Harry1") -- Needed to prevent the Axe Smash session Marrilona has to deal with.
    Var.D("$COMBAT.POSFOE_1","CENTER")
    Var.D("$COMBAT.MUSIC","Music/Special Boss/AnnoyingBoy.ogg")
    Var.D("$COMBAT.ARENA","Forest.png")
    StartBoss("Annoying Warrior Wannabe","Harry McDummy")      
    
    -- Sys.Error('Script ends here')
end

function Treason_PostBoss()
    MapText('HARRYPOST1')
    Maps.Obj.Kill('Harry') -- No, not permanently. Since we'll never return to this spot there is no need for an extra "perma" file.
    MapText('HARRYPOST2')
    WorldMap()
end

function PleaseGo()
    MapText('PLEASEGO')
    WorldMap_Lock('CH1FRENDOR')
    WorldMap_UnLock('CH2ELFROAD')
    Var.D("$WMCHAT","ELDERGONE")
    WorldMap()
end    


function AccessDenied()
  if (not CVV('&FRENDOR.ALLOW2STAY')) then 
     MapText('ACCESSDENIED') 
     WorldMap() 
  elseif Maps.Obj.Exists('FANDALORA_ENTRANCE')==1 then 
     Maps.Obj.Kill('FANDALORA_ENTRANCE',1) 
     FandaZone()
  end
end
  
function ComeInEvents()
   local ret = (({ FAIRYJAKE = Treason, LIBDONE=PleaseGo })[CVV('$WMCHAT')] or AccessDenied)()
   FandaZone()   
end



function NPC_FandaloraOutside()
   if CVV("$WMCHAT")=="SPIRATAFIRE" then
     Shift('Human')
     MapText('FANDALORA_DANDORCURE1')
     Maps.Obj.Kill('NPC_FandaloraOutside',1)
     Party('Jake_Human;Marrilona;Dandor;HandoStillor') 
     GoToLayer('marrilona','Entry')
     Maps.Obj.Kill('NPC_YanneeInside',1) -- From now on Yannee will only be found outside in the city itself.
     PartyPop('Dandor','North')
     ActorRepos("PLAYER2","Dandor_Dandor","South","Dandor")
     MapText("FANDALORA_DANDORCURE2")
     ItemGive('ZZKEY_WIND')
     Var.D("$WMCHAT","DANDORJOINED")
     WorldMap_Unlock("CH2WINDSPIRATA")
     Done("&DONE.PARTY.DANDORJOINED")
     FandaZone()
     Maps.GotoLayer("marrilona")
   else
     MapText('FANDALORA_OUTSIDE')
     MasterFandalora()
  end   
end   

function Enter(z)
    GoToLayer(z,'Start')
end

function B_Exit()    
    local z = Maps.LayerCodeName
    GoToLayer('town','exit_'..z)
end

function NPC_Alberta()
    MapText('ALBERTA')
    Shop('ITEM_ALBERTA')
end

function NPC_Michiel()
    MapText('MICHIEL')
    Shop('WEAPON_MICHIEL')
end

function NPC_Inn()
    -- MapText('INN')
    Inn()
end

function NPC_Wand()
    MapText('WAND')
    Shop('CLONE_AELVINDOR')
end    

function NPC_YanneeOutside()
    local wm = CVV('$WMCHAT')
    local say = {
                   DANDORCAUGHT = 'DANDORCURSED',
                   SPIRATAFIRE  = 'DANDORCURED'
                }
    MapText('YANNEE_'..(say[wm] or 'OUTSIDE'))            
end

function FandaloraEnter()
   GoToLayer('marrilona','Entry')
end   




-- Init
function GALE_OnLoad()
   ZA_Enter('ExitHouse',ExitHouse)
   ZA_Enter('Elder_Exit',Elder2Boss)
   ZA_Enter('ComeInEvents',ComeInEvents)
   for z in each({'items','weapons','wands','inn'}) do
       ZA_Enter('enter_'..z,Enter,z)
   end    
   ZA_Enter('B_Exit',B_Exit)
   ZA_Enter('Byebye',WorldMap)
   ZA_Enter('FandaEnter',FandaloraEnter)
   ZA_Enter("FandaLeaveRezone",FandaZone)
   Maps.GoToLayer("town")
end
