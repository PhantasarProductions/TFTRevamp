--[[
**********************************************
  
  Mega Ghost.lua
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
 
version: 17.01.18
]]
-- File Generated: Wed 18 January 2017; 01:21:54


local foe = {}

	foe["AI"] = "default"
	foe["NEWGAMEPLUS_AAA_ATTACK"] = true
	foe["NEWGAMEPLUS_AAA_GUARD"] = true
	foe["NEWGAMEPLUS_ABL_FOE_CRUSH"] = true
	foe["NEWGAMEPLUS_ABL_FOE_DESPERATEATTACK"] = true
	foe["NEWGAMEPLUS_ABL_FOE_DISTRACT"] = true
	foe["NEWGAMEPLUS_ABL_FOE_FLAMESTRIKE"] = true
	foe["NEWGAMEPLUS_ABL_FOE_PARADIVE"] = true
	foe["NEWGAMEPLUS_ABL_FOE_TAKEOVER"] = true
	foe["NEWGAMEPLUS_ABL_FOE_TAKEOVER\50"] = true
	foe["NEWGAMEPLUS_ABL_FOE_VENOMSTAB"] = true
	foe["NEWGAMEPLUS_ABL_FOE_VIRUSSTAB"] = true
	foe["NEWGAMEPLUS_ABL_GLOOM"] = true
	foe["NORMAL_AAA_ATTACK"] = true
	foe["NORMAL_AAA_GUARD"] = true
	foe["NORMAL_ABL_FOE_CRUSH"] = true
	foe["NORMAL_ABL_FOE_DESPERATEATTACK"] = true
	foe["NORMAL_ABL_FOE_DISTRACT"] = true
	foe["NORMAL_ABL_FOE_FLAMESTRIKE"] = true
	foe["NORMAL_ABL_FOE_PARADIVE"] = true
	foe["NORMAL_ABL_FOE_TAKEOVER"] = true
	foe["NORMAL_ABL_FOE_TAKEOVER\50"] = true
	foe["NORMAL_ABL_FOE_VENOMSTAB"] = true
	foe["NORMAL_ABL_FOE_VIRUSSTAB"] = true
	foe["NORMAL_ABL_GLOOM"] = true
	foe["OVERSOUL_AAA_ATTACK"] = true
	foe["OVERSOUL_AAA_GUARD"] = true
	foe["OVERSOUL_ABL_FOE_CRUSH"] = true
	foe["OVERSOUL_ABL_FOE_DESPERATEATTACK"] = true
	foe["OVERSOUL_ABL_FOE_DISTRACT"] = true
	foe["OVERSOUL_ABL_FOE_FLAMESTRIKE"] = true
	foe["OVERSOUL_ABL_FOE_PARADIVE"] = true
	foe["OVERSOUL_ABL_FOE_TAKEOVER"] = true
	foe["OVERSOUL_ABL_FOE_TAKEOVER\50"] = true
	foe["OVERSOUL_ABL_FOE_VENOMSTAB"] = true
	foe["OVERSOUL_ABL_FOE_VIRUSSTAB"] = true
	foe["OVERSOUL_ABL_GLOOM"] = true
	foe["SKILL\49_AAA_ATTACK"] = true
	foe["SKILL\49_AAA_GUARD"] = true
	foe["SKILL\49_ABL_FOE_CRUSH"] = true
	foe["SKILL\49_ABL_FOE_DESPERATEATTACK"] = true
	foe["SKILL\49_ABL_FOE_DISTRACT"] = true
	foe["SKILL\49_ABL_FOE_FLAMESTRIKE"] = true
	foe["SKILL\49_ABL_FOE_PARADIVE"] = true
	foe["SKILL\49_ABL_FOE_TAKEOVER"] = true
	foe["SKILL\49_ABL_FOE_TAKEOVER\50"] = true
	foe["SKILL\49_ABL_FOE_VENOMSTAB"] = true
	foe["SKILL\49_ABL_FOE_VIRUSSTAB"] = true
	foe["SKILL\49_ABL_GLOOM"] = true
	foe["SKILL\50_AAA_ATTACK"] = true
	foe["SKILL\50_AAA_GUARD"] = true
	foe["SKILL\50_ABL_FOE_CRUSH"] = true
	foe["SKILL\50_ABL_FOE_DESPERATEATTACK"] = true
	foe["SKILL\50_ABL_FOE_DISTRACT"] = true
	foe["SKILL\50_ABL_FOE_FLAMESTRIKE"] = true
	foe["SKILL\50_ABL_FOE_PARADIVE"] = true
	foe["SKILL\50_ABL_FOE_TAKEOVER"] = true
	foe["SKILL\50_ABL_FOE_TAKEOVER\50"] = true
	foe["SKILL\50_ABL_FOE_VENOMSTAB"] = true
	foe["SKILL\50_ABL_FOE_VIRUSSTAB"] = true
	foe["SKILL\50_ABL_GLOOM"] = true
	foe["SKILL\51_AAA_ATTACK"] = true
	foe["SKILL\51_AAA_GUARD"] = true
	foe["SKILL\51_ABL_FOE_CRUSH"] = true
	foe["SKILL\51_ABL_FOE_DESPERATEATTACK"] = true
	foe["SKILL\51_ABL_FOE_DISTRACT"] = true
	foe["SKILL\51_ABL_FOE_FLAMESTRIKE"] = true
	foe["SKILL\51_ABL_FOE_PARADIVE"] = true
	foe["SKILL\51_ABL_FOE_TAKEOVER"] = true
	foe["SKILL\51_ABL_FOE_TAKEOVER\50"] = true
	foe["SKILL\51_ABL_FOE_VENOMSTAB"] = true
	foe["SKILL\51_ABL_FOE_VIRUSSTAB"] = true
	foe["SKILL\51_ABL_GLOOM"] = true
	foe["STSTART_Curse"] = false
	foe["STSTART_Disease"] = false
	foe["STSTART_Paralysis"] = false
	foe["STSTART_Petrification"] = false
	foe["STSTART_Poison"] = false
	foe["STSTART_Silence"] = false
	foe["STSTART_Undead"] = true
	foe["Desc"] = "All doomed souls may unite\10into something like this\46\10How dangerous it it?"
	foe["Image"] = "GFX\47Combat\47Fighters\47Foe\47boss\47MegaGhost\46png"
	foe["Item Drop \49"] = "WAND_DARK"
	foe["Item Drop \50"] = "ITM_ANTIDOTE"
	foe["Item Steal \49"] = "ITM_CARROT"
	foe["Item Steal \50"] = "ITM_PHOENIX"
	foe["Item Steal \51"] = "WAND_BIO"
	foe["Name"] = "Mega Ghost"
	foe["RATE_AAA_ATTACK"] = 25
	foe["RATE_AAA_GUARD"] = 5
	foe["RATE_ABL_FOE_BACTERIATUSK"] = 0
	foe["RATE_ABL_FOE_CRUSH"] = 1
	foe["RATE_ABL_FOE_DESPERATEATTACK"] = 1
	foe["RATE_ABL_FOE_DISTRACT"] = 5
	foe["RATE_ABL_FOE_FLAMESTRIKE"] = 1
	foe["RATE_ABL_FOE_PARADIVE"] = 1
	foe["RATE_ABL_FOE_SHOCKINGSTORIES"] = 0
	foe["RATE_ABL_FOE_SICKSTORIES"] = 0
	foe["RATE_ABL_FOE_SMITE"] = 0
	foe["RATE_ABL_FOE_SOULCRUSHINGSTORY"] = 0
	foe["RATE_ABL_FOE_SUICIDE"] = 0
	foe["RATE_ABL_FOE_TAKEOVER"] = 3
	foe["RATE_ABL_FOE_TAKEOVER\50"] = 3
	foe["RATE_ABL_FOE_TUSK"] = 0
	foe["RATE_ABL_FOE_VENOMBITE"] = 0
	foe["RATE_ABL_FOE_VENOMSTAB"] = 1
	foe["RATE_ABL_FOE_VIRUSSTAB"] = 1
	foe["RATE_ABL_GLOOM"] = 5
	foe["RATE_ABL_HERO_DANDOR_AXESMASH"] = 0
	foe["RATE_ABL_HERO_DANDOR_SUPERAXESMASH"] = 0
	foe["RATE_ABL_HERO_HANDOSTILLOR_CUREDISEASE"] = 0
	foe["RATE_ABL_HERO_HANDOSTILLOR_FIRSTAID"] = 0
	foe["RATE_ABL_HERO_HANDOSTILLOR_HOLYSTRIKE"] = 0
	foe["RATE_ABL_HERO_HANDOSTILLOR_NEUTRALIZEPOISON"] = 0
	foe["RATE_ABL_HERO_HANDOSTILLOR_PRAY"] = 0
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
	foe["RATE_ABL_HERO_MARRILONA_ETERNALFLAME"] = 0
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
	foe["RATE_ITM_HEALINGHERB"] = 0
	foe["RATE_ITM_MAGICDUST"] = 0
	foe["RATE_ITM_MANDRAKE"] = 0
	foe["RATE_ITM_MEDICINE"] = 0
	foe["RATE_ITM_PANACEA"] = 0
	foe["RATE_ITM_PHOENIX"] = 0
	foe["RATE_ITM_POTION"] = 0
	foe["RATE_ITM_PURELITERATURE"] = 0
	foe["RATE_ITM_SALVE"] = 0
	foe["RATE_ITM_VOICEHERB"] = 0
	foe["RATE_SPECIAL_AXESMASH"] = 0
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
	foe["RATE_ZZKEY_KEYWATER"] = 0
	foe["TARGET_AAA_ATTACK"] = "Random"
	foe["TARGET_AAA_GUARD"] = "Random"
	foe["TARGET_ABL_FOE_BACTERIATUSK"] = "Random"
	foe["TARGET_ABL_FOE_CRUSH"] = "Random"
	foe["TARGET_ABL_FOE_DESPERATEATTACK"] = "Random"
	foe["TARGET_ABL_FOE_DISTRACT"] = "Random"
	foe["TARGET_ABL_FOE_FLAMESTRIKE"] = "Random"
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
	foe["TARGET_ABL_HERO_HANDOSTILLOR_CUREDISEASE"] = "Random"
	foe["TARGET_ABL_HERO_HANDOSTILLOR_FIRSTAID"] = "Random"
	foe["TARGET_ABL_HERO_HANDOSTILLOR_HOLYSTRIKE"] = "Random"
	foe["TARGET_ABL_HERO_HANDOSTILLOR_NEUTRALIZEPOISON"] = "Random"
	foe["TARGET_ABL_HERO_HANDOSTILLOR_PRAY"] = "Random"
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
	foe["TARGET_ABL_HERO_MARRILONA_ETERNALFLAME"] = "Random"
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
	foe["TARGET_ITM_MAGICDUST"] = "Random"
	foe["TARGET_ITM_MANDRAKE"] = "Random"
	foe["TARGET_ITM_MEDICINE"] = "Random"
	foe["TARGET_ITM_PANACEA"] = "Random"
	foe["TARGET_ITM_PHOENIX"] = "Random"
	foe["TARGET_ITM_POTION"] = "Random"
	foe["TARGET_ITM_PURELITERATURE"] = "Random"
	foe["TARGET_ITM_SALVE"] = "Random"
	foe["TARGET_ITM_VOICEHERB"] = "Random"
	foe["TARGET_SPECIAL_AXESMASH"] = "Random"
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
	foe["TARGET_ZZKEY_KEYWATER"] = "Random"
	foe["VocalTag"] = "Mega Ghost"
	foe["Boss"] = true
	foe["Oversoul"] = false
	foe["Oversoul Drop \49"] = false
	foe["Oversoul Drop \50"] = false
	foe["Oversoul Steal \49"] = false
	foe["Oversoul Steal \50"] = false
	foe["Oversoul Steal \51"] = false
	foe["Cash"] = 10000
	foe["ER_Darkness"] = 100000
	foe["ER_Earth"] = 100
	foe["ER_Flame"] = -100
	foe["ER_Frost"] = 100
	foe["ER_Light"] = -195
	foe["ER_Lightning"] = -150
	foe["ER_Water"] = 100
	foe["ER_Wind"] = 100
	foe["Rate Drop \49"] = 100
	foe["Rate Drop \50"] = 0
	foe["Rate Steal \49"] = 25
	foe["Rate Steal \50"] = 25
	foe["Rate Steal \51"] = 3
	foe["SR_Curse "] = 100
	foe["SR_Disease "] = 100
	foe["SR_Paralysis "] = 100
	foe["SR_Petrification "] = 100
	foe["SR_Poison "] = 100
	foe["SR_Silence "] = 100
	foe["SR_Undead "] = 100
	foe["normal_Accuracy"] = 100
	foe["normal_EXP"] = 250
	foe["normal_Endurance"] = 100
	foe["normal_Evasion"] = 2
	foe["normal_HP"] = 5000
	foe["normal_Intelligence"] = 300
	foe["normal_Power"] = 300
	foe["normal_Resistance"] = 100
	foe["normal_Speed"] = 40
	foe["oversoul_Accuracy"] = 100
	foe["oversoul_EXP"] = 0
	foe["oversoul_Endurance"] = 0
	foe["oversoul_Evasion"] = 0
	foe["oversoul_HP"] = 0
	foe["oversoul_Intelligence"] = 0
	foe["oversoul_Power"] = 0
	foe["oversoul_Resistance"] = 0
	foe["oversoul_Speed"] = 0


return foe

