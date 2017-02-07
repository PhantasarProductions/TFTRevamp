--[[
  Thief.lua
  Version: 17.02.07
  Copyright (C) 2017 Jeroen Petrus Broks
  
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
-- File Generated: Tue 07 February 2017; 23:27:33


local foe = {}

	foe["AI"] = "default"
	foe["NEWGAMEPLUS_AAA_ATTACK"] = true
	foe["NEWGAMEPLUS_AAA_GUARD"] = true
	foe["NEWGAMEPLUS_ABL_FOE_DISTRACT"] = true
	foe["NEWGAMEPLUS_ABL_FOE_VENOMSTAB"] = true
	foe["NEWGAMEPLUS_ABL_FOE_VIRUSSTAB"] = true
	foe["NEWGAMEPLUS_ABL_HERO_JAKE_\50PS"] = true
	foe["NEWGAMEPLUS_ITM_HEALINGHERB"] = true
	foe["NEWGAMEPLUS_ITM_HEALSHOWER"] = true
	foe["NEWGAMEPLUS_ITM_POTION"] = true
	foe["NORMAL_AAA_ATTACK"] = true
	foe["NORMAL_AAA_GUARD"] = true
	foe["NORMAL_ABL_FOE_DISTRACT"] = true
	foe["NORMAL_ABL_FOE_VENOMSTAB"] = true
	foe["NORMAL_ABL_FOE_VIRUSSTAB"] = true
	foe["NORMAL_ABL_HERO_JAKE_\50PS"] = false
	foe["NORMAL_ITM_HEALINGHERB"] = true
	foe["NORMAL_ITM_HEALSHOWER"] = true
	foe["NORMAL_ITM_POTION"] = true
	foe["OVERSOUL_AAA_ATTACK"] = true
	foe["OVERSOUL_AAA_GUARD"] = true
	foe["OVERSOUL_ABL_FOE_DISTRACT"] = true
	foe["OVERSOUL_ABL_FOE_VENOMSTAB"] = true
	foe["OVERSOUL_ABL_FOE_VIRUSSTAB"] = true
	foe["OVERSOUL_ABL_HERO_JAKE_\50PS"] = true
	foe["OVERSOUL_ITM_HEALINGHERB"] = true
	foe["OVERSOUL_ITM_HEALSHOWER"] = true
	foe["OVERSOUL_ITM_POTION"] = true
	foe["SKILL\49_AAA_ATTACK"] = true
	foe["SKILL\49_AAA_GUARD"] = true
	foe["SKILL\49_ABL_FOE_DISTRACT"] = true
	foe["SKILL\49_ABL_FOE_VENOMSTAB"] = true
	foe["SKILL\49_ABL_FOE_VIRUSSTAB"] = true
	foe["SKILL\49_ABL_HERO_JAKE_\50PS"] = true
	foe["SKILL\49_ITM_HEALINGHERB"] = true
	foe["SKILL\49_ITM_HEALSHOWER"] = true
	foe["SKILL\49_ITM_POTION"] = true
	foe["SKILL\50_AAA_ATTACK"] = true
	foe["SKILL\50_AAA_GUARD"] = true
	foe["SKILL\50_ABL_FOE_DISTRACT"] = true
	foe["SKILL\50_ABL_FOE_VENOMSTAB"] = true
	foe["SKILL\50_ABL_FOE_VIRUSSTAB"] = true
	foe["SKILL\50_ABL_HERO_JAKE_\50PS"] = true
	foe["SKILL\50_ITM_HEALINGHERB"] = true
	foe["SKILL\50_ITM_HEALSHOWER"] = true
	foe["SKILL\50_ITM_POTION"] = true
	foe["SKILL\51_AAA_ATTACK"] = true
	foe["SKILL\51_AAA_GUARD"] = true
	foe["SKILL\51_ABL_FOE_DISTRACT"] = true
	foe["SKILL\51_ABL_FOE_VENOMSTAB"] = true
	foe["SKILL\51_ABL_FOE_VIRUSSTAB"] = true
	foe["SKILL\51_ABL_HERO_JAKE_\50PS"] = true
	foe["SKILL\51_ITM_HEALINGHERB"] = true
	foe["SKILL\51_ITM_HEALSHOWER"] = true
	foe["SKILL\51_ITM_POTION"] = true
	foe["STSTART_Curse"] = false
	foe["STSTART_Death"] = false
	foe["STSTART_Disease"] = false
	foe["STSTART_Paralysis"] = false
	foe["STSTART_Petrification"] = false
	foe["STSTART_Poison"] = false
	foe["STSTART_Silence"] = false
	foe["STSTART_Undead"] = false
	foe["Desc"] = "Let\39s take all your loot\33"
	foe["Image"] = "GFX\47Combat\47Fighters\47Foe\47reg\47Thief\47"
	foe["Item Drop \49"] = "ITM_PHOENIX"
	foe["Item Drop \50"] = "ITM_HEALSHOWER"
	foe["Item Steal \49"] = "ITM_BELL"
	foe["Item Steal \50"] = "ITM_HEALSHOWER"
	foe["Item Steal \51"] = "ITM_CARROT"
	foe["Name"] = "Thief"
	foe["RATE_AAA_ATTACK"] = 5
	foe["RATE_AAA_GUARD"] = 5
	foe["RATE_ABL_FOE_BACTERIATUSK"] = 0
	foe["RATE_ABL_FOE_CRUSH"] = 0
	foe["RATE_ABL_FOE_DESPERATEATTACK"] = 0
	foe["RATE_ABL_FOE_DISTRACT"] = 5
	foe["RATE_ABL_FOE_FLAMESTRIKE"] = 0
	foe["RATE_ABL_FOE_GAZE"] = 0
	foe["RATE_ABL_FOE_MERMAID_TEMPATION"] = 0
	foe["RATE_ABL_FOE_PARADIVE"] = 0
	foe["RATE_ABL_FOE_SHOCKINGSTORIES"] = 0
	foe["RATE_ABL_FOE_SICKSTORIES"] = 0
	foe["RATE_ABL_FOE_SMITE"] = 0
	foe["RATE_ABL_FOE_SOULCRUSHINGSTORY"] = 0
	foe["RATE_ABL_FOE_SUICIDE"] = 0
	foe["RATE_ABL_FOE_TAKEOVER"] = 0
	foe["RATE_ABL_FOE_TAKEOVER\50"] = 0
	foe["RATE_ABL_FOE_TUSK"] = 0
	foe["RATE_ABL_FOE_VENOMBITE"] = 0
	foe["RATE_ABL_FOE_VENOMSTAB"] = 5
	foe["RATE_ABL_FOE_VIRUSSTAB"] = 5
	foe["RATE_ABL_GLOOM"] = 0
	foe["RATE_ABL_HERO_DANDOR_AXESMASH"] = 0
	foe["RATE_ABL_HERO_DANDOR_SUPERAXESMASH"] = 0
	foe["RATE_ABL_HERO_HANDOSTILLOR_CLEANSE"] = 0
	foe["RATE_ABL_HERO_HANDOSTILLOR_CUREDISEASE"] = 0
	foe["RATE_ABL_HERO_HANDOSTILLOR_FIRSTAID"] = 0
	foe["RATE_ABL_HERO_HANDOSTILLOR_HOLYSTRIKE"] = 0
	foe["RATE_ABL_HERO_HANDOSTILLOR_NEUTRALIZEPOISON"] = 0
	foe["RATE_ABL_HERO_HANDOSTILLOR_PRAY"] = 0
	foe["RATE_ABL_HERO_HANDOSTILLOR_PURIFY"] = 0
	foe["RATE_ABL_HERO_HANDOSTILLOR_RECOVER"] = 0
	foe["RATE_ABL_HERO_HANDOSTILLOR_REMOVEPARALYSIS"] = 0
	foe["RATE_ABL_HERO_HANDOSTILLOR_STICKSWING"] = 0
	foe["RATE_ABL_HERO_HANDOSTILLOR_TREATMENT"] = 0
	foe["RATE_ABL_HERO_HANDOSTILLOR_VITALIZE"] = 0
	foe["RATE_ABL_HERO_JAKE_\50PS"] = 1
	foe["RATE_ABL_HERO_JAKE_\51PS"] = 0
	foe["RATE_ABL_HERO_JAKE_\52PS"] = 0
	foe["RATE_ABL_HERO_JAKE_HEALBLADE"] = 0
	foe["RATE_ABL_HERO_JAKE_SHIFT_FAIRY"] = 0
	foe["RATE_ABL_HERO_JAKE_SHIFT_HUMAN"] = 0
	foe["RATE_ABL_HERO_MARRILONA_BIO"] = 0
	foe["RATE_ABL_HERO_MARRILONA_CHILL"] = 0
	foe["RATE_ABL_HERO_MARRILONA_ETERNALFLAME"] = 0
	foe["RATE_ABL_HERO_MARRILONA_FIREBLAST"] = 0
	foe["RATE_ABL_HERO_MARRILONA_FLAME"] = 0
	foe["RATE_ABL_HERO_MARRILONA_HEAL"] = 0
	foe["RATE_ABL_HERO_MARRILONA_INFERNO"] = 0
	foe["RATE_ABL_HERO_MARRILONA_PERMANENCE"] = 0
	foe["RATE_ABL_HERO_MARRILONA_PROTECT"] = 0
	foe["RATE_ABL_HERO_MARRILONA_ROCK"] = 0
	foe["RATE_ABL_HERO_MARRILONA_SPLASH"] = 0
	foe["RATE_ABL_HERO_MARRILONA_STONE\50FLESH"] = 0
	foe["RATE_ABL_HERO_MARRILONA_TSUNAMI"] = 0
	foe["RATE_ABL_HERO_MARRILONA_ZAP"] = 0
	foe["RATE_ABL_MASTER_FANDALORA_CURSE"] = 0
	foe["RATE_ABL_MASTER_FANDALORA_DARKNESS"] = 0
	foe["RATE_ABL_MASTER_FANDALORA_DARKVISION"] = 0
	foe["RATE_ABL_MASTER_FANDALORA_DEATH"] = 0
	foe["RATE_ABL_MASTER_FANDALORA_PHANTOM"] = 0
	foe["RATE_ABL_MASTER_FANDALORA_REMOVECURSE"] = 0
	foe["RATE_ABL_MASTER_FANDALORA_VOID"] = 0
	foe["RATE_ABL_MASTER_FREYA_REJUVENATE"] = 0
	foe["RATE_ABL_MASTER_FREYA_ULTRAHEAL"] = 0
	foe["RATE_ABL_MASTER_FREYA_VIGOR"] = 0
	foe["RATE_ABL_MASTER_MIDAS_HARDFORTHEMONEY"] = 0
	foe["RATE_ABL_MASTER_MIDAS_STEALMONEY"] = 0
	foe["RATE_ABL_MASTER_RUBINE_BACKSTAB"] = 0
	foe["RATE_ABL_MASTER_RUBINE_FOLLOWME"] = 0
	foe["RATE_ABL_MASTER_RUBINE_INVADE"] = 0
	foe["RATE_ABL_MASTER_RUBINE_PICKPOCKET"] = 0
	foe["RATE_ABL_MASTER_RUBINE_POISONSTAB"] = 0
	foe["RATE_ITM_ANTIDOTE"] = 0
	foe["RATE_ITM_APPLE"] = 0
	foe["RATE_ITM_BELL"] = 0
	foe["RATE_ITM_CARROT"] = 0
	foe["RATE_ITM_FLAMEORB"] = 0
	foe["RATE_ITM_HEALINGHERB"] = 1
	foe["RATE_ITM_HEALSHOWER"] = 1
	foe["RATE_ITM_HOLYSCROLL"] = 0
	foe["RATE_ITM_INFERNOORB"] = 0
	foe["RATE_ITM_MAGICDUST"] = 0
	foe["RATE_ITM_MANDRAKE"] = 0
	foe["RATE_ITM_MEDICINE"] = 0
	foe["RATE_ITM_MIRROR"] = 0
	foe["RATE_ITM_PANACEA"] = 0
	foe["RATE_ITM_PHOENIX"] = 0
	foe["RATE_ITM_POTION"] = 1
	foe["RATE_ITM_PURELITERATURE"] = 0
	foe["RATE_ITM_SALVE"] = 0
	foe["RATE_ITM_TRUMPCARD"] = 0
	foe["RATE_ITM_VOICEHERB"] = 0
	foe["RATE_ITM_VOLTABALL"] = 0
	foe["RATE_SPECIAL_AXESMASH"] = 0
	foe["RATE_SPIRATATRANSFORM"] = 0
	foe["RATE_SPIRATA_ATTACK_DANDOR"] = 0
	foe["RATE_SPIRATA_ATTACK_HANDOSTILLOR"] = 0
	foe["RATE_SPIRATA_ATTACK_JAKE"] = 0
	foe["RATE_SPIRATA_ATTACK_MARRILONA"] = 0
	foe["RATE_WAND_BIO"] = 0
	foe["RATE_WAND_DARK"] = 0
	foe["RATE_WAND_FLAME"] = 0
	foe["RATE_WAND_FROST"] = 0
	foe["RATE_WAND_GAIA"] = 0
	foe["RATE_WAND_HOLY"] = 0
	foe["RATE_WAND_SPLASH"] = 0
	foe["RATE_WAND_THUNDER"] = 0
	foe["RATE_WAND_TRAINING"] = 0
	foe["RATE_WAND_WIND"] = 0
	foe["RATE_ZZKEY_FIRE"] = 0
	foe["RATE_ZZKEY_KEYWATER"] = 0
	foe["TARGET_AAA_ATTACK"] = "Random"
	foe["TARGET_AAA_GUARD"] = "Random"
	foe["TARGET_ABL_FOE_BACTERIATUSK"] = "Random"
	foe["TARGET_ABL_FOE_CRUSH"] = "Random"
	foe["TARGET_ABL_FOE_DESPERATEATTACK"] = "Random"
	foe["TARGET_ABL_FOE_DISTRACT"] = "Random"
	foe["TARGET_ABL_FOE_FLAMESTRIKE"] = "Random"
	foe["TARGET_ABL_FOE_GAZE"] = "Random"
	foe["TARGET_ABL_FOE_MERMAID_TEMPATION"] = "Random"
	foe["TARGET_ABL_FOE_PARADIVE"] = "Random"
	foe["TARGET_ABL_FOE_SHOCKINGSTORIES"] = "Random"
	foe["TARGET_ABL_FOE_SICKSTORIES"] = "Random"
	foe["TARGET_ABL_FOE_SMITE"] = "Random"
	foe["TARGET_ABL_FOE_SOULCRUSHINGSTORY"] = "Random"
	foe["TARGET_ABL_FOE_SUICIDE"] = "Random"
	foe["TARGET_ABL_FOE_TAKEOVER"] = "Random"
	foe["TARGET_ABL_FOE_TAKEOVER\50"] = "Random"
	foe["TARGET_ABL_FOE_TUSK"] = "Random"
	foe["TARGET_ABL_FOE_VENOMBITE"] = "Random"
	foe["TARGET_ABL_FOE_VENOMSTAB"] = "Random"
	foe["TARGET_ABL_FOE_VIRUSSTAB"] = "Random"
	foe["TARGET_ABL_GLOOM"] = "Random"
	foe["TARGET_ABL_HERO_DANDOR_AXESMASH"] = "Random"
	foe["TARGET_ABL_HERO_DANDOR_SUPERAXESMASH"] = "Random"
	foe["TARGET_ABL_HERO_HANDOSTILLOR_CLEANSE"] = "Random"
	foe["TARGET_ABL_HERO_HANDOSTILLOR_CUREDISEASE"] = "Random"
	foe["TARGET_ABL_HERO_HANDOSTILLOR_FIRSTAID"] = "Random"
	foe["TARGET_ABL_HERO_HANDOSTILLOR_HOLYSTRIKE"] = "Random"
	foe["TARGET_ABL_HERO_HANDOSTILLOR_NEUTRALIZEPOISON"] = "Random"
	foe["TARGET_ABL_HERO_HANDOSTILLOR_PRAY"] = "Random"
	foe["TARGET_ABL_HERO_HANDOSTILLOR_PURIFY"] = "Random"
	foe["TARGET_ABL_HERO_HANDOSTILLOR_RECOVER"] = "Random"
	foe["TARGET_ABL_HERO_HANDOSTILLOR_REMOVEPARALYSIS"] = "Random"
	foe["TARGET_ABL_HERO_HANDOSTILLOR_STICKSWING"] = "Random"
	foe["TARGET_ABL_HERO_HANDOSTILLOR_TREATMENT"] = "Random"
	foe["TARGET_ABL_HERO_HANDOSTILLOR_VITALIZE"] = "Random"
	foe["TARGET_ABL_HERO_JAKE_\50PS"] = "Random"
	foe["TARGET_ABL_HERO_JAKE_\51PS"] = "Random"
	foe["TARGET_ABL_HERO_JAKE_\52PS"] = "Random"
	foe["TARGET_ABL_HERO_JAKE_HEALBLADE"] = "Random"
	foe["TARGET_ABL_HERO_JAKE_SHIFT_FAIRY"] = "Random"
	foe["TARGET_ABL_HERO_JAKE_SHIFT_HUMAN"] = "Random"
	foe["TARGET_ABL_HERO_MARRILONA_BIO"] = "Random"
	foe["TARGET_ABL_HERO_MARRILONA_CHILL"] = "Random"
	foe["TARGET_ABL_HERO_MARRILONA_ETERNALFLAME"] = "Random"
	foe["TARGET_ABL_HERO_MARRILONA_FIREBLAST"] = "Random"
	foe["TARGET_ABL_HERO_MARRILONA_FLAME"] = "Random"
	foe["TARGET_ABL_HERO_MARRILONA_HEAL"] = "Random"
	foe["TARGET_ABL_HERO_MARRILONA_INFERNO"] = "Random"
	foe["TARGET_ABL_HERO_MARRILONA_PERMANENCE"] = "Random"
	foe["TARGET_ABL_HERO_MARRILONA_PROTECT"] = "Random"
	foe["TARGET_ABL_HERO_MARRILONA_ROCK"] = "Random"
	foe["TARGET_ABL_HERO_MARRILONA_SPLASH"] = "Random"
	foe["TARGET_ABL_HERO_MARRILONA_STONE\50FLESH"] = "Random"
	foe["TARGET_ABL_HERO_MARRILONA_TSUNAMI"] = "Random"
	foe["TARGET_ABL_HERO_MARRILONA_ZAP"] = "Random"
	foe["TARGET_ABL_MASTER_FANDALORA_CURSE"] = "Random"
	foe["TARGET_ABL_MASTER_FANDALORA_DARKNESS"] = "Random"
	foe["TARGET_ABL_MASTER_FANDALORA_DARKVISION"] = "Random"
	foe["TARGET_ABL_MASTER_FANDALORA_DEATH"] = "Random"
	foe["TARGET_ABL_MASTER_FANDALORA_PHANTOM"] = "Random"
	foe["TARGET_ABL_MASTER_FANDALORA_REMOVECURSE"] = "Random"
	foe["TARGET_ABL_MASTER_FANDALORA_VOID"] = "Random"
	foe["TARGET_ABL_MASTER_FREYA_REJUVENATE"] = "Random"
	foe["TARGET_ABL_MASTER_FREYA_ULTRAHEAL"] = "Random"
	foe["TARGET_ABL_MASTER_FREYA_VIGOR"] = "Random"
	foe["TARGET_ABL_MASTER_MIDAS_HARDFORTHEMONEY"] = "Random"
	foe["TARGET_ABL_MASTER_MIDAS_STEALMONEY"] = "Random"
	foe["TARGET_ABL_MASTER_RUBINE_BACKSTAB"] = "Random"
	foe["TARGET_ABL_MASTER_RUBINE_FOLLOWME"] = "Random"
	foe["TARGET_ABL_MASTER_RUBINE_INVADE"] = "Random"
	foe["TARGET_ABL_MASTER_RUBINE_PICKPOCKET"] = "Random"
	foe["TARGET_ABL_MASTER_RUBINE_POISONSTAB"] = "Random"
	foe["TARGET_ITM_ANTIDOTE"] = "Random"
	foe["TARGET_ITM_APPLE"] = "Random"
	foe["TARGET_ITM_BELL"] = "Random"
	foe["TARGET_ITM_CARROT"] = "Random"
	foe["TARGET_ITM_FLAMEORB"] = "Random"
	foe["TARGET_ITM_HEALINGHERB"] = "Random"
	foe["TARGET_ITM_HEALSHOWER"] = "Random"
	foe["TARGET_ITM_HOLYSCROLL"] = "Random"
	foe["TARGET_ITM_INFERNOORB"] = "Random"
	foe["TARGET_ITM_MAGICDUST"] = "Random"
	foe["TARGET_ITM_MANDRAKE"] = "Random"
	foe["TARGET_ITM_MEDICINE"] = "Random"
	foe["TARGET_ITM_MIRROR"] = "Random"
	foe["TARGET_ITM_PANACEA"] = "Random"
	foe["TARGET_ITM_PHOENIX"] = "Random"
	foe["TARGET_ITM_POTION"] = "Random"
	foe["TARGET_ITM_PURELITERATURE"] = "Random"
	foe["TARGET_ITM_SALVE"] = "Random"
	foe["TARGET_ITM_TRUMPCARD"] = "Random"
	foe["TARGET_ITM_VOICEHERB"] = "Random"
	foe["TARGET_ITM_VOLTABALL"] = "Random"
	foe["TARGET_SPECIAL_AXESMASH"] = "Random"
	foe["TARGET_SPIRATATRANSFORM"] = "Random"
	foe["TARGET_SPIRATA_ATTACK_DANDOR"] = "Random"
	foe["TARGET_SPIRATA_ATTACK_HANDOSTILLOR"] = "Random"
	foe["TARGET_SPIRATA_ATTACK_JAKE"] = "Random"
	foe["TARGET_SPIRATA_ATTACK_MARRILONA"] = "Random"
	foe["TARGET_WAND_BIO"] = "Random"
	foe["TARGET_WAND_DARK"] = "Random"
	foe["TARGET_WAND_FLAME"] = "Random"
	foe["TARGET_WAND_FROST"] = "Random"
	foe["TARGET_WAND_GAIA"] = "Random"
	foe["TARGET_WAND_HOLY"] = "Random"
	foe["TARGET_WAND_SPLASH"] = "Random"
	foe["TARGET_WAND_THUNDER"] = "Random"
	foe["TARGET_WAND_TRAINING"] = "Random"
	foe["TARGET_WAND_WIND"] = "Random"
	foe["TARGET_ZZKEY_FIRE"] = "Random"
	foe["TARGET_ZZKEY_KEYWATER"] = "Random"
	foe["VocalTag"] = "Thief"
	foe["Boss"] = false
	foe["Oversoul"] = true
	foe["Oversoul Drop \49"] = false
	foe["Oversoul Drop \50"] = false
	foe["Oversoul Steal \49"] = false
	foe["Oversoul Steal \50"] = false
	foe["Oversoul Steal \51"] = false
	foe["Cash"] = 25
	foe["ER_Darkness"] = 100
	foe["ER_Earth"] = -5
	foe["ER_Flame"] = -5
	foe["ER_Frost"] = -5
	foe["ER_Light"] = -25
	foe["ER_Lightning"] = 15
	foe["ER_Water"] = -5
	foe["ER_Wind"] = 5
	foe["Rate Drop \49"] = 5
	foe["Rate Drop \50"] = 1
	foe["Rate Steal \49"] = 500
	foe["Rate Steal \50"] = 75
	foe["Rate Steal \51"] = 1
	foe["SR_Curse "] = 0
	foe["SR_Death"] = 65
	foe["SR_Disease "] = 0
	foe["SR_Paralysis "] = 0
	foe["SR_Petrification "] = 0
	foe["SR_Poison "] = 0
	foe["SR_Silence "] = 0
	foe["SR_Undead "] = 0
	foe["normal_Accuracy"] = 100
	foe["normal_EXP"] = 12
	foe["normal_Endurance"] = 10
	foe["normal_Evasion"] = 75
	foe["normal_HP"] = 75
	foe["normal_Intelligence"] = 150
	foe["normal_Power"] = 150
	foe["normal_Resistance"] = 5
	foe["normal_Speed"] = 500
	foe["oversoul_Accuracy"] = 100
	foe["oversoul_EXP"] = 3
	foe["oversoul_Endurance"] = 1
	foe["oversoul_Evasion"] = 99
	foe["oversoul_HP"] = 250
	foe["oversoul_Intelligence"] = 200
	foe["oversoul_Power"] = 200
	foe["oversoul_Resistance"] = 1
	foe["oversoul_Speed"] = 500


return foe


