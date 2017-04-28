--[[
**********************************************
  
  DragonDown.lua
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
 
version: 17.04.27
]]
-- @IF IGNORE
local SpellScript = {}
-- @FI

function SpellScript.BDragonDefeated(tar,user)
    local foe = fighterbytag["FOE_1"]
    foe.x = SW/4
    foe.y = SH/2
    local tag="FOE_1"
    Image.Load('GFX/Actors/Single/Humans/Frendor_Big.png',"FIGHT_"..tag..upper(sval(false)))
    Image.Load('GFX/Actors/Single/Humans/Frendor_Big.png',"FIGHT_"..tag..upper(sval(true)))
    Image.Hot("FIGHT_"..tag.."FALSE",Image.Width("FIGHT_"..tag.."FALSE")/2,Image.Height("FIGHT_"..tag.."FALSE")) -- Hotspot bottom center
    Image.Hot("FIGHT_"..tag.."TRUE" ,Image.Width("FIGHT_"..tag.."TRUE" )/2,Image.Height("FIGHT_"..tag.."TRUE" )) -- Hotspot bottom center
    Music("Hub/The Sad Fate.ogg")
    MapText('FRENDOR',"FLOW_COMBAT")
    LoadMap("CH3_HUB_FrendorGrave")
    GoToLayer("Graf","Start_Frendor")
    local getexp = ({-20000,-10000,-5000})[skill]
    for ch in each({"Jake_Human","Marrilona","Dandor","HandoStillor"}) do RPG.IncStat(ch,"EXP",getexp); RPG.Points(ch,"HP").Have=RPG.Points(ch,"HP").Maximum end
    LAURA.Flow("FIELD")
end


-- @IF IGNORE
return SpellScript
-- @FI
