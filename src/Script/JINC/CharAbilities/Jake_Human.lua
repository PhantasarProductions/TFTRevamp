--[[
**********************************************
  
  Jake_Human.lua
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
 
version: 17.08.02
]]

local fullversion = JCR6.Exists('ID/ID.Data.Full')==1
local skill = Sys.Val(Var.C("%SKILL"))
local newgameplus = Var.C("&NEWGAMEPLUS")=="TRUE"


local r = {
                 ["1. Sword"]  = {abl_hero_jake_2ps = {5},
                                  abl_hero_jake_3ps={20},
                                  abl_hero_jake_4ps={40},
                                  abl_hero_jake_cleave={9*skill,3,3,3,3},
                              --  abl_hero_jake_berserk={10,5},
                                  ABL_HERO_JAKE_SHIFT_FAIRY={[2]=99,[3]=99,[4]=99,[5]=99}},
                 ["2. Hybrid"] = {abl_hero_jake_healblade = {[1]=30,[4]=15,[5]=15},abl_foe_paradive={15,10,10},abl_hero_jake_flameblade={8,2*skill},
                                  abl_hero_jake_earthslice = {[1]=10+(skill^2),[5]=skill*15},abl_hero_jake_windstrike={[1]=27,[3]=23}}


          }
          
if not fullversion then r["1. Sword"].abl_hero_jake_berserk=nil end

if newgameplus then r["2. Hybrid"].abl_hero_jake_deathstrike = {skill*5,skill,skill,skill,skill} end
          
return r

