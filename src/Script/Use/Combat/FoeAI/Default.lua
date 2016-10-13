--[[
  Default.lua
  Version: 16.10.13
  Copyright (C) 2016 Jeroen Petrus Broks
  
  ===========================
  This file is part of a project related to the Phantasar Chronicles or another
  series or saga which is property of Jeroen P. Broks.
  This means that it may contain references to a story-line plus characters
  which are property of Jeroen Broks. These references may only be distributed
  along with an unmodified version of the game. 
  
  As soon as you remove or replace ALL references to the storyline or character
  references, or any termology specifically set up for the Phantasar universe,
  or any other univers a story of Jeroen P. Broks is set up for,
  the restrictions of this file are removed and will automatically become
  zLib licensed (see below).
  
  Please note that doing so counts as a modification and must be marked as such
  in accordance to the zLib license.
  ===========================
  zLib license terms:
  This software is provided 'as-is', without any express or implied
  warranty.  In no event will the authors be held liable for any damages
  arising from the use of this software.
  Permission is granted to anyone to use this software for any purpose,
  including commercial applications, and to alter it and redistribute it
  freely, subject to the following restrictions:
  1. The origin of this software must not be misrepresented; you must not
     claim that you wrote the original software. If you use this software
     in a product, an acknowledgment in the product documentation would be
     appreciated but is not required.
  2. Altered source versions must be plainly marked as such, and must not be
     misrepresented as being the original software.
  3. This notice may not be removed or altered from any source distribution.
]]
-- @IF IGNORE
FoeAI = {}
-- @FI

FoeAI.Target = {}

FoeAI.Target['1F'] = function(tag,abl)
     return 'Hero',rand(0,3)
end
FoeAI.Target['AF'] = FoeAI.Target['1F']

FoeAI.Target['1A'] = function(tab,abl)
     local tgt = {}
     for i,_ in pairs(fighters.Foe) do
         tgt[#tgt+1]=i
     end
     return 'Foe',tgt[rand(1,#tgt)]
end

FoeAI.Target.AA = FoeAI.Target['1A']

function FoeAI.default(tag)
    local timeout = 10000 
    local foe = fightersbytag[tag]
    repeat -- Inifinite loop
       timeout = timeout - 1; assert(timeout>0,"FoeAI.default('"..sval(tag).."'): Time-out!")
       local dabl = foe.abilities[rand(1,#foe.abilities)]; assert ( dabl , "Nil returned from a array["..#foe.abilities.."]")
       local abl  = ItemGet(dabl.abl)
       local g,i  = ({
                        ['Random'] = function(t,a)
                                        return FoeAI.Target[a.Target](t)
                                     end
                    })[dabl.target](tag,abl)
       local good = true
       good = good and Fighters[g][i]
       good = good and RPG.Points(Fighters[g][i].tag,'HP').Have>=1
       if good then
          nextact   = {
                           executor = { group = 'Foe', tag=foe.tag },
                           act = dabl.abl, 
                           flow='Execution', 
                           group=g,
                           targetidx=i
                       }
          return nextact             
       end
       -- Cls() DarkText(timeout.."/"..sval(good).."/"..sval(g).."/"..sval(i).."/"..sval(Fighters[g][i]).."/"..dabl.abl.."/"..serialize('onmogelijk',Fighters[g])) Flip()             
    until false    
end

-- @IF IGNORE
return FoeAI
-- @FI
