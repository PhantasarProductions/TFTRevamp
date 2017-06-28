--[[
**********************************************
  
  Nostramantu Goes Oversoul.lua
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
 
version: 17.06.28
]]
-- @IF IGNORE
local SpellScript = {}
-- @FI

function SpellScript.NostraMorph(tar,user)
       -- SZ
       local sx,sy,sw,sh=GetViewport()
       -- Fade Out
       for a=0,100 do
           Cls()
           DrawScreen()
           Image.SetAlphaPC(a)
           Image.Color(0,0,a*2)
           Image.Rect(sx,sy,sw,sh)
           Image.SetAlphaPC(100)
           Flip()
       end
       -- Clean
       Fighters.Foe = {}
       -- Load enemy data (if the two Nemesis girls are still standing they will disappear).
       CompileFoe('FOE_1',JINC('Script/JINC/Foes/OverNos/Antenna_Nice.lua'),'Script/JINC/Foes/OverNos/Antenna_Nice.lua') 
       CompileFoe('FOE_2',JINC('Script/JINC/Foes/OverNos/Nostramantu.lua' ),'Script/JINC/Foes/OverNos/Nostramantu.lua') 
       CompileFoe('FOE_3',JINC('Script/JINC/Foes/OverNos/Antenna_Mock.lua'),'Script/JINC/Foes/OverNos/Antenna_Mock.lua')
       -- Antennae indestructable
       RPG.Points('FOE_1','HP').Minimum =  RPG.Points('FOE_1','HP').Maximum
       RPG.Points('FOE_3','HP').Minimum =  RPG.Points('FOE_3','HP').Maximum
       -- Nostramantu's stat copier
       for s in each({'Power','Endurance','Intelligence','Resistance','HP'}) do
           local v=0
           for ch in each({'Jake_Human','Marrilona','Dandor','HandoStillor'}) do
               v = v + RPG.Stat(ch,"END_"..s)
           end
           if s=="HP" then v=v*(skill*12) end
           local avg = math.ceil(v/(6-skill))
           RPG.DefStat('FOE_2','BASE_'..s,avg)
       end
       RPG.Points('FOE_2','HP').Have = RPG.Points('FOE_2','HP').Maximum
       Done('&DONE.ULTIMATENOSTRAMANTU.MORPH.COMPLETE')
       -- Music Change
       Music("Special Boss/Final Boss.ogg")
       -- Fade In    
       for a=100,0,-1 do
           Cls()
           DrawScreen()
           Image.SetAlphaPC(a)
           Image.Color(0,0,a*2)
           Image.Rect(sx,sy,sw,sh)
           Image.SetAlphaPC(100)
           Flip()
       end
       return true
end


-- @IF IGNORE
return SpellScript
-- @FI
