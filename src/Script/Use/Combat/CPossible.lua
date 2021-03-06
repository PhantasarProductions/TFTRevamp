--[[
  CPossible.lua
  Version: 17.06.25
  Copyright (C) 2017 Jeroen Petrus Broks
  
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

-- @DEFINE POSSIBLE_DEBUG

local LOCALALWAYSYES = function() return true end
local function LOCALSINGLE()
         local g = nextact.group
         local i = nextact.targetidx
         local tab = Fighters[g][i]; if not tab then return nil end
         local ret = tab~=nil 
         local tag = (tab or {}).tag; 
         -- @IF POSSIBLE_DEBUG
         CSay("target group = "..sval(g).."; index = "..sval(i).."; tag = "..sval(tag))
         -- @FI
         if not tag then return nil end
         if prefixed(tag,"FOE_") and RPG.Points(tag,'HP').Have==0 then ret = false end
         return ret
end         

ArrayPossible = {
                    EV=LOCALALWAYSYES, AA=LOCALALWAYSYES, AF=LOCALALWAYSYES,
                    ['1A'] = LOCALSINGLE,['1F']=LOCALSINGLE,
                    ['OS'] = function() return fighterbytag[nextact.executor.tag]~=nil end                    
                }
                


function ActionPossible(i)
     -- local i 
     return ArrayPossible[i]()
end                


LOCALALWAYSYES = nil                
LOCALSINGLE=nil 
-- @IF IGNORE                
return ArrayPossible
-- @FI
