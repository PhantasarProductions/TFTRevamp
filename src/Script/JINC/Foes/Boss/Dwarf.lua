--[[
**********************************************
  
  Dwarf.lua
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
 
version: 16.12.31
]]
-- File Generated: Sat 31 December 2016; 17:28:56


local foe = {}

	foe["AI"] = "dwarfprologue"
	foe["NEWGAMEPLUS_AAA_ATTACK"] = true
	foe["NEWGAMEPLUS_ABL_FOE_CRUSH"] = true
	foe["NEWGAMEPLUS_ABL_FOE_DESPERATEATTACK"] = true
	foe["NEWGAMEPLUS_ABL_FOE_DISTRACT"] = true
	foe["NEWGAMEPLUS_ABL_FOE_FLAMESTRIKE"] = true
	foe["NEWGAMEPLUS_ABL_FOE_SMITE"] = true
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
	foe["NEWGAMEPLUS_ABL_HERO_JAKE_SHIFT_FAIRY"] = true
	foe["NEWGAMEPLUS_ABL_HERO_JAKE_SHIFT_HUMAN"] = true
	foe["NEWGAMEPLUS_ABL_HERO_MARRILONA_FLAME"] = true
	foe["NEWGAMEPLUS_ABL_HERO_MARRILONA_HEAL"] = true
	foe["NEWGAMEPLUS_ABL_HERO_MARRILONA_SPLASH"] = true
	foe["NEWGAMEPLUS_ABL_MASTER_RUBINE_BACKSTAB"] = true
	foe["NEWGAMEPLUS_ABL_MASTER_RUBINE_FOLLOWME"] = true
	foe["NEWGAMEPLUS_ABL_MASTER_RUBINE_PICKPOCKET"] = true
	foe["NEWGAMEPLUS_ABL_MASTER_RUBINE_POISONSTAB"] = true
	foe["NEWGAMEPLUS_ITM_ANTIDOTE"] = true
	foe["NEWGAMEPLUS_ITM_APPLE"] = true
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
	foe["NEWGAMEPLUS_WAND_TRAINING"] = true
	foe["NORMAL_AAA_ATTACK"] = true
	foe["NORMAL_ABL_FOE_CRUSH"] = true
	foe["NORMAL_ABL_FOE_DESPERATEATTACK"] = true
	foe["NORMAL_ABL_FOE_DISTRACT"] = true
	foe["NORMAL_ABL_FOE_FLAMESTRIKE"] = true
	foe["NORMAL_ABL_FOE_SMITE"] = true
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
	foe["NORMAL_ABL_HERO_JAKE_SHIFT_FAIRY"] = true
	foe["NORMAL_ABL_HERO_JAKE_SHIFT_HUMAN"] = true
	foe["NORMAL_ABL_HERO_MARRILONA_FLAME"] = true
	foe["NORMAL_ABL_HERO_MARRILONA_HEAL"] = true
	foe["NORMAL_ABL_HERO_MARRILONA_SPLASH"] = true
	foe["NORMAL_ABL_MASTER_RUBINE_BACKSTAB"] = true
	foe["NORMAL_ABL_MASTER_RUBINE_FOLLOWME"] = true
	foe["NORMAL_ABL_MASTER_RUBINE_PICKPOCKET"] = true
	foe["NORMAL_ABL_MASTER_RUBINE_POISONSTAB"] = true
	foe["NORMAL_ITM_ANTIDOTE"] = true
	foe["NORMAL_ITM_APPLE"] = true
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
	foe["NORMAL_WAND_TRAINING"] = true
	foe["OVERSOUL_AAA_ATTACK"] = true
	foe["OVERSOUL_ABL_FOE_CRUSH"] = true
	foe["OVERSOUL_ABL_FOE_DESPERATEATTACK"] = true
	foe["OVERSOUL_ABL_FOE_DISTRACT"] = true
	foe["OVERSOUL_ABL_FOE_FLAMESTRIKE"] = true
	foe["OVERSOUL_ABL_FOE_SMITE"] = true
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
	foe["OVERSOUL_ABL_HERO_JAKE_SHIFT_FAIRY"] = true
	foe["OVERSOUL_ABL_HERO_JAKE_SHIFT_HUMAN"] = true
	foe["OVERSOUL_ABL_HERO_MARRILONA_FLAME"] = true
	foe["OVERSOUL_ABL_HERO_MARRILONA_HEAL"] = true
	foe["OVERSOUL_ABL_HERO_MARRILONA_SPLASH"] = true
	foe["OVERSOUL_ABL_MASTER_RUBINE_BACKSTAB"] = true
	foe["OVERSOUL_ABL_MASTER_RUBINE_FOLLOWME"] = true
	foe["OVERSOUL_ABL_MASTER_RUBINE_PICKPOCKET"] = true
	foe["OVERSOUL_ABL_MASTER_RUBINE_POISONSTAB"] = true
	foe["OVERSOUL_ITM_ANTIDOTE"] = true
	foe["OVERSOUL_ITM_APPLE"] = true
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
	foe["OVERSOUL_WAND_TRAINING"] = true
	foe["SKILL\49_AAA_ATTACK"] = true
	foe["SKILL\49_ABL_FOE_CRUSH"] = true
	foe["SKILL\49_ABL_FOE_DESPERATEATTACK"] = true
	foe["SKILL\49_ABL_FOE_DISTRACT"] = true
	foe["SKILL\49_ABL_FOE_FLAMESTRIKE"] = true
	foe["SKILL\49_ABL_FOE_SMITE"] = true
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
	foe["SKILL\49_ABL_HERO_JAKE_SHIFT_FAIRY"] = true
	foe["SKILL\49_ABL_HERO_JAKE_SHIFT_HUMAN"] = true
	foe["SKILL\49_ABL_HERO_MARRILONA_FLAME"] = true
	foe["SKILL\49_ABL_HERO_MARRILONA_HEAL"] = true
	foe["SKILL\49_ABL_HERO_MARRILONA_SPLASH"] = true
	foe["SKILL\49_ABL_MASTER_RUBINE_BACKSTAB"] = true
	foe["SKILL\49_ABL_MASTER_RUBINE_FOLLOWME"] = true
	foe["SKILL\49_ABL_MASTER_RUBINE_PICKPOCKET"] = true
	foe["SKILL\49_ABL_MASTER_RUBINE_POISONSTAB"] = true
	foe["SKILL\49_ITM_ANTIDOTE"] = true
	foe["SKILL\49_ITM_APPLE"] = true
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
	foe["SKILL\49_WAND_TRAINING"] = true
	foe["SKILL\50_AAA_ATTACK"] = true
	foe["SKILL\50_ABL_FOE_CRUSH"] = true
	foe["SKILL\50_ABL_FOE_DESPERATEATTACK"] = true
	foe["SKILL\50_ABL_FOE_DISTRACT"] = true
	foe["SKILL\50_ABL_FOE_FLAMESTRIKE"] = true
	foe["SKILL\50_ABL_FOE_SMITE"] = true
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
	foe["SKILL\50_ABL_HERO_JAKE_SHIFT_FAIRY"] = true
	foe["SKILL\50_ABL_HERO_JAKE_SHIFT_HUMAN"] = true
	foe["SKILL\50_ABL_HERO_MARRILONA_FLAME"] = true
	foe["SKILL\50_ABL_HERO_MARRILONA_HEAL"] = true
	foe["SKILL\50_ABL_HERO_MARRILONA_SPLASH"] = true
	foe["SKILL\50_ABL_MASTER_RUBINE_BACKSTAB"] = true
	foe["SKILL\50_ABL_MASTER_RUBINE_FOLLOWME"] = true
	foe["SKILL\50_ABL_MASTER_RUBINE_PICKPOCKET"] = true
	foe["SKILL\50_ABL_MASTER_RUBINE_POISONSTAB"] = true
	foe["SKILL\50_ITM_ANTIDOTE"] = true
	foe["SKILL\50_ITM_APPLE"] = true
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
	foe["SKILL\50_WAND_TRAINING"] = true
	foe["SKILL\51_AAA_ATTACK"] = true
	foe["SKILL\51_ABL_FOE_CRUSH"] = true
	foe["SKILL\51_ABL_FOE_DESPERATEATTACK"] = true
	foe["SKILL\51_ABL_FOE_DISTRACT"] = true
	foe["SKILL\51_ABL_FOE_FLAMESTRIKE"] = true
	foe["SKILL\51_ABL_FOE_SMITE"] = true
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
	foe["SKILL\51_ABL_HERO_JAKE_SHIFT_FAIRY"] = true
	foe["SKILL\51_ABL_HERO_JAKE_SHIFT_HUMAN"] = true
	foe["SKILL\51_ABL_HERO_MARRILONA_FLAME"] = true
	foe["SKILL\51_ABL_HERO_MARRILONA_HEAL"] = true
	foe["SKILL\51_ABL_HERO_MARRILONA_SPLASH"] = true
	foe["SKILL\51_ABL_MASTER_RUBINE_BACKSTAB"] = true
	foe["SKILL\51_ABL_MASTER_RUBINE_FOLLOWME"] = true
	foe["SKILL\51_ABL_MASTER_RUBINE_PICKPOCKET"] = true
	foe["SKILL\51_ABL_MASTER_RUBINE_POISONSTAB"] = true
	foe["SKILL\51_ITM_ANTIDOTE"] = true
	foe["SKILL\51_ITM_APPLE"] = true
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
	foe["SKILL\51_WAND_TRAINING"] = true
	foe["Desc"] = "A hungry Dwarf on the road"
	foe["Image"] = "GFX\47Combat\47Fighters\47Foe\47Boss\47Dwarf\46png"
	foe["Item Drop \49"] = "ITM_APPLE"
	foe["Item Drop \50"] = "ITM_MEDICINE"
	foe["Item Steal \49"] = "ITM_ANTIDOTE"
	foe["Item Steal \50"] = "ITM_ANTIDOTE"
	foe["Item Steal \51"] = "ITM_ANTIDOTE"
	foe["Name"] = "Dwarf"
	foe["RATE_AAA_ATTACK"] = 100
	foe["RATE_ABL_FOE_CRUSH"] = 0
	foe["RATE_ABL_FOE_DESPERATEATTACK"] = 0
	foe["RATE_ABL_FOE_DISTRACT"] = 0
	foe["RATE_ABL_FOE_FLAMESTRIKE"] = 0
	foe["RATE_ABL_FOE_SMITE"] = 0
	foe["RATE_ABL_FOE_SUICIDE"] = 0
	foe["RATE_ABL_FOE_VENOMBITE"] = 0
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
	foe["RATE_ABL_HERO_JAKE_SHIFT_FAIRY"] = 0
	foe["RATE_ABL_HERO_JAKE_SHIFT_HUMAN"] = 0
	foe["RATE_ABL_HERO_MARRILONA_FLAME"] = 0
	foe["RATE_ABL_HERO_MARRILONA_HEAL"] = 0
	foe["RATE_ABL_HERO_MARRILONA_SPLASH"] = 0
	foe["RATE_ABL_MASTER_RUBINE_BACKSTAB"] = 0
	foe["RATE_ABL_MASTER_RUBINE_FOLLOWME"] = 0
	foe["RATE_ABL_MASTER_RUBINE_PICKPOCKET"] = 0
	foe["RATE_ABL_MASTER_RUBINE_POISONSTAB"] = 0
	foe["RATE_ITM_ANTIDOTE"] = 0
	foe["RATE_ITM_APPLE"] = 0
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
	foe["RATE_WAND_TRAINING"] = 0
	foe["TARGET_AAA_ATTACK"] = "Random"
	foe["TARGET_ABL_FOE_CRUSH"] = "Random"
	foe["TARGET_ABL_FOE_DESPERATEATTACK"] = "Random"
	foe["TARGET_ABL_FOE_DISTRACT"] = "Random"
	foe["TARGET_ABL_FOE_FLAMESTRIKE"] = "Random"
	foe["TARGET_ABL_FOE_SMITE"] = "Random"
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
	foe["TARGET_ABL_HERO_JAKE_SHIFT_FAIRY"] = "Random"
	foe["TARGET_ABL_HERO_JAKE_SHIFT_HUMAN"] = "Random"
	foe["TARGET_ABL_HERO_MARRILONA_FLAME"] = "Random"
	foe["TARGET_ABL_HERO_MARRILONA_HEAL"] = "Random"
	foe["TARGET_ABL_HERO_MARRILONA_SPLASH"] = "Random"
	foe["TARGET_ABL_MASTER_RUBINE_BACKSTAB"] = "Random"
	foe["TARGET_ABL_MASTER_RUBINE_FOLLOWME"] = "Random"
	foe["TARGET_ABL_MASTER_RUBINE_PICKPOCKET"] = "Random"
	foe["TARGET_ABL_MASTER_RUBINE_POISONSTAB"] = "Random"
	foe["TARGET_ITM_ANTIDOTE"] = "Random"
	foe["TARGET_ITM_APPLE"] = "Random"
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
	foe["TARGET_WAND_TRAINING"] = "Random"
	foe["VocalTag"] = ""
	foe["Boss"] = true
	foe["Oversoul"] = false
	foe["Oversoul Drop \49"] = false
	foe["Oversoul Drop \50"] = false
	foe["Oversoul Steal \49"] = false
	foe["Oversoul Steal \50"] = false
	foe["Oversoul Steal \51"] = false
	foe["Cash"] = 150
	foe["ER_Darkness"] = -50
	foe["ER_Earth"] = -50
	foe["ER_Flame"] = -50
	foe["ER_Frost"] = -50
	foe["ER_Light"] = -50
	foe["ER_Lightning"] = -50
	foe["ER_Water"] = -50
	foe["ER_Wind"] = -50
	foe["Rate Drop \49"] = 100
	foe["Rate Drop \50"] = 50
	foe["Rate Steal \49"] = 0
	foe["Rate Steal \50"] = 0
	foe["Rate Steal \51"] = 0
	foe["SR_Curse "] = 0
	foe["SR_Disease "] = 0
	foe["SR_Paralysis "] = 0
	foe["SR_Petrification "] = 0
	foe["SR_Poison "] = 0
	foe["SR_Silence "] = 0
	foe["SR_Undead "] = 0
	foe["normal_Accuracy"] = 75
	foe["normal_EXP"] = 15
	foe["normal_Endurance"] = 2
	foe["normal_Evasion"] = 0
	foe["normal_HP"] = 100
	foe["normal_Intelligence"] = 2
	foe["normal_Power"] = 15
	foe["normal_Resistance"] = 1
	foe["normal_Speed"] = 2
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


