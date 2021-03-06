--[[
  Imp2.lua
  Version: 17.05.27
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
-- File Generated: Sat 27 May 2017; 17:41:41


local foe = {}

	foe["AI"] = "default"
	foe["NEWGAMEPLUS_AAA_ATTACK"] = true
	foe["NEWGAMEPLUS_AAA_GUARD"] = true
	foe["NEWGAMEPLUS_ABL_FOE_GAZE"] = true
	foe["NEWGAMEPLUS_ABL_FOE_GRAVITY"] = true
	foe["NEWGAMEPLUS_ABL_FOE_PARADIVE"] = true
	foe["NEWGAMEPLUS_ABL_FOE_TAKEOVER"] = true
	foe["NEWGAMEPLUS_ABL_FOE_TOTALEXHAUSTION"] = true
	foe["NEWGAMEPLUS_ABL_FOE_VENOMSTAB"] = true
	foe["NEWGAMEPLUS_ABL_FOE_VIRUSSTAB"] = true
	foe["NORMAL_AAA_ATTACK"] = true
	foe["NORMAL_AAA_GUARD"] = true
	foe["NORMAL_ABL_FOE_GAZE"] = true
	foe["NORMAL_ABL_FOE_GRAVITY"] = true
	foe["NORMAL_ABL_FOE_PARADIVE"] = true
	foe["NORMAL_ABL_FOE_TAKEOVER"] = true
	foe["NORMAL_ABL_FOE_TOTALEXHAUSTION"] = true
	foe["NORMAL_ABL_FOE_VENOMSTAB"] = true
	foe["NORMAL_ABL_FOE_VIRUSSTAB"] = true
	foe["OVERSOUL_AAA_ATTACK"] = true
	foe["OVERSOUL_AAA_GUARD"] = true
	foe["OVERSOUL_ABL_FOE_GAZE"] = true
	foe["OVERSOUL_ABL_FOE_GRAVITY"] = true
	foe["OVERSOUL_ABL_FOE_PARADIVE"] = true
	foe["OVERSOUL_ABL_FOE_TAKEOVER"] = true
	foe["OVERSOUL_ABL_FOE_TOTALEXHAUSTION"] = true
	foe["OVERSOUL_ABL_FOE_VENOMSTAB"] = true
	foe["OVERSOUL_ABL_FOE_VIRUSSTAB"] = true
	foe["SKILL\49_AAA_ATTACK"] = true
	foe["SKILL\49_AAA_GUARD"] = true
	foe["SKILL\49_ABL_FOE_GAZE"] = false
	foe["SKILL\49_ABL_FOE_GRAVITY"] = true
	foe["SKILL\49_ABL_FOE_PARADIVE"] = true
	foe["SKILL\49_ABL_FOE_TAKEOVER"] = true
	foe["SKILL\49_ABL_FOE_TOTALEXHAUSTION"] = true
	foe["SKILL\49_ABL_FOE_VENOMSTAB"] = true
	foe["SKILL\49_ABL_FOE_VIRUSSTAB"] = true
	foe["SKILL\50_AAA_ATTACK"] = true
	foe["SKILL\50_AAA_GUARD"] = true
	foe["SKILL\50_ABL_FOE_GAZE"] = false
	foe["SKILL\50_ABL_FOE_GRAVITY"] = true
	foe["SKILL\50_ABL_FOE_PARADIVE"] = true
	foe["SKILL\50_ABL_FOE_TAKEOVER"] = true
	foe["SKILL\50_ABL_FOE_TOTALEXHAUSTION"] = true
	foe["SKILL\50_ABL_FOE_VENOMSTAB"] = true
	foe["SKILL\50_ABL_FOE_VIRUSSTAB"] = true
	foe["SKILL\51_AAA_ATTACK"] = true
	foe["SKILL\51_AAA_GUARD"] = true
	foe["SKILL\51_ABL_FOE_GAZE"] = true
	foe["SKILL\51_ABL_FOE_GRAVITY"] = true
	foe["SKILL\51_ABL_FOE_PARADIVE"] = true
	foe["SKILL\51_ABL_FOE_TAKEOVER"] = true
	foe["SKILL\51_ABL_FOE_TOTALEXHAUSTION"] = true
	foe["SKILL\51_ABL_FOE_VENOMSTAB"] = true
	foe["SKILL\51_ABL_FOE_VIRUSSTAB"] = true
	foe["STSTART_Confusion"] = false
	foe["STSTART_Curse"] = false
	foe["STSTART_Death"] = false
	foe["STSTART_Disease"] = false
	foe["STSTART_Paralysis"] = false
	foe["STSTART_Petrification"] = false
	foe["STSTART_Poison"] = false
	foe["STSTART_Silence"] = false
	foe["STSTART_Sleep"] = false
	foe["STSTART_Undead"] = false
	foe["Desc"] = "Looks the same\46 Is even called the same\46\10But it\39s definitely stronger\46"
	foe["Image"] = "GFX\47Combat\47Fighters\47Foe\47Reg\47Imp\46png"
	foe["Item Drop \49"] = "ITM_JUSDORANGE"
	foe["Item Drop \50"] = "ITM_UBERPOTION"
	foe["Item Steal \49"] = "ITM_ANABOLINEA"
	foe["Item Steal \50"] = "ITM_BANANA"
	foe["Item Steal \51"] = "ITM_ANABOLINEA"
	foe["Name"] = "Imp"
	foe["RATE_AAA_ATTACK"] = 100
	foe["RATE_AAA_GUARD"] = 5
	foe["RATE_ABL_FOE_BACTERIATUSK"] = 0
	foe["RATE_ABL_FOE_CRUSH"] = 0
	foe["RATE_ABL_FOE_DEATHSPELL"] = 0
	foe["RATE_ABL_FOE_DEMON_SOUL_BREAKER"] = 0
	foe["RATE_ABL_FOE_DESPERATEATTACK"] = 0
	foe["RATE_ABL_FOE_DISINTEGRATE"] = 0
	foe["RATE_ABL_FOE_DISTRACT"] = 0
	foe["RATE_ABL_FOE_EXHAUST"] = 0
	foe["RATE_ABL_FOE_FLAMEBITE"] = 0
	foe["RATE_ABL_FOE_FLAMESTRIKE"] = 0
	foe["RATE_ABL_FOE_GAZE"] = 1
	foe["RATE_ABL_FOE_GRAVITY"] = 2
	foe["RATE_ABL_FOE_HOLDPERSON"] = 0
	foe["RATE_ABL_FOE_HORROR"] = 0
	foe["RATE_ABL_FOE_MERMAID_TEMPATION"] = 0
	foe["RATE_ABL_FOE_PARADIVE"] = 1
	foe["RATE_ABL_FOE_RANDOMIZER"] = 0
	foe["RATE_ABL_FOE_RANDOMIZERTOTAL"] = 0
	foe["RATE_ABL_FOE_SETTHESTAGEONFIRE"] = 0
	foe["RATE_ABL_FOE_SHOCKINGSTORIES"] = 0
	foe["RATE_ABL_FOE_SICKSTORIES"] = 0
	foe["RATE_ABL_FOE_SMITE"] = 0
	foe["RATE_ABL_FOE_SOULCRUSHINGSTORY"] = 0
	foe["RATE_ABL_FOE_SPORES"] = 0
	foe["RATE_ABL_FOE_SUICIDE"] = 0
	foe["RATE_ABL_FOE_TAKEOVER"] = 1
	foe["RATE_ABL_FOE_TAKEOVER\50"] = 0
	foe["RATE_ABL_FOE_TOTALEXHAUSTION"] = 1
	foe["RATE_ABL_FOE_TUSK"] = 0
	foe["RATE_ABL_FOE_TWOEDGE"] = 0
	foe["RATE_ABL_FOE_ULTIMATESOULCRUSHER"] = 0
	foe["RATE_ABL_FOE_VENOMBITE"] = 0
	foe["RATE_ABL_FOE_VENOMSTAB"] = 6
	foe["RATE_ABL_FOE_VIRUSSTAB"] = 6
	foe["RATE_ABL_FOE_WELCOMEINHELL"] = 0
	foe["RATE_ABL_FOLLOWUP_FIKKIE"] = 0
	foe["RATE_ABL_GLOOM"] = 0
	foe["RATE_ABL_HERO_DANDOR_AXESMASH"] = 0
	foe["RATE_ABL_HERO_DANDOR_BARRIER"] = 0
	foe["RATE_ABL_HERO_DANDOR_SHIELD"] = 0
	foe["RATE_ABL_HERO_DANDOR_SUPERAXESMASH"] = 0
	foe["RATE_ABL_HERO_HANDOSTILLOR_CLEANSE"] = 0
	foe["RATE_ABL_HERO_HANDOSTILLOR_CUREDISEASE"] = 0
	foe["RATE_ABL_HERO_HANDOSTILLOR_FIRSTAID"] = 0
	foe["RATE_ABL_HERO_HANDOSTILLOR_GOODMORNING"] = 0
	foe["RATE_ABL_HERO_HANDOSTILLOR_HASPARONVITALIZATION"] = 0
	foe["RATE_ABL_HERO_HANDOSTILLOR_HOLYSTRIKE"] = 0
	foe["RATE_ABL_HERO_HANDOSTILLOR_NEUTRALIZEPOISON"] = 0
	foe["RATE_ABL_HERO_HANDOSTILLOR_PRAY"] = 0
	foe["RATE_ABL_HERO_HANDOSTILLOR_PRAYFORALL"] = 0
	foe["RATE_ABL_HERO_HANDOSTILLOR_PURIFY"] = 0
	foe["RATE_ABL_HERO_HANDOSTILLOR_RECOVER"] = 0
	foe["RATE_ABL_HERO_HANDOSTILLOR_REMOVEPARALYSIS"] = 0
	foe["RATE_ABL_HERO_HANDOSTILLOR_RESURRECT"] = 0
	foe["RATE_ABL_HERO_HANDOSTILLOR_REVIVE"] = 0
	foe["RATE_ABL_HERO_HANDOSTILLOR_SMITE"] = 0
	foe["RATE_ABL_HERO_HANDOSTILLOR_STICKSWING"] = 0
	foe["RATE_ABL_HERO_HANDOSTILLOR_TREATMENT"] = 0
	foe["RATE_ABL_HERO_HANDOSTILLOR_TWINKLE"] = 0
	foe["RATE_ABL_HERO_HANDOSTILLOR_VITALIZE"] = 0
	foe["RATE_ABL_HERO_HANDOSTILLOR_WHIZZY"] = 0
	foe["RATE_ABL_HERO_JAKE_\50PS"] = 0
	foe["RATE_ABL_HERO_JAKE_\51PS"] = 0
	foe["RATE_ABL_HERO_JAKE_\52PS"] = 0
	foe["RATE_ABL_HERO_JAKE_BERSERK"] = 0
	foe["RATE_ABL_HERO_JAKE_EARTHSLICE"] = 0
	foe["RATE_ABL_HERO_JAKE_FLAMEBLADE"] = 0
	foe["RATE_ABL_HERO_JAKE_HEALBLADE"] = 0
	foe["RATE_ABL_HERO_JAKE_SHIFT_FAIRY"] = 0
	foe["RATE_ABL_HERO_JAKE_SHIFT_HUMAN"] = 0
	foe["RATE_ABL_HERO_MARRILONA_BIO"] = 0
	foe["RATE_ABL_HERO_MARRILONA_BREEZE"] = 0
	foe["RATE_ABL_HERO_MARRILONA_CHILL"] = 0
	foe["RATE_ABL_HERO_MARRILONA_CURSEDHEALING"] = 0
	foe["RATE_ABL_HERO_MARRILONA_ELECTROCUTION"] = 0
	foe["RATE_ABL_HERO_MARRILONA_ETERNALFLAME"] = 0
	foe["RATE_ABL_HERO_MARRILONA_FIREBLAST"] = 0
	foe["RATE_ABL_HERO_MARRILONA_FLAME"] = 0
	foe["RATE_ABL_HERO_MARRILONA_HEAL"] = 0
	foe["RATE_ABL_HERO_MARRILONA_HURRICANE"] = 0
	foe["RATE_ABL_HERO_MARRILONA_ICEBLAST"] = 0
	foe["RATE_ABL_HERO_MARRILONA_INFERNO"] = 0
	foe["RATE_ABL_HERO_MARRILONA_MEDITATION"] = 0
	foe["RATE_ABL_HERO_MARRILONA_PERMANENCE"] = 0
	foe["RATE_ABL_HERO_MARRILONA_PROTECT"] = 0
	foe["RATE_ABL_HERO_MARRILONA_QUAKE"] = 0
	foe["RATE_ABL_HERO_MARRILONA_ROCK"] = 0
	foe["RATE_ABL_HERO_MARRILONA_SPEEDUP"] = 0
	foe["RATE_ABL_HERO_MARRILONA_SPLASH"] = 0
	foe["RATE_ABL_HERO_MARRILONA_STONE\50FLESH"] = 0
	foe["RATE_ABL_HERO_MARRILONA_TSUNAMI"] = 0
	foe["RATE_ABL_HERO_MARRILONA_ZAP"] = 0
	foe["RATE_ABL_HERO_SPEEDUP"] = 0
	foe["RATE_ABL_MASTER_FANDALORA_CURSE"] = 0
	foe["RATE_ABL_MASTER_FANDALORA_DARKNESS"] = 0
	foe["RATE_ABL_MASTER_FANDALORA_DARKVISION"] = 0
	foe["RATE_ABL_MASTER_FANDALORA_DEATH"] = 0
	foe["RATE_ABL_MASTER_FANDALORA_PHANTOM"] = 0
	foe["RATE_ABL_MASTER_FANDALORA_REMOVECURSE"] = 0
	foe["RATE_ABL_MASTER_FANDALORA_VOID"] = 0
	foe["RATE_ABL_MASTER_FEENA_CHARIBDIS"] = 0
	foe["RATE_ABL_MASTER_FEENA_COCYTUS"] = 0
	foe["RATE_ABL_MASTER_FEENA_DROWN"] = 0
	foe["RATE_ABL_MASTER_FEENA_FULLPOWER"] = 0
	foe["RATE_ABL_MASTER_FEENA_KATRINA"] = 0
	foe["RATE_ABL_MASTER_FEENA_MAGMABLAST"] = 0
	foe["RATE_ABL_MASTER_FEENA_MEGAQUAKE"] = 0
	foe["RATE_ABL_MASTER_FEENA_SCYLLA"] = 0
	foe["RATE_ABL_MASTER_FREYA_REJUVENATE"] = 0
	foe["RATE_ABL_MASTER_FREYA_ULTRAHEAL"] = 0
	foe["RATE_ABL_MASTER_FREYA_VIGOR"] = 0
	foe["RATE_ABL_MASTER_KRANDAR_\53PS"] = 0
	foe["RATE_ABL_MASTER_KRANDAR_\54PS"] = 0
	foe["RATE_ABL_MASTER_KRANDAR_\55PS"] = 0
	foe["RATE_ABL_MASTER_KRANDAR_CATASTROPHE"] = 0
	foe["RATE_ABL_MASTER_KRANDAR_CHARGE"] = 0
	foe["RATE_ABL_MASTER_KRANDAR_HOLYSHIT"] = 0
	foe["RATE_ABL_MASTER_MIDAS_HARDFORTHEMONEY"] = 0
	foe["RATE_ABL_MASTER_MIDAS_STEALMONEY"] = 0
	foe["RATE_ABL_MASTER_RUBINE_BACKSTAB"] = 0
	foe["RATE_ABL_MASTER_RUBINE_FOLLOWME"] = 0
	foe["RATE_ABL_MASTER_RUBINE_INVADE"] = 0
	foe["RATE_ABL_MASTER_RUBINE_PICKPOCKET"] = 0
	foe["RATE_ABL_MASTER_RUBINE_POISONSTAB"] = 0
	foe["RATE_ABL_MASTER_RUSSELL_DECAPITATE"] = 0
	foe["RATE_ABL_MASTER_RUSSELL_GENOCIDE"] = 0
	foe["RATE_ABL_MASTER_RUSSELL_SAFESHOT"] = 0
	foe["RATE_ABL_MASTER_RUSSEL_DECAPITATE"] = 0
	foe["RATE_ABL_SPECIAL"] = 0
	foe["RATE_ABL_SPECIAL_DRAGONDOWN"] = 0
	foe["RATE_ABL_SPECIAL_INSTABILITY"] = 0
	foe["RATE_AUTO_NOODHULP"] = 0
	foe["RATE_BERSERK_ATTACK"] = 0
	foe["RATE_COCYTUS_ANTENORA"] = 0
	foe["RATE_COCYTUS_CAINA"] = 0
	foe["RATE_COCYTUS_JUDECCA"] = 0
	foe["RATE_COCYTUS_PTOLOMEA"] = 0
	foe["RATE_EXE_MARRILONA_MEDITATION"] = 0
	foe["RATE_FOE_WATCHMOVE"] = 0
	foe["RATE_ICEBLAST"] = 0
	foe["RATE_ITM_AMBROSIA"] = 0
	foe["RATE_ITM_ANABOLINEA"] = 0
	foe["RATE_ITM_ANTIDOTE"] = 0
	foe["RATE_ITM_APPLE"] = 0
	foe["RATE_ITM_BANANA"] = 0
	foe["RATE_ITM_BELL"] = 0
	foe["RATE_ITM_CARROT"] = 0
	foe["RATE_ITM_CURSEDSPORES"] = 0
	foe["RATE_ITM_DEATHCUBE"] = 0
	foe["RATE_ITM_EEL"] = 0
	foe["RATE_ITM_FLAMEORB"] = 0
	foe["RATE_ITM_HEALINGHERB"] = 0
	foe["RATE_ITM_HEALSHOWER"] = 0
	foe["RATE_ITM_HELLSTONE"] = 0
	foe["RATE_ITM_HOLYSCROLL"] = 0
	foe["RATE_ITM_HOLYWATER"] = 0
	foe["RATE_ITM_ICICLE"] = 0
	foe["RATE_ITM_ICICLES"] = 0
	foe["RATE_ITM_INFERNOORB"] = 0
	foe["RATE_ITM_JUSDORANGE"] = 0
	foe["RATE_ITM_MAGICDUST"] = 0
	foe["RATE_ITM_MAGICSTONE"] = 0
	foe["RATE_ITM_MANDRAKE"] = 0
	foe["RATE_ITM_MEDICINE"] = 0
	foe["RATE_ITM_MIRROR"] = 0
	foe["RATE_ITM_PANACEA"] = 0
	foe["RATE_ITM_PHOENIX"] = 0
	foe["RATE_ITM_POISONDART"] = 0
	foe["RATE_ITM_POTION"] = 0
	foe["RATE_ITM_PURELITERATURE"] = 0
	foe["RATE_ITM_SALVE"] = 0
	foe["RATE_ITM_SLEEPHERB"] = 0
	foe["RATE_ITM_STONE"] = 0
	foe["RATE_ITM_STORMBOTTLE"] = 0
	foe["RATE_ITM_TOTALEXHAUSTION"] = 0
	foe["RATE_ITM_TRUMPCARD"] = 0
	foe["RATE_ITM_UBERPOTION"] = 0
	foe["RATE_ITM_VIRUSBOMB"] = 0
	foe["RATE_ITM_VOICEHERB"] = 0
	foe["RATE_ITM_VOLTABALL"] = 0
	foe["RATE_ITM_WATERBUBBLE"] = 0
	foe["RATE_SILLY_ONE"] = 0
	foe["RATE_SILLY_ONES"] = 0
	foe["RATE_SPECIAL_ARMAGEDDON"] = 0
	foe["RATE_SPECIAL_AXESMASH"] = 0
	foe["RATE_SPECIAL_SPIRATAKILLER"] = 0
	foe["RATE_SPIRATATRANSFORM"] = 0
	foe["RATE_SPIRATA_ATTACK_DANDOR"] = 0
	foe["RATE_SPIRATA_ATTACK_HANDOSTILLOR"] = 0
	foe["RATE_SPIRATA_ATTACK_JAKE"] = 0
	foe["RATE_SPIRATA_ATTACK_MARRILONA"] = 0
	foe["RATE_WAND_BIO"] = 0
	foe["RATE_WAND_DARK"] = 0
	foe["RATE_WAND_DOOM"] = 0
	foe["RATE_WAND_FLAME"] = 0
	foe["RATE_WAND_FROST"] = 0
	foe["RATE_WAND_GAIA"] = 0
	foe["RATE_WAND_HOLY"] = 0
	foe["RATE_WAND_II_EVIL"] = 0
	foe["RATE_WAND_II_GAIA"] = 0
	foe["RATE_WAND_II_HURRICANE"] = 0
	foe["RATE_WAND_II_KELVIN"] = 0
	foe["RATE_WAND_II_SAINT"] = 0
	foe["RATE_WAND_II_SPRINGTIJ"] = 0
	foe["RATE_WAND_II_VOLCANOWAND"] = 0
	foe["RATE_WAND_II_WATT"] = 0
	foe["RATE_WAND_SPLASH"] = 0
	foe["RATE_WAND_THUNDER"] = 0
	foe["RATE_WAND_TRAINING"] = 0
	foe["RATE_WAND_WIND"] = 0
	foe["RATE_ZZKEY_BLUESTAFF"] = 0
	foe["RATE_ZZKEY_FIRE"] = 0
	foe["RATE_ZZKEY_GAIA"] = 0
	foe["RATE_ZZKEY_KEYWATER"] = 0
	foe["RATE_ZZKEY_WIND"] = 0
	foe["RATE_ZZZ_KRANDARARMOR"] = 0
	foe["RATE_ZZZ_KRANDARBLADE"] = 0
	foe["RATE_ZZ_CRYPTKEY"] = 0
	foe["TARGET_AAA_ATTACK"] = "Random"
	foe["TARGET_AAA_GUARD"] = "Random"
	foe["TARGET_ABL_FOE_BACTERIATUSK"] = "Random"
	foe["TARGET_ABL_FOE_CRUSH"] = "Random"
	foe["TARGET_ABL_FOE_DEATHSPELL"] = "Random"
	foe["TARGET_ABL_FOE_DEMON_SOUL_BREAKER"] = "Random"
	foe["TARGET_ABL_FOE_DESPERATEATTACK"] = "Random"
	foe["TARGET_ABL_FOE_DISINTEGRATE"] = "Random"
	foe["TARGET_ABL_FOE_DISTRACT"] = "Random"
	foe["TARGET_ABL_FOE_EXHAUST"] = "Random"
	foe["TARGET_ABL_FOE_FLAMEBITE"] = "Random"
	foe["TARGET_ABL_FOE_FLAMESTRIKE"] = "Random"
	foe["TARGET_ABL_FOE_GAZE"] = "Random"
	foe["TARGET_ABL_FOE_GRAVITY"] = "Random"
	foe["TARGET_ABL_FOE_HOLDPERSON"] = "Random"
	foe["TARGET_ABL_FOE_HORROR"] = "Random"
	foe["TARGET_ABL_FOE_MERMAID_TEMPATION"] = "Random"
	foe["TARGET_ABL_FOE_PARADIVE"] = "Random"
	foe["TARGET_ABL_FOE_RANDOMIZER"] = "Random"
	foe["TARGET_ABL_FOE_RANDOMIZERTOTAL"] = "Random"
	foe["TARGET_ABL_FOE_SETTHESTAGEONFIRE"] = "Random"
	foe["TARGET_ABL_FOE_SHOCKINGSTORIES"] = "Random"
	foe["TARGET_ABL_FOE_SICKSTORIES"] = "Random"
	foe["TARGET_ABL_FOE_SMITE"] = "Random"
	foe["TARGET_ABL_FOE_SOULCRUSHINGSTORY"] = "Random"
	foe["TARGET_ABL_FOE_SPORES"] = "Random"
	foe["TARGET_ABL_FOE_SUICIDE"] = "Random"
	foe["TARGET_ABL_FOE_TAKEOVER"] = "Random"
	foe["TARGET_ABL_FOE_TAKEOVER\50"] = "Random"
	foe["TARGET_ABL_FOE_TOTALEXHAUSTION"] = "Random"
	foe["TARGET_ABL_FOE_TUSK"] = "Random"
	foe["TARGET_ABL_FOE_TWOEDGE"] = "Random"
	foe["TARGET_ABL_FOE_ULTIMATESOULCRUSHER"] = "Random"
	foe["TARGET_ABL_FOE_VENOMBITE"] = "Random"
	foe["TARGET_ABL_FOE_VENOMSTAB"] = "Random"
	foe["TARGET_ABL_FOE_VIRUSSTAB"] = "Random"
	foe["TARGET_ABL_FOE_WELCOMEINHELL"] = "Random"
	foe["TARGET_ABL_FOLLOWUP_FIKKIE"] = "Random"
	foe["TARGET_ABL_GLOOM"] = "Random"
	foe["TARGET_ABL_HERO_DANDOR_AXESMASH"] = "Random"
	foe["TARGET_ABL_HERO_DANDOR_BARRIER"] = "Random"
	foe["TARGET_ABL_HERO_DANDOR_SHIELD"] = "Random"
	foe["TARGET_ABL_HERO_DANDOR_SUPERAXESMASH"] = "Random"
	foe["TARGET_ABL_HERO_HANDOSTILLOR_CLEANSE"] = "Random"
	foe["TARGET_ABL_HERO_HANDOSTILLOR_CUREDISEASE"] = "Random"
	foe["TARGET_ABL_HERO_HANDOSTILLOR_FIRSTAID"] = "Random"
	foe["TARGET_ABL_HERO_HANDOSTILLOR_GOODMORNING"] = "Random"
	foe["TARGET_ABL_HERO_HANDOSTILLOR_HASPARONVITALIZATION"] = "Random"
	foe["TARGET_ABL_HERO_HANDOSTILLOR_HOLYSTRIKE"] = "Random"
	foe["TARGET_ABL_HERO_HANDOSTILLOR_NEUTRALIZEPOISON"] = "Random"
	foe["TARGET_ABL_HERO_HANDOSTILLOR_PRAY"] = "Random"
	foe["TARGET_ABL_HERO_HANDOSTILLOR_PRAYFORALL"] = "Random"
	foe["TARGET_ABL_HERO_HANDOSTILLOR_PURIFY"] = "Random"
	foe["TARGET_ABL_HERO_HANDOSTILLOR_RECOVER"] = "Random"
	foe["TARGET_ABL_HERO_HANDOSTILLOR_REMOVEPARALYSIS"] = "Random"
	foe["TARGET_ABL_HERO_HANDOSTILLOR_RESURRECT"] = "Random"
	foe["TARGET_ABL_HERO_HANDOSTILLOR_REVIVE"] = "Random"
	foe["TARGET_ABL_HERO_HANDOSTILLOR_SMITE"] = "Random"
	foe["TARGET_ABL_HERO_HANDOSTILLOR_STICKSWING"] = "Random"
	foe["TARGET_ABL_HERO_HANDOSTILLOR_TREATMENT"] = "Random"
	foe["TARGET_ABL_HERO_HANDOSTILLOR_TWINKLE"] = "Random"
	foe["TARGET_ABL_HERO_HANDOSTILLOR_VITALIZE"] = "Random"
	foe["TARGET_ABL_HERO_HANDOSTILLOR_WHIZZY"] = "Random"
	foe["TARGET_ABL_HERO_JAKE_\50PS"] = "Random"
	foe["TARGET_ABL_HERO_JAKE_\51PS"] = "Random"
	foe["TARGET_ABL_HERO_JAKE_\52PS"] = "Random"
	foe["TARGET_ABL_HERO_JAKE_BERSERK"] = "Random"
	foe["TARGET_ABL_HERO_JAKE_EARTHSLICE"] = "Random"
	foe["TARGET_ABL_HERO_JAKE_FLAMEBLADE"] = "Random"
	foe["TARGET_ABL_HERO_JAKE_HEALBLADE"] = "Random"
	foe["TARGET_ABL_HERO_JAKE_SHIFT_FAIRY"] = "Random"
	foe["TARGET_ABL_HERO_JAKE_SHIFT_HUMAN"] = "Random"
	foe["TARGET_ABL_HERO_MARRILONA_BIO"] = "Random"
	foe["TARGET_ABL_HERO_MARRILONA_BREEZE"] = "Random"
	foe["TARGET_ABL_HERO_MARRILONA_CHILL"] = "Random"
	foe["TARGET_ABL_HERO_MARRILONA_CURSEDHEALING"] = "Random"
	foe["TARGET_ABL_HERO_MARRILONA_ELECTROCUTION"] = "Random"
	foe["TARGET_ABL_HERO_MARRILONA_ETERNALFLAME"] = "Random"
	foe["TARGET_ABL_HERO_MARRILONA_FIREBLAST"] = "Random"
	foe["TARGET_ABL_HERO_MARRILONA_FLAME"] = "Random"
	foe["TARGET_ABL_HERO_MARRILONA_HEAL"] = "Random"
	foe["TARGET_ABL_HERO_MARRILONA_HURRICANE"] = "Random"
	foe["TARGET_ABL_HERO_MARRILONA_ICEBLAST"] = "Random"
	foe["TARGET_ABL_HERO_MARRILONA_INFERNO"] = "Random"
	foe["TARGET_ABL_HERO_MARRILONA_MEDITATION"] = "Random"
	foe["TARGET_ABL_HERO_MARRILONA_PERMANENCE"] = "Random"
	foe["TARGET_ABL_HERO_MARRILONA_PROTECT"] = "Random"
	foe["TARGET_ABL_HERO_MARRILONA_QUAKE"] = "Random"
	foe["TARGET_ABL_HERO_MARRILONA_ROCK"] = "Random"
	foe["TARGET_ABL_HERO_MARRILONA_SPEEDUP"] = "Random"
	foe["TARGET_ABL_HERO_MARRILONA_SPLASH"] = "Random"
	foe["TARGET_ABL_HERO_MARRILONA_STONE\50FLESH"] = "Random"
	foe["TARGET_ABL_HERO_MARRILONA_TSUNAMI"] = "Random"
	foe["TARGET_ABL_HERO_MARRILONA_ZAP"] = "Random"
	foe["TARGET_ABL_HERO_SPEEDUP"] = "Random"
	foe["TARGET_ABL_MASTER_FANDALORA_CURSE"] = "Random"
	foe["TARGET_ABL_MASTER_FANDALORA_DARKNESS"] = "Random"
	foe["TARGET_ABL_MASTER_FANDALORA_DARKVISION"] = "Random"
	foe["TARGET_ABL_MASTER_FANDALORA_DEATH"] = "Random"
	foe["TARGET_ABL_MASTER_FANDALORA_PHANTOM"] = "Random"
	foe["TARGET_ABL_MASTER_FANDALORA_REMOVECURSE"] = "Random"
	foe["TARGET_ABL_MASTER_FANDALORA_VOID"] = "Random"
	foe["TARGET_ABL_MASTER_FEENA_CHARIBDIS"] = "Random"
	foe["TARGET_ABL_MASTER_FEENA_COCYTUS"] = "Random"
	foe["TARGET_ABL_MASTER_FEENA_DROWN"] = "Random"
	foe["TARGET_ABL_MASTER_FEENA_FULLPOWER"] = "Random"
	foe["TARGET_ABL_MASTER_FEENA_KATRINA"] = "Random"
	foe["TARGET_ABL_MASTER_FEENA_MAGMABLAST"] = "Random"
	foe["TARGET_ABL_MASTER_FEENA_MEGAQUAKE"] = "Random"
	foe["TARGET_ABL_MASTER_FEENA_SCYLLA"] = "Random"
	foe["TARGET_ABL_MASTER_FREYA_REJUVENATE"] = "Random"
	foe["TARGET_ABL_MASTER_FREYA_ULTRAHEAL"] = "Random"
	foe["TARGET_ABL_MASTER_FREYA_VIGOR"] = "Random"
	foe["TARGET_ABL_MASTER_KRANDAR_\53PS"] = "Random"
	foe["TARGET_ABL_MASTER_KRANDAR_\54PS"] = "Random"
	foe["TARGET_ABL_MASTER_KRANDAR_\55PS"] = "Random"
	foe["TARGET_ABL_MASTER_KRANDAR_CATASTROPHE"] = "Random"
	foe["TARGET_ABL_MASTER_KRANDAR_CHARGE"] = "Random"
	foe["TARGET_ABL_MASTER_KRANDAR_HOLYSHIT"] = "Random"
	foe["TARGET_ABL_MASTER_MIDAS_HARDFORTHEMONEY"] = "Random"
	foe["TARGET_ABL_MASTER_MIDAS_STEALMONEY"] = "Random"
	foe["TARGET_ABL_MASTER_RUBINE_BACKSTAB"] = "Random"
	foe["TARGET_ABL_MASTER_RUBINE_FOLLOWME"] = "Random"
	foe["TARGET_ABL_MASTER_RUBINE_INVADE"] = "Random"
	foe["TARGET_ABL_MASTER_RUBINE_PICKPOCKET"] = "Random"
	foe["TARGET_ABL_MASTER_RUBINE_POISONSTAB"] = "Random"
	foe["TARGET_ABL_MASTER_RUSSELL_DECAPITATE"] = "Random"
	foe["TARGET_ABL_MASTER_RUSSELL_GENOCIDE"] = "Random"
	foe["TARGET_ABL_MASTER_RUSSELL_SAFESHOT"] = "Random"
	foe["TARGET_ABL_MASTER_RUSSEL_DECAPITATE"] = "Random"
	foe["TARGET_ABL_SPECIAL"] = "Random"
	foe["TARGET_ABL_SPECIAL_DRAGONDOWN"] = "Random"
	foe["TARGET_ABL_SPECIAL_INSTABILITY"] = "Random"
	foe["TARGET_AUTO_NOODHULP"] = "Random"
	foe["TARGET_BERSERK_ATTACK"] = "Random"
	foe["TARGET_COCYTUS_ANTENORA"] = "Random"
	foe["TARGET_COCYTUS_CAINA"] = "Random"
	foe["TARGET_COCYTUS_JUDECCA"] = "Random"
	foe["TARGET_COCYTUS_PTOLOMEA"] = "Random"
	foe["TARGET_EXE_MARRILONA_MEDITATION"] = "Random"
	foe["TARGET_FOE_WATCHMOVE"] = "Random"
	foe["TARGET_ICEBLAST"] = "Random"
	foe["TARGET_ITM_AMBROSIA"] = "Random"
	foe["TARGET_ITM_ANABOLINEA"] = "Random"
	foe["TARGET_ITM_ANTIDOTE"] = "Random"
	foe["TARGET_ITM_APPLE"] = "Random"
	foe["TARGET_ITM_BANANA"] = "Random"
	foe["TARGET_ITM_BELL"] = "Random"
	foe["TARGET_ITM_CARROT"] = "Random"
	foe["TARGET_ITM_CURSEDSPORES"] = "Random"
	foe["TARGET_ITM_DEATHCUBE"] = "Random"
	foe["TARGET_ITM_EEL"] = "Random"
	foe["TARGET_ITM_FLAMEORB"] = "Random"
	foe["TARGET_ITM_HEALINGHERB"] = "Random"
	foe["TARGET_ITM_HEALSHOWER"] = "Random"
	foe["TARGET_ITM_HELLSTONE"] = "Random"
	foe["TARGET_ITM_HOLYSCROLL"] = "Random"
	foe["TARGET_ITM_HOLYWATER"] = "Random"
	foe["TARGET_ITM_ICICLE"] = "Random"
	foe["TARGET_ITM_ICICLES"] = "Random"
	foe["TARGET_ITM_INFERNOORB"] = "Random"
	foe["TARGET_ITM_JUSDORANGE"] = "Random"
	foe["TARGET_ITM_MAGICDUST"] = "Random"
	foe["TARGET_ITM_MAGICSTONE"] = "Random"
	foe["TARGET_ITM_MANDRAKE"] = "Random"
	foe["TARGET_ITM_MEDICINE"] = "Random"
	foe["TARGET_ITM_MIRROR"] = "Random"
	foe["TARGET_ITM_PANACEA"] = "Random"
	foe["TARGET_ITM_PHOENIX"] = "Random"
	foe["TARGET_ITM_POISONDART"] = "Random"
	foe["TARGET_ITM_POTION"] = "Random"
	foe["TARGET_ITM_PURELITERATURE"] = "Random"
	foe["TARGET_ITM_SALVE"] = "Random"
	foe["TARGET_ITM_SLEEPHERB"] = "Random"
	foe["TARGET_ITM_STONE"] = "Random"
	foe["TARGET_ITM_STORMBOTTLE"] = "Random"
	foe["TARGET_ITM_TOTALEXHAUSTION"] = "Random"
	foe["TARGET_ITM_TRUMPCARD"] = "Random"
	foe["TARGET_ITM_UBERPOTION"] = "Random"
	foe["TARGET_ITM_VIRUSBOMB"] = "Random"
	foe["TARGET_ITM_VOICEHERB"] = "Random"
	foe["TARGET_ITM_VOLTABALL"] = "Random"
	foe["TARGET_ITM_WATERBUBBLE"] = "Random"
	foe["TARGET_SILLY_ONE"] = "Random"
	foe["TARGET_SILLY_ONES"] = "Random"
	foe["TARGET_SPECIAL_ARMAGEDDON"] = "Random"
	foe["TARGET_SPECIAL_AXESMASH"] = "Random"
	foe["TARGET_SPECIAL_SPIRATAKILLER"] = "Random"
	foe["TARGET_SPIRATATRANSFORM"] = "Random"
	foe["TARGET_SPIRATA_ATTACK_DANDOR"] = "Random"
	foe["TARGET_SPIRATA_ATTACK_HANDOSTILLOR"] = "Random"
	foe["TARGET_SPIRATA_ATTACK_JAKE"] = "Random"
	foe["TARGET_SPIRATA_ATTACK_MARRILONA"] = "Random"
	foe["TARGET_WAND_BIO"] = "Random"
	foe["TARGET_WAND_DARK"] = "Random"
	foe["TARGET_WAND_DOOM"] = "Random"
	foe["TARGET_WAND_FLAME"] = "Random"
	foe["TARGET_WAND_FROST"] = "Random"
	foe["TARGET_WAND_GAIA"] = "Random"
	foe["TARGET_WAND_HOLY"] = "Random"
	foe["TARGET_WAND_II_EVIL"] = "Random"
	foe["TARGET_WAND_II_GAIA"] = "Random"
	foe["TARGET_WAND_II_HURRICANE"] = "Random"
	foe["TARGET_WAND_II_KELVIN"] = "Random"
	foe["TARGET_WAND_II_SAINT"] = "Random"
	foe["TARGET_WAND_II_SPRINGTIJ"] = "Random"
	foe["TARGET_WAND_II_VOLCANOWAND"] = "Random"
	foe["TARGET_WAND_II_WATT"] = "Random"
	foe["TARGET_WAND_SPLASH"] = "Random"
	foe["TARGET_WAND_THUNDER"] = "Random"
	foe["TARGET_WAND_TRAINING"] = "Random"
	foe["TARGET_WAND_WIND"] = "Random"
	foe["TARGET_ZZKEY_BLUESTAFF"] = "Random"
	foe["TARGET_ZZKEY_FIRE"] = "Random"
	foe["TARGET_ZZKEY_GAIA"] = "Random"
	foe["TARGET_ZZKEY_KEYWATER"] = "Random"
	foe["TARGET_ZZKEY_WIND"] = "Random"
	foe["TARGET_ZZZ_KRANDARARMOR"] = "Random"
	foe["TARGET_ZZZ_KRANDARBLADE"] = "Random"
	foe["TARGET_ZZ_CRYPTKEY"] = "Random"
	foe["VocalTag"] = "Imp"
	foe["Boss"] = false
	foe["Oversoul"] = true
	foe["Oversoul Drop \49"] = false
	foe["Oversoul Drop \50"] = false
	foe["Oversoul Steal \49"] = false
	foe["Oversoul Steal \50"] = false
	foe["Oversoul Steal \51"] = false
	foe["Cash"] = 100
	foe["ER_Darkness"] = 75
	foe["ER_Earth"] = 75
	foe["ER_Flame"] = 75
	foe["ER_Frost"] = 75
	foe["ER_Light"] = 75
	foe["ER_Lightning"] = 75
	foe["ER_Water"] = 75
	foe["ER_Wind"] = 75
	foe["Rate Drop \49"] = 5
	foe["Rate Drop \50"] = 3
	foe["Rate Steal \49"] = 1
	foe["Rate Steal \50"] = 1
	foe["Rate Steal \51"] = 1
	foe["SR_Confusion"] = 75
	foe["SR_Curse"] = 75
	foe["SR_Death"] = 75
	foe["SR_Disease"] = 75
	foe["SR_Paralysis"] = 75
	foe["SR_Petrification"] = 75
	foe["SR_Poison"] = 75
	foe["SR_Silence"] = 75
	foe["SR_Sleep"] = 75
	foe["SR_Undead"] = 75
	foe["normal_Accuracy"] = 99
	foe["normal_EXP"] = 1234
	foe["normal_Endurance"] = 560
	foe["normal_Evasion"] = 50
	foe["normal_HP"] = 3200
	foe["normal_Intelligence"] = 440
	foe["normal_Power"] = 620
	foe["normal_Resistance"] = 200
	foe["normal_Speed"] = 260
	foe["oversoul_Accuracy"] = 100
	foe["oversoul_EXP"] = 0
	foe["oversoul_Endurance"] = 1120
	foe["oversoul_Evasion"] = 80
	foe["oversoul_HP"] = 6400
	foe["oversoul_Intelligence"] = 880
	foe["oversoul_Power"] = 1240
	foe["oversoul_Resistance"] = 400
	foe["oversoul_Speed"] = 520


return foe


