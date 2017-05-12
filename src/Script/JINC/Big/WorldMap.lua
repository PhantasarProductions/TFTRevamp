--[[
  WorldMap.lua
  Version: 17.05.12
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
-- This file has be generated by Tricky's MyData
-- 12 May 2017; 22:28:27



ret = {
	["ANNA"] = {
		["Dungeon"] = false,
		["Folder"] = "Delisto",
		["Kthura"] = "Anna",
		["Layer"] = "#001",
		["LocationName"] = "Anna's Temple",
		["LocationPrefix"] = "",
		["Start"] = "Start",
		["UnlockedFromStart"] = false},
	["CH1ALTAR"] = {
		["Dungeon"] = false,
		["Folder"] = "Delisto",
		["Kthura"] = "CH1_HUB_ALTAR",
		["Layer"] = "Altar",
		["LocationName"] = "Ancient Fairy Altar",
		["LocationPrefix"] = "",
		["Start"] = "Start",
		["UnlockedFromStart"] = false},
	["CH1FRENDOR"] = {
		["Dungeon"] = false,
		["Folder"] = "Delisto",
		["Kthura"] = "PRO_Town_Frendor",
		["Layer"] = "town",
		["LocationName"] = "Frendor",
		["LocationPrefix"] = "The Fairy Village of",
		["Start"] = "Start",
		["UnlockedFromStart"] = false},
	["CH1FRENDORBUSHES"] = {
		["Dungeon"] = true,
		["Folder"] = "Delisto",
		["Kthura"] = "CH1_Dungeon_FrendorBushes",
		["Layer"] = "FRENDORBUSHES",
		["LocationName"] = "Frendor Bushes",
		["LocationPrefix"] = "",
		["Start"] = "Start",
		["UnlockedFromStart"] = true},
	["CH1HELL"] = {
		["Dungeon"] = true,
		["Folder"] = "Delisto",
		["Kthura"] = "CH1_Dungeon_Hell",
		["Layer"] = "#001",
		["LocationName"] = "Road to Hell",
		["LocationPrefix"] = "The",
		["Start"] = "Start",
		["UnlockedFromStart"] = false},
	["CH1HOLY"] = {
		["Dungeon"] = true,
		["Folder"] = "Delisto",
		["Kthura"] = "CH1_Dungeon_HolyPath",
		["Layer"] = "Bos",
		["LocationName"] = "Holy Path",
		["LocationPrefix"] = "",
		["Start"] = "Start",
		["UnlockedFromStart"] = true},
	["CH1JAKE"] = {
		["Dungeon"] = false,
		["Folder"] = "Delisto",
		["Kthura"] = "CH1_HUB_JakeHut",
		["Layer"] = "Exterior",
		["LocationName"] = "Jake's Hut",
		["LocationPrefix"] = "",
		["Start"] = "Start",
		["UnlockedFromStart"] = true},
	["CH1LIBRARY"] = {
		["Dungeon"] = true,
		["Folder"] = "Delisto",
		["Kthura"] = "CH1_Dungeon_Library",
		["Layer"] = "#001",
		["LocationName"] = "Forbidden Library",
		["LocationPrefix"] = "The",
		["Start"] = "Start",
		["UnlockedFromStart"] = false},
	["CH2DOUBLINE"] = {
		["Dungeon"] = false,
		["Folder"] = "Delisto",
		["Kthura"] = "CH2_Town_Doubline",
		["Layer"] = "city",
		["LocationName"] = "Doubline",
		["LocationPrefix"] = "The Human Village of",
		["Start"] = "Start",
		["UnlockedFromStart"] = false},
	["CH2DOUBLINEBAY"] = {
		["Dungeon"] = true,
		["Folder"] = "Delisto",
		["Kthura"] = "ch2_Dungeon_DoublineBayForest",
		["Layer"] = "forest",
		["LocationName"] = "Doubline Bay Forest",
		["LocationPrefix"] = "",
		["Start"] = "Start",
		["UnlockedFromStart"] = false},
	["CH2DRAGONCASTLE"] = {
		["Dungeon"] = true,
		["Folder"] = "Delisto",
		["Kthura"] = "CH2_Dungeon_DragonCastle",
		["Layer"] = "#000",
		["LocationName"] = "Dragon Castle",
		["LocationPrefix"] = "",
		["Start"] = "Start",
		["UnlockedFromStart"] = false},
	["CH2DRESHKA"] = {
		["Dungeon"] = false,
		["Folder"] = "Delisto",
		["Kthura"] = "CH2_Town_Dreshka",
		["Layer"] = "entry",
		["LocationName"] = "Dreshka",
		["LocationPrefix"] = "The Fairy Village of",
		["Start"] = "Start",
		["UnlockedFromStart"] = false},
	["CH2ELFROAD"] = {
		["Dungeon"] = true,
		["Folder"] = "Delisto",
		["Kthura"] = "CH2_DUNGEON_ElfRoad",
		["Layer"] = "#001",
		["LocationName"] = "Elven Road",
		["LocationPrefix"] = "The",
		["Start"] = "Start",
		["UnlockedFromStart"] = false},
	["CH2FIRESPIRATA"] = {
		["Dungeon"] = true,
		["Folder"] = "Delisto",
		["Kthura"] = "CH2_Dungeon_SpirataFire",
		["Layer"] = "#000",
		["LocationName"] = "Bandafir's temple",
		["LocationPrefix"] = "",
		["Start"] = "Start",
		["UnlockedFromStart"] = false},
	["CH2ISKARDERIU"] = {
		["Dungeon"] = false,
		["Folder"] = "Delisto",
		["Kthura"] = "CH2_Town_Iskarderiu",
		["Layer"] = "town",
		["LocationName"] = "Iskarderiu",
		["LocationPrefix"] = "The Elfish City of",
		["Start"] = "Start",
		["UnlockedFromStart"] = false},
	["CH2VANDAR"] = {
		["Dungeon"] = false,
		["Folder"] = "Delisto",
		["Kthura"] = "PRO_Town_Vandar",
		["Layer"] = "town",
		["LocationName"] = "Vandar",
		["LocationPrefix"] = "The Human Village of",
		["Start"] = "Start",
		["UnlockedFromStart"] = false},
	["CH2VANDARROAD"] = {
		["Dungeon"] = true,
		["Folder"] = "Delisto",
		["Kthura"] = "CH2_Dungeon_VandarRoad",
		["Layer"] = "road",
		["LocationName"] = "Vandar Road",
		["LocationPrefix"] = "",
		["Start"] = "Start",
		["UnlockedFromStart"] = false},
	["CH2WATERSPIRATA"] = {
		["Dungeon"] = true,
		["Folder"] = "Delisto",
		["Kthura"] = "CH2_Dungeon_SpirataWater",
		["Layer"] = "#000",
		["LocationName"] = "Bandafar's Temple",
		["LocationPrefix"] = "",
		["Start"] = "Start",
		["UnlockedFromStart"] = false},
	["CH2WENIARIA"] = {
		["Dungeon"] = false,
		["Folder"] = "Delisto",
		["Kthura"] = "PRO_Hub_Weniaria",
		["Layer"] = "lobby",
		["LocationName"] = "Weniaria's Temple",
		["LocationPrefix"] = "",
		["Start"] = "Start",
		["UnlockedFromStart"] = false},
	["CH2WINDSPIRATA"] = {
		["Dungeon"] = true,
		["Folder"] = "Delisto",
		["Kthura"] = "CH2_Dungeon_SpirataWind",
		["Layer"] = "#000",
		["LocationName"] = "Bandafor's temple",
		["LocationPrefix"] = "",
		["Start"] = "Start",
		["UnlockedFromStart"] = false},
	["CH3FRENDORGRAVE"] = {
		["Dungeon"] = false,
		["Folder"] = "Delisto",
		["Kthura"] = "CH3_Hub_FrendorGrave",
		["Layer"] = "#001",
		["LocationName"] = "Frendor's Grave",
		["LocationPrefix"] = "",
		["Start"] = "Graf",
		["UnlockedFromStart"] = false},
	["CH3GROMBO"] = {
		["Dungeon"] = false,
		["Folder"] = "Delisto",
		["Kthura"] = "CH3_Town_Grombo",
		["Layer"] = "town",
		["LocationName"] = "Grombo",
		["LocationPrefix"] = "The Dwarven city of",
		["Start"] = "Start",
		["UnlockedFromStart"] = false},
	["CH3KOKOFOREST"] = {
		["Dungeon"] = true,
		["Folder"] = "Kokonora",
		["Kthura"] = "CH3_Dungeon_KokonoraForest",
		["Layer"] = "forest",
		["LocationName"] = "Kokonora Forest",
		["LocationPrefix"] = "",
		["Start"] = "Start",
		["UnlockedFromStart"] = true},
	["CH3KOKOFORESTSTRAND"] = {
		["Dungeon"] = false,
		["Folder"] = "Kokonora",
		["Kthura"] = "CH3_Dungeon_KokonoraForest",
		["Layer"] = "fisherman",
		["LocationName"] = "Kokonora Forest - Fisherman",
		["LocationPrefix"] = "",
		["Start"] = "Start",
		["UnlockedFromStart"] = true},
	["CH3MINE"] = {
		["Dungeon"] = true,
		["Folder"] = "Delisto",
		["Kthura"] = "CH3_Dungeon_Mine",
		["Layer"] = "#001",
		["LocationName"] = "Abandoned Mine",
		["LocationPrefix"] = "The",
		["Start"] = "Start",
		["UnlockedFromStart"] = false},
	["CH3NOSTRABURG"] = {
		["Dungeon"] = false,
		["Folder"] = "Kokonora",
		["Kthura"] = "CH3_Town_Nostraburg",
		["Layer"] = "town",
		["LocationName"] = "Nostraburg",
		["LocationPrefix"] = "The Black Winged Fairy City Of",
		["Start"] = "Start",
		["UnlockedFromStart"] = false},
	["CH3PYRUS"] = {
		["Dungeon"] = true,
		["Folder"] = "Delisto",
		["Kthura"] = "CH3_Dungeon_MTPYRUS",
		["Layer"] = "#000",
		["LocationName"] = "Mt. Pyrus",
		["LocationPrefix"] = "",
		["Start"] = "Start",
		["UnlockedFromStart"] = false},
	["CH3SPIRATAEARTH"] = {
		["Dungeon"] = true,
		["Folder"] = "Kokonora",
		["Kthura"] = "CH3_Dungeon_SpirataEarth",
		["Layer"] = "#000",
		["LocationName"] = "Bandafer's Temple",
		["LocationPrefix"] = "",
		["Start"] = "Start",
		["UnlockedFromStart"] = false},
	["CH4MANAROAD"] = {
		["Dungeon"] = true,
		["Folder"] = "Kokonora",
		["Kthura"] = "Anna",
		["Layer"] = "#001",
		["LocationName"] = "Mana Road",
		["LocationPrefix"] = "The",
		["Start"] = "Start",
		["UnlockedFromStart"] = false},
	["CH4PYRUSPASS"] = {
		["Dungeon"] = true,
		["Folder"] = "Delisto",
		["Kthura"] = "CH4_Dungeon_PyrusPass",
		["Layer"] = "#000",
		["LocationName"] = "Pyrus Pass",
		["LocationPrefix"] = "",
		["Start"] = "Start",
		["UnlockedFromStart"] = false}}



-- Got all data, let's now return it!
return ret
