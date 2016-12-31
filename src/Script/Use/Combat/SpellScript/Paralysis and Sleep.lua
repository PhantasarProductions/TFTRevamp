--[[
  Paralysis and Sleep.lua
  Version: 16.12.31
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
StatusChanges = {}
-- @FI

StatusChanges.Sleep = {
    mydat = { zzz = {} },

    DrawFighter = function(ch)

       local zzz = StatusChanges.Disease.mydat.zzz
       local chx,chy = FighterCoords(ch)
       Image.LoadNew('ST_SLEEP','GFX/Combat/StatusChanges/Sleep/Z.png'); Image.HotCenter('ST_SLEEP')
       if rand(1,10)==1 then 
           zzz[#zzz+1] = { 
                     x = rand(chx-16, chx+16),
                     y = chy,
                     kill = 200                     
           } 
       end
       for i,cross in pairs(zzz) do -- ipairs is OUT OF THE QUESTION!!!
             cross.kill = cross.kill - 1
             if cross.kill<0 then zzz[i]=nil end -- This routine makes the usage of ipairs out of the question.
             cross.y = cross.y - 2
             Image.Draw('ST_SLEEP',cross.x,cross.y)
       end                        
    end,
    
    ExpireRoll = skill*3,
    SkipTurn   = true,
    AttackExpire = true
}


StatusChanges.Paralysis = {
    mydat = { zzz = {} },

    DrawFighter = function(ch)

       local bliksem = StatusChanges.Disease.mydat.bliksem
       local chx,chy = FighterCoords(ch)
       Image.LoadNew('ST_SLEEP','GFX/Combat/StatusChanges/Paralysis/Bliksem.png'); Image.HotCenter('ST_PARALYSIS')
       if rand(1,10)==1 then 
           bliksem[#bliksem+1] = { 
                     x = rand(chx-16, chx+16),
                     y = chy,
                     kill = 200                     
           } 
       end
       for i,cross in pairs(bliksem) do -- ipairs is OUT OF THE QUESTION!!!
             cross.kill = cross.kill - 1
             if cross.kill<0 then bliksem[i]=nil end -- This routine makes the usage of ipairs out of the question.
             cross.y = cross.y - 2
             Image.Draw('ST_PARALYSIS',cross.x,cross.y)
       end                        
    end,
    
    ExpireRoll = math.ceil(skill*2.5),
    SkipTurn   = true
}


-- @IF IGNORE
return StatusChanges
-- @FI    
