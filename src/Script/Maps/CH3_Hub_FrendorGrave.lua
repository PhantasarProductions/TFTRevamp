--[[
**********************************************
  
  CH3_Hub_FrendorGrave.lua
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
 
version: 17.04.28
]]
function Harry()
    PartyPop("H")
    MapText('HARRY')
    ClearCombatData()
    Var.D("$COMBAT.FOE_1","Boss/Harry3")
    Var.D("$COMBAT.POSFOE_1","CENTER")
    Var.D("$COMBAT.MUSIC","Music/Special Boss/AnnoyingBoy.ogg")
    Var.D("$COMBAT.ARENA","Forest.png")
    StartBoss("Doesn't he ever give up?","Harry McDummy")      
    Schedule("MAP","Harry_Post")
end

function Harry_Post()
   Award('CHAPTER3')
   local chief = Maps.Obj.Obj("NPC_MT_Chief")
   local chiefspot = Maps.Obj.Obj('NewChief')
   chief.TextureFile = "GFX/ACTORS/SINGLE/HUMANS/CHIEFWERRINGTON_BACKSIDE.PNG"
   chief.x = chiefspot.x
   chief.y = chiefspot.y
   MapText('HARRY_POST')
   Party("Marrilona")
   LoadMap('CH4_Town_NostraburgNight')
   GoToLayer('town','exit_krandar')
   Chapter('GFX/Chapters/4.png')
   MapText("START")
   Var.D('$VANDAR.STATUS',"All cleared now")
   --error("Move along nothing to see here!")
end

function Event()
   Maps.Obj.Kill("Event",1)
   PartyPop("Ev","North")
   MapText("Event")
   Award("SCEN_DRAGON")
   WorldMap_Unlock("CH3FRENDORGRAVE") 
end      


function GALE_OnLoad()
    ZA_Enter('Harry',Harry)
    ZA_Enter("Event",Event)
end       
