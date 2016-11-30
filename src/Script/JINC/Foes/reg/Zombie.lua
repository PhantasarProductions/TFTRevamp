--[[
**********************************************
  
  Zombie.lua
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
 
version: 16.11.29
]]
-- File Generated: Mon 21 November 2016; 17:36:52


local foe = {}

	foe["AI"] = "default"
	foe["NEWGAMEPLUS_AAA_ATTACK"] = true
	foe["NEWGAMEPLUS_ABL_HERO_DANDOR_AXESMASH"] = true
	foe["NEWGAMEPLUS_ABL_HERO_DANDOR_SUPERAXESMASH"] = true
	foe["NEWGAMEPLUS_ABL_HERO_HANDOSTILLOR_FIRSTAID"] = true
	foe["NEWGAMEPLUS_ABL_HERO_JAKE_\50PS"] = true
	foe["NEWGAMEPLUS_ABL_HERO_JAKE_\51PS"] = true
	foe["NEWGAMEPLUS_ABL_HERO_JAKE_\52PS"] = true
	foe["NEWGAMEPLUS_ABL_HERO_MARRILONA_HEAL"] = true
	foe["NEWGAMEPLUS_ABL_HERO_MARRILONA_SPLASH"] = true
	foe["NEWGAMEPLUS_ITM_ANTIDOTE"] = true
	foe["NEWGAMEPLUS_ITM_APPLE"] = true
	foe["NEWGAMEPLUS_ITM_FLAMEORB"] = true
	foe["NEWGAMEPLUS_ITM_MEDICINE"] = true
	foe["NEWGAMEPLUS_ITM_SALVE"] = true
	foe["NEWGAMEPLUS_SPECIAL_AXESMASH"] = true
	foe["NEWGAMEPLUS_WAND_FLAME"] = true
	foe["NORMAL_AAA_ATTACK"] = true
	foe["NORMAL_ABL_HERO_DANDOR_AXESMASH"] = true
	foe["NORMAL_ABL_HERO_DANDOR_SUPERAXESMASH"] = true
	foe["NORMAL_ABL_HERO_HANDOSTILLOR_FIRSTAID"] = true
	foe["NORMAL_ABL_HERO_JAKE_\50PS"] = true
	foe["NORMAL_ABL_HERO_JAKE_\51PS"] = true
	foe["NORMAL_ABL_HERO_JAKE_\52PS"] = true
	foe["NORMAL_ABL_HERO_MARRILONA_HEAL"] = true
	foe["NORMAL_ABL_HERO_MARRILONA_SPLASH"] = true
	foe["NORMAL_ITM_ANTIDOTE"] = true
	foe["NORMAL_ITM_APPLE"] = true
	foe["NORMAL_ITM_FLAMEORB"] = true
	foe["NORMAL_ITM_MEDICINE"] = true
	foe["NORMAL_ITM_SALVE"] = true
	foe["NORMAL_SPECIAL_AXESMASH"] = true
	foe["NORMAL_WAND_FLAME"] = true
	foe["OVERSOUL_AAA_ATTACK"] = true
	foe["OVERSOUL_ABL_HERO_DANDOR_AXESMASH"] = true
	foe["OVERSOUL_ABL_HERO_DANDOR_SUPERAXESMASH"] = true
	foe["OVERSOUL_ABL_HERO_HANDOSTILLOR_FIRSTAID"] = true
	foe["OVERSOUL_ABL_HERO_JAKE_\50PS"] = true
	foe["OVERSOUL_ABL_HERO_JAKE_\51PS"] = true
	foe["OVERSOUL_ABL_HERO_JAKE_\52PS"] = true
	foe["OVERSOUL_ABL_HERO_MARRILONA_HEAL"] = true
	foe["OVERSOUL_ABL_HERO_MARRILONA_SPLASH"] = true
	foe["OVERSOUL_ITM_ANTIDOTE"] = true
	foe["OVERSOUL_ITM_APPLE"] = true
	foe["OVERSOUL_ITM_FLAMEORB"] = true
	foe["OVERSOUL_ITM_MEDICINE"] = true
	foe["OVERSOUL_ITM_SALVE"] = true
	foe["OVERSOUL_SPECIAL_AXESMASH"] = true
	foe["OVERSOUL_WAND_FLAME"] = true
	foe["SKILL\49_AAA_ATTACK"] = true
	foe["SKILL\49_ABL_HERO_DANDOR_AXESMASH"] = true
	foe["SKILL\49_ABL_HERO_DANDOR_SUPERAXESMASH"] = true
	foe["SKILL\49_ABL_HERO_HANDOSTILLOR_FIRSTAID"] = true
	foe["SKILL\49_ABL_HERO_JAKE_\50PS"] = true
	foe["SKILL\49_ABL_HERO_JAKE_\51PS"] = true
	foe["SKILL\49_ABL_HERO_JAKE_\52PS"] = true
	foe["SKILL\49_ABL_HERO_MARRILONA_HEAL"] = true
	foe["SKILL\49_ABL_HERO_MARRILONA_SPLASH"] = true
	foe["SKILL\49_ITM_ANTIDOTE"] = true
	foe["SKILL\49_ITM_APPLE"] = true
	foe["SKILL\49_ITM_FLAMEORB"] = true
	foe["SKILL\49_ITM_MEDICINE"] = true
	foe["SKILL\49_ITM_SALVE"] = true
	foe["SKILL\49_SPECIAL_AXESMASH"] = true
	foe["SKILL\49_WAND_FLAME"] = true
	foe["SKILL\50_AAA_ATTACK"] = true
	foe["SKILL\50_ABL_HERO_DANDOR_AXESMASH"] = true
	foe["SKILL\50_ABL_HERO_DANDOR_SUPERAXESMASH"] = true
	foe["SKILL\50_ABL_HERO_HANDOSTILLOR_FIRSTAID"] = true
	foe["SKILL\50_ABL_HERO_JAKE_\50PS"] = true
	foe["SKILL\50_ABL_HERO_JAKE_\51PS"] = true
	foe["SKILL\50_ABL_HERO_JAKE_\52PS"] = true
	foe["SKILL\50_ABL_HERO_MARRILONA_HEAL"] = true
	foe["SKILL\50_ABL_HERO_MARRILONA_SPLASH"] = true
	foe["SKILL\50_ITM_ANTIDOTE"] = true
	foe["SKILL\50_ITM_APPLE"] = true
	foe["SKILL\50_ITM_FLAMEORB"] = true
	foe["SKILL\50_ITM_MEDICINE"] = true
	foe["SKILL\50_ITM_SALVE"] = true
	foe["SKILL\50_SPECIAL_AXESMASH"] = true
	foe["SKILL\50_WAND_FLAME"] = true
	foe["SKILL\51_AAA_ATTACK"] = true
	foe["SKILL\51_ABL_HERO_DANDOR_AXESMASH"] = true
	foe["SKILL\51_ABL_HERO_DANDOR_SUPERAXESMASH"] = true
	foe["SKILL\51_ABL_HERO_HANDOSTILLOR_FIRSTAID"] = true
	foe["SKILL\51_ABL_HERO_JAKE_\50PS"] = true
	foe["SKILL\51_ABL_HERO_JAKE_\51PS"] = true
	foe["SKILL\51_ABL_HERO_JAKE_\52PS"] = true
	foe["SKILL\51_ABL_HERO_MARRILONA_HEAL"] = true
	foe["SKILL\51_ABL_HERO_MARRILONA_SPLASH"] = true
	foe["SKILL\51_ITM_ANTIDOTE"] = true
	foe["SKILL\51_ITM_APPLE"] = true
	foe["SKILL\51_ITM_FLAMEORB"] = true
	foe["SKILL\51_ITM_MEDICINE"] = true
	foe["SKILL\51_ITM_SALVE"] = true
	foe["SKILL\51_SPECIAL_AXESMASH"] = true
	foe["SKILL\51_WAND_FLAME"] = true
	foe["Desc"] = "Restless soul in a rotting body\46\10Wonders around mindlessly\10until being freed from its evil\10curse\44 or whatever keeps it bound\46"
	foe["Image"] = "GFX\47Combat\47Fighters\47Foe\47REG\47Zombie\46png"
	foe["Item Drop \49"] = "ITM_APPLE"
	foe["Item Drop \50"] = "ITM_SALVE"
	foe["Item Steal \49"] = "ITM_ANTIDOTE"
	foe["Item Steal \50"] = "ITM_ANTIDOTE"
	foe["Item Steal \51"] = "ITM_ANTIDOTE"
	foe["Name"] = "Zombie"
	foe["RATE_AAA_ATTACK"] = 5
	foe["RATE_ABL_HERO_DANDOR_AXESMASH"] = 0
	foe["RATE_ABL_HERO_DANDOR_SUPERAXESMASH"] = 0
	foe["RATE_ABL_HERO_HANDOSTILLOR_FIRSTAID"] = 0
	foe["RATE_ABL_HERO_JAKE_\50PS"] = 0
	foe["RATE_ABL_HERO_JAKE_\51PS"] = 0
	foe["RATE_ABL_HERO_JAKE_\52PS"] = 0
	foe["RATE_ABL_HERO_MARRILONA_HEAL"] = 0
	foe["RATE_ABL_HERO_MARRILONA_SPLASH"] = 0
	foe["RATE_ITM_ANTIDOTE"] = 0
	foe["RATE_ITM_APPLE"] = 0
	foe["RATE_ITM_FLAMEORB"] = 0
	foe["RATE_ITM_MEDICINE"] = 0
	foe["RATE_ITM_SALVE"] = 0
	foe["RATE_SPECIAL_AXESMASH"] = 0
	foe["RATE_WAND_FLAME"] = 0
	foe["TARGET_AAA_ATTACK"] = "Random"
	foe["TARGET_ABL_HERO_DANDOR_AXESMASH"] = "Random"
	foe["TARGET_ABL_HERO_DANDOR_SUPERAXESMASH"] = "Random"
	foe["TARGET_ABL_HERO_HANDOSTILLOR_FIRSTAID"] = "Random"
	foe["TARGET_ABL_HERO_JAKE_\50PS"] = "Random"
	foe["TARGET_ABL_HERO_JAKE_\51PS"] = "Random"
	foe["TARGET_ABL_HERO_JAKE_\52PS"] = "Random"
	foe["TARGET_ABL_HERO_MARRILONA_HEAL"] = "Random"
	foe["TARGET_ABL_HERO_MARRILONA_SPLASH"] = "Random"
	foe["TARGET_ITM_ANTIDOTE"] = "Random"
	foe["TARGET_ITM_APPLE"] = "Random"
	foe["TARGET_ITM_FLAMEORB"] = "Random"
	foe["TARGET_ITM_MEDICINE"] = "Random"
	foe["TARGET_ITM_SALVE"] = "Random"
	foe["TARGET_SPECIAL_AXESMASH"] = "Random"
	foe["TARGET_WAND_FLAME"] = "Random"
	foe["Boss"] = false
	foe["Oversoul"] = false
	foe["Oversoul Drop \49"] = false
	foe["Oversoul Drop \50"] = false
	foe["Oversoul Steal \49"] = false
	foe["Oversoul Steal \50"] = false
	foe["Oversoul Steal \51"] = false
	foe["Cash"] = 25
	foe["ER_Darkness"] = 500
	foe["ER_Earth"] = 75
	foe["ER_Flame"] = -100
	foe["ER_Frost"] = 100
	foe["ER_Light"] = -999
	foe["ER_Lightning"] = -75
	foe["ER_Water"] = 0
	foe["ER_Wind"] = 0
	foe["Rate Drop \49"] = 100
	foe["Rate Drop \50"] = 50
	foe["Rate Steal \49"] = 0
	foe["Rate Steal \50"] = 0
	foe["Rate Steal \51"] = 0
	foe["SR_Curse "] = 100
	foe["SR_Disease "] = 100
	foe["SR_Paralysis "] = 100
	foe["SR_Petrification "] = 100
	foe["SR_Poison "] = 100
	foe["SR_Silence "] = 100
	foe["SR_Undead "] = 100
	foe["normal_Accuracy"] = 75
	foe["normal_Endurance"] = 20
	foe["normal_Evasion"] = 2
	foe["normal_HP"] = 75
	foe["normal_Intelligence"] = 1
	foe["normal_Power"] = 50
	foe["normal_Resistance"] = 1
	foe["normal_Speed"] = 75
	foe["oversoul_Accuracy"] = 100
	foe["oversoul_Endurance"] = 0
	foe["oversoul_Evasion"] = 0
	foe["oversoul_HP"] = 0
	foe["oversoul_Intelligence"] = 0
	foe["oversoul_Power"] = 0
	foe["oversoul_Resistance"] = 0
	foe["oversoul_Speed"] = 0


return foe


