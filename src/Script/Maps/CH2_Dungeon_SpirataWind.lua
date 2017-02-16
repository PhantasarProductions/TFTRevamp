--[[
**********************************************
  
  CH2_Dungeon_SpirataWind.lua
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
 
version: 17.02.16
]]
function MAP_FLOW()
   --FlowBlops()
   FlowMoveTex(hsin)
   FlowMoveTex(vsin)
   FlowMoveTex(wind)
   local lay = Maps.LayerCodeName;
   (SubFlow[lay] or Nothing)()
end

function GALE_OnLoad()
   --InitBlops()
   hsin = InitMoveTex({X=-1,Y=0,suffix='HSINUS.PNG'})
   vsin = InitMoveTex({X= 0,Y=1,suffix='VSINUS.PNG'})
   wind = InitMoveTex({X=-4,Y=0,tag='WindLeft'})
   --[[
   ZA_Enter('GenPuz2',GeneratePuzzle,4)
   ZA_Enter('GenPuz8',GeneratePuzzle,8)
   ZA_Enter('SpirataRoom',Music,'Hub/Angevin.ogg')
   ZA_Enter('Kerk'       ,Music,"Dungeon/Chanson d'eglise.ogg")
   ZA_Enter('Spirata',Spirata)
   ]]
   MapHide('Secret')
end
