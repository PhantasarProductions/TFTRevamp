--[[
  Steal.lua
  Version: 17.01.03
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
-- @IF INGORE
SpellScript = {}
-- @FI


function SpellScript.Steal(tartag,extag,param)
     local foe=fighterbytag[tartag]
     local foed = foe.data
     if foe.bestolen then 
        ChMiniMsg(foe.tag,"Already stolen from",255,0,0)
        return
     end
     local queue = {}
     for i1=1,3 do
         CSay('Item to steal: '..sval(foed['Item Steal '..i1]).."; rate: "..sval(foed['Rate Steal '..i1]))
         for i2=1,foed['Rate Steal '..i1] or 0 do
             queue[#queue+1] = foed['Item Steal '..i1]
         end
     end
     if #queue==0 then         
        ChMiniMsg(foe.tag,"Has nothing to steal",255,0,0)
        return
     end
     local ag1=RPG.Stat(extag,'END_Speed')
     local ag2=RPG.Stat(tartag,'END_Speed')
     if rand(1,ag1)<rand(1,ag2) then
        ChMiniMsg(foe.tag,"Stealing attempt failed",255,0,0)
        return
     end
     local stolenitem = queue[rand(1,#queue)]
     if ItemHave(stolenitem)>=itemmax then 
        ChMiniMsg(foe.tag,"Couldn't steal due to overstocking",255,0,0)
        return
     end   
     local item = ItemGet(stolenitem)
     ChMiniMsg(foe.tag,item.Title.." stolen",180,0,255)
     ItemGive(stolenitem)
     foe.bestolen = true -- "Bestolen" means "being stolen from" in Dutch. "Ik ben bestolen" = "Somebody stole from me".
     return true   
end

-- @IF INGORE
return SpellScript 
-- @FI
