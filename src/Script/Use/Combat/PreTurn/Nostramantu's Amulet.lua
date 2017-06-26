--[[
**********************************************
  
  Nostramantu's Amulet.lua
  (c) Jeroen Broks, 2017, All Rights Reserved.
  
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
 
version: 17.06.26
]]
-- @IF IGNORE
local Pre_Turn_Array = {}
-- @FI




function Pre_Turn_Array.NosAmulet(gettag,amount)
    local tag=gettag; if prefixed(tag,"Jake") then tag="Jake" end
    NostramantuAmulet=NostramantuAmulet or {}
    NostramantuAmulet[tag]=NostramantuAmulet[tag] or {}
    for c in pairs(NostramantuAmulet) do
        if c~=tag and skill~=1 and rand(12/skill)==1 then NostramantuAmulet[tag] = {} end        
    end
    local CV = NostramantuAmulet[tag]
    CV.HP = CV.HP or 1
    CV.AP = CV.AP or 1
    RPG.Points(tag,'HP').Inc(CV.HP); charmsg(tag,     CV.HP       ,0,255,  0)
    RPG.Points(tag,'AP').Inc(CV.AP); charmsg(tag,"+"..CV.AP.." AP",0,180,255)
    if rand(1,skill*4)==1 then CV.HP = CV.HP + 1 end
    if rand(1,skill*9)==1 then CV.AP = CV.AP + 1 end
end


-- @IF IGNORE
return Pre_Turn_Array
-- @FI

