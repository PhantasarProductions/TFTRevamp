--[[
**********************************************
  
  Nostramantu1.lua
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
 
version: 17.05.11
]]
-- File Generated: Thu 11 May 2017; 13:37:00


local foe = {}

	foe["AI"] = "default"
	foe["NEWGAMEPLUS_AAA_GUARD"] = true
	foe["NEWGAMEPLUS_ABL_FOE_CRUSH"] = true
	foe["NEWGAMEPLUS_ABL_FOE_DEATHSPELL"] = true
	foe["NEWGAMEPLUS_ABL_FOE_DEMON_SOUL_BREAKER"] = true
	foe["NEWGAMEPLUS_ABL_FOE_DISINTEGRATE"] = true
	foe["NEWGAMEPLUS_ABL_FOE_DISTRACT"] = true
	foe["NEWGAMEPLUS_ABL_FOE_EXHAUST"] = true
	foe["NEWGAMEPLUS_ABL_FOE_GRAVITY"] = true
	foe["NEWGAMEPLUS_ABL_FOE_HOLDPERSON"] = true
	foe["NEWGAMEPLUS_ABL_FOE_HORROR"] = true
	foe["NEWGAMEPLUS_ABL_FOE_SETTHESTAGEONFIRE"] = true
	foe["NEWGAMEPLUS_ABL_FOE_TAKEOVER"] = true
	foe["NEWGAMEPLUS_ABL_FOE_TAKEOVER\50"] = true
	foe["NEWGAMEPLUS_ABL_FOE_TOTALEXHAUSTION"] = true
	foe["NEWGAMEPLUS_ABL_FOE_ULTIMATESOULCRUSHER"] = true
	foe["NEWGAMEPLUS_ABL_GLOOM"] = true
	foe["NEWGAMEPLUS_ABL_HERO_MARRILONA_BIO"] = true
	foe["NEWGAMEPLUS_ABL_HERO_MARRILONA_BREEZE"] = true
	foe["NEWGAMEPLUS_ABL_HERO_MARRILONA_CHILL"] = true
	foe["NEWGAMEPLUS_ABL_HERO_MARRILONA_CURSEDHEALING"] = true
	foe["NEWGAMEPLUS_ABL_HERO_MARRILONA_ELECTROCUTION"] = true
	foe["NEWGAMEPLUS_ABL_HERO_MARRILONA_ETERNALFLAME"] = true
	foe["NEWGAMEPLUS_ABL_HERO_MARRILONA_FIREBLAST"] = true
	foe["NEWGAMEPLUS_ABL_HERO_MARRILONA_FLAME"] = true
	foe["NEWGAMEPLUS_ABL_HERO_MARRILONA_HEAL"] = true
	foe["NORMAL_AAA_GUARD"] = true
	foe["NORMAL_ABL_FOE_CRUSH"] = true
	foe["NORMAL_ABL_FOE_DEATHSPELL"] = true
	foe["NORMAL_ABL_FOE_DEMON_SOUL_BREAKER"] = true
	foe["NORMAL_ABL_FOE_DISINTEGRATE"] = true
	foe["NORMAL_ABL_FOE_DISTRACT"] = true
	foe["NORMAL_ABL_FOE_EXHAUST"] = true
	foe["NORMAL_ABL_FOE_GRAVITY"] = true
	foe["NORMAL_ABL_FOE_HOLDPERSON"] = true
	foe["NORMAL_ABL_FOE_HORROR"] = true
	foe["NORMAL_ABL_FOE_SETTHESTAGEONFIRE"] = true
	foe["NORMAL_ABL_FOE_TAKEOVER"] = true
	foe["NORMAL_ABL_FOE_TAKEOVER\50"] = true
	foe["NORMAL_ABL_FOE_TOTALEXHAUSTION"] = true
	foe["NORMAL_ABL_FOE_ULTIMATESOULCRUSHER"] = true
	foe["NORMAL_ABL_GLOOM"] = true
	foe["NORMAL_ABL_HERO_MARRILONA_BIO"] = true
	foe["NORMAL_ABL_HERO_MARRILONA_BREEZE"] = true
	foe["NORMAL_ABL_HERO_MARRILONA_CHILL"] = true
	foe["NORMAL_ABL_HERO_MARRILONA_CURSEDHEALING"] = true
	foe["NORMAL_ABL_HERO_MARRILONA_ELECTROCUTION"] = true
	foe["NORMAL_ABL_HERO_MARRILONA_ETERNALFLAME"] = true
	foe["NORMAL_ABL_HERO_MARRILONA_FIREBLAST"] = true
	foe["NORMAL_ABL_HERO_MARRILONA_FLAME"] = true
	foe["NORMAL_ABL_HERO_MARRILONA_HEAL"] = true
	foe["OVERSOUL_AAA_GUARD"] = true
	foe["OVERSOUL_ABL_FOE_CRUSH"] = true
	foe["OVERSOUL_ABL_FOE_DEATHSPELL"] = true
	foe["OVERSOUL_ABL_FOE_DEMON_SOUL_BREAKER"] = true
	foe["OVERSOUL_ABL_FOE_DISINTEGRATE"] = true
	foe["OVERSOUL_ABL_FOE_DISTRACT"] = true
	foe["OVERSOUL_ABL_FOE_EXHAUST"] = true
	foe["OVERSOUL_ABL_FOE_GRAVITY"] = true
	foe["OVERSOUL_ABL_FOE_HOLDPERSON"] = true
	foe["OVERSOUL_ABL_FOE_HORROR"] = true
	foe["OVERSOUL_ABL_FOE_SETTHESTAGEONFIRE"] = true
	foe["OVERSOUL_ABL_FOE_TAKEOVER"] = true
	foe["OVERSOUL_ABL_FOE_TAKEOVER\50"] = true
	foe["OVERSOUL_ABL_FOE_TOTALEXHAUSTION"] = true
	foe["OVERSOUL_ABL_FOE_ULTIMATESOULCRUSHER"] = true
	foe["OVERSOUL_ABL_GLOOM"] = true
	foe["OVERSOUL_ABL_HERO_MARRILONA_BIO"] = true
	foe["OVERSOUL_ABL_HERO_MARRILONA_BREEZE"] = true
	foe["OVERSOUL_ABL_HERO_MARRILONA_CHILL"] = true
	foe["OVERSOUL_ABL_HERO_MARRILONA_CURSEDHEALING"] = true
	foe["OVERSOUL_ABL_HERO_MARRILONA_ELECTROCUTION"] = true
	foe["OVERSOUL_ABL_HERO_MARRILONA_ETERNALFLAME"] = true
	foe["OVERSOUL_ABL_HERO_MARRILONA_FIREBLAST"] = true
	foe["OVERSOUL_ABL_HERO_MARRILONA_FLAME"] = true
	foe["OVERSOUL_ABL_HERO_MARRILONA_HEAL"] = true
	foe["SKILL\49_AAA_GUARD"] = true
	foe["SKILL\49_ABL_FOE_CRUSH"] = true
	foe["SKILL\49_ABL_FOE_DEATHSPELL"] = false
	foe["SKILL\49_ABL_FOE_DEMON_SOUL_BREAKER"] = true
	foe["SKILL\49_ABL_FOE_DISINTEGRATE"] = true
	foe["SKILL\49_ABL_FOE_DISTRACT"] = true
	foe["SKILL\49_ABL_FOE_EXHAUST"] = true
	foe["SKILL\49_ABL_FOE_GRAVITY"] = true
	foe["SKILL\49_ABL_FOE_HOLDPERSON"] = true
	foe["SKILL\49_ABL_FOE_HORROR"] = true
	foe["SKILL\49_ABL_FOE_SETTHESTAGEONFIRE"] = true
	foe["SKILL\49_ABL_FOE_TAKEOVER"] = true
	foe["SKILL\49_ABL_FOE_TAKEOVER\50"] = true
	foe["SKILL\49_ABL_FOE_TOTALEXHAUSTION"] = false
	foe["SKILL\49_ABL_FOE_ULTIMATESOULCRUSHER"] = true
	foe["SKILL\49_ABL_GLOOM"] = true
	foe["SKILL\49_ABL_HERO_MARRILONA_BIO"] = true
	foe["SKILL\49_ABL_HERO_MARRILONA_BREEZE"] = true
	foe["SKILL\49_ABL_HERO_MARRILONA_CHILL"] = true
	foe["SKILL\49_ABL_HERO_MARRILONA_CURSEDHEALING"] = true
	foe["SKILL\49_ABL_HERO_MARRILONA_ELECTROCUTION"] = true
	foe["SKILL\49_ABL_HERO_MARRILONA_ETERNALFLAME"] = true
	foe["SKILL\49_ABL_HERO_MARRILONA_FIREBLAST"] = false
	foe["SKILL\49_ABL_HERO_MARRILONA_FLAME"] = true
	foe["SKILL\49_ABL_HERO_MARRILONA_HEAL"] = true
	foe["SKILL\50_AAA_GUARD"] = false
	foe["SKILL\50_ABL_FOE_CRUSH"] = true
	foe["SKILL\50_ABL_FOE_DEATHSPELL"] = false
	foe["SKILL\50_ABL_FOE_DEMON_SOUL_BREAKER"] = true
	foe["SKILL\50_ABL_FOE_DISINTEGRATE"] = true
	foe["SKILL\50_ABL_FOE_DISTRACT"] = true
	foe["SKILL\50_ABL_FOE_EXHAUST"] = true
	foe["SKILL\50_ABL_FOE_GRAVITY"] = true
	foe["SKILL\50_ABL_FOE_HOLDPERSON"] = true
	foe["SKILL\50_ABL_FOE_HORROR"] = true
	foe["SKILL\50_ABL_FOE_SETTHESTAGEONFIRE"] = true
	foe["SKILL\50_ABL_FOE_TAKEOVER"] = true
	foe["SKILL\50_ABL_FOE_TAKEOVER\50"] = true
	foe["SKILL\50_ABL_FOE_TOTALEXHAUSTION"] = true
	foe["SKILL\50_ABL_FOE_ULTIMATESOULCRUSHER"] = true
	foe["SKILL\50_ABL_GLOOM"] = true
	foe["SKILL\50_ABL_HERO_MARRILONA_BIO"] = true
	foe["SKILL\50_ABL_HERO_MARRILONA_BREEZE"] = true
	foe["SKILL\50_ABL_HERO_MARRILONA_CHILL"] = true
	foe["SKILL\50_ABL_HERO_MARRILONA_CURSEDHEALING"] = true
	foe["SKILL\50_ABL_HERO_MARRILONA_ELECTROCUTION"] = true
	foe["SKILL\50_ABL_HERO_MARRILONA_ETERNALFLAME"] = true
	foe["SKILL\50_ABL_HERO_MARRILONA_FIREBLAST"] = false
	foe["SKILL\50_ABL_HERO_MARRILONA_FLAME"] = true
	foe["SKILL\50_ABL_HERO_MARRILONA_HEAL"] = true
	foe["SKILL\51_AAA_GUARD"] = false
	foe["SKILL\51_ABL_FOE_CRUSH"] = true
	foe["SKILL\51_ABL_FOE_DEATHSPELL"] = true
	foe["SKILL\51_ABL_FOE_DEMON_SOUL_BREAKER"] = true
	foe["SKILL\51_ABL_FOE_DISINTEGRATE"] = true
	foe["SKILL\51_ABL_FOE_DISTRACT"] = true
	foe["SKILL\51_ABL_FOE_EXHAUST"] = true
	foe["SKILL\51_ABL_FOE_GRAVITY"] = true
	foe["SKILL\51_ABL_FOE_HOLDPERSON"] = true
	foe["SKILL\51_ABL_FOE_HORROR"] = true
	foe["SKILL\51_ABL_FOE_SETTHESTAGEONFIRE"] = true
	foe["SKILL\51_ABL_FOE_TAKEOVER"] = true
	foe["SKILL\51_ABL_FOE_TAKEOVER\50"] = false
	foe["SKILL\51_ABL_FOE_TOTALEXHAUSTION"] = true
	foe["SKILL\51_ABL_FOE_ULTIMATESOULCRUSHER"] = true
	foe["SKILL\51_ABL_GLOOM"] = true
	foe["SKILL\51_ABL_HERO_MARRILONA_BIO"] = true
	foe["SKILL\51_ABL_HERO_MARRILONA_BREEZE"] = true
	foe["SKILL\51_ABL_HERO_MARRILONA_CHILL"] = true
	foe["SKILL\51_ABL_HERO_MARRILONA_CURSEDHEALING"] = true
	foe["SKILL\51_ABL_HERO_MARRILONA_ELECTROCUTION"] = true
	foe["SKILL\51_ABL_HERO_MARRILONA_ETERNALFLAME"] = true
	foe["SKILL\51_ABL_HERO_MARRILONA_FIREBLAST"] = true
	foe["SKILL\51_ABL_HERO_MARRILONA_FLAME"] = true
	foe["SKILL\51_ABL_HERO_MARRILONA_HEAL"] = true
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
	foe["Desc"] = "Fairy Elder\46\10Founder of the Fairy Tribe\46\10Turned insane by the power that made him great\46"
	foe["Image"] = "GFX\47Combat\47Fighters\47Foe\47boss\47Nostramantu\46png"
	foe["Item Drop \49"] = "ITM_BANANA"
	foe["Item Drop \50"] = "ITM_AMBROSIA"
	foe["Item Steal \49"] = "ITM_ANABOLINEA"
	foe["Item Steal \50"] = "ITM_BANANA"
	foe["Item Steal \51"] = "WAND_II_VOLCANOWAND"
	foe["Name"] = "Nostramantu"
	foe["RATE_AAA_ATTACK"] = 0
	foe["RATE_AAA_GUARD"] = 5
	foe["RATE_ABL_FOE_BACTERIATUSK"] = 0
	foe["RATE_ABL_FOE_CRUSH"] = 25
	foe["RATE_ABL_FOE_DEATHSPELL"] = 1
	foe["RATE_ABL_FOE_DEMON_SOUL_BREAKER"] = 5
	foe["RATE_ABL_FOE_DESPERATEATTACK"] = 0
	foe["RATE_ABL_FOE_DISINTEGRATE"] = 1
	foe["RATE_ABL_FOE_DISTRACT"] = 2
	foe["RATE_ABL_FOE_EXHAUST"] = 1
	foe["RATE_ABL_FOE_FLAMEBITE"] = 0
	foe["RATE_ABL_FOE_FLAMESTRIKE"] = 0
	foe["RATE_ABL_FOE_GAZE"] = 0
	foe["RATE_ABL_FOE_GRAVITY"] = 1
	foe["RATE_ABL_FOE_HOLDPERSON"] = 1
	foe["RATE_ABL_FOE_HORROR"] = 1
	foe["RATE_ABL_FOE_MERMAID_TEMPATION"] = 0
	foe["RATE_ABL_FOE_PARADIVE"] = 0
	foe["RATE_ABL_FOE_SETTHESTAGEONFIRE"] = 1
	foe["RATE_ABL_FOE_SHOCKINGSTORIES"] = 0
	foe["RATE_ABL_FOE_SICKSTORIES"] = 0
	foe["RATE_ABL_FOE_SMITE"] = 0
	foe["RATE_ABL_FOE_SOULCRUSHINGSTORY"] = 0
	foe["RATE_ABL_FOE_SPORES"] = 0
	foe["RATE_ABL_FOE_SUICIDE"] = 0
	foe["RATE_ABL_FOE_TAKEOVER"] = 5
	foe["RATE_ABL_FOE_TAKEOVER\50"] = 2
	foe["RATE_ABL_FOE_TOTALEXHAUSTION"] = 1
	foe["RATE_ABL_FOE_TUSK"] = 0
	foe["RATE_ABL_FOE_ULTIMATESOULCRUSHER"] = 5
	foe["RATE_ABL_FOE_VENOMBITE"] = 0
	foe["RATE_ABL_FOE_VENOMSTAB"] = 0
	foe["RATE_ABL_FOE_VIRUSSTAB"] = 0
	foe["RATE_ABL_FOE_WELCOMEINHELL"] = 0
	foe["RATE_ABL_FOLLOWUP_FIKKIE"] = 0
	foe["RATE_ABL_GLOOM"] = 1
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
	foe["RATE_ABL_HERO_MARRILONA_BIO"] = 1
	foe["RATE_ABL_HERO_MARRILONA_BREEZE"] = 1
	foe["RATE_ABL_HERO_MARRILONA_CHILL"] = 1
	foe["RATE_ABL_HERO_MARRILONA_CURSEDHEALING"] = 1
	foe["RATE_ABL_HERO_MARRILONA_ELECTROCUTION"] = 1
	foe["RATE_ABL_HERO_MARRILONA_ETERNALFLAME"] = 1
	foe["RATE_ABL_HERO_MARRILONA_FIREBLAST"] = 1
	foe["RATE_ABL_HERO_MARRILONA_FLAME"] = 1
	foe["RATE_ABL_HERO_MARRILONA_HEAL"] = 2
	foe["RATE_ABL_HERO_MARRILONA_HURRICANE"] = 0
	foe["RATE_ABL_HERO_MARRILONA_ICEBLAST"] = 0
	foe["RATE_ABL_HERO_MARRILONA_INFERNO"] = 0
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
	foe["RATE_ABL_MASTER_FREYA_REJUVENATE"] = 0
	foe["RATE_ABL_MASTER_FREYA_ULTRAHEAL"] = 0
	foe["RATE_ABL_MASTER_FREYA_VIGOR"] = 0
	foe["RATE_ABL_MASTER_KRANDAR_\53PS"] = 0
	foe["RATE_ABL_MASTER_KRANDAR_\54PS"] = 0
	foe["RATE_ABL_MASTER_KRANDAR_\55PS"] = 0
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
	foe["RATE_ZZKEY_FIRE"] = 0
	foe["RATE_ZZKEY_GAIA"] = 0
	foe["RATE_ZZKEY_KEYWATER"] = 0
	foe["RATE_ZZKEY_WIND"] = 0
	foe["RATE_ZZZ_KRANDARARMOR"] = 0
	foe["RATE_ZZZ_KRANDARBLADE"] = 0
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
	foe["TARGET_ABL_MASTER_FREYA_REJUVENATE"] = "Random"
	foe["TARGET_ABL_MASTER_FREYA_ULTRAHEAL"] = "Random"
	foe["TARGET_ABL_MASTER_FREYA_VIGOR"] = "Random"
	foe["TARGET_ABL_MASTER_KRANDAR_\53PS"] = "Random"
	foe["TARGET_ABL_MASTER_KRANDAR_\54PS"] = "Random"
	foe["TARGET_ABL_MASTER_KRANDAR_\55PS"] = "Random"
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
	foe["TARGET_ZZKEY_FIRE"] = "Random"
	foe["TARGET_ZZKEY_GAIA"] = "Random"
	foe["TARGET_ZZKEY_KEYWATER"] = "Random"
	foe["TARGET_ZZKEY_WIND"] = "Random"
	foe["TARGET_ZZZ_KRANDARARMOR"] = "Random"
	foe["TARGET_ZZZ_KRANDARBLADE"] = "Random"
	foe["VocalTag"] = "Nostramantu"
	foe["Boss"] = true
	foe["Oversoul"] = false
	foe["Oversoul Drop \49"] = false
	foe["Oversoul Drop \50"] = false
	foe["Oversoul Steal \49"] = false
	foe["Oversoul Steal \50"] = false
	foe["Oversoul Steal \51"] = false
	foe["Cash"] = 100
	foe["ER_Darkness"] = 101
	foe["ER_Earth"] = 0
	foe["ER_Flame"] = 0
	foe["ER_Frost"] = 0
	foe["ER_Light"] = -1
	foe["ER_Lightning"] = 0
	foe["ER_Water"] = 0
	foe["ER_Wind"] = 0
	foe["Rate Drop \49"] = 100
	foe["Rate Drop \50"] = 50
	foe["Rate Steal \49"] = 1
	foe["Rate Steal \50"] = 25
	foe["Rate Steal \51"] = 100
	foe["SR_Confusion"] = 100
	foe["SR_Curse"] = 100
	foe["SR_Death"] = 100
	foe["SR_Disease"] = 85
	foe["SR_Paralysis"] = 95
	foe["SR_Petrification"] = 100
	foe["SR_Poison"] = 90
	foe["SR_Silence"] = 100
	foe["SR_Sleep"] = 100
	foe["SR_Undead"] = 100
	foe["normal_Accuracy"] = 100
	foe["normal_EXP"] = 10000
	foe["normal_Endurance"] = 50
	foe["normal_Evasion"] = 25
	foe["normal_HP"] = 25000
	foe["normal_Intelligence"] = 700
	foe["normal_Power"] = 250
	foe["normal_Resistance"] = 800
	foe["normal_Speed"] = 600
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

