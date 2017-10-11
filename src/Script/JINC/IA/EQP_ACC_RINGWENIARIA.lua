--[[
**********************************************
  
  EQP_ACC_RINGWENIARIA.lua
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
 
version: 17.10.11
]]
ret = {
	["ADDCARD_Action_Act"] = "Self",
	["ADDCARD_Action_Interval"] = 5,
	["ADDCARD_Char_Interval"] = 5,
	["Acc_PreTurn"] = "Regenerate",
	["Acc_PreTurn_Arg"] = "150",
	["Attack_AccuracyRate"] = 100,
	["Attack_AttackStat"] = "Power",
	["Attack_DefenseStat"] = "Endurance",
	["Attack_Element"] = "None",
	["Desc"] = "Heals 150 HP each turn",
	["EQP_STAT_AP"] = 1,
	["EQP_STAT_Endurance"] = 1,
	["EQP_STAT_Evasion"] = 5,
	["EQP_STAT_HP"] = 25,
	["EQP_STAT_Intelligence"] = 25,
	["EQP_STAT_Resistance"] = 1,
	["EQP_STAT_SR_Death"] = 25,
	["EQP_STAT_SR_Destruction"] = 25,
	["EQP_STAT_SR_Disease"] = 25,
	["EQP_STAT_SR_Poison"] = 25,
	["EQP_STAT_SR_Undead"] = 75,
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
	["ITM_ShopPrice"] = 950000,
	["ITM_Type"] = "Accesoiry",
	["Stance"] = "Cast",
	["Target"] = "1F",
	["Title"] = "Weniaria's Ring",
	["Type"] = "Item"}

return ret

-- This file is an automatically generated file!

