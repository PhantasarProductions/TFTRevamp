--[[
**********************************************
  
  HandoStillor.lua
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
 
version: 17.03.18
]]

local fullversion = JCR6.Exists('ID/ID.Data.Full')==1
local skill = Sys.Val(Var.C('%SKILL'))

local r = {
                 ["1. Level 1"]  = {
                         abl_hero_handostillor_firstaid = { [2] = 1 },           -- 1
                         abl_hero_handostillor_neutralizepoison = { [2] = 7 },   -- 2
                         abl_hero_handostillor_removeparalysis = { [2] = 9 },    -- 3
                         abl_hero_handostillor_stickswing = { 20 },              -- 4
                         abl_hero_handostillor_recover = { [2] = 12 },           -- 5
                         abl_hero_handostillor_curedisease = { [2]=14 },         -- 6
                         abl_hero_handostillor_holystrike = { 20,20 }   ,        -- 7
                         abl_hero_handostillor_vitalize = { [2] = 25 }   ,       -- 8
                         abl_hero_handostillor_removeparalysis = { [2] = 16 },   -- 9
                         abl_hero_handostillor_purify = { [2] = 65 }             -- 10
                         
                 },
          }
          
if fullversion then -- That's right Hando Stillor will not get his level #2 and level #3 spells unless you have the full version of the game.          
   r["2. Level 2"] = { abl_hero_handostillor_cleanse = { [2]=3*skill }, --1 
                       abl_hero_handostillor_treatment = { [2]=(2^skill)+skill }, -- 2
                       abl_hero_handostillor_goodmorning = {[2]=5*skill}, -- 3
                       abl_hero_handostillor_revive = {[2] = 12*skill } -- 4
                     }  
   r["3. Level 3"] = { abl_hero_handostillor_pray = { 5*skill, math.ceil(3^skill) }, -- 1
                       abl_hero_handostillor_smite = {(skill^skill)+(2*skill)}                   -- 2
                     }
end

if skill~=3 then r["3. Level 3"].abl_hero_handostillor_resurrect = { [2] = ({20,50})[skill]} end -- 3
             
return r
