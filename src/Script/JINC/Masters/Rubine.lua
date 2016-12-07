--[[
**********************************************
  
  Rubine.lua
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
 
version: 16.12.06
]]


local Rubine = {}

function Rubine.requirement() return true end

function Rubine.teach(ch) -- Should return true if master actually decides to teach something
end

function Rubine.appoint(ch)
end

function Rubine.dismiss(ch)
end

Rubine.stats = {
                      -- Spd +25%, Atk -10%, End -5%, Int -10%, Res - 5%, Acc +5%, eva +5%
                      Speed = 25,
                      Power = -10,
                      Endurance = -10,
                      Intelligence = -10,
                      Resstance = -10,
                      Accuracy = 5,
                      Evasion = 5
               }


return Rubine
