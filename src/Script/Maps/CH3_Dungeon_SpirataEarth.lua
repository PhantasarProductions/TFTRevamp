--[[
**********************************************
  
  CH3_Dungeon_SpirataEarth.lua
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
 
version: 17.04.02
]]
SubFlow = {}

function MAP_FLOW()
   --FlowBlops()
   FlowMoveTex(hsin)
   FlowMoveTex(vsin)
   local lay = Maps.LayerCodeName;
   (SubFlow[lay] or Nothing)()
end


function sap_startfunction()
    MapText("PUZZLETUTORIAL")
end

function Boss()
  ClearCombatData()
  Schedule('MAP','ManaOrb')
  Var.D("$COMBAT.FOE_1","Boss/Terra")
  Var.D("$COMBAT.POSFOE_1","CENTER")
  Var.D("$COMBAT.MUSIC","Music/SpecialBoss/Summon the Rawk.ogg")
  Var.D("$COMBAT.ARENA","spirataearth.png")
  StartBoss("Protector of the Earth Spirata","Aer")  
  Maps.PermaWrite("if Maps.Obj.Exists('PTE_GAIA)==1 then \n\tlocal e = Maps.Obj.Obj('PTE_GAIA')\n\tlocal es=Maps.Obj.Obj('EmblemSpot')\n\te.X=es.X\n\te.Y=es.Y\nend")  
  local e = Maps.Obj.Obj('PTE_GAIA')
  local es=Maps.Obj.Obj('EmblemSpot')
  e.X=es.X
  e.Y=es.Y
  end

function GALE_OnLoad()
   hsin = InitMoveTex({X= 1,Y=0,suffix='HSINUS.PNG'})
   vsin = InitMoveTex({X= 0,Y=1,suffix='VSINUS.PNG'})
   arrowdir['#002']='East'
   arrowslide_onload(sap_startfunction)
end


-- @USE /script/use/specific/plasmafloor.lua
-- @USE /script/use/specific/arrowslide.lua

