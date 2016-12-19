--[[
  GobPriest.lua
  Version: 16.12.19
  Copyright (C) 2016 Jeroen Petrus Broks
  
  ===========================
  This file is part of a project related to the Phantasar Chronicles or another
  series or saga which is property of Jeroen P. Broks.
  This means that it may contain references to a story-line plus characters
  which are property of Jeroen Broks. These references may only be distributed
  along with an unmodified version of the game. 
  
  As soon as you remove or replace ALL references to the storyline or character
  references, or any termology specifically set up for the Phantasar universe,
  or any other univers a story of Jeroen P. Broks is set up for,
  the restrictions of this file are removed and will automatically become
  zLib licensed (see below).
  
  Please note that doing so counts as a modification and must be marked as such
  in accordance to the zLib license.
  ===========================
  zLib license terms:
  This software is provided 'as-is', without any express or implied
  warranty.  In no event will the authors be held liable for any damages
  arising from the use of this software.
  Permission is granted to anyone to use this software for any purpose,
  including commercial applications, and to alter it and redistribute it
  freely, subject to the following restrictions:
  1. The origin of this software must not be misrepresented; you must not
     claim that you wrote the original software. If you use this software
     in a product, an acknowledgment in the product documentation would be
     appreciated but is not required.
  2. Altered source versions must be plainly marked as such, and must not be
     misrepresented as being the original software.
  3. This notice may not be removed or altered from any source distribution.
]]
-- File Generated: Mon 19 December 2016; 18:32:05


