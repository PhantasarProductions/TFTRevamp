--[[
**********************************************
  
  Juggernaut.lua
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
 
version: 17.06.12
]]

-- Spells to pick from
local JUG = { ATK=12,HEAL=3,TACT=10}


-- @IF IGNORE
local SpellScript = {}
-- @FI

function SpellScript.Juggernaut()
    local rounds = {'ATK','HEAL','TACT'}
    local l=1
    for r in each(rounds) do
        local card2add = { group = nextact.group, tag=nextact.tag, letter=nextact.letter, auto=true }
        card2add.nextact = {}
        for f,i in pairs(nextact) do card2add.nextact[f]=i; CSay("Added to juggernaut round card: "..f) end
        CSay("Adding round card "..r)
        card2add.nextact.act = "jug_"..r..rand(1,JUG[r])
        CSay("= Action "..card2add.nextact.act)
        l = l + (10-(skill*3))
        AddCard(card2add,l)
    end    
    return true
end

-- @IF IGNORE
return SpellScript
