--[[
  AAAAA.lua
  Version: 17.04.25
  Copyright (C) 2016, 2017 Jeroen Petrus Broks
  
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

-----------------------------------------------------
-- Fields
-- function OnGiven       -- Activates when status is given
-- int      ExpireRoll    -- 1 to ... chance the status expires at the beginning of character's turn (if nil, the status lingers till the end of the battle)
-- boolean  SkipTurn      -- If character has this, his or her turns will be skipped.
-- boolean  BlockHeal     -- If set healing is blocked
-- funtion  OnCure        -- What to do if this status is cured
-- boolean  IgnoreDeath   -- If set to true, this status will not go away simply by dying
-- function DrawFigher    -- Used to set some alternate settings to drawing a character
-- boolean  DrawReplace   -- If set the original DrawFighter routine will not be executed.
-- function PreTurn       -- If set the game will check this function to see if something has to happen prior to the input of the next turn (Poison and Curse will use this).
-- table    mydat         -- Ignored by the Status Change routine itself. Status changes may use this var to store extra data about themselves they may need themselves.
-- boolean  AttackExpire  -- Expire as soon as character is attacked 
-----------------------------------------------------


StatusChanges = {}



function SetStatus(ch,st,dontannounce)
    fighterbytag[ch].StatusChanges = fighterbytag[ch].StatusChanges or {}
    fighterbytag[ch].statuschanges = fighterbytag[ch].StatusChanges
    local sc = fighterbytag[ch].StatusChanges
    if sc[st] then return end --- If the character already go this status change, then let's get autta here.
    sc[st] = StatusChanges[st]
    if not sc[st] then CSay("WARNING! Character '"..ch.."' got a non-existing status change ("..st..")") return end
    (sc[st].OnGiven or Nothing)(ch)
    if not dontannounce then
       charmsg(ch,"! "..st.." !",StatusChanges[st].AnnR,StatusChanges[st].AnnG,StatusChanges[st].AnnB)
    end   
    CSay(ch.." now has the status: "..st)
    if ch=="Marrilona" and CVVN("%HANDICAP.MARRILONA") and st~="Death" then inc('%HANDICAP.MARRILONA',12/skill) end
end
GiveStatus = SetStatus

function expireroll(ch,st)
   return rand(1,fighterbytag[ch].StatusChanges.ExpireRoll)==1 
end

function TurnSkip(ch,allowexpireroll)
     local ret = false
     local remove = {}
     if not fighterbytag[ch] then CSay("No character on tag "..ch.." (anymore)")return true end
     for s,d in pairs(fighterbytag[ch].StatusChanges or {}) do
         if allowexpireroll and d.ExpireRoll and  expireroll(ch,s) then remove[#remove+1] = s end
         if d.SkipTurn then ret = true end
     end
     for s in each(remove) do fighterbytag[ch].StatusChanges[s] = nil end
     return ret
end      

function AltMove(ch)
    for s,d in spairs(fighterbytag[ch].StatusChanges or {}) do
        local f = d.AltMove
        if f then 
           f(ch)
           return true
        end 
    end
    return false
end        
