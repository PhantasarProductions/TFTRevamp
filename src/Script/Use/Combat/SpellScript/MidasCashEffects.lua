--[[
  MidasCashEffects.lua
  Version: 17.07.10
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
-- @IF IGNORE
local SpellScript = {}
-- @FI


function SpellScript.HardForTheMoney(foetag,exe)
     local foe = fighterbytag[foetag]
     if foe.data.Boss then CSay('Bosses are always unaffected') return false end
     if (not foe.exp) then CSay('Experience not set at all')    return false end
     if foe.exp==0    then CSay('Foe does not give exp')        return false end
     --if not foe.data.Cash then CSay('Target has no money') return false end
     CSay('HFTM: Before: Cash='..sval(foe.data.Cash)..'; Experience='..foe.exp)
     foe.data.Cash = (foe.data.Cash or 0) + (foe.exp * (4-skill))
     foe.exp = 0
     CSay('HFTM: After:  Cash='..sval(foe.data.Cash)..'; Experience='..foe.exp)
     return true
end

function SpellScript.StealMoney(foetag,exe)
    local foe = fighterbytag[foetag]
    if not foe.data.Cash then return false end
    if foe.data.Cash==0 then return false end
    charmsg(foetag,foe.data.Cash.." shilders stolen",160,255,0)
    inc('%CASH',foe.data.Cash)
    foe.data.Cash=0
    return true
end    


-- @IF INGORE
return SpellScript 
-- @FI
