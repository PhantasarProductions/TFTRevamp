--[[
  Snake.lua
  Version: 17.01.07
  Copyright (C) 2016, 2017 Jeroen Petrus Broks
  
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
-- File Generated: Sat 07 January 2017; 11:12:50


local foe = {}

	foe["AI"] = "default"
	foe["NEWGAMEPLUS_AAA_ATTACK"] = true
	foe["NEWGAMEPLUS_AAA_GUARD"] = true
	foe["NEWGAMEPLUS_ABL_FOE_CRUSH"] = true
	foe["NEWGAMEPLUS_ABL_FOE_DESPERATEATTACK"] = true
	foe["NEWGAMEPLUS_ABL_FOE_DISTRACT"] = true
	foe["NEWGAMEPLUS_ABL_FOE_FLAMESTRIKE"] = true
	foe["NEWGAMEPLUS_ABL_FOE_SHOCKINGSTORIES"] = true
	foe["NEWGAMEPLUS_ABL_FOE_SICKSTORIES"] = true
	foe["NEWGAMEPLUS_ABL_FOE_SMITE"] = true
	foe["NEWGAMEPLUS_ABL_FOE_SOULCRUSHINGSTORY"] = true
	foe["NEWGAMEPLUS_ABL_FOE_SUICIDE"] = true
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
	foe["NEWGAMEPLUS_ABL_HERO_JAKE_HEALBLADE"] = true
	foe["NEWGAMEPLUS_ABL_HERO_JAKE_SHIFT_FAIRY"] = true
	foe["NEWGAMEPLUS_ABL_HERO_JAKE_SHIFT_HUMAN"] = true
	foe["NEWGAMEPLUS_ABL_HERO_MARRILONA_CHILL"] = true
	foe["NEWGAMEPLUS_ABL_HERO_MARRILONA_FLAME"] = true
	foe["NEWGAMEPLUS_ABL_HERO_MARRILONA_HEAL"] = true
	foe["NEWGAMEPLUS_ABL_HERO_MARRILONA_PERMANENCE"] = true
	foe["NEWGAMEPLUS_ABL_HERO_MARRILONA_PROTECT"] = true
	foe["NEWGAMEPLUS_ABL_HERO_MARRILONA_ROCK"] = true
	foe["NEWGAMEPLUS_ABL_HERO_MARRILONA_SPLASH"] = true
	foe["NEWGAMEPLUS_ABL_HERO_MARRILONA_ZAP"] = true
	foe["NEWGAMEPLUS_ABL_MASTER_FREYA_REJUVENATE"] = true
	foe["NEWGAMEPLUS_ABL_MASTER_FREYA_ULTRAHEAL"] = true
	foe["NEWGAMEPLUS_ABL_MASTER_FREYA_VIGOR"] = true
	foe["NEWGAMEPLUS_ABL_MASTER_RUBINE_BACKSTAB"] = true
	foe["NEWGAMEPLUS_ABL_MASTER_RUBINE_FOLLOWME"] = true
	foe["NEWGAMEPLUS_ABL_MASTER_RUBINE_INVADE"] = true
	foe["NEWGAMEPLUS_ABL_MASTER_RUBINE_PICKPOCKET"] = true
	foe["NEWGAMEPLUS_ABL_MASTER_RUBINE_POISONSTAB"] = true
	foe["NEWGAMEPLUS_ITM_ANTIDOTE"] = true
	foe["NEWGAMEPLUS_ITM_APPLE"] = true
	foe["NEWGAMEPLUS_ITM_BELL"] = true
	foe["NEWGAMEPLUS_ITM_FLAMEORB"] = true
	foe["NEWGAMEPLUS_ITM_MAGICDUST"] = true
	foe["NEWGAMEPLUS_ITM_MANDRAKE"] = true
	foe["NEWGAMEPLUS_ITM_MEDICINE"] = true
	foe["NEWGAMEPLUS_ITM_PANACEA"] = true
	foe["NEWGAMEPLUS_ITM_PHOENIX"] = true
	foe["NEWGAMEPLUS_ITM_POTION"] = true
	foe["NEWGAMEPLUS_ITM_PURELITERATURE"] = true
	foe["NEWGAMEPLUS_ITM_SALVE"] = true
	foe["NEWGAMEPLUS_SPECIAL_AXESMASH"] = true
	foe["NEWGAMEPLUS_WAND_FLAME"] = true
	foe["NEWGAMEPLUS_WAND_FROST"] = true
	foe["NEWGAMEPLUS_WAND_THUNDER"] = true
	foe["NEWGAMEPLUS_WAND_TRAINING"] = true
	foe["NORMAL_AAA_ATTACK"] = true
	foe["NORMAL_AAA_GUARD"] = true
	foe["NORMAL_ABL_FOE_CRUSH"] = true
	foe["NORMAL_ABL_FOE_DESPERATEATTACK"] = true
	foe["NORMAL_ABL_FOE_DISTRACT"] = true
	foe["NORMAL_ABL_FOE_FLAMESTRIKE"] = true
	foe["NORMAL_ABL_FOE_SHOCKINGSTORIES"] = true
	foe["NORMAL_ABL_FOE_SICKSTORIES"] = true
	foe["NORMAL_ABL_FOE_SMITE"] = true
	foe["NORMAL_ABL_FOE_SOULCRUSHINGSTORY"] = true
	foe["NORMAL_ABL_FOE_SUICIDE"] = true
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
	foe["NORMAL_ABL_HERO_JAKE_HEALBLADE"] = true
	foe["NORMAL_ABL_HERO_JAKE_SHIFT_FAIRY"] = true
	foe["NORMAL_ABL_HERO_JAKE_SHIFT_HUMAN"] = true
	foe["NORMAL_ABL_HERO_MARRILONA_CHILL"] = true
	foe["NORMAL_ABL_HERO_MARRILONA_FLAME"] = true
	foe["NORMAL_ABL_HERO_MARRILONA_HEAL"] = true
	foe["NORMAL_ABL_HERO_MARRILONA_PERMANENCE"] = true
	foe["NORMAL_ABL_HERO_MARRILONA_PROTECT"] = true
	foe["NORMAL_ABL_HERO_MARRILONA_ROCK"] = true
	foe["NORMAL_ABL_HERO_MARRILONA_SPLASH"] = true
	foe["NORMAL_ABL_HERO_MARRILONA_ZAP"] = true
	foe["NORMAL_ABL_MASTER_FREYA_REJUVENATE"] = true
	foe["NORMAL_ABL_MASTER_FREYA_ULTRAHEAL"] = true
	foe["NORMAL_ABL_MASTER_FREYA_VIGOR"] = true
	foe["NORMAL_ABL_MASTER_RUBINE_BACKSTAB"] = true
	foe["NORMAL_ABL_MASTER_RUBINE_FOLLOWME"] = true
	foe["NORMAL_ABL_MASTER_RUBINE_INVADE"] = true
	foe["NORMAL_ABL_MASTER_RUBINE_PICKPOCKET"] = true
	foe["NORMAL_ABL_MASTER_RUBINE_POISONSTAB"] = true
	foe["NORMAL_ITM_ANTIDOTE"] = true
	foe["NORMAL_ITM_APPLE"] = true
	foe["NORMAL_ITM_BELL"] = true
	foe["NORMAL_ITM_FLAMEORB"] = true
	foe["NORMAL_ITM_MAGICDUST"] = true
	foe["NORMAL_ITM_MANDRAKE"] = true
	foe["NORMAL_ITM_MEDICINE"] = true
	foe["NORMAL_ITM_PANACEA"] = true
	foe["NORMAL_ITM_PHOENIX"] = true
	foe["NORMAL_ITM_POTION"] = true
	foe["NORMAL_ITM_PURELITERATURE"] = true
	foe["NORMAL_ITM_SALVE"] = true
	foe["NORMAL_SPECIAL_AXESMASH"] = true
	foe["NORMAL_WAND_FLAME"] = true
	foe["NORMAL_WAND_FROST"] = true
	foe["NORMAL_WAND_THUNDER"] = true
	foe["NORMAL_WAND_TRAINING"] = true
	foe["OVERSOUL_AAA_ATTACK"] = false
	foe["OVERSOUL_AAA_GUARD"] = true
	foe["OVERSOUL_ABL_FOE_CRUSH"] = true
	foe["OVERSOUL_ABL_FOE_DESPERATEATTACK"] = true
	foe["OVERSOUL_ABL_FOE_DISTRACT"] = true
	foe["OVERSOUL_ABL_FOE_FLAMESTRIKE"] = true
	foe["OVERSOUL_ABL_FOE_SHOCKINGSTORIES"] = true
	foe["OVERSOUL_ABL_FOE_SICKSTORIES"] = true
	foe["OVERSOUL_ABL_FOE_SMITE"] = true
	foe["OVERSOUL_ABL_FOE_SOULCRUSHINGSTORY"] = true
	foe["OVERSOUL_ABL_FOE_SUICIDE"] = true
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
	foe["OVERSOUL_ABL_HERO_JAKE_HEALBLADE"] = true
	foe["OVERSOUL_ABL_HERO_JAKE_SHIFT_FAIRY"] = true
	foe["OVERSOUL_ABL_HERO_JAKE_SHIFT_HUMAN"] = true
	foe["OVERSOUL_ABL_HERO_MARRILONA_CHILL"] = true
	foe["OVERSOUL_ABL_HERO_MARRILONA_FLAME"] = true
	foe["OVERSOUL_ABL_HERO_MARRILONA_HEAL"] = true
	foe["OVERSOUL_ABL_HERO_MARRILONA_PERMANENCE"] = true
	foe["OVERSOUL_ABL_HERO_MARRILONA_PROTECT"] = true
	foe["OVERSOUL_ABL_HERO_MARRILONA_ROCK"] = true
	foe["OVERSOUL_ABL_HERO_MARRILONA_SPLASH"] = true
	foe["OVERSOUL_ABL_HERO_MARRILONA_ZAP"] = true
	foe["OVERSOUL_ABL_MASTER_FREYA_REJUVENATE"] = true
	foe["OVERSOUL_ABL_MASTER_FREYA_ULTRAHEAL"] = true
	foe["OVERSOUL_ABL_MASTER_FREYA_VIGOR"] = true
	foe["OVERSOUL_ABL_MASTER_RUBINE_BACKSTAB"] = true
	foe["OVERSOUL_ABL_MASTER_RUBINE_FOLLOWME"] = true
	foe["OVERSOUL_ABL_MASTER_RUBINE_INVADE"] = true
	foe["OVERSOUL_ABL_MASTER_RUBINE_PICKPOCKET"] = true
	foe["OVERSOUL_ABL_MASTER_RUBINE_POISONSTAB"] = true
	foe["OVERSOUL_ITM_ANTIDOTE"] = true
	foe["OVERSOUL_ITM_APPLE"] = true
	foe["OVERSOUL_ITM_BELL"] = true
	foe["OVERSOUL_ITM_FLAMEORB"] = true
	foe["OVERSOUL_ITM_MAGICDUST"] = true
	foe["OVERSOUL_ITM_MANDRAKE"] = true
	foe["OVERSOUL_ITM_MEDICINE"] = true
	foe["OVERSOUL_ITM_PANACEA"] = true
	foe["OVERSOUL_ITM_PHOENIX"] = true
	foe["OVERSOUL_ITM_POTION"] = true
	foe["OVERSOUL_ITM_PURELITERATURE"] = true
	foe["OVERSOUL_ITM_SALVE"] = true
	foe["OVERSOUL_SPECIAL_AXESMASH"] = true
	foe["OVERSOUL_WAND_FLAME"] = true
	foe["OVERSOUL_WAND_FROST"] = true
	foe["OVERSOUL_WAND_THUNDER"] = true
	foe["OVERSOUL_WAND_TRAINING"] = true
	foe["SKILL\49_AAA_ATTACK"] = true
	foe["SKILL\49_AAA_GUARD"] = true
	foe["SKILL\49_ABL_FOE_CRUSH"] = true
	foe["SKILL\49_ABL_FOE_DESPERATEATTACK"] = true
	foe["SKILL\49_ABL_FOE_DISTRACT"] = true
	foe["SKILL\49_ABL_FOE_FLAMESTRIKE"] = true
	foe["SKILL\49_ABL_FOE_SHOCKINGSTORIES"] = true
	foe["SKILL\49_ABL_FOE_SICKSTORIES"] = true
	foe["SKILL\49_ABL_FOE_SMITE"] = true
	foe["SKILL\49_ABL_FOE_SOULCRUSHINGSTORY"] = true
	foe["SKILL\49_ABL_FOE_SUICIDE"] = true
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
	foe["SKILL\49_ABL_HERO_JAKE_HEALBLADE"] = true
	foe["SKILL\49_ABL_HERO_JAKE_SHIFT_FAIRY"] = true
	foe["SKILL\49_ABL_HERO_JAKE_SHIFT_HUMAN"] = true
	foe["SKILL\49_ABL_HERO_MARRILONA_CHILL"] = true
	foe["SKILL\49_ABL_HERO_MARRILONA_FLAME"] = true
	foe["SKILL\49_ABL_HERO_MARRILONA_HEAL"] = true
	foe["SKILL\49_ABL_HERO_MARRILONA_PERMANENCE"] = true
	foe["SKILL\49_ABL_HERO_MARRILONA_PROTECT"] = true
	foe["SKILL\49_ABL_HERO_MARRILONA_ROCK"] = true
	foe["SKILL\49_ABL_HERO_MARRILONA_SPLASH"] = true
	foe["SKILL\49_ABL_HERO_MARRILONA_ZAP"] = true
	foe["SKILL\49_ABL_MASTER_FREYA_REJUVENATE"] = true
	foe["SKILL\49_ABL_MASTER_FREYA_ULTRAHEAL"] = true
	foe["SKILL\49_ABL_MASTER_FREYA_VIGOR"] = true
	foe["SKILL\49_ABL_MASTER_RUBINE_BACKSTAB"] = true
	foe["SKILL\49_ABL_MASTER_RUBINE_FOLLOWME"] = true
	foe["SKILL\49_ABL_MASTER_RUBINE_INVADE"] = true
	foe["SKILL\49_ABL_MASTER_RUBINE_PICKPOCKET"] = true
	foe["SKILL\49_ABL_MASTER_RUBINE_POISONSTAB"] = true
	foe["SKILL\49_ITM_ANTIDOTE"] = true
	foe["SKILL\49_ITM_APPLE"] = true
	foe["SKILL\49_ITM_BELL"] = true
	foe["SKILL\49_ITM_FLAMEORB"] = true
	foe["SKILL\49_ITM_MAGICDUST"] = true
	foe["SKILL\49_ITM_MANDRAKE"] = true
	foe["SKILL\49_ITM_MEDICINE"] = true
	foe["SKILL\49_ITM_PANACEA"] = true
	foe["SKILL\49_ITM_PHOENIX"] = true
	foe["SKILL\49_ITM_POTION"] = true
	foe["SKILL\49_ITM_PURELITERATURE"] = true
	foe["SKILL\49_ITM_SALVE"] = true
	foe["SKILL\49_SPECIAL_AXESMASH"] = true
	foe["SKILL\49_WAND_FLAME"] = true
	foe["SKILL\49_WAND_FROST"] = true
	foe["SKILL\49_WAND_THUNDER"] = true
	foe["SKILL\49_WAND_TRAINING"] = true
	foe["SKILL\50_AAA_ATTACK"] = true
	foe["SKILL\50_AAA_GUARD"] = true
	foe["SKILL\50_ABL_FOE_CRUSH"] = true
	foe["SKILL\50_ABL_FOE_DESPERATEATTACK"] = true
	foe["SKILL\50_ABL_FOE_DISTRACT"] = true
	foe["SKILL\50_ABL_FOE_FLAMESTRIKE"] = true
	foe["SKILL\50_ABL_FOE_SHOCKINGSTORIES"] = true
	foe["SKILL\50_ABL_FOE_SICKSTORIES"] = true
	foe["SKILL\50_ABL_FOE_SMITE"] = true
	foe["SKILL\50_ABL_FOE_SOULCRUSHINGSTORY"] = true
	foe["SKILL\50_ABL_FOE_SUICIDE"] = true
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
	foe["SKILL\50_ABL_HERO_JAKE_HEALBLADE"] = true
	foe["SKILL\50_ABL_HERO_JAKE_SHIFT_FAIRY"] = true
	foe["SKILL\50_ABL_HERO_JAKE_SHIFT_HUMAN"] = true
	foe["SKILL\50_ABL_HERO_MARRILONA_CHILL"] = true
	foe["SKILL\50_ABL_HERO_MARRILONA_FLAME"] = true
	foe["SKILL\50_ABL_HERO_MARRILONA_HEAL"] = true
	foe["SKILL\50_ABL_HERO_MARRILONA_PERMANENCE"] = true
	foe["SKILL\50_ABL_HERO_MARRILONA_PROTECT"] = true
	foe["SKILL\50_ABL_HERO_MARRILONA_ROCK"] = true
	foe["SKILL\50_ABL_HERO_MARRILONA_SPLASH"] = true
	foe["SKILL\50_ABL_HERO_MARRILONA_ZAP"] = true
	foe["SKILL\50_ABL_MASTER_FREYA_REJUVENATE"] = true
	foe["SKILL\50_ABL_MASTER_FREYA_ULTRAHEAL"] = true
	foe["SKILL\50_ABL_MASTER_FREYA_VIGOR"] = true
	foe["SKILL\50_ABL_MASTER_RUBINE_BACKSTAB"] = true
	foe["SKILL\50_ABL_MASTER_RUBINE_FOLLOWME"] = true
	foe["SKILL\50_ABL_MASTER_RUBINE_INVADE"] = true
	foe["SKILL\50_ABL_MASTER_RUBINE_PICKPOCKET"] = true
	foe["SKILL\50_ABL_MASTER_RUBINE_POISONSTAB"] = true
	foe["SKILL\50_ITM_ANTIDOTE"] = true
	foe["SKILL\50_ITM_APPLE"] = true
	foe["SKILL\50_ITM_BELL"] = true
	foe["SKILL\50_ITM_FLAMEORB"] = true
	foe["SKILL\50_ITM_MAGICDUST"] = true
	foe["SKILL\50_ITM_MANDRAKE"] = true
	foe["SKILL\50_ITM_MEDICINE"] = true
	foe["SKILL\50_ITM_PANACEA"] = true
	foe["SKILL\50_ITM_PHOENIX"] = true
	foe["SKILL\50_ITM_POTION"] = true
	foe["SKILL\50_ITM_PURELITERATURE"] = true
	foe["SKILL\50_ITM_SALVE"] = true
	foe["SKILL\50_SPECIAL_AXESMASH"] = true
	foe["SKILL\50_WAND_FLAME"] = true
	foe["SKILL\50_WAND_FROST"] = true
	foe["SKILL\50_WAND_THUNDER"] = true
	foe["SKILL\50_WAND_TRAINING"] = true
	foe["SKILL\51_AAA_ATTACK"] = false
	foe["SKILL\51_AAA_GUARD"] = true
	foe["SKILL\51_ABL_FOE_CRUSH"] = true
	foe["SKILL\51_ABL_FOE_DESPERATEATTACK"] = true
	foe["SKILL\51_ABL_FOE_DISTRACT"] = true
	foe["SKILL\51_ABL_FOE_FLAMESTRIKE"] = true
	foe["SKILL\51_ABL_FOE_SHOCKINGSTORIES"] = true
	foe["SKILL\51_ABL_FOE_SICKSTORIES"] = true
	foe["SKILL\51_ABL_FOE_SMITE"] = true
	foe["SKILL\51_ABL_FOE_SOULCRUSHINGSTORY"] = true
	foe["SKILL\51_ABL_FOE_SUICIDE"] = true
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
	foe["SKILL\51_ABL_HERO_JAKE_HEALBLADE"] = true
	foe["SKILL\51_ABL_HERO_JAKE_SHIFT_FAIRY"] = true
	foe["SKILL\51_ABL_HERO_JAKE_SHIFT_HUMAN"] = true
	foe["SKILL\51_ABL_HERO_MARRILONA_CHILL"] = true
	foe["SKILL\51_ABL_HERO_MARRILONA_FLAME"] = true
	foe["SKILL\51_ABL_HERO_MARRILONA_HEAL"] = true
	foe["SKILL\51_ABL_HERO_MARRILONA_PERMANENCE"] = true
	foe["SKILL\51_ABL_HERO_MARRILONA_PROTECT"] = true
	foe["SKILL\51_ABL_HERO_MARRILONA_ROCK"] = true
	foe["SKILL\51_ABL_HERO_MARRILONA_SPLASH"] = true
	foe["SKILL\51_ABL_HERO_MARRILONA_ZAP"] = true
	foe["SKILL\51_ABL_MASTER_FREYA_REJUVENATE"] = true
	foe["SKILL\51_ABL_MASTER_FREYA_ULTRAHEAL"] = true
	foe["SKILL\51_ABL_MASTER_FREYA_VIGOR"] = true
	foe["SKILL\51_ABL_MASTER_RUBINE_BACKSTAB"] = true
	foe["SKILL\51_ABL_MASTER_RUBINE_FOLLOWME"] = true
	foe["SKILL\51_ABL_MASTER_RUBINE_INVADE"] = true
	foe["SKILL\51_ABL_MASTER_RUBINE_PICKPOCKET"] = true
	foe["SKILL\51_ABL_MASTER_RUBINE_POISONSTAB"] = true
	foe["SKILL\51_ITM_ANTIDOTE"] = true
	foe["SKILL\51_ITM_APPLE"] = true
	foe["SKILL\51_ITM_BELL"] = true
	foe["SKILL\51_ITM_FLAMEORB"] = true
	foe["SKILL\51_ITM_MAGICDUST"] = true
	foe["SKILL\51_ITM_MANDRAKE"] = true
	foe["SKILL\51_ITM_MEDICINE"] = true
	foe["SKILL\51_ITM_PANACEA"] = true
	foe["SKILL\51_ITM_PHOENIX"] = true
	foe["SKILL\51_ITM_POTION"] = true
	foe["SKILL\51_ITM_PURELITERATURE"] = true
	foe["SKILL\51_ITM_SALVE"] = true
	foe["SKILL\51_SPECIAL_AXESMASH"] = true
	foe["SKILL\51_WAND_FLAME"] = true
	foe["SKILL\51_WAND_FROST"] = true
	foe["SKILL\51_WAND_THUNDER"] = true
	foe["SKILL\51_WAND_TRAINING"] = true
	foe["Desc"] = "Poisonous"
	foe["Image"] = "GFX\47Combat\47Fighters\47Foe\47reg\47Snake\46png"
	foe["Item Drop \49"] = "ITM_ANTIDOTE"
	foe["Item Drop \50"] = "ITM_ANTIDOTE"
	foe["Item Steal \49"] = "ITM_POTION"
	foe["Item Steal \50"] = "ITM_ANTIDOTE"
	foe["Item Steal \51"] = "ITM_ANTIDOTE"
	foe["Name"] = "Snake"
	foe["RATE_AAA_ATTACK"] = 10
	foe["RATE_AAA_GUARD"] = 0
	foe["RATE_ABL_FOE_CRUSH"] = 0
	foe["RATE_ABL_FOE_DESPERATEATTACK"] = 0
	foe["RATE_ABL_FOE_DISTRACT"] = 0
	foe["RATE_ABL_FOE_FLAMESTRIKE"] = 0
	foe["RATE_ABL_FOE_SHOCKINGSTORIES"] = 0
	foe["RATE_ABL_FOE_SICKSTORIES"] = 0
	foe["RATE_ABL_FOE_SMITE"] = 0
	foe["RATE_ABL_FOE_SOULCRUSHINGSTORY"] = 0
	foe["RATE_ABL_FOE_SUICIDE"] = 0
	foe["RATE_ABL_FOE_VENOMBITE"] = 5
	foe["RATE_ABL_FOE_VENOMSTAB"] = 0
	foe["RATE_ABL_FOE_VIRUSSTAB"] = 0
	foe["RATE_ABL_HERO_DANDOR_AXESMASH"] = 0
	foe["RATE_ABL_HERO_DANDOR_SUPERAXESMASH"] = 0
	foe["RATE_ABL_HERO_HANDOSTILLOR_CUREDISEASE"] = 0
	foe["RATE_ABL_HERO_HANDOSTILLOR_FIRSTAID"] = 0
	foe["RATE_ABL_HERO_HANDOSTILLOR_HOLYSTRIKE"] = 0
	foe["RATE_ABL_HERO_HANDOSTILLOR_NEUTRALIZEPOISON"] = 0
	foe["RATE_ABL_HERO_HANDOSTILLOR_PURIFY"] = 0
	foe["RATE_ABL_HERO_HANDOSTILLOR_RECOVER"] = 0
	foe["RATE_ABL_HERO_HANDOSTILLOR_REMOVEPARALYSIS"] = 0
	foe["RATE_ABL_HERO_HANDOSTILLOR_STICKSWING"] = 0
	foe["RATE_ABL_HERO_HANDOSTILLOR_VITALIZE"] = 0
	foe["RATE_ABL_HERO_JAKE_\50PS"] = 0
	foe["RATE_ABL_HERO_JAKE_\51PS"] = 0
	foe["RATE_ABL_HERO_JAKE_\52PS"] = 0
	foe["RATE_ABL_HERO_JAKE_HEALBLADE"] = 0
	foe["RATE_ABL_HERO_JAKE_SHIFT_FAIRY"] = 0
	foe["RATE_ABL_HERO_JAKE_SHIFT_HUMAN"] = 0
	foe["RATE_ABL_HERO_MARRILONA_CHILL"] = 0
	foe["RATE_ABL_HERO_MARRILONA_FLAME"] = 0
	foe["RATE_ABL_HERO_MARRILONA_HEAL"] = 0
	foe["RATE_ABL_HERO_MARRILONA_PERMANENCE"] = 0
	foe["RATE_ABL_HERO_MARRILONA_PROTECT"] = 0
	foe["RATE_ABL_HERO_MARRILONA_ROCK"] = 0
	foe["RATE_ABL_HERO_MARRILONA_SPLASH"] = 0
	foe["RATE_ABL_HERO_MARRILONA_ZAP"] = 0
	foe["RATE_ABL_MASTER_FREYA_REJUVENATE"] = 0
	foe["RATE_ABL_MASTER_FREYA_ULTRAHEAL"] = 0
	foe["RATE_ABL_MASTER_FREYA_VIGOR"] = 0
	foe["RATE_ABL_MASTER_RUBINE_BACKSTAB"] = 0
	foe["RATE_ABL_MASTER_RUBINE_FOLLOWME"] = 0
	foe["RATE_ABL_MASTER_RUBINE_INVADE"] = 0
	foe["RATE_ABL_MASTER_RUBINE_PICKPOCKET"] = 0
	foe["RATE_ABL_MASTER_RUBINE_POISONSTAB"] = 0
	foe["RATE_ITM_ANTIDOTE"] = 0
	foe["RATE_ITM_APPLE"] = 0
	foe["RATE_ITM_BELL"] = 0
	foe["RATE_ITM_FLAMEORB"] = 0
	foe["RATE_ITM_MAGICDUST"] = 0
	foe["RATE_ITM_MANDRAKE"] = 0
	foe["RATE_ITM_MEDICINE"] = 0
	foe["RATE_ITM_PANACEA"] = 0
	foe["RATE_ITM_PHOENIX"] = 0
	foe["RATE_ITM_POTION"] = 0
	foe["RATE_ITM_PURELITERATURE"] = 0
	foe["RATE_ITM_SALVE"] = 0
	foe["RATE_SPECIAL_AXESMASH"] = 0
	foe["RATE_WAND_FLAME"] = 0
	foe["RATE_WAND_FROST"] = 0
	foe["RATE_WAND_THUNDER"] = 0
	foe["RATE_WAND_TRAINING"] = 0
	foe["TARGET_AAA_ATTACK"] = "Random"
	foe["TARGET_AAA_GUARD"] = "Random"
	foe["TARGET_ABL_FOE_CRUSH"] = "Random"
	foe["TARGET_ABL_FOE_DESPERATEATTACK"] = "Random"
	foe["TARGET_ABL_FOE_DISTRACT"] = "Random"
	foe["TARGET_ABL_FOE_FLAMESTRIKE"] = "Random"
	foe["TARGET_ABL_FOE_SHOCKINGSTORIES"] = "Random"
	foe["TARGET_ABL_FOE_SICKSTORIES"] = "Random"
	foe["TARGET_ABL_FOE_SMITE"] = "Random"
	foe["TARGET_ABL_FOE_SOULCRUSHINGSTORY"] = "Random"
	foe["TARGET_ABL_FOE_SUICIDE"] = "Random"
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
	foe["TARGET_ABL_HERO_JAKE_HEALBLADE"] = "Random"
	foe["TARGET_ABL_HERO_JAKE_SHIFT_FAIRY"] = "Random"
	foe["TARGET_ABL_HERO_JAKE_SHIFT_HUMAN"] = "Random"
	foe["TARGET_ABL_HERO_MARRILONA_CHILL"] = "Random"
	foe["TARGET_ABL_HERO_MARRILONA_FLAME"] = "Random"
	foe["TARGET_ABL_HERO_MARRILONA_HEAL"] = "Random"
	foe["TARGET_ABL_HERO_MARRILONA_PERMANENCE"] = "Random"
	foe["TARGET_ABL_HERO_MARRILONA_PROTECT"] = "Random"
	foe["TARGET_ABL_HERO_MARRILONA_ROCK"] = "Random"
	foe["TARGET_ABL_HERO_MARRILONA_SPLASH"] = "Random"
	foe["TARGET_ABL_HERO_MARRILONA_ZAP"] = "Random"
	foe["TARGET_ABL_MASTER_FREYA_REJUVENATE"] = "Random"
	foe["TARGET_ABL_MASTER_FREYA_ULTRAHEAL"] = "Random"
	foe["TARGET_ABL_MASTER_FREYA_VIGOR"] = "Random"
	foe["TARGET_ABL_MASTER_RUBINE_BACKSTAB"] = "Random"
	foe["TARGET_ABL_MASTER_RUBINE_FOLLOWME"] = "Random"
	foe["TARGET_ABL_MASTER_RUBINE_INVADE"] = "Random"
	foe["TARGET_ABL_MASTER_RUBINE_PICKPOCKET"] = "Random"
	foe["TARGET_ABL_MASTER_RUBINE_POISONSTAB"] = "Random"
	foe["TARGET_ITM_ANTIDOTE"] = "Random"
	foe["TARGET_ITM_APPLE"] = "Random"
	foe["TARGET_ITM_BELL"] = "Random"
	foe["TARGET_ITM_FLAMEORB"] = "Random"
	foe["TARGET_ITM_MAGICDUST"] = "Random"
	foe["TARGET_ITM_MANDRAKE"] = "Random"
	foe["TARGET_ITM_MEDICINE"] = "Random"
	foe["TARGET_ITM_PANACEA"] = "Random"
	foe["TARGET_ITM_PHOENIX"] = "Random"
	foe["TARGET_ITM_POTION"] = "Random"
	foe["TARGET_ITM_PURELITERATURE"] = "Random"
	foe["TARGET_ITM_SALVE"] = "Random"
	foe["TARGET_SPECIAL_AXESMASH"] = "Random"
	foe["TARGET_WAND_FLAME"] = "Random"
	foe["TARGET_WAND_FROST"] = "Random"
	foe["TARGET_WAND_THUNDER"] = "Random"
	foe["TARGET_WAND_TRAINING"] = "Random"
	foe["VocalTag"] = ""
	foe["Boss"] = false
	foe["Oversoul"] = true
	foe["Oversoul Drop \49"] = false
	foe["Oversoul Drop \50"] = false
	foe["Oversoul Steal \49"] = true
	foe["Oversoul Steal \50"] = false
	foe["Oversoul Steal \51"] = false
	foe["Cash"] = 50
	foe["ER_Darkness"] = 0
	foe["ER_Earth"] = 0
	foe["ER_Flame"] = 0
	foe["ER_Frost"] = 0
	foe["ER_Light"] = 0
	foe["ER_Lightning"] = 0
	foe["ER_Water"] = 0
	foe["ER_Wind"] = 0
	foe["Rate Drop \49"] = 75
	foe["Rate Drop \50"] = 25
	foe["Rate Steal \49"] = 100
	foe["Rate Steal \50"] = 0
	foe["Rate Steal \51"] = 0
	foe["SR_Curse "] = 50
	foe["SR_Disease "] = 100
	foe["SR_Paralysis "] = 88
	foe["SR_Petrification "] = 95
	foe["SR_Poison "] = 100
	foe["SR_Silence "] = 40
	foe["SR_Undead "] = 100
	foe["normal_Accuracy"] = 97
	foe["normal_EXP"] = 4
	foe["normal_Endurance"] = 28
	foe["normal_Evasion"] = 4
	foe["normal_HP"] = 151
	foe["normal_Intelligence"] = 21
	foe["normal_Power"] = 37
	foe["normal_Resistance"] = 18
	foe["normal_Speed"] = 31
	foe["oversoul_Accuracy"] = 100
	foe["oversoul_EXP"] = 8
	foe["oversoul_Endurance"] = 30
	foe["oversoul_Evasion"] = 5
	foe["oversoul_HP"] = 300
	foe["oversoul_Intelligence"] = 42
	foe["oversoul_Power"] = 60
	foe["oversoul_Resistance"] = 20
	foe["oversoul_Speed"] = 60


return foe


