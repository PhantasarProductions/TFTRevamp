--[[
**********************************************
  
  Krandar.lua
  (c) Jeroen Broks, 2016, 2017, All Rights Reserved.
  
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
 
version: 17.04.29
]]

local fullversion = JCR6.Exists('ID/ID.Data.Full')==1
local skill = Sys.Val(Var.C("%SKILL"))



local ret = { ['1. Physical']={
                                     abl_hero_jake_2ps = {5},
                                     abl_hero_jake_3ps={20},
                                     abl_hero_jake_4ps={40},
                                     abl_hero_jake_berserk={10,5},
                                     --ABL_HERO_JAKE_SHIFT_FAIRY={[2]=99,[3]=99,[4]=99,[5]=99},
                                     Abl_master_krandar_5ps={10},
                                     abl_master_krandar_6ps={10,10},
                                     abl_master_krandar_7ps={10,10,10},
                                     abl_hero_jake_healblade = {[1]=30,[4]=15,[5]=15},
                                     abl_foe_paradive={15,10,10},
                                     abl_hero_jake_flameblade={8,2*skill}
                              },
              ['2. Magical']={
                                     ABL_HERO_JAKE_SHIFT_HUMAN={[2]=99,[3]=99,[4]=99,[5]=99},
                                     abl_hero_marrilona_flame = {[2]=1},          -- 2
                                     abl_hero_marrilona_speedup = {[3]=1},       -- 3
                                     abl_hero_marrilona_heal = {[4]=1},          -- 4                                     
                                     abl_hero_marrilona_protect = {[5]=1}  ,
                                     abl_hero_handostillor_cleanse = {1,2,3,4},
                                     abl_hero_marrilona_inferno = {4},
                                     abl_hero_marrilona_quake = {8},
                                     abl_hero_marrilona_iceblast = {1},
                                     abl_hero_marrilona_fireblast = {20},
                                     abl_hero_marrilona_tsunami = {1},
                                     abl_hero_marrilona_hurricane = {40}
                               },
              ["9. Skills"]="Marrilona" }

return ret
