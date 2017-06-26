--[[
**********************************************
  
  Gendrabroe.lua
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
local HitBy = {}
-- @FI


-- Hydra kill upon being struck by fire when HP is on 1
function HitBy.Gendrabroe(tag,elem,a,d,data)
    if RPG.Points(tag,"HP").Have==0 then return end
    local exe
    charmsg("COUNTER",255,0,180)
    for i=0,3 do if data.executor==RPG.PartyTag(i) then exe=i end end
    local card = {
                    nextact= {
                      executor = {tag=tag, group='Foe'},
                      group='Hero',
                      targetidx=exe,
                      act = 'SPECIAL_GENDRABROE_COUNTER', --ItemGet('SPECIAL_GENDRABROE_COUNTER'),
                      auto=true,
                      ruleofvengeance = data.damage
                    }    ,
                    group='Foe'  ,
                    ruleofvengeance = data.damage                
                 }
    AddCard(card,1)                 
end


-- @IF Ignore
return HitBy
-- @FI
