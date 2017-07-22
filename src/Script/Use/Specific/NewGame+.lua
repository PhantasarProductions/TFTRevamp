--[[
  NewGame+.lua
  Version: 17.07.22
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


function NGP_StartBoss(a,b)
    StartBoss(a,b,75,191,51)
end    


function ToHallHeroes(name,achkey,wmap)
   local gh = loadstring(Var.C('$HALLOFHEROES.PEOPLE').."\n return ret")
   local heroes = gh()
   heroes[name] = true
   MapText("HEROES_"..upper(name))
   Var.D("$HALLOFHEROES.PEOPLE",serialize('ret',heroes))
   Maps.Obj.Kill("NPC_"..name,1)
   Award('ZZNGP_'..upper(achkey))
   CSay('Do we got them all?')
   local c = 0
   for k,b in spairs(heroes) do
       CSay('= Achievement check '..k..' > '..sval(b))
       if b then c=c+1 end
   end
   CSay(c.." representatives found")
   if c==4 then Award('ZZNGP_ALLHEROES') end
   WorldMap(wmap or 'Delisto')
   WorldMap_Unlock('NGPHEROES')
end

-- --[[
--function FeenaSync()
if RPGChar.PartyTag(1)=="Feenalaria_Human" or RPGChar.PartyTag(1)=="Feenalaria_Human2" then
    Console.Write("Feena synchronize",255,0,0)
    MS.LoadNew('ITEMS','Script/Subs/Items.lua')
    MS.Run('ITEMS','FeenaHumanSync')
end      
-- ]]
 
   
