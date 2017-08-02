--[[
**********************************************
  
  CH2_Dungeon_DoublineBayForest.lua
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
 
version: 17.08.02
]]

russel = "&DONE.BOSS.RUSSELL"

function Boss_Russell()
  if Done("&DONE.BOSS.RUSSELL") then return end
  PartyPop("R","North")
  MapText("RUSSELL_PREBOSS")
  ClearCombatData()
  --Schedule('MAP','NPC_Russell')
  Var.D("$COMBAT.FOE_1","Boss/Russell")
  Var.D("$COMBAT.POSFOE_1","CENTER")
  Var.D("$COMBAT.MUSIC","Music/SpecialBoss/Living Voyage.ogg")
  Var.D("$COMBAT.ARENA","ForestLoof.png")
  Schedule('MAP','NPC_Russell')
  StartBoss("A pirate's life for him","Russell")
  Maps.Obj.Obj("NPC_Elizabeth").Visible = 1   
  WorldMap_Unlock("CH2DOUBLINE")
  Maps.Obj.Kill("Russell_Boss")
end

function NPC_Russell()   
   Master("Russell")
end   

function NPC_Elizabeth()
   MapText('BETH')
end

function GoToCorrectStart()
    GoToLayer("forest",({[false]="Start_South",[true]="Start_North"})[CVV(russel)])
end

function GALE_OnLoad()
    ZA_Enter("StartZone",GoToCorrectStart)
    for i=1,2 do ZA_Enter("Bye"..i,WorldMap) end
    MapHide("Secret")
    Maps.Obj.Obj("NPC_Elizabeth").Visible = ({ [true]=1, [false]=0})[CVV("&DONE.BOSS.RUSSELL")]
    ZA_Enter("Russell_Boss",Boss_Russell)
end
