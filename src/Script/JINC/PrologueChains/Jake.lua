--[[
**********************************************
  
  Jake.lua
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
 
version: 16.09.12
]]
function GoNext()
   MS.LoadNew("FIELD","Script/Flow/Field.lua")
   MS.Run('FIELD','LoadMap',"PRO_TOWN_VANDAR")
   Maps.GotoLayer('town')
   MS.Run('FIELD','Party',"Jake_Human")
   RPGStat.SetName('Jake_Human','Jake')
   RPGStat.SetData('Jake_Human','Face','Jake')
   RPGStat.SetData('Jake_Human','EQP_Weapon',"EQP_JAKE_WP1")
   RPGStat.SetData('Jake_Human','EQP_Armor' ,"EQP_JAKE_AR1")
   RPGStat.SetData("Jake_Human","EQP_Acc"   ,"") -- This just makes sure the entry exists so no crashes can come bacause of it later.
   LAURA.Flow("FIELD")
   MS.Run('FIELD','SpawnPlayer',"Dojo")
   MS.Run('FIELD','Schedule','MAP;John_Exam')
end

return GoNext
