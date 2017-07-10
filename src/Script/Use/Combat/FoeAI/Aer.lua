--[[
**********************************************
  
  Aer.lua
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
 
version: 17.02.20
]]
-- @IF IGNORE
FoeAI = {}
-- @FI


function FoeAI.Aer(tag)
    local foe = fightersbytag[tag]
    local countcards = 0
    for _,c in pairs(cards) do if c.tag==tag then countcards=countcards+1 end end
    if countcards>2 then return FoeAI.default(tag) end
    -- if RPG.Points(tag,'HP').Have>1 then return FoeAI.default(tag) end
    if rand(1,9)>skill^2 then return FoeAI.default(tag) end
    nextact =   {
                           executor = { group = 'Foe', tag=foe.tag },
                           act = 'ITM_ANABOLINEA', 
                           flow='Execution', 
                           group='Foe',
                           targetidx=1
    }
    return nextact
end

-- @IF IGNORE
return FoeAI
-- @FI
