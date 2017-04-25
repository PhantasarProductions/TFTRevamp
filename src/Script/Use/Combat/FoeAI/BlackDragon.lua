--[[
**********************************************
  
  BlackDragon.lua
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
 
version: 17.04.25
]]
-- @IF IGNORE
local FoeAI = {}
-- @FI

function FoeAI.BlackDragon(tag)
   local onefullap,allfullhp=false,true
   local foe = fightersbytag[tag]
   for i=0,3 do
      local t = RPG.PartyTag(i)
      local h = RPG.Points(t,"HP")
      local a = RPG.Points(t,"AP")
      onefullap = onefullap or a.Have==a.Maximum
      allfullhp = allfullhp and h.have==h.Maximum      
   end
   RPG.Points(tag,"HP").Minimum=1
   if RPG.Points(tag,"HP").Have==1 then
    nextact =   {
                           executor = { group = 'Foe', tag=foe.tag },
                           act = 'ABL_SPECIAL_DRAGONDOWN', 
                           flow='Execution', 
                           group='Foe',
                           targetidx=1
    }
   elseif allfullhp then
    nextact =   {
                           executor = { group = 'Foe', tag=foe.tag },
                           act = 'ABL_FOE_DEMON_SOUL_BREAKER', 
                           flow='Execution', 
                           group='Hero',
                           targetidx=1
    }
   elseif onefullap then
       nextact =   {
                           executor = { group = 'Foe', tag=foe.tag },
                           act = 'ABL_FOE_TOTALEXHAUSTION', 
                           flow='Execution', 
                           group='Hero',
                           targetidx=1
    }
   else
      FoeAI.default(tag)
   end
   return nextact     
   --assert(false,"Nothing to see here yet!")
end


-- @IF IGNORE
return FoeAI
-- @FI
