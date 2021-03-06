--[[
  Fonts.lua
  Version: 17.07.05
  Copyright (C) 2016, 2017 2015
  
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



-----------------------------
-- Definition of all fonts --
-----------------------------


fonts = {

    -- BoxText = {"SuperSoulFighter.ttf",20} -- Font unreadable, but I'll keep this line in case nothing better comes my way
    Compass = {"Coolvetica.ttf",20},
    BoxTextContent = {"Coolvetica.ttf",20},
    BoxTextHeader= {'master_of_break.ttf',20},
    BestiaryHeader= {'master_of_break.ttf',20},
    Tutorial = {"Coolvetica.ttf",10},
    Stats = {"Monof55.ttf",20},
    FieldInfo = {"Coolvetica.ttf",35},
    FieldStat = {'Monof55.ttf',35},
    SaveGameLine = {"Coolvetica.ttf",25},
    StatusName = {"CoolVetica.ttf",45},
    StatusStat = {'Monof55.ttf',35},
    ItemName = {"Coolvetica.ttf",25},
    ItemAmm = {'Monof55.ttf',25},
    CombatName = {"master_of_break.ttf",50},
    Target = {'Monof55.ttf',20},
    CombatBigMessage = {'CoolVetica.TtF',45},
    CombatCharMessage = {'Monof55.ttf',20},
    PhanCombatBigMessage = {'Phantasar.ttf',45},
    SpellUnlockBox = {'CoolVetica.ttf',10},
    MiniMsg = {'Monof55.ttf',20},
    Lv1 = {'Monof55.ttf',15},
    Lv2 = {'Monof55.ttf',40},
    Quit = {"Coolvetica.ttf",20},
    MasterHeader = {'master_of_break.ttf',30},
    MasterContent = {"Coolvetica.ttf",20},
    ShopItem = {'Coolvetica.ttf',0},  -- Shop item and number are in size dependent on the screensize.
    ShopNumber = {'Monof55.ttf',0},
    WorldHeader = {'master_of_break.ttf',30},
    WorldItem = {'Coolvetica.ttf',0},  -- Variable size based on screensize
    Equip = {'Coolvetica.ttf',20},
    TradeCompare = {'Monof55.ttf',20},
    JoyConfig = {"Coolvetica.ttf",20},    
    AltInputHead = {"Coolvetica.ttf",60},
    AltInputInput = {'Monof55.ttf',50},
    AltInputKeys = {'Monof55.ttf',30},
    MastersList = {'Coolvetica.ttf',15}    ,
    OuttakesChar = {'master_of_break.ttf',50},
    OuttakesAct = {"Coolvetica.ttf",50}
    
    
}

fonts.BoxText = fonts.BoxTextContent


--------------------------------------
-- And the function to set the font --
--------------------------------------
function SetFont(font)
if not fonts[font] then CSay("WARNING! Font "..sval(font).." does not exist in the list!") end
if not fonts[font][1] then CSay("WARNING! Font "..sval(font).." does not refer to a file!") end
Image.Font("Fonts/"..fonts[font][1],fonts[font][2])
end

setfont = SetFont
