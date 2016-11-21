--[[
**********************************************
  
  Marrilona.lua
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
 
version: 16.11.20
]]

-- abl_hero_jake_2ps = {5},abl_hero_jake_3ps={25},abl_hero_jake_4ps={50},abl_hero_jake_berserk={10,5}

--[[
                   skill1 = "Wand Waving Wonders",
                   skill2 = "Fairy Fire Magic",
                   skill3 = "Fairy Wind Magic",
                   skill4 = "Fairy Water Magic",
                   skill5 = "Fairy Earth Magic",
]]

local r = {
                 ["1. Level 1"]  = { 
                                       abl_hero_marrilona_fire = {[2]=1},          --  1
                                       abl_hero_marrilona_speedup = {[3]=1},       --  2
                                       abl_hero_marrilona_heal = {[4]=1},          --  3
                                       abl_hero_marrilona_protect = {[5]=1},       --  4
                                       abl_hero_marrilona_rock = {[5]=7},          --  5
                                       abl_hero_marrilona_splash = {[4]=7},        --  6
                                       abl_hero_marrilona_zap = {[2]=5,[3]=5},     --  7
                                       abl_hero_marrilona_chill = {[3]=7, [4]=10}, --  8
                                       abl_hero_marrilona_empower = {[2]=25},      --  9
                                       abl_hero_marrilona_bio = { [5]=10, [4]=15}  -- 10                                                                              
                 },
          }
          
if fullveresion then -- That's right Marrilona will not get her level #2 and level #3 spells unless you have the full version of the game.          
   r["2. Level 2"] = {}
   r["3. Level 3"] = {}
end
             
return r
