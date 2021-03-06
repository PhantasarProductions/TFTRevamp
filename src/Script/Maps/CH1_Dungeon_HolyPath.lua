--[[
**********************************************
  
  CH1_Dungeon_HolyPath.lua
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
 
version: 17.03.21
]]


function Bye(Unlock)
   if Unlock then WorldMap_Unlock('CH1ALTAR') end
   WorldMap()
end   

function SecretDungeon()
  LoadMap('CH1_DUNGEON_SUBRIVER')
  GoToLayer('#001','Start')
end


function GALE_OnLoad()
   ZA_Enter('ByeNorth',Bye,false)
   ZA_Enter('ByeSouth',Bye,true)
   ZA_Enter('ToSecretDungeon',SecretDungeon)
   MapHide('Secret')
   --Var.D(upper("&ALLOW.ENCOFF['"..'CH1_DUngeon_HolyPath'.."']"),Var.C("&ALLOW.ENCOFF['"..'CH1_DUngeon_HolyPath'.."']"))
end   
