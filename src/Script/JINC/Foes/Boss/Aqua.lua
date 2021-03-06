--[[
**********************************************
  
  Aqua.lua
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
 
version: 17.07.10
]]
-- File Generated: Mon 10 July 2017; 08:03:07


local foe = {}

	foe["AI"] = "default"
	foe["NEWGAMEPLUS_AAA_ATTACK"] = true
	foe["NEWGAMEPLUS_AAA_GUARD"] = true
	foe["NEWGAMEPLUS_ABL_FOE_CRUSH"] = true
	foe["NEWGAMEPLUS_ABL_FOE_DISTRACT"] = true
	foe["NEWGAMEPLUS_ABL_HERO_MARRILONA_HEAL"] = true
	foe["NEWGAMEPLUS_ABL_HERO_MARRILONA_SPLASH"] = true
	foe["NEWGAMEPLUS_ABL_HERO_MARRILONA_TSUNAMI"] = true
	foe["NORMAL_AAA_ATTACK"] = true
	foe["NORMAL_AAA_GUARD"] = true
	foe["NORMAL_ABL_FOE_CRUSH"] = true
	foe["NORMAL_ABL_FOE_DISTRACT"] = true
	foe["NORMAL_ABL_HERO_MARRILONA_HEAL"] = true
	foe["NORMAL_ABL_HERO_MARRILONA_SPLASH"] = true
	foe["NORMAL_ABL_HERO_MARRILONA_TSUNAMI"] = true
	foe["OVERSOUL_AAA_ATTACK"] = true
	foe["OVERSOUL_AAA_GUARD"] = true
	foe["OVERSOUL_ABL_FOE_CRUSH"] = true
	foe["OVERSOUL_ABL_FOE_DISTRACT"] = true
	foe["OVERSOUL_ABL_HERO_MARRILONA_HEAL"] = true
	foe["OVERSOUL_ABL_HERO_MARRILONA_SPLASH"] = true
	foe["OVERSOUL_ABL_HERO_MARRILONA_TSUNAMI"] = true
	foe["SKILL\49_AAA_ATTACK"] = true
	foe["SKILL\49_AAA_GUARD"] = true
	foe["SKILL\49_ABL_FOE_CRUSH"] = true
	foe["SKILL\49_ABL_FOE_DISTRACT"] = true
	foe["SKILL\49_ABL_HERO_MARRILONA_HEAL"] = true
	foe["SKILL\49_ABL_HERO_MARRILONA_SPLASH"] = true
	foe["SKILL\49_ABL_HERO_MARRILONA_TSUNAMI"] = false
	foe["SKILL\50_AAA_ATTACK"] = true
	foe["SKILL\50_AAA_GUARD"] = true
	foe["SKILL\50_ABL_FOE_CRUSH"] = true
	foe["SKILL\50_ABL_FOE_DISTRACT"] = true
	foe["SKILL\50_ABL_HERO_MARRILONA_HEAL"] = true
	foe["SKILL\50_ABL_HERO_MARRILONA_SPLASH"] = true
	foe["SKILL\50_ABL_HERO_MARRILONA_TSUNAMI"] = true
	foe["SKILL\51_AAA_ATTACK"] = true
	foe["SKILL\51_AAA_GUARD"] = false
	foe["SKILL\51_ABL_FOE_CRUSH"] = true
	foe["SKILL\51_ABL_FOE_DISTRACT"] = true
	foe["SKILL\51_ABL_HERO_MARRILONA_HEAL"] = true
	foe["SKILL\51_ABL_HERO_MARRILONA_SPLASH"] = true
	foe["SKILL\51_ABL_HERO_MARRILONA_TSUNAMI"] = true
	foe["STSTART_Confusion"] = false
	foe["STSTART_Curse"] = false
	foe["STSTART_Death"] = false
	foe["STSTART_Disease"] = false
	foe["STSTART_Hydra"] = false
	foe["STSTART_Paralysis"] = false
	foe["STSTART_Petrification"] = false
	foe["STSTART_Poison"] = false
	foe["STSTART_Silence"] = false
	foe["STSTART_Sleep"] = false
	foe["STSTART_Undead"] = false
	foe["Desc"] = "Protector of the Water Spirata"
	foe["HitBy"] = ""
	foe["Image"] = "GFX\47Combat\47Fighters\47Foe\47boss\47Aqua\46png"
	foe["Item Drop \49"] = "ITM_HEALSHOWER"
	foe["Item Drop \50"] = "ITM_APPLE"
	foe["Item Steal \49"] = "ITM_ANTIDOTE"
	foe["Item Steal \50"] = "ITM_ANTIDOTE"
	foe["Item Steal \51"] = "ITM_ANTIDOTE"
	foe["Name"] = "Aqua"
	foe["RATE_AAA_ATTACK"] = 10
	foe["RATE_AAA_GUARD"] = 5
	foe["RATE_ABL_FOE_BACTERIATUSK"] = 0
	foe["RATE_ABL_FOE_CRUSH"] = 1
	foe["RATE_ABL_FOE_CURSEDWIND"] = 0
	foe["RATE_ABL_FOE_DEATHSPELL"] = 0
	foe["RATE_ABL_FOE_DEMON_SOUL_BREAKER"] = 0
	foe["RATE_ABL_FOE_DESPERATEATTACK"] = 0
	foe["RATE_ABL_FOE_DEVOUR"] = 0
	foe["RATE_ABL_FOE_DISINTEGRATE"] = 0
	foe["RATE_ABL_FOE_DISTRACT"] = 4
	foe["RATE_ABL_FOE_ENEMYVITALIZE"] = 0
	foe["RATE_ABL_FOE_ENERGYDRAIN"] = 0
	foe["RATE_ABL_FOE_EVIL_EYE"] = 0
	foe["RATE_ABL_FOE_EVIL_EYE_PARALYZE"] = 0
	foe["RATE_ABL_FOE_EVIL_EYE_PETRIFY"] = 0
	foe["RATE_ABL_FOE_EXHAUST"] = 0
	foe["RATE_ABL_FOE_FATALPOISON"] = 0
	foe["RATE_ABL_FOE_FLAMEBITE"] = 0
	foe["RATE_ABL_FOE_FLAMEONSELF"] = 0
	foe["RATE_ABL_FOE_FLAMESTRIKE"] = 0
	foe["RATE_ABL_FOE_FOOLGOLD"] = 0
	foe["RATE_ABL_FOE_GAIASMASH"] = 0
	foe["RATE_ABL_FOE_GAZE"] = 0
	foe["RATE_ABL_FOE_GG_DEATHSCREAM"] = 0
	foe["RATE_ABL_FOE_GG_SCREAM"] = 0
	foe["RATE_ABL_FOE_GRAVITY"] = 0
	foe["RATE_ABL_FOE_HOLDPERSON"] = 0
	foe["RATE_ABL_FOE_HORROR"] = 0
	foe["RATE_ABL_FOE_LIFEDRAIN"] = 0
	foe["RATE_ABL_FOE_LIFEFORCE"] = 0
	foe["RATE_ABL_FOE_MERMAID_TEMPATION"] = 0
	foe["RATE_ABL_FOE_MULTISTRIKE"] = 0
	foe["RATE_ABL_FOE_PARADIVE"] = 0
	foe["RATE_ABL_FOE_RANDOMIZER"] = 0
	foe["RATE_ABL_FOE_RANDOMIZERTOTAL"] = 0
	foe["RATE_ABL_FOE_SETTHESTAGEONFIRE"] = 0
	foe["RATE_ABL_FOE_SHOCKINGSTORIES"] = 0
	foe["RATE_ABL_FOE_SICKSTORIES"] = 0
	foe["RATE_ABL_FOE_SLASH"] = 0
	foe["RATE_ABL_FOE_SMITE"] = 0
	foe["RATE_ABL_FOE_SOULCRUSHINGSTORY"] = 0
	foe["RATE_ABL_FOE_SPORES"] = 0
	foe["RATE_ABL_FOE_SUICIDE"] = 0
	foe["RATE_ABL_FOE_TAKEOVER"] = 0
	foe["RATE_ABL_FOE_TAKEOVER\50"] = 0
	foe["RATE_ABL_FOE_TAKEOVER_STRIKE"] = 0
	foe["RATE_ABL_FOE_THRILL"] = 0
	foe["RATE_ABL_FOE_TOTALEXHAUSTION"] = 0
	foe["RATE_ABL_FOE_TUSK"] = 0
	foe["RATE_ABL_FOE_TWOEDGE"] = 0
	foe["RATE_ABL_FOE_ULTIMATESOULCRUSHER"] = 0
	foe["RATE_ABL_FOE_VENOMBITE"] = 0
	foe["RATE_ABL_FOE_VENOMSTAB"] = 0
	foe["RATE_ABL_FOE_VIRUSSTAB"] = 0
	foe["RATE_ABL_FOE_WELCOMEINHELL"] = 0
	foe["RATE_ABL_FOLLOWUP_FIKKIE"] = 0
	foe["RATE_ABL_GG_DEATHSCREAM"] = 0
	foe["RATE_ABL_GG_TERRSCREAM"] = 0
	foe["RATE_ABL_GG_TOTALBREAKSCREAM"] = 0
	foe["RATE_ABL_GLOOM"] = 0
	foe["RATE_ABL_HANDOSTILLOR_EVERYBODYKNEELBEFOREME"] = 0
	foe["RATE_ABL_HERO_DANDOR_AXESMASH"] = 0
	foe["RATE_ABL_HERO_DANDOR_BARRIER"] = 0
	foe["RATE_ABL_HERO_DANDOR_SHIELD"] = 0
	foe["RATE_ABL_HERO_DANDOR_SUPERAXESMASH"] = 0
	foe["RATE_ABL_HERO_HANDOSTILLOR_CLEANSE"] = 0
	foe["RATE_ABL_HERO_HANDOSTILLOR_CUREDISEASE"] = 0
	foe["RATE_ABL_HERO_HANDOSTILLOR_FIRESTORM"] = 0
	foe["RATE_ABL_HERO_HANDOSTILLOR_FIRSTAID"] = 0
	foe["RATE_ABL_HERO_HANDOSTILLOR_GOODMORNING"] = 0
	foe["RATE_ABL_HERO_HANDOSTILLOR_HASPARONVITALIZATION"] = 0
	foe["RATE_ABL_HERO_HANDOSTILLOR_HOLYSTRIKE"] = 0
	foe["RATE_ABL_HERO_HANDOSTILLOR_KNEELBEFOREME"] = 0
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
	foe["RATE_ABL_HERO_JAKE_WINDSTRIKE"] = 0
	foe["RATE_ABL_HERO_MARRILONA_\49\57\53\51"] = 0
	foe["RATE_ABL_HERO_MARRILONA_BIO"] = 0
	foe["RATE_ABL_HERO_MARRILONA_BREEZE"] = 0
	foe["RATE_ABL_HERO_MARRILONA_CHILL"] = 0
	foe["RATE_ABL_HERO_MARRILONA_CURSEDHEALING"] = 0
	foe["RATE_ABL_HERO_MARRILONA_ELECTROCUTION"] = 0
	foe["RATE_ABL_HERO_MARRILONA_EMPOWER"] = 0
	foe["RATE_ABL_HERO_MARRILONA_ETERNALFLAME"] = 0
	foe["RATE_ABL_HERO_MARRILONA_FIREBLAST"] = 0
	foe["RATE_ABL_HERO_MARRILONA_FLAME"] = 0
	foe["RATE_ABL_HERO_MARRILONA_HEAL"] = 2
	foe["RATE_ABL_HERO_MARRILONA_HURRICANE"] = 0
	foe["RATE_ABL_HERO_MARRILONA_ICEBLAST"] = 0
	foe["RATE_ABL_HERO_MARRILONA_INFERNO"] = 0
	foe["RATE_ABL_HERO_MARRILONA_LETSHEALEMALL"] = 0
	foe["RATE_ABL_HERO_MARRILONA_MEDITATION"] = 0
	foe["RATE_ABL_HERO_MARRILONA_PERMANENCE"] = 0
	foe["RATE_ABL_HERO_MARRILONA_PROTECT"] = 0
	foe["RATE_ABL_HERO_MARRILONA_QUAKE"] = 0
	foe["RATE_ABL_HERO_MARRILONA_ROCK"] = 0
	foe["RATE_ABL_HERO_MARRILONA_SPEEDUP"] = 0
	foe["RATE_ABL_HERO_MARRILONA_SPLASH"] = 10
	foe["RATE_ABL_HERO_MARRILONA_STONE\50FLESH"] = 0
	foe["RATE_ABL_HERO_MARRILONA_TSUNAMI"] = 2
	foe["RATE_ABL_HERO_MARRILONA_ZAP"] = 0
	foe["RATE_ABL_HERO_SPEEDUP"] = 0
	foe["RATE_ABL_JUGGERNAUT_DONALDTRUMP"] = 0
	foe["RATE_ABL_JUGGERNAUT_MAY"] = 0
	foe["RATE_ABL_MARRILONA_LIFEFORCE"] = 0
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
	foe["RATE_ABL_MASTER_RUBINE_FASTDRAW"] = 0
	foe["RATE_ABL_MASTER_RUBINE_FOLLOWME"] = 0
	foe["RATE_ABL_MASTER_RUBINE_INVADE"] = 0
	foe["RATE_ABL_MASTER_RUBINE_PICKPOCKET"] = 0
	foe["RATE_ABL_MASTER_RUBINE_POISONSTAB"] = 0
	foe["RATE_ABL_MASTER_RUSSELL_DECAPITATE"] = 0
	foe["RATE_ABL_MASTER_RUSSELL_GENOCIDE"] = 0
	foe["RATE_ABL_MASTER_RUSSELL_SAFESHOT"] = 0
	foe["RATE_ABL_MASTER_RUSSEL_DECAPITATE"] = 0
	foe["RATE_ABL_NPSH_OVERNAME"] = 0
	foe["RATE_ABL_NPSR_DOOD"] = 0
	foe["RATE_ABL_NPSR_GIF"] = 0
	foe["RATE_ABL_NPSR_RUG"] = 0
	foe["RATE_ABL_NPSR_VERLAM"] = 0
	foe["RATE_ABL_NPSR_VLOEK"] = 0
	foe["RATE_ABL_NPSR_ZIEKTE"] = 0
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
	foe["RATE_HYDRA_ONTHOOFD"] = 0
	foe["RATE_ICEBLAST"] = 0
	foe["RATE_ITEM_MEDICINES"] = 0
	foe["RATE_ITM_AMBROSIA"] = 0
	foe["RATE_ITM_ANABOLINEA"] = 0
	foe["RATE_ITM_ANTIDOTE"] = 0
	foe["RATE_ITM_ANTIDOTES"] = 0
	foe["RATE_ITM_APPLE"] = 0
	foe["RATE_ITM_APPLES"] = 0
	foe["RATE_ITM_BANANA"] = 0
	foe["RATE_ITM_BELL"] = 0
	foe["RATE_ITM_CARROT"] = 0
	foe["RATE_ITM_CARROTPACKFISH"] = 0
	foe["RATE_ITM_CARROTS"] = 0
	foe["RATE_ITM_CHERRY"] = 0
	foe["RATE_ITM_CURSEDSPORES"] = 0
	foe["RATE_ITM_DEATHCUBE"] = 0
	foe["RATE_ITM_EEL"] = 0
	foe["RATE_ITM_ELIXIR"] = 0
	foe["RATE_ITM_FISH"] = 0
	foe["RATE_ITM_FLAMEORB"] = 0
	foe["RATE_ITM_FLAMEORBS"] = 0
	foe["RATE_ITM_HEALINGHERB"] = 0
	foe["RATE_ITM_HEALSHOWER"] = 0
	foe["RATE_ITM_HELLSTONE"] = 0
	foe["RATE_ITM_HOLYHANDGRENATE"] = 0
	foe["RATE_ITM_HOLYORB"] = 0
	foe["RATE_ITM_HOLYSCROLL"] = 0
	foe["RATE_ITM_HOLYWATER"] = 0
	foe["RATE_ITM_ICICLE"] = 0
	foe["RATE_ITM_ICICLES"] = 0
	foe["RATE_ITM_INFERNOORB"] = 0
	foe["RATE_ITM_JUSDORANGE"] = 0
	foe["RATE_ITM_MAGICDUST"] = 0
	foe["RATE_ITM_MAGICSPRINKLES"] = 0
	foe["RATE_ITM_MAGICSTONE"] = 0
	foe["RATE_ITM_MANDRAKE"] = 0
	foe["RATE_ITM_MANDRAKES"] = 0
	foe["RATE_ITM_MEDICINE"] = 0
	foe["RATE_ITM_MIRROR"] = 0
	foe["RATE_ITM_MULTIPHOENIX"] = 0
	foe["RATE_ITM_MUTTON"] = 0
	foe["RATE_ITM_PANACEA"] = 0
	foe["RATE_ITM_PHOENIX"] = 0
	foe["RATE_ITM_POCKETTSUNAMI"] = 0
	foe["RATE_ITM_POISONDART"] = 0
	foe["RATE_ITM_POTION"] = 0
	foe["RATE_ITM_POTIONS"] = 0
	foe["RATE_ITM_PURELITERATURE"] = 0
	foe["RATE_ITM_PURIFICATIONSHOWER"] = 0
	foe["RATE_ITM_SALVE"] = 0
	foe["RATE_ITM_SALVES"] = 0
	foe["RATE_ITM_SAUERKRAUT"] = 0
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
	foe["RATE_ITM_WIZARDDUST"] = 0
	foe["RATE_ITM_YASHARBERRIES"] = 0
	foe["RATE_JUG_ATK\49"] = 0
	foe["RATE_JUG_ATK\49\48"] = 0
	foe["RATE_JUG_ATK\49\49"] = 0
	foe["RATE_JUG_ATK\49\50"] = 0
	foe["RATE_JUG_ATK\50"] = 0
	foe["RATE_JUG_ATK\51"] = 0
	foe["RATE_JUG_ATK\52"] = 0
	foe["RATE_JUG_ATK\53"] = 0
	foe["RATE_JUG_ATK\54"] = 0
	foe["RATE_JUG_ATK\55"] = 0
	foe["RATE_JUG_ATK\56"] = 0
	foe["RATE_JUG_ATK\57"] = 0
	foe["RATE_JUG_HEAL\49"] = 0
	foe["RATE_JUG_HEAL\50"] = 0
	foe["RATE_JUG_HEAL\51"] = 0
	foe["RATE_JUG_JUGGERNAUT"] = 0
	foe["RATE_JUG_TACT\49"] = 0
	foe["RATE_JUG_TACT\49\48"] = 0
	foe["RATE_JUG_TACT\50"] = 0
	foe["RATE_JUG_TACT\51"] = 0
	foe["RATE_JUG_TACT\52"] = 0
	foe["RATE_JUG_TACT\53"] = 0
	foe["RATE_JUG_TACT\54"] = 0
	foe["RATE_JUG_TACT\55"] = 0
	foe["RATE_JUG_TACT\56"] = 0
	foe["RATE_JUG_TACT\57"] = 0
	foe["RATE_NOS_BURN"] = 0
	foe["RATE_NOS_DROWN"] = 0
	foe["RATE_NOS_FREEZE"] = 0
	foe["RATE_NOS_FRY"] = 0
	foe["RATE_NOS_GET"] = 0
	foe["RATE_NOS_HATE"] = 0
	foe["RATE_NOS_HURT"] = 0
	foe["RATE_NOS_KILL"] = 0
	foe["RATE_NOS_SHAKE"] = 0
	foe["RATE_NOS_SQUEEZE"] = 0
	foe["RATE_NOS_STOP"] = 0
	foe["RATE_NOS_TWIST"] = 0
	foe["RATE_SILLY_ONE"] = 0
	foe["RATE_SILLY_ONES"] = 0
	foe["RATE_SPECIAL_ARMAGEDDON"] = 0
	foe["RATE_SPECIAL_AXESMASH"] = 0
	foe["RATE_SPECIAL_GENDRABROE_COUNTER"] = 0
	foe["RATE_SPECIAL_NOSTRAMORPH"] = 0
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
	foe["RATE_ZZKEY_NOSTRACOIN\49"] = 0
	foe["RATE_ZZKEY_NOSTRACOIN\50"] = 0
	foe["RATE_ZZKEY_NOSTRACOIN\51"] = 0
	foe["RATE_ZZKEY_NOSTRACOIN\52"] = 0
	foe["RATE_ZZKEY_NOSTRACOIN\53"] = 0
	foe["RATE_ZZKEY_NOSTRACOIN\54"] = 0
	foe["RATE_ZZKEY_NOSTRACOIN\55"] = 0
	foe["RATE_ZZKEY_NOSTRACOIN\56"] = 0
	foe["RATE_ZZKEY_WIND"] = 0
	foe["RATE_ZZZ_KRANDARARMOR"] = 0
	foe["RATE_ZZZ_KRANDARBLADE"] = 0
	foe["RATE_ZZ_CRYPTKEY"] = 0
	foe["TARGET_AAA_ATTACK"] = "Random"
	foe["TARGET_AAA_GUARD"] = "Random"
	foe["TARGET_ABL_FOE_BACTERIATUSK"] = "Random"
	foe["TARGET_ABL_FOE_CRUSH"] = "Random"
	foe["TARGET_ABL_FOE_CURSEDWIND"] = "Random"
	foe["TARGET_ABL_FOE_DEATHSPELL"] = "Random"
	foe["TARGET_ABL_FOE_DEMON_SOUL_BREAKER"] = "Random"
	foe["TARGET_ABL_FOE_DESPERATEATTACK"] = "Random"
	foe["TARGET_ABL_FOE_DEVOUR"] = "Random"
	foe["TARGET_ABL_FOE_DISINTEGRATE"] = "Random"
	foe["TARGET_ABL_FOE_DISTRACT"] = "Random"
	foe["TARGET_ABL_FOE_ENEMYVITALIZE"] = "Random"
	foe["TARGET_ABL_FOE_ENERGYDRAIN"] = "Random"
	foe["TARGET_ABL_FOE_EVIL_EYE"] = "Random"
	foe["TARGET_ABL_FOE_EVIL_EYE_PARALYZE"] = "Random"
	foe["TARGET_ABL_FOE_EVIL_EYE_PETRIFY"] = "Random"
	foe["TARGET_ABL_FOE_EXHAUST"] = "Random"
	foe["TARGET_ABL_FOE_FATALPOISON"] = "Random"
	foe["TARGET_ABL_FOE_FLAMEBITE"] = "Random"
	foe["TARGET_ABL_FOE_FLAMEONSELF"] = "Random"
	foe["TARGET_ABL_FOE_FLAMESTRIKE"] = "Random"
	foe["TARGET_ABL_FOE_FOOLGOLD"] = "Random"
	foe["TARGET_ABL_FOE_GAIASMASH"] = "Random"
	foe["TARGET_ABL_FOE_GAZE"] = "Random"
	foe["TARGET_ABL_FOE_GG_DEATHSCREAM"] = "Random"
	foe["TARGET_ABL_FOE_GG_SCREAM"] = "Random"
	foe["TARGET_ABL_FOE_GRAVITY"] = "Random"
	foe["TARGET_ABL_FOE_HOLDPERSON"] = "Random"
	foe["TARGET_ABL_FOE_HORROR"] = "Random"
	foe["TARGET_ABL_FOE_LIFEDRAIN"] = "Random"
	foe["TARGET_ABL_FOE_LIFEFORCE"] = "Random"
	foe["TARGET_ABL_FOE_MERMAID_TEMPATION"] = "Random"
	foe["TARGET_ABL_FOE_MULTISTRIKE"] = "Random"
	foe["TARGET_ABL_FOE_PARADIVE"] = "Random"
	foe["TARGET_ABL_FOE_RANDOMIZER"] = "Random"
	foe["TARGET_ABL_FOE_RANDOMIZERTOTAL"] = "Random"
	foe["TARGET_ABL_FOE_SETTHESTAGEONFIRE"] = "Random"
	foe["TARGET_ABL_FOE_SHOCKINGSTORIES"] = "Random"
	foe["TARGET_ABL_FOE_SICKSTORIES"] = "Random"
	foe["TARGET_ABL_FOE_SLASH"] = "Random"
	foe["TARGET_ABL_FOE_SMITE"] = "Random"
	foe["TARGET_ABL_FOE_SOULCRUSHINGSTORY"] = "Random"
	foe["TARGET_ABL_FOE_SPORES"] = "Random"
	foe["TARGET_ABL_FOE_SUICIDE"] = "Random"
	foe["TARGET_ABL_FOE_TAKEOVER"] = "Random"
	foe["TARGET_ABL_FOE_TAKEOVER\50"] = "Random"
	foe["TARGET_ABL_FOE_TAKEOVER_STRIKE"] = "Random"
	foe["TARGET_ABL_FOE_THRILL"] = "Random"
	foe["TARGET_ABL_FOE_TOTALEXHAUSTION"] = "Random"
	foe["TARGET_ABL_FOE_TUSK"] = "Random"
	foe["TARGET_ABL_FOE_TWOEDGE"] = "Random"
	foe["TARGET_ABL_FOE_ULTIMATESOULCRUSHER"] = "Random"
	foe["TARGET_ABL_FOE_VENOMBITE"] = "Random"
	foe["TARGET_ABL_FOE_VENOMSTAB"] = "Random"
	foe["TARGET_ABL_FOE_VIRUSSTAB"] = "Random"
	foe["TARGET_ABL_FOE_WELCOMEINHELL"] = "Random"
	foe["TARGET_ABL_FOLLOWUP_FIKKIE"] = "Random"
	foe["TARGET_ABL_GG_DEATHSCREAM"] = "Random"
	foe["TARGET_ABL_GG_TERRSCREAM"] = "Random"
	foe["TARGET_ABL_GG_TOTALBREAKSCREAM"] = "Random"
	foe["TARGET_ABL_GLOOM"] = "Random"
	foe["TARGET_ABL_HANDOSTILLOR_EVERYBODYKNEELBEFOREME"] = "Random"
	foe["TARGET_ABL_HERO_DANDOR_AXESMASH"] = "Random"
	foe["TARGET_ABL_HERO_DANDOR_BARRIER"] = "Random"
	foe["TARGET_ABL_HERO_DANDOR_SHIELD"] = "Random"
	foe["TARGET_ABL_HERO_DANDOR_SUPERAXESMASH"] = "Random"
	foe["TARGET_ABL_HERO_HANDOSTILLOR_CLEANSE"] = "Random"
	foe["TARGET_ABL_HERO_HANDOSTILLOR_CUREDISEASE"] = "Random"
	foe["TARGET_ABL_HERO_HANDOSTILLOR_FIRESTORM"] = "Random"
	foe["TARGET_ABL_HERO_HANDOSTILLOR_FIRSTAID"] = "Random"
	foe["TARGET_ABL_HERO_HANDOSTILLOR_GOODMORNING"] = "Random"
	foe["TARGET_ABL_HERO_HANDOSTILLOR_HASPARONVITALIZATION"] = "Random"
	foe["TARGET_ABL_HERO_HANDOSTILLOR_HOLYSTRIKE"] = "Random"
	foe["TARGET_ABL_HERO_HANDOSTILLOR_KNEELBEFOREME"] = "Random"
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
	foe["TARGET_ABL_HERO_JAKE_WINDSTRIKE"] = "Random"
	foe["TARGET_ABL_HERO_MARRILONA_\49\57\53\51"] = "Random"
	foe["TARGET_ABL_HERO_MARRILONA_BIO"] = "Random"
	foe["TARGET_ABL_HERO_MARRILONA_BREEZE"] = "Random"
	foe["TARGET_ABL_HERO_MARRILONA_CHILL"] = "Random"
	foe["TARGET_ABL_HERO_MARRILONA_CURSEDHEALING"] = "Random"
	foe["TARGET_ABL_HERO_MARRILONA_ELECTROCUTION"] = "Random"
	foe["TARGET_ABL_HERO_MARRILONA_EMPOWER"] = "Random"
	foe["TARGET_ABL_HERO_MARRILONA_ETERNALFLAME"] = "Random"
	foe["TARGET_ABL_HERO_MARRILONA_FIREBLAST"] = "Random"
	foe["TARGET_ABL_HERO_MARRILONA_FLAME"] = "Random"
	foe["TARGET_ABL_HERO_MARRILONA_HEAL"] = "Random"
	foe["TARGET_ABL_HERO_MARRILONA_HURRICANE"] = "Random"
	foe["TARGET_ABL_HERO_MARRILONA_ICEBLAST"] = "Random"
	foe["TARGET_ABL_HERO_MARRILONA_INFERNO"] = "Random"
	foe["TARGET_ABL_HERO_MARRILONA_LETSHEALEMALL"] = "Random"
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
	foe["TARGET_ABL_JUGGERNAUT_DONALDTRUMP"] = "Random"
	foe["TARGET_ABL_JUGGERNAUT_MAY"] = "Random"
	foe["TARGET_ABL_MARRILONA_LIFEFORCE"] = "Random"
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
	foe["TARGET_ABL_MASTER_RUBINE_FASTDRAW"] = "Random"
	foe["TARGET_ABL_MASTER_RUBINE_FOLLOWME"] = "Random"
	foe["TARGET_ABL_MASTER_RUBINE_INVADE"] = "Random"
	foe["TARGET_ABL_MASTER_RUBINE_PICKPOCKET"] = "Random"
	foe["TARGET_ABL_MASTER_RUBINE_POISONSTAB"] = "Random"
	foe["TARGET_ABL_MASTER_RUSSELL_DECAPITATE"] = "Random"
	foe["TARGET_ABL_MASTER_RUSSELL_GENOCIDE"] = "Random"
	foe["TARGET_ABL_MASTER_RUSSELL_SAFESHOT"] = "Random"
	foe["TARGET_ABL_MASTER_RUSSEL_DECAPITATE"] = "Random"
	foe["TARGET_ABL_NPSH_OVERNAME"] = "Random"
	foe["TARGET_ABL_NPSR_DOOD"] = "Random"
	foe["TARGET_ABL_NPSR_GIF"] = "Random"
	foe["TARGET_ABL_NPSR_RUG"] = "Random"
	foe["TARGET_ABL_NPSR_VERLAM"] = "Random"
	foe["TARGET_ABL_NPSR_VLOEK"] = "Random"
	foe["TARGET_ABL_NPSR_ZIEKTE"] = "Random"
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
	foe["TARGET_HYDRA_ONTHOOFD"] = "Random"
	foe["TARGET_ICEBLAST"] = "Random"
	foe["TARGET_ITEM_MEDICINES"] = "Random"
	foe["TARGET_ITM_AMBROSIA"] = "Random"
	foe["TARGET_ITM_ANABOLINEA"] = "Random"
	foe["TARGET_ITM_ANTIDOTE"] = "Random"
	foe["TARGET_ITM_ANTIDOTES"] = "Random"
	foe["TARGET_ITM_APPLE"] = "Random"
	foe["TARGET_ITM_APPLES"] = "Random"
	foe["TARGET_ITM_BANANA"] = "Random"
	foe["TARGET_ITM_BELL"] = "Random"
	foe["TARGET_ITM_CARROT"] = "Random"
	foe["TARGET_ITM_CARROTPACKFISH"] = "Random"
	foe["TARGET_ITM_CARROTS"] = "Random"
	foe["TARGET_ITM_CHERRY"] = "Random"
	foe["TARGET_ITM_CURSEDSPORES"] = "Random"
	foe["TARGET_ITM_DEATHCUBE"] = "Random"
	foe["TARGET_ITM_EEL"] = "Random"
	foe["TARGET_ITM_ELIXIR"] = "Random"
	foe["TARGET_ITM_FISH"] = "Random"
	foe["TARGET_ITM_FLAMEORB"] = "Random"
	foe["TARGET_ITM_FLAMEORBS"] = "Random"
	foe["TARGET_ITM_HEALINGHERB"] = "Random"
	foe["TARGET_ITM_HEALSHOWER"] = "Random"
	foe["TARGET_ITM_HELLSTONE"] = "Random"
	foe["TARGET_ITM_HOLYHANDGRENATE"] = "Random"
	foe["TARGET_ITM_HOLYORB"] = "Random"
	foe["TARGET_ITM_HOLYSCROLL"] = "Random"
	foe["TARGET_ITM_HOLYWATER"] = "Random"
	foe["TARGET_ITM_ICICLE"] = "Random"
	foe["TARGET_ITM_ICICLES"] = "Random"
	foe["TARGET_ITM_INFERNOORB"] = "Random"
	foe["TARGET_ITM_JUSDORANGE"] = "Random"
	foe["TARGET_ITM_MAGICDUST"] = "Random"
	foe["TARGET_ITM_MAGICSPRINKLES"] = "Random"
	foe["TARGET_ITM_MAGICSTONE"] = "Random"
	foe["TARGET_ITM_MANDRAKE"] = "Random"
	foe["TARGET_ITM_MANDRAKES"] = "Random"
	foe["TARGET_ITM_MEDICINE"] = "Random"
	foe["TARGET_ITM_MIRROR"] = "Random"
	foe["TARGET_ITM_MULTIPHOENIX"] = "Random"
	foe["TARGET_ITM_MUTTON"] = "Random"
	foe["TARGET_ITM_PANACEA"] = "Random"
	foe["TARGET_ITM_PHOENIX"] = "Random"
	foe["TARGET_ITM_POCKETTSUNAMI"] = "Random"
	foe["TARGET_ITM_POISONDART"] = "Random"
	foe["TARGET_ITM_POTION"] = "Random"
	foe["TARGET_ITM_POTIONS"] = "Random"
	foe["TARGET_ITM_PURELITERATURE"] = "Random"
	foe["TARGET_ITM_PURIFICATIONSHOWER"] = "Random"
	foe["TARGET_ITM_SALVE"] = "Random"
	foe["TARGET_ITM_SALVES"] = "Random"
	foe["TARGET_ITM_SAUERKRAUT"] = "Random"
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
	foe["TARGET_ITM_WIZARDDUST"] = "Random"
	foe["TARGET_ITM_YASHARBERRIES"] = "Random"
	foe["TARGET_JUG_ATK\49"] = "Random"
	foe["TARGET_JUG_ATK\49\48"] = "Random"
	foe["TARGET_JUG_ATK\49\49"] = "Random"
	foe["TARGET_JUG_ATK\49\50"] = "Random"
	foe["TARGET_JUG_ATK\50"] = "Random"
	foe["TARGET_JUG_ATK\51"] = "Random"
	foe["TARGET_JUG_ATK\52"] = "Random"
	foe["TARGET_JUG_ATK\53"] = "Random"
	foe["TARGET_JUG_ATK\54"] = "Random"
	foe["TARGET_JUG_ATK\55"] = "Random"
	foe["TARGET_JUG_ATK\56"] = "Random"
	foe["TARGET_JUG_ATK\57"] = "Random"
	foe["TARGET_JUG_HEAL\49"] = "Random"
	foe["TARGET_JUG_HEAL\50"] = "Random"
	foe["TARGET_JUG_HEAL\51"] = "Random"
	foe["TARGET_JUG_JUGGERNAUT"] = "Random"
	foe["TARGET_JUG_TACT\49"] = "Random"
	foe["TARGET_JUG_TACT\49\48"] = "Random"
	foe["TARGET_JUG_TACT\50"] = "Random"
	foe["TARGET_JUG_TACT\51"] = "Random"
	foe["TARGET_JUG_TACT\52"] = "Random"
	foe["TARGET_JUG_TACT\53"] = "Random"
	foe["TARGET_JUG_TACT\54"] = "Random"
	foe["TARGET_JUG_TACT\55"] = "Random"
	foe["TARGET_JUG_TACT\56"] = "Random"
	foe["TARGET_JUG_TACT\57"] = "Random"
	foe["TARGET_NOS_BURN"] = "Random"
	foe["TARGET_NOS_DROWN"] = "Random"
	foe["TARGET_NOS_FREEZE"] = "Random"
	foe["TARGET_NOS_FRY"] = "Random"
	foe["TARGET_NOS_GET"] = "Random"
	foe["TARGET_NOS_HATE"] = "Random"
	foe["TARGET_NOS_HURT"] = "Random"
	foe["TARGET_NOS_KILL"] = "Random"
	foe["TARGET_NOS_SHAKE"] = "Random"
	foe["TARGET_NOS_SQUEEZE"] = "Random"
	foe["TARGET_NOS_STOP"] = "Random"
	foe["TARGET_NOS_TWIST"] = "Random"
	foe["TARGET_SILLY_ONE"] = "Random"
	foe["TARGET_SILLY_ONES"] = "Random"
	foe["TARGET_SPECIAL_ARMAGEDDON"] = "Random"
	foe["TARGET_SPECIAL_AXESMASH"] = "Random"
	foe["TARGET_SPECIAL_GENDRABROE_COUNTER"] = "Random"
	foe["TARGET_SPECIAL_NOSTRAMORPH"] = "Random"
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
	foe["TARGET_ZZKEY_NOSTRACOIN\49"] = "Random"
	foe["TARGET_ZZKEY_NOSTRACOIN\50"] = "Random"
	foe["TARGET_ZZKEY_NOSTRACOIN\51"] = "Random"
	foe["TARGET_ZZKEY_NOSTRACOIN\52"] = "Random"
	foe["TARGET_ZZKEY_NOSTRACOIN\53"] = "Random"
	foe["TARGET_ZZKEY_NOSTRACOIN\54"] = "Random"
	foe["TARGET_ZZKEY_NOSTRACOIN\55"] = "Random"
	foe["TARGET_ZZKEY_NOSTRACOIN\56"] = "Random"
	foe["TARGET_ZZKEY_WIND"] = "Random"
	foe["TARGET_ZZZ_KRANDARARMOR"] = "Random"
	foe["TARGET_ZZZ_KRANDARBLADE"] = "Random"
	foe["TARGET_ZZ_CRYPTKEY"] = "Random"
	foe["VocalTag"] = "Aqua"
	foe["Boss"] = true
	foe["Oversoul"] = false
	foe["Oversoul Drop \49"] = false
	foe["Oversoul Drop \50"] = false
	foe["Oversoul Steal \49"] = false
	foe["Oversoul Steal \50"] = false
	foe["Oversoul Steal \51"] = false
	foe["Cash"] = 100
	foe["ER_Darkness"] = 0
	foe["ER_Earth"] = 0
	foe["ER_Flame"] = 100
	foe["ER_Frost"] = -50
	foe["ER_Light"] = 0
	foe["ER_Lightning"] = -150
	foe["ER_Water"] = 200
	foe["ER_Wind"] = 0
	foe["Rate Drop \49"] = 100
	foe["Rate Drop \50"] = 1
	foe["Rate Steal \49"] = 0
	foe["Rate Steal \50"] = 0
	foe["Rate Steal \51"] = 0
	foe["SR_Confusion"] = 100
	foe["SR_Curse"] = 100
	foe["SR_Death"] = 100
	foe["SR_Disease"] = 100
	foe["SR_Paralysis"] = 100
	foe["SR_Petrification"] = 100
	foe["SR_Poison"] = 100
	foe["SR_Silence"] = 100
	foe["SR_Sleep"] = 100
	foe["SR_Undead"] = 100
	foe["normal_Accuracy"] = 89
	foe["normal_EXP"] = 100
	foe["normal_Endurance"] = 80
	foe["normal_Evasion"] = 10
	foe["normal_HP"] = 5000
	foe["normal_Intelligence"] = 160
	foe["normal_Power"] = 90
	foe["normal_Resistance"] = 140
	foe["normal_Speed"] = 120
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


