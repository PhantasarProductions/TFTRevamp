--[[
**********************************************
  
  HandoStillor.lua
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
 
version: 16.11.18
]]
local function GoNext()
   local skill = tonumber(Var.C('%SKILL')) or 2
   MS.LoadNew("FIELD","Script/Flow/Field.lua")
   MS.Run('FIELD','LoadMap',"PRO_HUB_WENIARIA")
   Maps.GotoLayer('HALL')
   MS.Run('FIELD','Party',"HandoStillor")
   RPGStat.SetName('HandoStillor','Hando Stillor')
   RPGStat.SetData('HandoStillor','Face','Hando Stillor')
   RPGStat.SetData('HandoStillor','EQP_Weapon',"EQP_HandoStillor_WP1")
   RPGStat.SetData('HandoStillor','EQP_Armor' ,"EQP_HandoStillor_AR1") -- HandoStillor has no armor prior to the optional bosses, but this field must exist as it will otherwise crash the game
   RPGStat.SetData("HandoStillor","EQP_Acc"   ,"") -- This just makes sure the entry exists so no crashes can come bacause of it later.
   RPGStat.SetStat("HandoStillor","Level",12/skill)
   MS.Run("MAP","InitHandoSkill")
   LAURA.Flow("FIELD")
   MS.Run('FIELD','SpawnPlayer',"Hando")
   MS.Run('FIELD','Schedule','MAP;SashaFunda')
   MS.LN_Run('PARTY','Script/Subs/Party.lua','SyncLevel','HandoStillor') -- HandoStillor is the only main character who starts this high
   RPGStat.Points("HandoStillor","HP").Have = RPGStat.Points("HandoStillor","HP").Maximum
   RPGStat.Points("HandoStillor","AP").Have = 0 
end

return GoNext
