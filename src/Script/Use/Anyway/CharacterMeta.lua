--[[
**********************************************
  
  CharacterMeta.lua
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
 
version: 16.09.29
]]
CharacterMeta = {

             Jake = {
                   sex = "Male",
                   pvnw = "He",
                   bvnw = "His",
                   avnw = "Him",
                   skill1 = "Sword Slashing Skills",
                   skill2 = "Fairy Fire Magic",
                   skill3 = "Fairy Wind Magic",
                   skill4 = "Fairy Water Magic",
                   skill5 = "Fairy Earth Magic",
                   askillup1 = {'Power',2},
                   askillup2 = {'Intelligence',1},
                   askillup3 = {'Speed',1},
                   askillup4 = {'HP',1},
                   askillup5 = {'Endurance',2}
             },
             Marrilona = {
                   sex = "Female",
                   pvnw = "See",
                   bvnw = "Her",
                   avnw = "Her",
                   skill1 = "Wand Waving Wonders",
                   skill2 = "Fairy Fire Magic",
                   skill3 = "Fairy Wind Magic",
                   skill4 = "Fairy Water Magic",
                   skill5 = "Fairy Earth Magic",
                   askillup1 = {'Intelligence',5},
                   askillup2 = {'Intelligence',2},
                   askillup3 = {'Speed',2},
                   askillup4 = {'HP',2},
                   askillup5 = {'Endurance',1}
             },
             Dandor = {
                   sex = "Male",
                   pvnw = "He",
                   bvnw = "His",
                   avnw = "Him",
                   skill1 = "Axe Chopping Abilities",
                   skill2 = "Physical Defense",
                   skill3 = "Magical Defense",
                   askillup1 = {'Power',5},
                   askillup2 = {'Endurance',2},
                   askillup3 = {'Resistance',2}
             },      
             HandoStillor = {
                   sex = "Male",
                   pvnw = "He",
                   bvnw = "His",
                   avnw = "Him",
                   skill1 = "Staff Slinging Skills",
                   skill2 = "Holy Powers",
                   askillup1 = {'Power',1},
                   askillup2 = {'Intelligence',2},
             },
             Krandar = {
                   sex = "Male",
                   pvnw = "He",
                   bvnw = "His",
                   avnw = "Him",
                   skill1 = "Sword Mastery",
                   skill2 = "Nero's Burning Combat",
                   skill3 = "Beaufort's Warth",
                   skill4 = "Pascal's Pressure",
                   skill5 = "Richter's Curse",
                   -- In Krandar's case this is just anti-crash prevention, as this should not play any role at all
                   askillup1 = {'Power',5},
                   askillup2 = {'Intelligence',2},
                   askillup3 = {'Speed',2},
                   askillup4 = {'HP',2},
                   askillup5 = {'Endurance',1}
             }                   
}

CharacterMeta.Jake_Human = CharacterMeta.Jake
CharacterMeta.Jake_Fairy = CharacterMeta.Jake


function SetSkill(exp,lvl,level)
   exp.Maximum = level * ({20,25,30})[skill]
   lvl.Maximum = skill * ({300,250,100})[skill]
   if level>=lvl.Maximum then exp.Maximum = 0 end
end
   
function CreateSkill(ch,num,level)
   if RPG.PointsExists(ch,"EXP_"..num)==1 then return end -- Don't create if we already have it.
   local exp = RPG.Points(ch,"SK_EXP_"..num,1)
   local lvl = RPG.Points(ch,"SK_LVL_"..num,1)
   SetSkill(exp,lvl,level)
end   

function SetChSkill(ch,level)
   if RPG.PointsExists(ch,"EXP_"..num)==0 then return end
   local exp = RPG.Points(ch,"SK_EXP_"..num)
   local lvl = RPG.Points(ch,"SK_LVL_"..num)
   Setskill(exp,lvl,level or lvl.Have)
end   

-- @IF IGNORE
return CharacterMeta
-- @FI
