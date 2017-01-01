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
 
version: 17.01.01
]]

-- @USE /Script/Use/Specific/EndOfPrologue.lua

-- General
function MapMusic()
   if not (Done("&DONE.VANDAR.OPENING_Fandalora") or CVV('$WMCHAT')=='FAIRYJAKE') then 
      CSay("Skip the music for now. Let Fandalora speak first.")
   else
      OriMapMusic()
   end   
end

function ExitHouse()
   if CVV("&DONE.PATHOFMAGIC") then
      GoToLayer('town','exitfrom_'..Maps.LayerCodeName)
      return
   end
   EH()
end

-- Inside Fandalora's house

function NPC_Fandalora()
  if not CVV("&DONE.PATHOFMAGIC") then
     MapText("FANDALORA_PROLOGUE")
     return
  end
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
    Nostramantu.X = NosSpot.Y
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

function ComeInEvents()
   return (({ FAIRYJAKE = Treason, LIBDONE=PleaseGo })[CVV('$WMCHAT')] or Nothing)()
end

-- Init
function GALE_OnLoad()
   ZA_Enter('ExitHouse',ExitHouse)
   ZA_Enter('Elder_Exit',Elder2Boss)
   ZA_Enter('ComeInEvents',ComeInEvents)
end
