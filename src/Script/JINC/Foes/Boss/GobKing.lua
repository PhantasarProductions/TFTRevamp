--[[
  GobKing.lua
  Version: 16.10.12
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
-- File Generated: Wed 12 October 2016; 21:26:24


local foe = {}

	foe["AI"] = "default"
	foe["NEWGAMEPLUS_AAA_ATTACK"] = true
	foe["NEWGAMEPLUS_ABL_HERO_HANDOSTILLOR_FIRSTAID"] = true
	foe["NEWGAMEPLUS_ABL_HERO_JAKE_\50PS"] = true
	foe["NEWGAMEPLUS_ABL_HERO_JAKE_\51PS"] = true
	foe["NEWGAMEPLUS_ABL_HERO_JAKE_\52PS"] = true
	foe["NEWGAMEPLUS_ITM_ANTIDOTE"] = true
	foe["NEWGAMEPLUS_ITM_APPLE"] = true
	foe["NEWGAMEPLUS_ITM_FLAMEORB"] = true
	foe["NORMAL_AAA_ATTACK"] = true
	foe["NORMAL_ABL_HERO_HANDOSTILLOR_FIRSTAID"] = true
	foe["NORMAL_ABL_HERO_JAKE_\50PS"] = true
	foe["NORMAL_ABL_HERO_JAKE_\51PS"] = true
	foe["NORMAL_ABL_HERO_JAKE_\52PS"] = true
	foe["NORMAL_ITM_ANTIDOTE"] = true
	foe["NORMAL_ITM_APPLE"] = true
	foe["NORMAL_ITM_FLAMEORB"] = true
	foe["OVERSOUL_AAA_ATTACK"] = true
	foe["OVERSOUL_ABL_HERO_HANDOSTILLOR_FIRSTAID"] = true
	foe["OVERSOUL_ABL_HERO_JAKE_\50PS"] = true
	foe["OVERSOUL_ABL_HERO_JAKE_\51PS"] = true
	foe["OVERSOUL_ABL_HERO_JAKE_\52PS"] = true
	foe["OVERSOUL_ITM_ANTIDOTE"] = true
	foe["OVERSOUL_ITM_APPLE"] = true
	foe["OVERSOUL_ITM_FLAMEORB"] = true
	foe["SKILL\49_AAA_ATTACK"] = true
	foe["SKILL\49_ABL_HERO_HANDOSTILLOR_FIRSTAID"] = true
	foe["SKILL\49_ABL_HERO_JAKE_\50PS"] = true
	foe["SKILL\49_ABL_HERO_JAKE_\51PS"] = true
	foe["SKILL\49_ABL_HERO_JAKE_\52PS"] = true
	foe["SKILL\49_ITM_ANTIDOTE"] = true
	foe["SKILL\49_ITM_APPLE"] = false
	foe["SKILL\49_ITM_FLAMEORB"] = true
	foe["SKILL\50_AAA_ATTACK"] = true
	foe["SKILL\50_ABL_HERO_HANDOSTILLOR_FIRSTAID"] = true
	foe["SKILL\50_ABL_HERO_JAKE_\50PS"] = true
	foe["SKILL\50_ABL_HERO_JAKE_\51PS"] = true
	foe["SKILL\50_ABL_HERO_JAKE_\52PS"] = true
	foe["SKILL\50_ITM_ANTIDOTE"] = true
	foe["SKILL\50_ITM_APPLE"] = true
	foe["SKILL\50_ITM_FLAMEORB"] = true
	foe["SKILL\51_AAA_ATTACK"] = true
	foe["SKILL\51_ABL_HERO_HANDOSTILLOR_FIRSTAID"] = true
	foe["SKILL\51_ABL_HERO_JAKE_\50PS"] = true
	foe["SKILL\51_ABL_HERO_JAKE_\51PS"] = true
	foe["SKILL\51_ABL_HERO_JAKE_\52PS"] = true
	foe["SKILL\51_ITM_ANTIDOTE"] = true
	foe["SKILL\51_ITM_APPLE"] = true
	foe["SKILL\51_ITM_FLAMEORB"] = true
	foe["Desc"] = "Leader of the goblins\46\10Not smarter\44 only a bit stronger"
	foe["Image"] = "GFX\47Combat\47Fighters\47Foe\47Boss\47GobKing\46png"
	foe["Item Drop \49"] = "ITM_APPLE"
	foe["Item Drop \50"] = "ITM_FLAMEORB"
	foe["Item Steal \49"] = "ITM_ANTIDOTE"
	foe["Item Steal \50"] = "ITM_ANTIDOTE"
	foe["Item Steal \51"] = "ITM_ANTIDOTE"
	foe["Name"] = "Goblin King"
	foe["RATE_AAA_ATTACK"] = 100
	foe["RATE_ABL_HERO_HANDOSTILLOR_FIRSTAID"] = 0
	foe["RATE_ABL_HERO_JAKE_\50PS"] = 0
	foe["RATE_ABL_HERO_JAKE_\51PS"] = 0
	foe["RATE_ABL_HERO_JAKE_\52PS"] = 0
	foe["RATE_ITM_ANTIDOTE"] = 0
	foe["RATE_ITM_APPLE"] = 10
	foe["RATE_ITM_FLAMEORB"] = 0
	foe["TARGET_AAA_ATTACK"] = "Random"
	foe["TARGET_ABL_HERO_HANDOSTILLOR_FIRSTAID"] = "Random"
	foe["TARGET_ABL_HERO_JAKE_\50PS"] = "Random"
	foe["TARGET_ABL_HERO_JAKE_\51PS"] = "Random"
	foe["TARGET_ABL_HERO_JAKE_\52PS"] = "Random"
	foe["TARGET_ITM_ANTIDOTE"] = "Random"
	foe["TARGET_ITM_APPLE"] = "Random"
	foe["TARGET_ITM_FLAMEORB"] = "Random"
	foe["Boss"] = true
	foe["Oversoul"] = false
	foe["Oversoul Drop \49"] = false
	foe["Oversoul Drop \50"] = false
	foe["Oversoul Steal \49"] = false
	foe["Oversoul Steal \50"] = false
	foe["Oversoul Steal \51"] = false
	foe["Cash"] = 100
	foe["Rate Drop \49"] = 50
	foe["Rate Drop \50"] = 25
	foe["Rate Steal \49"] = 0
	foe["Rate Steal \50"] = 0
	foe["Rate Steal \51"] = 0
	foe["normal_Accuracy"] = 100
	foe["normal_Endurance"] = 14
	foe["normal_Evasion"] = 2
	foe["normal_HP"] = 100
	foe["normal_Intelligence"] = 1
	foe["normal_Power"] = 18
	foe["normal_Resistance"] = 5
	foe["normal_Speed"] = 7
	foe["oversoul_Accuracy"] = 100
	foe["oversoul_Endurance"] = 0
	foe["oversoul_Evasion"] = 0
	foe["oversoul_HP"] = 0
	foe["oversoul_Intelligence"] = 0
	foe["oversoul_Power"] = 0
	foe["oversoul_Resistance"] = 0
	foe["oversoul_Speed"] = 0


return foe


