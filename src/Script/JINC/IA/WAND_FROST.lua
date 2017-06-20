--[[
**********************************************
  
  WAND_FROST.lua
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
 
version: 17.06.21
]]
ret = {
	["ADDCARD_Action_Act"] = "Self",
	["Attack"] = 100,
	["Attack_AccuracyRate"] = 100,
	["Attack_AllowAccuracy"] = true,
	["Attack_AllowCritical"] = true,
	["Attack_AllowDodge"] = true,
	["Attack_AttackStat"] = "Intelligence",
	["Attack_DefenseStat"] = "Resistance",
	["Attack_Element"] = "Frost",
	["Desc"] = "Let it go! Let it go!",
	["EQP_STAT_Intelligence"] = 1,
	["Heal_StatPercent"] = "Intelligence",
	["Heal_Type"] = "Absolute",
	["ITM_ACC_Dandor"] = true,
	["ITM_ACC_HandoStillor"] = true,
	["ITM_ACC_Jake"] = true,
	["ITM_ACC_Marrilona"] = true,
	["ITM_Combat"] = true,
	["ITM_EQP_For"] = "Marrilona",
	["ITM_Field"] = true,
	["ITM_Sellable"] = true,
	["ITM_ShopPrice"] = 250,
	["ITM_Type"] = "Weapon",
	["ITM_WeaponAbility"] = true,
	["Rew_GainAP"] = 5,
	["SpellAni"] = "Frost",
	["Stance"] = "Attack",
	["Target"] = "1F",
	["Title"] = "Frost Wand",
	["Type"] = "Item",
	["Voice"] = "Frost",
	["rew_CreateSkill1"] = true,
	["rew_GainSkill1"] = 5}

return ret

-- This file is an automatically generated file!

