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
 
version: 17.03.04
]]


function Krandar()
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

function GALE_OnLoad()
    ZA_Enter("Kokonora2",WorldMap,"Kokonora")
    ZA_Enter("ActKrandar",Krandar)
end    
