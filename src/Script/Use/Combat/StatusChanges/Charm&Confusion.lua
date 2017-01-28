--[[
  Charm&Confusion.lua
  Version: 17.01.28
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
local StatusChanges = {}
-- @FI


function ConfuSetMove(me,groups)
          nextact   = {
                           executor = { group = ({[true]='Foe',[false]='Hero'})[prefixed(me,'FOE_')], tag=me },
                           act = 'AAA_ATTACK', 
                           flow='Execution', 
                           group=groups[rand(1,#groups)],
                           --targetidx=i
                       }
          flow='Execution'                             
          local myg = nextact.executor.group
          local chg = {}
          for i,_ in pairs(fighters[g]) do chg[#chg+1]=i end
          nextact.targetidx = chg[rand(1,#chg)]              
          return nextact             

end



StatusChanges.Charmed = {
    mydat = { zzz = {} },

    AttackExpire = true,
    
    AltMove = function(me) return ConfuSetMove(me,{'Hero'}) end,
    
    
    DrawFighter = function(ch)

       local chx,chy = FighterCoords(ch)
       Image.LoadNew('ST_HEART','GFX/Combat/SpellAni/Temptation/Heart.png'); Image.Hot('ST_HEART',Image.Width('ST_HEART')/2,Image.Height('ST_HEART'))
       
       QScale(10+math.abs(math.sin(Time.MSecs()/5)*10))
       Image.Show('ST_HEART',chx,chy-70)
       QScale()
    end
}


-- @IF IGNORE
return StatusChanges
-- @FI
