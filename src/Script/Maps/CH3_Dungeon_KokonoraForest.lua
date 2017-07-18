--[[
**********************************************
  
  CH3_Dungeon_KokonoraForest.lua
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
 
version: 17.07.19
]]

-- @USE /Script/Use/Specific/NewGame+.lua

function ByeNos()
    --if RPG.PartyTag(0)=='Nostramantu_Human' then
       Loading()
       LoadMap('CH3_TOWN_NOSTRABURG')
       GoToLayer('town','NosStart')
       PartyPop('Nos','North')
       MapText('BYE_NOS')
       Party('Jake_Human;Marrilona;Dandor;HandoStillor')
       LoadMap('NGP_DUNGEON_DANDLETON')
       GoToLayer('#007','Start')
       MapText("ENDFL007")
       RPG.IncStat("Marrilona","EXP",-250000)
    --end
end

function Krandar()
    --if Maps.Obj.Exist('Krandar')==0 then return end
    PartyPop('Krandar','North')
    Music("Sys/Silence.ogg")
    Shift("Human")
    MapText('KRANDAR1')
    WorldMap_Unlock("CH3MINE")
    Var.D("$WMCHAT","KRANDARNOS")
    for i=1,3 do Maps.Obj.Kill("BWF"..i,1) end
    Maps.Obj.Kill('Krandar',1)
    Maps.Obj.Kill('ActKrandar',1)
    WorldMap('Kokonora')
    -- Sys.Error("Sorry, the rest isn't scripted yet")
end

function NPC_Ludo()
   --local ludo = "&DONE.LUDO.CHARTERED"
   --if CVV(ludo) then
      --MapText("LUDO_SAIL");
      ({function() LoadMap("CH2_Town_Doubline") GoToLayer("city","Einde") end,Nothing})[RunQuestion("MAP","LUDO_SAIL")]()
      --return
   --end
end

function WelcomeNos()
   MapText('WELCOME_NOS')
   Award('ZZNGP_Carry')
end   

function Boss()
  ClearCombatData()
  Var.D("$COMBAT.FOE_1","Boss/GiantEagle")
  Var.D("$COMBAT.POSFOE_1","CENTER")
  Var.D("$COMBAT.MUSIC","Music/Boss/NewGame+.ogg")
  Var.D("$COMBAT.ARENA","ForestLoof.png")
  NGP_StartBoss("Bird of Prey","Giant Eagle")    
end

function GALE_OnLoad()
    if RPG.PartyTag(0)=='Nostramantu_Human' then ZA_Enter('Kokonora2',ByeNos) else ZA_Enter("Kokonora2",WorldMap,"Kokonora") end
    ZA_Enter("ActKrandar",Krandar)
    if RPG.PartyTag(0)=="Nostramantu_Human" then 
       Maps.Obj.Obj("NosBlock").Impassible=1 Maps.Remap() 
    else 
       Maps.Obj.Kill('PRC_NosOnly')
       Maps.Obj.Kill('Boss')
       Maps.Obj.Kill('StartBoss') 
       -- The boss is for Nostramantu during the New Game+ Flashback. Not for Jake and company!
    end
end    
