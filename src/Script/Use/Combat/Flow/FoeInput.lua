--[[
  FoeInput.lua
  Version: 16.12.28
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
fflow = {}
-- @FI

function GoOversoul(tag,foe)
    if skill==1 then oversoul={} return end -- No oversouls in the easy mode
    if not oversoul[foe.fidtag] then return end -- No oversouls counted yet
    if not foe.data.Oversoul then return end -- Just don't check this if a foe cannot go oversoul at all (which is the case with prologue enemies and bosses).
    local os = {0,10,5}
    if oversoul[foe.fidtag]<os[skill] then return end -- Not enough kills for oversoul
    for t,mf in pairs(fighterbytag) do
        if prefixed(t,"FOE_") and mf.statuschanges.Oversoul and mf.fidtag==foe.fidtag then return end -- Don't go oversoul if the same enemy is there already in oversoul state
    end
    -- Everything is allright, let's go oversoul now then.
    local n = RPG.GetName(tag)
    local id
    for i,f in pairs(fighters.Foe) do if f==foe then id=i end end
    if not id then CSay('WARNING! Finding oversoul id has failed!') return end
    CardMessage(n.." goes oversoul",1)
    CompileFoe(tag,foe.data,foe.fidtag,id)
    local newfoe = fighterbytag[tag]
    newfoe.statuschanges = { Oversoul = StatusChanges.Oversoul }
    flow = 'idle' 
    nextact = nil
    table.remove(cards,1)    
    oversoul[foe.fidtag] = nil
    return true
end

function fflow.foeinput()
   local card = cards[1] 
   local tag = card.data.tag
   local foe = fighterbytag[tag]
   assert(FoeAI,"Foe AI not defined at all") -- If this one EVERY happens then there's really something wrong!
   assert(FoeAI[foe.AI],"No AI information found for AIID '"..foe.AI.."'")
   if not GoOversoul(tag,foe) then
      FoeAI[foe.AI](tag); assert(nextact,"nextact not define somehow???")
      flow = nextact.flow
   end   
   assert(flow~="foeinput","Somehow the flow goes into repeat!")
   -- assert(false,"Forced Crash")
end



-- @IF IGNORE
return fflow
-- @FI
