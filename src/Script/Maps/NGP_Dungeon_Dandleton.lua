--[[
  NGP_Dungeon_Dandleton.lua
  Version: 17.07.18
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


flashbacks = { ['#005'] = { priomt = nil, map='NGP_Dungeon_KokoBushes', layer='bush', start='Start'},
               ['#007'] = { priomt = "FL007", map = 'CH3_Dungeon_KokonoraForest', layer='forest', start='Start', schedule="WelcomeNos"}
             }

function NPC_Necrodia()
    local remark
    repeat
      remark = rand(1,6)
    until remark~=oldnecroremark oldnecroremark=remark
    MapText('SH'..remark)
    Shop('ITEM_NECRODIA')
end


function Memory(tag,pop,popwind)
    if pop then PartyPop(pop,popwind) end
    MapText('MEMORY'..(tag or right(Maps.LayerCodeName,3)))
end

function Flashback()
    if Done('&DONE.NEWGAMEPLUS.DANDLETON.FLASHBACK['..Maps.LayerCodeName..'].EXPERIENCED') then return end
    local fb = flashbacks[Maps.LayerCodeName]
    if fb.priomt then MapText(fb.priomt) end
    Party('Nostramantu_Human;Feenalaria_Human')
    MS.LoadNew('ITEMS','Script/Subs/Items.lua')
    MS.Run('ITEMS','FeenaHumanSync')
    LoadMap(fb.map)
    GoToLayer(fb.layer,fb.start)
    if fb.schedule then Schedule(fb.scheduleinstance or 'MAP',fb.schedule) Loading() end
end    


function GALE_OnLoad()
    ZA_Enter('pMemory',function() if not(Done('&DONE.NEWGAMEPLUS.DANDLETON.MEMORY.P['..Maps.LayerCodeName..'].SCENARIO')) then Memory(nil,'p') end end)
    ZA_Enter('Memory' ,function() if not(Done('&DONE.NEWGAMEPLUS.DANDLETON.MEMORY.N['..Maps.LayerCodeName..'].SCENARIO')) then Memory(nil,nil) end end)
    ZA_Enter('Flashback',Flashback)
end
    
