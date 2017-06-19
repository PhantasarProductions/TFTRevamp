--[[
**********************************************
  
  CH1_Dungeon_Hell.lua
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
 
version: 17.06.19
]]


-- @USE /Script/Use/Specific/MoveTex.lua


function StartHydra()
    RPG.Points('FOE_1','HP').Minimum = 1
    AddJoker('Hydra')
end

function PostHydra()
    MapText('HYDRADROP')
    ItemGive('EQP_HANDOSTILLOR_SEALEDARMOR')
    for ch in each({'Jake_Human','Marrilona','Dandor','HandoStillor'}) do RPG.IncStat(ch,'EXP',-100000) end
end

function BlueSeal()
  ClearCombatData()
  Var.D("$COMBAT.STARTEVENT","MAP,StartHydra")
  Var.D("$COMBAT.FOE_1","Sealed/Hydra")
  --Var.D("$COMBAT.POSFOE_1","DRAGON")
  Var.D("$COMBAT.MUSIC","Music/Special Boss/Blue Seal.ogg")
  Var.D("$COMBAT.ARENA","Hell.png")
  StartBoss("Mythical Snake","Hydra",0,0,255)   
  Schedule('MAP','PostHydra')
  --Maps.Obj.Kill("4MonksFromHell",1)
end

function North()
  WorldMap_Unlock('CH1LIBRARY')
  WorldMap()
end

function GALE_OnLoad()
   ZA_Enter('North',North)
   ZA_Enter('South',WorldMap)
   LavaStream = InitMoveTex({suffix='LAVA.PNG', Y=3 })
end

function MAP_FLOW()
   FlowMoveTex(LavaStream)
end      
