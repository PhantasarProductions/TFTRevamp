--[[
  ZombieShopHoerStock.lua
  Version: 17.07.31
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
local ret = {}
	ret[#ret+1] = { itemtag = "WAND_WIND", Title = "Wind Wand", Price = 250 }
	ret[#ret+1] = { itemtag = "EQP_ACC_RINGWIND", Title = "Ring \"Elf\"", Price = 125000 }
	ret[#ret+1] = { itemtag = "ITM_APPLES", Title = "Apples", Price = 250 }
	ret[#ret+1] = { itemtag = "ITM_CARROT", Title = "Carrot", Price = 1200 }
	ret[#ret+1] = { itemtag = "EQP_HANDOSTILLOR_AR8", Title = "Mythril Shirt with diamonds", Price = 14336 }
	ret[#ret+1] = { itemtag = "EQP_HANDOSTILLOR_AR9", Title = "Holy robes", Price = 28672 }
	ret[#ret+1] = { itemtag = "EQP_HANDOSTILLOR_AR4", Title = "Priest's shirt", Price = 896 }
	ret[#ret+1] = { itemtag = "EQP_HANDOSTILLOR_AR5", Title = "Holy vest", Price = 1792 }
	ret[#ret+1] = { itemtag = "EQP_HANDOSTILLOR_AR6", Title = "Mythril Shirt", Price = 3584 }
	ret[#ret+1] = { itemtag = "EQP_HANDOSTILLOR_AR7", Title = "Mythril Shirt +", Price = 7168 }
	ret[#ret+1] = { itemtag = "EQP_HANDOSTILLOR_AR1", Title = "Shirt", Price = 112 }
	ret[#ret+1] = { itemtag = "EQP_HANDOSTILLOR_AR2", Title = "Holy shirt", Price = 224 }
	ret[#ret+1] = { itemtag = "EQP_HANDOSTILLOR_AR3", Title = "Green shirt", Price = 448 }
	ret[#ret+1] = { itemtag = "EQP_JEWEL_ONYX", Title = "Onyx", Price = 6000 }
	ret[#ret+1] = { itemtag = "ITM_CARROTS", Title = "Carrots", Price = 1200 }
	ret[#ret+1] = { itemtag = "WAND_II_SAINT", Title = "Saint's Wand", Price = 123000 }
	ret[#ret+1] = { itemtag = "ITM_MJOLNIR", Title = "Mj<ouml>lnir", Price = 25000 }
	ret[#ret+1] = { itemtag = "ITM_MEDICINE", Title = "Medicine", Price = 50 }
	ret[#ret+1] = { itemtag = "ITM_JUSDORANGE", Title = "Jus d'orange", Price = 1200 }
	ret[#ret+1] = { itemtag = "ITM_HELLSTONE", Title = "Hell Stone", Price = 25000 }
	ret[#ret+1] = { itemtag = "WAND_FROST", Title = "Frost Wand", Price = 250 }
	ret[#ret+1] = { itemtag = "ITM_CURSEDSPORES", Title = "Cursed Spores", Price = 500 }
	ret[#ret+1] = { itemtag = "ITM_FLAMEORB", Title = "Flame Orb", Price = 50 }
	ret[#ret+1] = { itemtag = "ITM_PANACEA", Title = "Panacea", Price = 5000 }
	ret[#ret+1] = { itemtag = "EQP_JEWEL_SMALLRUBY", Title = "Ruby", Price = 6000 }
	ret[#ret+1] = { itemtag = "WAND_FLAME", Title = "Flame Wand", Price = 250 }
	ret[#ret+1] = { itemtag = "ITM_INFERNOORB", Title = "Inferno Orb", Price = 2000 }
	ret[#ret+1] = { itemtag = "WAND_THUNDER", Title = "Thunder Wand", Price = 250 }
	ret[#ret+1] = { itemtag = "WAND_II_VOLCANOWAND", Title = "Volcano Wand", Price = 123000 }
	ret[#ret+1] = { itemtag = "ITM_MEDICINES", Title = "Medicines", Price = 50 }
	ret[#ret+1] = { itemtag = "ITM_HEALSHOWER", Title = "Healing Shower", Price = 1000 }
	ret[#ret+1] = { itemtag = "EQP_DANDOR_WP10", Title = "Ruining Axe", Price = 1024000 }
	ret[#ret+1] = { itemtag = "ITM_ICICLE", Title = "Icicle", Price = 250 }
	ret[#ret+1] = { itemtag = "EQP_DANDOR_WP9", Title = "Extreme Axe", Price = 512000 }
	ret[#ret+1] = { itemtag = "WAND_GAIA", Title = "Gaia Wand", Price = 250 }
	ret[#ret+1] = { itemtag = "EQP_HANDOSTILLOR_WP10", Title = "Death Staff", Price = 153600 }
	ret[#ret+1] = { itemtag = "ITM_SLEEPHERB", Title = "Sleep Herb", Price = 150 }
	ret[#ret+1] = { itemtag = "EQP_ACC_RINGWENIARIA", Title = "Weniaria's Ring", Price = 950000 }
	ret[#ret+1] = { itemtag = "ITM_ANTIDOTES", Title = "Antidotes", Price = 50 }
	ret[#ret+1] = { itemtag = "EQP_JEWEL_SMALLTOPAZ", Title = "Small Topaz", Price = 2500 }
	ret[#ret+1] = { itemtag = "ITM_HOLYWATER", Title = "Holy Water", Price = 1500 }
	ret[#ret+1] = { itemtag = "ITM_WIZARDDUST", Title = "Wizard's Dust", Price = 500 }
	ret[#ret+1] = { itemtag = "EQP_ACC_TITANBELT", Title = "Titan Belt", Price = 5000 }
	ret[#ret+1] = { itemtag = "ITM_BANANA", Title = "Banana", Price = 250000 }
	ret[#ret+1] = { itemtag = "EQP_JAKE_WP10", Title = "Granasaber", Price = 128000 }
	ret[#ret+1] = { itemtag = "ITM_SALVES", Title = "Salves", Price = 1200 }
	ret[#ret+1] = { itemtag = "EQP_JEWEL_RUBY", Title = "Ruby", Price = 6000 }
	ret[#ret+1] = { itemtag = "EQP_ACC_NOTNAMED", Title = "The Ring Which Shall Not Be Named", Price = 50000 }
	ret[#ret+1] = { itemtag = "EQP_ACC_WIZARDRING", Title = "Ring of wizardry", Price = 1000000 }
	ret[#ret+1] = { itemtag = "ITM_POTION", Title = "Potion", Price = 3000 }
	ret[#ret+1] = { itemtag = "ITM_POCKETTSUNAMI", Title = "Pocket Tsunami", Price = 8000 }
	ret[#ret+1] = { itemtag = "ITM_HEALINGHERB", Title = "Healing Herb", Price = 1750 }
	ret[#ret+1] = { itemtag = "EQP_MARRILONA_AR3", Title = "Cotton Dress", Price = 500 }
	ret[#ret+1] = { itemtag = "EQP_ACC_RINGFIRE", Title = "Ring \"Hum\"", Price = 125000 }
	ret[#ret+1] = { itemtag = "ITM_VOLTABALL", Title = "Voltaball", Price = 250 }
	ret[#ret+1] = { itemtag = "EQP_JEWEL_SMALLEMERALD", Title = "Small Emerald", Price = 2500 }
	ret[#ret+1] = { itemtag = "EQP_JEWEL_GARNET", Title = "Garnet", Price = 2500 }
	ret[#ret+1] = { itemtag = "EQP_HANDOSTILLOR_WP3", Title = "Black Staff", Price = 1200 }
	ret[#ret+1] = { itemtag = "ITM_PHOENIX", Title = "Phoenix", Price = 100 }
	ret[#ret+1] = { itemtag = "EQP_JEWEL_SAPPHIRE", Title = "Sapphire", Price = 6000 }
	ret[#ret+1] = { itemtag = "WAND_HOLY", Title = "Holy Wand", Price = 250 }
	ret[#ret+1] = { itemtag = "ITM_MANDRAKES", Title = "Mandrakes", Price = 1000 }
	ret[#ret+1] = { itemtag = "EQP_ACC_RINGWATER", Title = "Ring \"Fe\"", Price = 125000 }
	ret[#ret+1] = { itemtag = "EQP_ACC_RINGEARTH", Title = "Ring \"Nano\"", Price = 125000 }
	ret[#ret+1] = { itemtag = "WAND_BIO", Title = "Bio Wand", Price = 500 }
	ret[#ret+1] = { itemtag = "ITM_POTIONVITALITY", Title = "Potion of Vitality", Price = 1200 }
	ret[#ret+1] = { itemtag = "ITM_APPLE", Title = "Apple", Price = 25 }
	ret[#ret+1] = { itemtag = "EQP_ACC_AMULETLIFE", Title = "Amulet of life", Price = 800000 }
	ret[#ret+1] = { itemtag = "ITM_ROCK", Title = "Rock", Price = 500 }
	ret[#ret+1] = { itemtag = "EQP_JEWEL_AMETHYST", Title = "Amethyst", Price = 6000 }
	ret[#ret+1] = { itemtag = "EQP_JAKE_AR4", Title = "Leather Armor \"Sunshine\"", Price = 800 }
	ret[#ret+1] = { itemtag = "ITM_BELL", Title = "Bell", Price = 10 }
	ret[#ret+1] = { itemtag = "ITM_MANDRAKE", Title = "Mandrake", Price = 100 }
	ret[#ret+1] = { itemtag = "EQP_JEWEL_TOPAZ", Title = "Topaz", Price = 6000 }
	ret[#ret+1] = { itemtag = "ITM_DRAGONFIRE", Title = "Bottled Dragonfire", Price = 500000 }
	ret[#ret+1] = { itemtag = "EQP_HANDOSTILLOR_WP9", Title = "Killer Staff", Price = 76800 }
	ret[#ret+1] = { itemtag = "EQP_HANDOSTILLOR_WP4", Title = "Steel staff", Price = 2400 }
	ret[#ret+1] = { itemtag = "EQP_HANDOSTILLOR_WP5", Title = "Saint's staff", Price = 4800 }
	ret[#ret+1] = { itemtag = "EQP_HANDOSTILLOR_WP6", Title = "Mythril Staff", Price = 9600 }
	ret[#ret+1] = { itemtag = "EQP_HANDOSTILLOR_WP7", Title = "Diamond Staff", Price = 19200 }
	ret[#ret+1] = { itemtag = "EQP_HANDOSTILLOR_WP1", Title = "Staff", Price = 300 }
	ret[#ret+1] = { itemtag = "EQP_HANDOSTILLOR_WP2", Title = "Long staff", Price = 600 }
	ret[#ret+1] = { itemtag = "ITM_ICICLES", Title = "Icicles", Price = 2500 }
	ret[#ret+1] = { itemtag = "ITM_STORMBOTTLE", Title = "Storm in a bottle", Price = 175 }
	ret[#ret+1] = { itemtag = "EQP_HANDOSTILLOR_AR10", Title = "Robe blessed by Weniaria", Price = 57344 }
	ret[#ret+1] = { itemtag = "EQP_ACC_THIEFCLOAK", Title = "Thief's cloak", Price = 12000 }
	ret[#ret+1] = { itemtag = "EQP_MARRILONA_AR10", Title = "Soft dress", Price = 64000 }
	ret[#ret+1] = { itemtag = "WAND_II_EVIL", Title = "Evil Wand", Price = 123000 }
	ret[#ret+1] = { itemtag = "EQP_JEWEL_SMALLGARNET", Title = "Small Garnet", Price = 2500 }
	ret[#ret+1] = { itemtag = "WAND_II_SPRINGTIJ", Title = "Springtij Wand", Price = 123000 }
	ret[#ret+1] = { itemtag = "ITM_WATERBUBBLE", Title = "Water Bubble", Price = 100 }
	ret[#ret+1] = { itemtag = "ITM_ANTIDOTE", Title = "Antidote", Price = 50 }
	ret[#ret+1] = { itemtag = "ITM_PURIFICATIONSHOWER", Title = "Purification Shower", Price = 2500 }
	ret[#ret+1] = { itemtag = "EQP_JEWEL_AQUAMARINE", Title = "Aquamarine", Price = 20000 }
	ret[#ret+1] = { itemtag = "ITM_MIRROR", Title = "Mirror", Price = 50000 }
	ret[#ret+1] = { itemtag = "ITM_STONE", Title = "Stone", Price = 100 }
	ret[#ret+1] = { itemtag = "ITM_VIRUSBOMB", Title = "Virus Bomb", Price = 250 }
	ret[#ret+1] = { itemtag = "ITM_SALVE", Title = "Salve", Price = 120 }
	ret[#ret+1] = { itemtag = "ITM_FLAMEORBS", Title = "Fire Orbs", Price = 2500 }
	ret[#ret+1] = { itemtag = "EQP_ACC_RINGSKILL", Title = "Ring of skills", Price = 200000 }
	ret[#ret+1] = { itemtag = "EQP_JEWEL_JADE", Title = "Jade", Price = 800 }
	ret[#ret+1] = { itemtag = "EQP_JAKE_AR1", Title = "Leather Armor", Price = 100 }
	ret[#ret+1] = { itemtag = "EQP_JAKE_AR2", Title = "Goblin Armor", Price = 200 }
	ret[#ret+1] = { itemtag = "EQP_JAKE_AR3", Title = "Leather plate", Price = 400 }
	ret[#ret+1] = { itemtag = "EQP_JAKE_AR5", Title = "Brown Armor", Price = 1600 }
	ret[#ret+1] = { itemtag = "EQP_JAKE_AR6", Title = "Manticoreskin Armor", Price = 3200 }
	ret[#ret+1] = { itemtag = "EQP_JAKE_AR7", Title = "Eye of the Beholder", Price = 6400 }
	ret[#ret+1] = { itemtag = "EQP_JAKE_AR8", Title = "Mythril Armor", Price = 12800 }
	ret[#ret+1] = { itemtag = "EQP_JAKE_AR9", Title = "Mythril Armor with diamond coating", Price = 25600 }
	ret[#ret+1] = { itemtag = "ITM_HOLYORB", Title = "Holy Orb", Price = 2500 }
	ret[#ret+1] = { itemtag = "WAND_II_WATT", Title = "Wattwand", Price = 246000 }
	ret[#ret+1] = { itemtag = "ITM_HOLYSCROLL", Title = "Holy Scroll", Price = 50 }
	ret[#ret+1] = { itemtag = "EQP_JAKE_WP8", Title = "Lady Justice", Price = 32000 }
	ret[#ret+1] = { itemtag = "EQP_JAKE_WP9", Title = "Spirit Sword", Price = 64000 }
	ret[#ret+1] = { itemtag = "EQP_JAKE_WP1", Title = "Short Sword", Price = 250 }
	ret[#ret+1] = { itemtag = "ITM_POISONDART", Title = "Poison Dart", Price = 250 }
	ret[#ret+1] = { itemtag = "EQP_JAKE_WP3", Title = "Long Sword", Price = 1000 }
	ret[#ret+1] = { itemtag = "EQP_JAKE_WP4", Title = "Claymore", Price = 2000 }
	ret[#ret+1] = { itemtag = "EQP_JAKE_WP5", Title = "Frostbite", Price = 4000 }
	ret[#ret+1] = { itemtag = "EQP_JAKE_WP6", Title = "Great Sword", Price = 8000 }
	ret[#ret+1] = { itemtag = "EQP_JAKE_WP7", Title = "Amazone", Price = 16000 }
	ret[#ret+1] = { itemtag = "WAND_DARK", Title = "Evil Wand", Price = 250 }
	ret[#ret+1] = { itemtag = "WAND_SPLASH", Title = "Splash Wand", Price = 250 }
	ret[#ret+1] = { itemtag = "ITM_MUTTON", Title = "Mutton", Price = 500 }
	ret[#ret+1] = { itemtag = "EQP_ACC_RINGTYRANT", Title = "Ring of the tyrant", Price = 150000 }
	ret[#ret+1] = { itemtag = "WAND_II_GAIA", Title = "Great Gaia Wand", Price = 123000 }
	ret[#ret+1] = { itemtag = "EQP_JAKE_WP2", Title = "Rapier \"Needle\"", Price = 500 }
	ret[#ret+1] = { itemtag = "ITM_UBERPOTION", Title = "UberPotion", Price = 300 }
	ret[#ret+1] = { itemtag = "EQP_JEWEL_EMERALD", Title = "Emerald", Price = 6000 }
	ret[#ret+1] = { itemtag = "EQP_DANDOR_WP8", Title = "Titanium Axe", Price = 256000 }
	ret[#ret+1] = { itemtag = "EQP_DANDOR_WP5", Title = "Grand Axe", Price = 32000 }
	ret[#ret+1] = { itemtag = "EQP_DANDOR_WP4", Title = "Great Axe", Price = 16000 }
	ret[#ret+1] = { itemtag = "EQP_DANDOR_WP7", Title = "Platinum Axe", Price = 128000 }
	ret[#ret+1] = { itemtag = "EQP_DANDOR_WP6", Title = "Andmi Ax", Price = 64000 }
	ret[#ret+1] = { itemtag = "EQP_DANDOR_WP3", Title = "Big axe", Price = 8000 }
	ret[#ret+1] = { itemtag = "EQP_DANDOR_WP2", Title = "Battleax", Price = 4000 }
	ret[#ret+1] = { itemtag = "ITM_BANANAS", Title = "Bananas", Price = 25000000 }
	ret[#ret+1] = { itemtag = "ITM_ANABOLINEA", Title = "Anabolinia", Price = 1000000 }
	ret[#ret+1] = { itemtag = "ITM_DAMNEDDUST", Title = "Damned Dust", Price = 125 }
	ret[#ret+1] = { itemtag = "ITM_MULTIPHOENIX", Title = "Multi Phoenix", Price = 1000 }
	ret[#ret+1] = { itemtag = "ITM_VOICEHERB", Title = "Voice Herb", Price = 50 }
	ret[#ret+1] = { itemtag = "ITM_TRUMPCARD", Title = "Trump Card", Price = 666 }
	ret[#ret+1] = { itemtag = "EQP_HANDOSTILLOR_WP8", Title = "Diamond staff with mythril coating", Price = 38400 }
	ret[#ret+1] = { itemtag = "ITM_MAGICDUST", Title = "Magic Dust", Price = 50 }
	ret[#ret+1] = { itemtag = "EQP_JAKE_AR10", Title = "Flash Armor", Price = 51200 }
	ret[#ret+1] = { itemtag = "ITM_AMBROSIA", Title = "Ambrosia", Price = 100000 }
	ret[#ret+1] = { itemtag = "ITM_PURELITERATURE", Title = "Pure Literature", Price = 200 }
	ret[#ret+1] = { itemtag = "ITM_SPIKEBOMB", Title = "Spike Bomb", Price = 40000 }
	ret[#ret+1] = { itemtag = "EQP_MARRILONA_AR9", Title = "Green Dress with Mythril Threads", Price = 32000 }
	ret[#ret+1] = { itemtag = "EQP_MARRILONA_AR8", Title = "White Dress", Price = 16000 }
	ret[#ret+1] = { itemtag = "EQP_MARRILONA_AR7", Title = "Hiss Dress", Price = 8000 }
	ret[#ret+1] = { itemtag = "EQP_MARRILONA_AR6", Title = "Expensive Dress", Price = 4000 }
	ret[#ret+1] = { itemtag = "EQP_MARRILONA_AR5", Title = "Fashionable Dress", Price = 2000 }
	ret[#ret+1] = { itemtag = "EQP_MARRILONA_AR4", Title = "Sexy Dress", Price = 1000 }
	ret[#ret+1] = { itemtag = "ITM_EEL", Title = "Eel", Price = 100 }
	ret[#ret+1] = { itemtag = "EQP_MARRILONA_AR2", Title = "Green Dress", Price = 250 }
	ret[#ret+1] = { itemtag = "EQP_MARRILONA_AR1", Title = "Simple dress", Price = 125 }
	ret[#ret+1] = { itemtag = "WAND_II_KELVIN", Title = "Kelvin's Wand", Price = 123000 }
	ret[#ret+1] = { itemtag = "ITM_POTIONS", Title = "Potions", Price = 30000 }
	ret[#ret+1] = { itemtag = "EQP_DANDOR_WP1", Title = "Axe", Price = 2000 }
	ret[#ret+1] = { itemtag = "WAND_II_HURRICANE", Title = "Hurricane Wand", Price = 123000 }
	ret[#ret+1] = { itemtag = "ITM_DEATHCUBE", Title = "Death Cube", Price = 750 }
return ret
