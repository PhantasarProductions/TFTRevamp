--[[
  Char.lua
  Version: 16.09.10
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

function EVASION(ch)
  local spd = RPGChar.Stat(ch,"END_Speed")
  local rate = 0.9 / skill
  local eva = floor(spd * skill)
  RPGChar.SetChar(ch,"BASE_Evasion",eva)
end

function NStat(ch,stat)
   local w = {'BASE','BUFF','EQP','POWERUP'}
   local rate = 1.01 - (0.01*(skill-1))
   local total = 0
   for wi in each(w) do
       total = total + (RPGChar.Stat(ch,wi.."_"..stat)*rate)
   end
   RPG.DefStat(ch,"END_"..stat,w)
   return total
end


function POWER       (ch) NStat(ch,"Power")        end   
function ENDURANCE   (ch) NStat(ch,"Endurance")    end   
function INTELLIGENCE(ch) NStat(ch,"Intelligence") end   
function RESISTANCE  (ch) NStat(ch,"Resistance")   end
function SPEED       (ch) NStat(ch,"Speed")        end
function HP          (ch) NStat(ch,"HP")           end     
function AP          (ch) NStat(ch,"AP")           end
function ACCURACY    (ch) NStat(ch,"ACCURACY")     end    
