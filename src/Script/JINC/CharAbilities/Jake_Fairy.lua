--[[
**********************************************
  
  Jake_Fairy.lua
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
 
version: 16.12.15
]]
local r = {
               ["1. Fairy Magic"] = {abl_hero_jake_shift_human={[2]=99,[3]=99,[4]=99,[5]=99},
                                     abl_hero_marrilona_fire = {[2]=1},          -- 2
                                     abl_hero_marrilona_speedup = {[3]=1},       -- 3
                                     abl_hero_marrilona_heal = {[4]=1},          -- 4                                     
                                     abl_hero_marrilona_protect = {[5]=1}                                     
                                    },
               ["2. Hybrid"] = "Jake_Human", -- This will cause Fairy Jake to "share" this list with human Jake, both in this list and in spell list.
               ["9. Skills"] = "Jake_Human"
}

return r
