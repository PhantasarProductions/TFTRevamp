--[[
**********************************************
  
  PRO_DUNGEON_DragonCave.lua
  (c) Jeroen Broks, 2016, All Rights Reserved.
  
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
 
version: 16.10.07
]]


function NPC_Guard()
   MapText('GUARD1')
   local y = -Maps.CamY
   for i=y,SH do
       Maps.CamY=-i
       Cls()
       DrawScreen()
       Flip()
   end
   Actors.Actor('PLAYER').Visible=0
   Actors.Actor('PLAYER').Y=SW*100   
   Maps.Remap()
   MapText('GUARD2')
   for i=SH,0,-1 do
       Cls()
       Maps.CamY=-i
       DrawScreen()
       Flip()
   end
   MapText('GUARD3')
   Maps.Obj.Kill('NPC_Guard',1)
   Maps.Obj.Kill('Guard_Block',1)
   GoToLayer('#001','Start')
   MapText('GUARD4')
end      
   
function GALE_OnLoad()
   MapHide('Secret')
end    
