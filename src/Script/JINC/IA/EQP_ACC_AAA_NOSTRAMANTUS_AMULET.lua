--[[
**********************************************
  
  EQP_ACC_AAA_NOSTRAMANTUS_AMULET.lua
  (c) Jeroen Broks, 2017, 2018, All Rights Reserved.
  
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
 
version: 18.06.02
]]
ret = {
	["ADDCARD_Action_Act"] = "Self",
	["ADDCARD_Action_Interval"] = 5,
	["ADDCARD_Char_Interval"] = 5,
	["Acc_PreTurn"] = "NosAmulet",
	["Attack_AccuracyRate"] = 100,
	["Attack_AttackStat"] = "Power",
	["Attack_DefenseStat"] = "Endurance",
	["Attack_Element"] = "None",
	["Desc"] = "Now this is POWER!!",
	["EQP_STAT_AP"] = 125,
	["EQP_STAT_Accuracy"] = 100,
	["EQP_STAT_ER_Darkness"] = 200,
	["EQP_STAT_ER_Earth"] = 200,
	["EQP_STAT_ER_Flame"] = 200,
	["EQP_STAT_ER_Frost"] = 200,
	["EQP_STAT_ER_Light"] = 200,
	["EQP_STAT_ER_Lightning"] = 200,
	["EQP_STAT_ER_Water"] = 200,
	["EQP_STAT_ER_Wind"] = 200,
	["EQP_STAT_Endurance"] = 100,
	["EQP_STAT_Evasion"] = 100,
	["EQP_STAT_HP"] = 500,
	["EQP_STAT_Intelligence"] = 100,
	["EQP_STAT_Power"] = 100,
	["EQP_STAT_Resistance"] = 100,
	["EQP_STAT_SR_Curse"] = 100,
	["EQP_STAT_SR_Death"] = 100,
	["EQP_STAT_SR_Destruction"] = 100,
	["EQP_STAT_SR_Disease"] = 100,
	["EQP_STAT_SR_Paralysis"] = 100,
	["EQP_STAT_SR_Petrification"] = 100,
	["EQP_STAT_SR_Poison"] = 100,
	["EQP_STAT_SR_Silence"] = 100,
	["EQP_STAT_SR_Sleep"] = 100,
	["EQP_STAT_SR_Undead"] = 100,
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
	["ITM_Type"] = "Accesoiry",
	["Stance"] = "Cast",
	["Target"] = "1F",
	["Title"] = "Nostramantu's Amulet",
	["Type"] = "Item"}

return ret

-- This file is an automatically generated file!

