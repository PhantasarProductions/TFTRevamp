--[[
  Char.lua
  Version: 16.12.13
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
-- @USEDIR Script/Use/Anyway

debug = {}

oldstuff = {}

stats = {'Power','Endurance','Intelligence','Resistance','Speed','Accuracy','Evasion','Critical','Counter','HP','AP'}

function EStat(ch)
    oldstuff[ch] = oldstuff[ch] or {}
    local chstuff = oldstuff[ch]
    if chstuff.Weapon == RPG.GetData(ch,'EQP_Weapon') and chstuff.Armor == RPG.GetData(ch,'EQP_Armor') and chstuff.Acc == RPG.GetData(ch,'EQP_Acc') then return end
    chstuff.Weapon = RPG.GetData(ch,'EQP_Weapon')
    chstuff.Armor  = RPG.GetData(ch,'EQP_Armor')
    chstuff.Acc    = RPG.GetData(ch,'EQP_Acc')
    for s in each(stats) do RPG.DefStat(ch,"EQP_"..s,0) end
    for k,v in pairs(chstuff) do
        CSay(ch.." equipment check: "..k.." >> "..v)
        if v~="" then
           local i = ItemGet(v)
           for s in each(stats) do
               RPG.IncStat(ch,'EQP_'..s,i['EQP_Stat_'..v])
           end
        end   
    end    
end

function NStat(ch,stat,max,pmin)
   EStat(ch)
   -- debug[ch] = debug[ch] or {}
   -- Init stuff
   local min = pmin or 1
   local w = {'BASE','BUFF','EQP','POWERUP'}
   local rate = 1.01 - (0.01*(skill-1))
   local total = 0
   -- Foe correction
   if prefixed(ch,"FOE_") then 
      w = {'BASE','BUFF'}; 
      rate = .75 + (.25*(skill-1)) 
      end
   -- Calc Regular stat
   for wi in each(w) do
       total = total + (RPGChar.Stat(ch,wi.."_"..stat)*rate)
   end
   -- Masters
   local ms = RPG.SafeStat(ch,"MASTER_"..stat)/100
   local mscor = math.ceil(RPG.Stat(ch,"BASE_"..stat) * ms)
   total = total + mscor
   -- Overflow correction
   if max and total>max then total = max end
   if total<min then total = min end
   RPG.DefStat(ch,"END_"..stat,total)
   -- if not debug[ch][stat] then CSay("First time calc for "..ch..","..stat.." > "..total) end
   return total
end

function EVASION(ch)
  local spd = RPGChar.Stat(ch,"END_Speed")
  local rate = 0.09 / skill
  local eva = math.floor(spd * rate)
  RPGChar.SetStat(ch,"BASE_Evasion",eva)
  NStat(ch,"Evasion")
end



function POWER       (ch) NStat(ch,"Power")        end   
function ENDURANCE   (ch) NStat(ch,"Endurance")    end   
function INTELLIGENCE(ch) NStat(ch,"Intelligence") end   
function RESISTANCE  (ch) NStat(ch,"Resistance")   end
function SPEED       (ch) NStat(ch,"Speed")        end
function HP          (ch) NStat(ch,"HP")           end     
function AP          (ch) NStat(ch,"AP")           end
function ACCURACY    (ch) NStat(ch,"Accuracy",100,0) end    
function CRITICAL    (ch) NStat(ch,"Critical",100,0) end    
function COUNTER     (ch) NStat(ch,"Counter",100,0)  end    


function ER_DARKNESS (ch) NStat(ch,"ER_Darkness")  end 
function ER_EARTH    (ch) NStat(ch,"ER_Earth")     end
function ER_FLAME    (ch) NStat(ch,"ER_Flame")     end
function ER_FROST    (ch) NStat(ch,"ER_Frost")     end
function ER_LIGHT    (ch) NStat(ch,"ER_Light")     end
function ER_NONE     (ch) NStat(ch,"ER_None")      end
function ER_THUNDER  (ch) NStat(ch,"ER_Thunder")   end
function ER_WATER    (ch) NStat(ch,"ER_Water")     end
function ER_WIND     (ch) NStat(ch,"ER_Wind")      end
