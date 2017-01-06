--[[
**********************************************
  
  CharacterMeta.lua
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
 
version: 17.01.06
]]
CharacterMeta = {

             Jake = {
                   race = "Human",
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
                   race = "Fairy",
                   sex = "Female",
                   pvnw = "She",
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
                   race = "Dwarf",
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
                   race = "Elf",
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
                   race = "Black Winged Fairy",
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
   lvl.Have = level or 1
   lvl.Minimum = 1
end
   
function CreateSkill(ch,num,level)
   if RPG.PointsExists(ch,"SK_EXP_"..num)==1 then return false end -- Don't create if we already have it.
   local exp = RPG.Points(ch,"SK_EXP_"..num,1)
   local lvl = RPG.Points(ch,"SK_LVL_"..num,1)
   SetSkill(exp,lvl,level)
   return true
end   

function SetChSkill(ch,num,level)
   -- if RPG.PointsExists(ch,"EXP_"..num)==1 then return end
   local exp = RPG.Points(ch,"SK_EXP_"..num)
   local lvl = RPG.Points(ch,"SK_LVL_"..num)
   SetSkill(exp,lvl,level or lvl.Have)
end   

function IncSkill(ch,num,points)
   CSay(ch.." gets "..points.." points in skill #"..num)
   RPG.Points(ch,"SK_EXP_"..num).Inc(points)
   if RPG.Points(ch,"SK_EXP_"..num).Have>= RPG.Points(ch,"SK_EXP_"..num).Maximum and RPG.Points(ch,"SK_EXP_"..num).Maximum>0 then
      SetChSkill(ch,num,RPG.Points(ch,"SK_LVL_"..num).Have+1)
      RPG.Points(ch,"SK_EXP_"..num).Have=0
      if RPG.Points(ch,"SK_LVL_"..num).Have==RPG.Points(ch,"SK_LVL_"..num).Maximum then RPG.Points('SK_EXP_'..num).Maximum=0 end
      RPG.IncStat(ch,"POWERUP_"..CharacterMeta[ch]['askillup'..num][1],CharacterMeta[ch]['askillup'..num][2])
      if charmsg then charmsg(ch,CharacterMeta[ch]['skill'..num],0,180,255) charmsg(ch,'Level up!',0,180,255) end
      if exprate then exprate[ch] = exprate[ch] + (RPG.Points(ch,"SK_LVL_"..num).Have/(100*skill)) end
   end   
end

function GetCharList()
   return JINC('Script/JINC/CharAbilities/List.lua')
end
-- @IF IGNORE
return CharacterMeta
-- @FI