local foe = {}

	foe["AI"] = "default"
	foe["NEWGAMEPLUS_AAA_ATTACK"] = true
	foe["NEWGAMEPLUS_ABL_FOE_SMITE"] = true
	foe["NEWGAMEPLUS_ABL_FOE_VENOMBITE"] = true
	foe["NEWGAMEPLUS_ABL_FOE_VENOMSTAB"] = true
	foe["NEWGAMEPLUS_ABL_FOE_VIRUSSTAB"] = true
	foe["NEWGAMEPLUS_ABL_HERO_DANDOR_AXESMASH"] = true
	foe["NEWGAMEPLUS_ABL_HERO_DANDOR_SUPERAXESMASH"] = true
	foe["NEWGAMEPLUS_ABL_HERO_HANDOSTILLOR_CUREDISEASE"] = true
	foe["NEWGAMEPLUS_ABL_HERO_HANDOSTILLOR_FIRSTAID"] = true
	foe["NEWGAMEPLUS_ABL_HERO_HANDOSTILLOR_HOLYSTRIKE"] = true
	foe["NEWGAMEPLUS_ABL_HERO_HANDOSTILLOR_NEUTRALIZEPOISON"] = true
	foe["NEWGAMEPLUS_ABL_HERO_HANDOSTILLOR_PURIFY"] = true
	foe["NEWGAMEPLUS_ABL_HERO_HANDOSTILLOR_RECOVER"] = true
	foe["NEWGAMEPLUS_ABL_HERO_HANDOSTILLOR_REMOVEPARALYSIS"] = true
	foe["NEWGAMEPLUS_ABL_HERO_HANDOSTILLOR_STICKSWING"] = true
	foe["NEWGAMEPLUS_ABL_HERO_HANDOSTILLOR_VITALIZE"] = true
	foe["NEWGAMEPLUS_ABL_HERO_JAKE_\50PS"] = true
	foe["NEWGAMEPLUS_ABL_HERO_JAKE_\51PS"] = true
	foe["NEWGAMEPLUS_ABL_HERO_JAKE_\52PS"] = true
	foe["NEWGAMEPLUS_ABL_HERO_JAKE_SHIFT_FAIRY"] = true
	foe["NEWGAMEPLUS_ABL_HERO_JAKE_SHIFT_HUMAN"] = true
	foe["NEWGAMEPLUS_ABL_HERO_MARRILONA_HEAL"] = true
	foe["NEWGAMEPLUS_ABL_HERO_MARRILONA_SPLASH"] = true
	foe["NEWGAMEPLUS_ITM_ANTIDOTE"] = true
	foe["NEWGAMEPLUS_ITM_APPLE"] = true
	foe["NEWGAMEPLUS_ITM_FLAMEORB"] = true
	foe["NEWGAMEPLUS_ITM_MAGICDUST"] = true
	foe["NEWGAMEPLUS_ITM_MANDRAKE"] = true
	foe["NEWGAMEPLUS_ITM_MEDICINE"] = true
	foe["NEWGAMEPLUS_ITM_PHOENIX"] = true
	foe["NEWGAMEPLUS_ITM_POTION"] = true
	foe["NEWGAMEPLUS_ITM_SALVE"] = true
	foe["NEWGAMEPLUS_SPECIAL_AXESMASH"] = true
	foe["NEWGAMEPLUS_WAND_FLAME"] = true
	foe["NEWGAMEPLUS_WAND_FROST"] = true
	foe["NEWGAMEPLUS_WAND_TRAINING"] = true
	foe["NORMAL_AAA_ATTACK"] = true
	foe["NORMAL_ABL_FOE_SMITE"] = true
	foe["NORMAL_ABL_FOE_VENOMBITE"] = true
	foe["NORMAL_ABL_FOE_VENOMSTAB"] = true
	foe["NORMAL_ABL_FOE_VIRUSSTAB"] = true
	foe["NORMAL_ABL_HERO_DANDOR_AXESMASH"] = true
	foe["NORMAL_ABL_HERO_DANDOR_SUPERAXESMASH"] = true
	foe["NORMAL_ABL_HERO_HANDOSTILLOR_CUREDISEASE"] = true
	foe["NORMAL_ABL_HERO_HANDOSTILLOR_FIRSTAID"] = true
	foe["NORMAL_ABL_HERO_HANDOSTILLOR_HOLYSTRIKE"] = true
	foe["NORMAL_ABL_HERO_HANDOSTILLOR_NEUTRALIZEPOISON"] = true
	foe["NORMAL_ABL_HERO_HANDOSTILLOR_PURIFY"] = true
	foe["NORMAL_ABL_HERO_HANDOSTILLOR_RECOVER"] = true
	foe["NORMAL_ABL_HERO_HANDOSTILLOR_REMOVEPARALYSIS"] = true
	foe["NORMAL_ABL_HERO_HANDOSTILLOR_STICKSWING"] = true
	foe["NORMAL_ABL_HERO_HANDOSTILLOR_VITALIZE"] = true
	foe["NORMAL_ABL_HERO_JAKE_\50PS"] = true
	foe["NORMAL_ABL_HERO_JAKE_\51PS"] = true
	foe["NORMAL_ABL_HERO_JAKE_\52PS"] = true
	foe["NORMAL_ABL_HERO_JAKE_SHIFT_FAIRY"] = true
	foe["NORMAL_ABL_HERO_JAKE_SHIFT_HUMAN"] = true
	foe["NORMAL_ABL_HERO_MARRILONA_HEAL"] = true
	foe["NORMAL_ABL_HERO_MARRILONA_SPLASH"] = true
	foe["NORMAL_ITM_ANTIDOTE"] = true
	foe["NORMAL_ITM_APPLE"] = true
	foe["NORMAL_ITM_FLAMEORB"] = true
	foe["NORMAL_ITM_MAGICDUST"] = true
	foe["NORMAL_ITM_MANDRAKE"] = true
	foe["NORMAL_ITM_MEDICINE"] = true
	foe["NORMAL_ITM_PHOENIX"] = true
	foe["NORMAL_ITM_POTION"] = true
	foe["NORMAL_ITM_SALVE"] = true
	foe["NORMAL_SPECIAL_AXESMASH"] = true
	foe["NORMAL_WAND_FLAME"] = true
	foe["NORMAL_WAND_FROST"] = true
	foe["NORMAL_WAND_TRAINING"] = true
	foe["OVERSOUL_AAA_ATTACK"] = true
	foe["OVERSOUL_ABL_FOE_SMITE"] = true
	foe["OVERSOUL_ABL_FOE_VENOMBITE"] = true
	foe["OVERSOUL_ABL_FOE_VENOMSTAB"] = true
	foe["OVERSOUL_ABL_FOE_VIRUSSTAB"] = true
	foe["OVERSOUL_ABL_HERO_DANDOR_AXESMASH"] = true
	foe["OVERSOUL_ABL_HERO_DANDOR_SUPERAXESMASH"] = true
	foe["OVERSOUL_ABL_HERO_HANDOSTILLOR_CUREDISEASE"] = true
	foe["OVERSOUL_ABL_HERO_HANDOSTILLOR_FIRSTAID"] = true
	foe["OVERSOUL_ABL_HERO_HANDOSTILLOR_HOLYSTRIKE"] = true
	foe["OVERSOUL_ABL_HERO_HANDOSTILLOR_NEUTRALIZEPOISON"] = true
	foe["OVERSOUL_ABL_HERO_HANDOSTILLOR_PURIFY"] = true
	foe["OVERSOUL_ABL_HERO_HANDOSTILLOR_RECOVER"] = true
	foe["OVERSOUL_ABL_HERO_HANDOSTILLOR_REMOVEPARALYSIS"] = true
	foe["OVERSOUL_ABL_HERO_HANDOSTILLOR_STICKSWING"] = true
	foe["OVERSOUL_ABL_HERO_HANDOSTILLOR_VITALIZE"] = true
	foe["OVERSOUL_ABL_HERO_JAKE_\50PS"] = true
	foe["OVERSOUL_ABL_HERO_JAKE_\51PS"] = true
	foe["OVERSOUL_ABL_HERO_JAKE_\52PS"] = true
	foe["OVERSOUL_ABL_HERO_JAKE_SHIFT_FAIRY"] = true
	foe["OVERSOUL_ABL_HERO_JAKE_SHIFT_HUMAN"] = true
	foe["OVERSOUL_ABL_HERO_MARRILONA_HEAL"] = true
	foe["OVERSOUL_ABL_HERO_MARRILONA_SPLASH"] = true
	foe["OVERSOUL_ITM_ANTIDOTE"] = true
	foe["OVERSOUL_ITM_APPLE"] = true
	foe["OVERSOUL_ITM_FLAMEORB"] = true
	foe["OVERSOUL_ITM_MAGICDUST"] = true
	foe["OVERSOUL_ITM_MANDRAKE"] = true
	foe["OVERSOUL_ITM_MEDICINE"] = true
	foe["OVERSOUL_ITM_PHOENIX"] = true
	foe["OVERSOUL_ITM_POTION"] = true
	foe["OVERSOUL_ITM_SALVE"] = true
	foe["OVERSOUL_SPECIAL_AXESMASH"] = true
	foe["OVERSOUL_WAND_FLAME"] = true
	foe["OVERSOUL_WAND_FROST"] = true
	foe["OVERSOUL_WAND_TRAINING"] = true
	foe["SKILL\49_AAA_ATTACK"] = true
	foe["SKILL\49_ABL_FOE_SMITE"] = true
	foe["SKILL\49_ABL_FOE_VENOMBITE"] = true
	foe["SKILL\49_ABL_FOE_VENOMSTAB"] = true
	foe["SKILL\49_ABL_FOE_VIRUSSTAB"] = true
	foe["SKILL\49_ABL_HERO_DANDOR_AXESMASH"] = true
	foe["SKILL\49_ABL_HERO_DANDOR_SUPERAXESMASH"] = true
	foe["SKILL\49_ABL_HERO_HANDOSTILLOR_CUREDISEASE"] = true
	foe["SKILL\49_ABL_HERO_HANDOSTILLOR_FIRSTAID"] = true
	foe["SKILL\49_ABL_HERO_HANDOSTILLOR_HOLYSTRIKE"] = true
	foe["SKILL\49_ABL_HERO_HANDOSTILLOR_NEUTRALIZEPOISON"] = true
	foe["SKILL\49_ABL_HERO_HANDOSTILLOR_PURIFY"] = true
	foe["SKILL\49_ABL_HERO_HANDOSTILLOR_RECOVER"] = true
	foe["SKILL\49_ABL_HERO_HANDOSTILLOR_REMOVEPARALYSIS"] = true
	foe["SKILL\49_ABL_HERO_HANDOSTILLOR_STICKSWING"] = true
	foe["SKILL\49_ABL_HERO_HANDOSTILLOR_VITALIZE"] = true
	foe["SKILL\49_ABL_HERO_JAKE_\50PS"] = true
	foe["SKILL\49_ABL_HERO_JAKE_\51PS"] = true
	foe["SKILL\49_ABL_HERO_JAKE_\52PS"] = true
	foe["SKILL\49_ABL_HERO_JAKE_SHIFT_FAIRY"] = true
	foe["SKILL\49_ABL_HERO_JAKE_SHIFT_HUMAN"] = true
	foe["SKILL\49_ABL_HERO_MARRILONA_HEAL"] = true
	foe["SKILL\49_ABL_HERO_MARRILONA_SPLASH"] = true
	foe["SKILL\49_ITM_ANTIDOTE"] = true
	foe["SKILL\49_ITM_APPLE"] = true
	foe["SKILL\49_ITM_FLAMEORB"] = true
	foe["SKILL\49_ITM_MAGICDUST"] = true
	foe["SKILL\49_ITM_MANDRAKE"] = true
	foe["SKILL\49_ITM_MEDICINE"] = true
	foe["SKILL\49_ITM_PHOENIX"] = true
	foe["SKILL\49_ITM_POTION"] = true
	foe["SKILL\49_ITM_SALVE"] = true
	foe["SKILL\49_SPECIAL_AXESMASH"] = true
	foe["SKILL\49_WAND_FLAME"] = true
	foe["SKILL\49_WAND_FROST"] = true
	foe["SKILL\49_WAND_TRAINING"] = true
	foe["SKILL\50_AAA_ATTACK"] = true
	foe["SKILL\50_ABL_FOE_SMITE"] = true
	foe["SKILL\50_ABL_FOE_VENOMBITE"] = true
	foe["SKILL\50_ABL_FOE_VENOMSTAB"] = true
	foe["SKILL\50_ABL_FOE_VIRUSSTAB"] = true
	foe["SKILL\50_ABL_HERO_DANDOR_AXESMASH"] = true
	foe["SKILL\50_ABL_HERO_DANDOR_SUPERAXESMASH"] = true
	foe["SKILL\50_ABL_HERO_HANDOSTILLOR_CUREDISEASE"] = true
	foe["SKILL\50_ABL_HERO_HANDOSTILLOR_FIRSTAID"] = true
	foe["SKILL\50_ABL_HERO_HANDOSTILLOR_HOLYSTRIKE"] = true
	foe["SKILL\50_ABL_HERO_HANDOSTILLOR_NEUTRALIZEPOISON"] = true
	foe["SKILL\50_ABL_HERO_HANDOSTILLOR_PURIFY"] = true
	foe["SKILL\50_ABL_HERO_HANDOSTILLOR_RECOVER"] = true
	foe["SKILL\50_ABL_HERO_HANDOSTILLOR_REMOVEPARALYSIS"] = true
	foe["SKILL\50_ABL_HERO_HANDOSTILLOR_STICKSWING"] = true
	foe["SKILL\50_ABL_HERO_HANDOSTILLOR_VITALIZE"] = true
	foe["SKILL\50_ABL_HERO_JAKE_\50PS"] = true
	foe["SKILL\50_ABL_HERO_JAKE_\51PS"] = true
	foe["SKILL\50_ABL_HERO_JAKE_\52PS"] = true
	foe["SKILL\50_ABL_HERO_JAKE_SHIFT_FAIRY"] = true
	foe["SKILL\50_ABL_HERO_JAKE_SHIFT_HUMAN"] = true
	foe["SKILL\50_ABL_HERO_MARRILONA_HEAL"] = true
	foe["SKILL\50_ABL_HERO_MARRILONA_SPLASH"] = true
	foe["SKILL\50_ITM_ANTIDOTE"] = true
	foe["SKILL\50_ITM_APPLE"] = true
	foe["SKILL\50_ITM_FLAMEORB"] = true
	foe["SKILL\50_ITM_MAGICDUST"] = true
	foe["SKILL\50_ITM_MANDRAKE"] = true
	foe["SKILL\50_ITM_MEDICINE"] = true
	foe["SKILL\50_ITM_PHOENIX"] = true
	foe["SKILL\50_ITM_POTION"] = true
	foe["SKILL\50_ITM_SALVE"] = true
	foe["SKILL\50_SPECIAL_AXESMASH"] = true
	foe["SKILL\50_WAND_FLAME"] = true
	foe["SKILL\50_WAND_FROST"] = true
	foe["SKILL\50_WAND_TRAINING"] = true
	foe["SKILL\51_AAA_ATTACK"] = true
	foe["SKILL\51_ABL_FOE_SMITE"] = true
	foe["SKILL\51_ABL_FOE_VENOMBITE"] = true
	foe["SKILL\51_ABL_FOE_VENOMSTAB"] = true
	foe["SKILL\51_ABL_FOE_VIRUSSTAB"] = true
	foe["SKILL\51_ABL_HERO_DANDOR_AXESMASH"] = true
	foe["SKILL\51_ABL_HERO_DANDOR_SUPERAXESMASH"] = true
	foe["SKILL\51_ABL_HERO_HANDOSTILLOR_CUREDISEASE"] = true
	foe["SKILL\51_ABL_HERO_HANDOSTILLOR_FIRSTAID"] = true
	foe["SKILL\51_ABL_HERO_HANDOSTILLOR_HOLYSTRIKE"] = true
	foe["SKILL\51_ABL_HERO_HANDOSTILLOR_NEUTRALIZEPOISON"] = true
	foe["SKILL\51_ABL_HERO_HANDOSTILLOR_PURIFY"] = true
	foe["SKILL\51_ABL_HERO_HANDOSTILLOR_RECOVER"] = true
	foe["SKILL\51_ABL_HERO_HANDOSTILLOR_REMOVEPARALYSIS"] = true
	foe["SKILL\51_ABL_HERO_HANDOSTILLOR_STICKSWING"] = true
	foe["SKILL\51_ABL_HERO_HANDOSTILLOR_VITALIZE"] = true
	foe["SKILL\51_ABL_HERO_JAKE_\50PS"] = true
	foe["SKILL\51_ABL_HERO_JAKE_\51PS"] = true
	foe["SKILL\51_ABL_HERO_JAKE_\52PS"] = true
	foe["SKILL\51_ABL_HERO_JAKE_SHIFT_FAIRY"] = true
	foe["SKILL\51_ABL_HERO_JAKE_SHIFT_HUMAN"] = true
	foe["SKILL\51_ABL_HERO_MARRILONA_HEAL"] = true
	foe["SKILL\51_ABL_HERO_MARRILONA_SPLASH"] = true
	foe["SKILL\51_ITM_ANTIDOTE"] = true
	foe["SKILL\51_ITM_APPLE"] = true
	foe["SKILL\51_ITM_FLAMEORB"] = true
	foe["SKILL\51_ITM_MAGICDUST"] = true
	foe["SKILL\51_ITM_MANDRAKE"] = true
	foe["SKILL\51_ITM_MEDICINE"] = true
	foe["SKILL\51_ITM_PHOENIX"] = true
	foe["SKILL\51_ITM_POTION"] = true
	foe["SKILL\51_ITM_SALVE"] = true
	foe["SKILL\51_SPECIAL_AXESMASH"] = true
	foe["SKILL\51_WAND_FLAME"] = true
	foe["SKILL\51_WAND_FROST"] = true
	foe["SKILL\51_WAND_TRAINING"] = true
	foe["Desc"] = "What? Do do have a priesthood?\10Is this some kind of a joke?"
	foe["Image"] = "GFX\47Combat\47Fighters\47Foe\47reg\47GobPriest\46png"
	foe["Item Drop \49"] = "ITM_SALVE"
	foe["Item Drop \50"] = "ITM_POTION"
	foe["Item Steal \49"] = "ITM_POTION"
	foe["Item Steal \50"] = "ITM_APPLE"
	foe["Item Steal \51"] = "ITM_ANTIDOTE"
	foe["Name"] = "Goblin priest"
	foe["RATE_AAA_ATTACK"] = 0
	foe["RATE_ABL_FOE_SMITE"] = 0
	foe["RATE_ABL_FOE_VENOMBITE"] = 0
	foe["RATE_ABL_FOE_VENOMSTAB"] = 0
	foe["RATE_ABL_FOE_VIRUSSTAB"] = 0
	foe["RATE_ABL_HERO_DANDOR_AXESMASH"] = 0
	foe["RATE_ABL_HERO_DANDOR_SUPERAXESMASH"] = 0
	foe["RATE_ABL_HERO_HANDOSTILLOR_CUREDISEASE"] = 0
	foe["RATE_ABL_HERO_HANDOSTILLOR_FIRSTAID"] = 5
	foe["RATE_ABL_HERO_HANDOSTILLOR_HOLYSTRIKE"] = 0
	foe["RATE_ABL_HERO_HANDOSTILLOR_NEUTRALIZEPOISON"] = 2
	foe["RATE_ABL_HERO_HANDOSTILLOR_PURIFY"] = 1
	foe["RATE_ABL_HERO_HANDOSTILLOR_RECOVER"] = 7
	foe["RATE_ABL_HERO_HANDOSTILLOR_REMOVEPARALYSIS"] = 3
	foe["RATE_ABL_HERO_HANDOSTILLOR_STICKSWING"] = 0
	foe["RATE_ABL_HERO_HANDOSTILLOR_VITALIZE"] = 4
	foe["RATE_ABL_HERO_JAKE_\50PS"] = 0
	foe["RATE_ABL_HERO_JAKE_\51PS"] = 0
	foe["RATE_ABL_HERO_JAKE_\52PS"] = 0
	foe["RATE_ABL_HERO_JAKE_SHIFT_FAIRY"] = 0
	foe["RATE_ABL_HERO_JAKE_SHIFT_HUMAN"] = 0
	foe["RATE_ABL_HERO_MARRILONA_HEAL"] = 0
	foe["RATE_ABL_HERO_MARRILONA_SPLASH"] = 0
	foe["RATE_ITM_ANTIDOTE"] = 0
	foe["RATE_ITM_APPLE"] = 0
	foe["RATE_ITM_FLAMEORB"] = 0
	foe["RATE_ITM_MAGICDUST"] = 0
	foe["RATE_ITM_MANDRAKE"] = 0
	foe["RATE_ITM_MEDICINE"] = 0
	foe["RATE_ITM_PHOENIX"] = 0
	foe["RATE_ITM_POTION"] = 0
	foe["RATE_ITM_SALVE"] = 0
	foe["RATE_SPECIAL_AXESMASH"] = 0
	foe["RATE_WAND_FLAME"] = 0
	foe["RATE_WAND_FROST"] = 0
	foe["RATE_WAND_TRAINING"] = 0
	foe["TARGET_AAA_ATTACK"] = "Random"
	foe["TARGET_ABL_FOE_SMITE"] = "Random"
	foe["TARGET_ABL_FOE_VENOMBITE"] = "Random"
	foe["TARGET_ABL_FOE_VENOMSTAB"] = "Random"
	foe["TARGET_ABL_FOE_VIRUSSTAB"] = "Random"
	foe["TARGET_ABL_HERO_DANDOR_AXESMASH"] = "Random"
	foe["TARGET_ABL_HERO_DANDOR_SUPERAXESMASH"] = "Random"
	foe["TARGET_ABL_HERO_HANDOSTILLOR_CUREDISEASE"] = "Random"
	foe["TARGET_ABL_HERO_HANDOSTILLOR_FIRSTAID"] = "Random"
	foe["TARGET_ABL_HERO_HANDOSTILLOR_HOLYSTRIKE"] = "Random"
	foe["TARGET_ABL_HERO_HANDOSTILLOR_NEUTRALIZEPOISON"] = "Random"
	foe["TARGET_ABL_HERO_HANDOSTILLOR_PURIFY"] = "Random"
	foe["TARGET_ABL_HERO_HANDOSTILLOR_RECOVER"] = "Random"
	foe["TARGET_ABL_HERO_HANDOSTILLOR_REMOVEPARALYSIS"] = "Random"
	foe["TARGET_ABL_HERO_HANDOSTILLOR_STICKSWING"] = "Random"
	foe["TARGET_ABL_HERO_HANDOSTILLOR_VITALIZE"] = "Random"
	foe["TARGET_ABL_HERO_JAKE_\50PS"] = "Random"
	foe["TARGET_ABL_HERO_JAKE_\51PS"] = "Random"
	foe["TARGET_ABL_HERO_JAKE_\52PS"] = "Random"
	foe["TARGET_ABL_HERO_JAKE_SHIFT_FAIRY"] = "Random"
	foe["TARGET_ABL_HERO_JAKE_SHIFT_HUMAN"] = "Random"
	foe["TARGET_ABL_HERO_MARRILONA_HEAL"] = "Random"
	foe["TARGET_ABL_HERO_MARRILONA_SPLASH"] = "Random"
	foe["TARGET_ITM_ANTIDOTE"] = "Random"
	foe["TARGET_ITM_APPLE"] = "Random"
	foe["TARGET_ITM_FLAMEORB"] = "Random"
	foe["TARGET_ITM_MAGICDUST"] = "Random"
	foe["TARGET_ITM_MANDRAKE"] = "Random"
	foe["TARGET_ITM_MEDICINE"] = "Random"
	foe["TARGET_ITM_PHOENIX"] = "Random"
	foe["TARGET_ITM_POTION"] = "Random"
	foe["TARGET_ITM_SALVE"] = "Random"
	foe["TARGET_SPECIAL_AXESMASH"] = "Random"
	foe["TARGET_WAND_FLAME"] = "Random"
	foe["TARGET_WAND_FROST"] = "Random"
	foe["TARGET_WAND_TRAINING"] = "Random"
	foe["Boss"] = false
	foe["Oversoul"] = true
	foe["Oversoul Drop \49"] = false
	foe["Oversoul Drop \50"] = true
	foe["Oversoul Steal \49"] = false
	foe["Oversoul Steal \50"] = false
	foe["Oversoul Steal \51"] = false
	foe["Cash"] = 0
	foe["ER_Darkness"] = 9999
	foe["ER_Earth"] = -100
	foe["ER_Flame"] = -100
	foe["ER_Frost"] = -100
	foe["ER_Light"] = 200
	foe["ER_Lightning"] = -100
	foe["ER_Water"] = -100
	foe["ER_Wind"] = -100
	foe["Rate Drop \49"] = 20
	foe["Rate Drop \50"] = 2
	foe["Rate Steal \49"] = 1
	foe["Rate Steal \50"] = 100
	foe["Rate Steal \51"] = 50
	foe["SR_Curse "] = 100
	foe["SR_Disease "] = 85
	foe["SR_Paralysis "] = 76
	foe["SR_Petrification "] = 95
	foe["SR_Poison "] = 76
	foe["SR_Silence "] = 100
	foe["SR_Undead "] = 100
	foe["normal_Accuracy"] = 100
	foe["normal_EXP"] = 8
	foe["normal_Endurance"] = 19
	foe["normal_Evasion"] = 1
	foe["normal_HP"] = 100
	foe["normal_Intelligence"] = 5
	foe["normal_Power"] = 5
	foe["normal_Resistance"] = 200
	foe["normal_Speed"] = 45
	foe["oversoul_Accuracy"] = 100
	foe["oversoul_EXP"] = 20
	foe["oversoul_Endurance"] = 25
	foe["oversoul_Evasion"] = 5
	foe["oversoul_HP"] = 200
	foe["oversoul_Intelligence"] = 100
	foe["oversoul_Power"] = 5
	foe["oversoul_Resistance"] = 900
	foe["oversoul_Speed"] = 60


return foe


