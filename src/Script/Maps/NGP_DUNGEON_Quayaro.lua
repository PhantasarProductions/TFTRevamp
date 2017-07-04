--[[
**********************************************
  
  NGP_DUNGEON_Quayaro.lua
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
 
version: 17.07.04
]]

-- @USE /Script/Use/Specific/QuickTo.lua
-- @USE /Script/Use/Specific/NewGame+.lua

function Boss()
  ClearCombatData()
  Var.D("$COMBAT.FOE_1","Boss/ShadowRogue")
  Var.D("$COMBAT.POSFOE_1","CENTER")
  Var.D("$COMBAT.MUSIC","Music/Boss/NewGame+.ogg")
  Var.D("$COMBAT.ARENA","Quayaro.png")
  NGP_StartBoss("Undead criminal","Shadow Rogue")    
end



function NPC_Switch()
     doneswitch = doneswitch or {}
     local dswd = '&DONE.NGP.QUAYARO.SWITCHES'
     local count = 0
     doneswitch[Maps.LayerCodeName] = true
     Maps.Obj.Obj('NPC_Switch').TextureFile = "GFX/TEXTURES/SWITCH/RIGHT.PNG"
     for k,b in spairs(doneswitch) do
        if b then count = count + 1 CSay('Switch '..k..' has been activated') end
     end
     CSay('Number of switches activated: '..count)
     if count<4 then return CSay('That\'s not all of \'em') end
     if Done(dswd) then return CSay('That is all but the great animation already took place here, so BYE!') end
     CSay('Right, let\'s open that freaking big door')
     local l = Maps.LayerCodeName
     Maps.GoToLayer('courtyard')
     Maps.Obj.Kill('MainDoor',1)
     Maps.GoToLayer(l)   
     MapText('OPEN')
end

function GALE_OnLoad()
    assert(newgameplus,"YOU ARE A CHEAT!")
    SetupTo()
end    
