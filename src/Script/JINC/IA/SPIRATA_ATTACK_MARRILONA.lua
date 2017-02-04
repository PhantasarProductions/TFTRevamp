--[[
**********************************************
  
  SPIRATA_ATTACK_MARRILONA.lua
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
 
version: 17.02.03
]]
ret = {
	["ADDCARD_Action_Act"] = "Self",
	["ADDCARD_Action_Interval"] = 5,
	["ADDCARD_Char_Interval"] = 10,
	["ADDCARD_Char_Number"] = 1,
	["Attack"] = 200,
	["Attack_AccuracyRate"] = 100,
	["Attack_AttackStat"] = "SpirataRate",
	["Attack_DefenseStat"] = "Endurance",
	["Attack_Element"] = "Water",
	["BUFF_Power"] = -15,
	["Desc"] = "Spirata Water attack",
	["EffectScript"] = "SpirataRestore",
	["Heal_StatPercent"] = "Intelligence",
	["Heal_Type"] = "Absolute",
	["ITM_ACC_Dandor"] = true,
	["ITM_ACC_HandoStillor"] = true,
	["ITM_ACC_Jake"] = true,
	["ITM_ACC_Marrilona"] = true,
	["ITM_Combat"] = true,
	["ITM_EQP_For"] = "Jake",
	["ITM_Field"] = true,
	["ITM_Sellable"] = true,
	["ITM_Type"] = "Consumable",
	["Stance"] = "Cast",
	["Target"] = "AF",
	["Title"] = "Pascal",
	["Type"] = "Ability",
	["Voice"] = "Water",
	["rew_GainSkill1"] = 5,
	["rew_GainSkill2"] = 5,
	["rew_GainSkill3"] = 5,
	["rew_GainSkill4"] = 8,
	["rew_GainSkill5"] = 5}

return ret

-- This file is an automatically generated file!
