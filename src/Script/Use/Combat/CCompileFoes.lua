--[[
  CCompileFoes.lua
  Version: 16.10.08
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

-- @UNDEF CPF_DBG


function CompileFoe(tag,data,oversoul)
   local function dbg(t) 
      -- @IF CPF_DBG
      CSay("COMPILEFOE:>"..t)
      -- @FI
   end
   local id = oversoul or (#Fighters.Foe + 1)
   local letter = string.char(id+64); if id>26 then letter="?" end
   local myfoe = { tag = tag, R=255, G=255, B=255, letter=letter, id = id }
   if oversoul then myfoe.R=200; myfoe.G=150 myfoe.B=255 end
   Fighters.Foe[id] = myfoe    
   fighterbytag[tag] = myfoe
   myfoe.group='Foe'
   myfoe.id=id
   myfoe.AI = data.AI
   myfoe.data = data
   RPG.CreateChar(tag)
   local myname = letter..". "..data.Name; if oversoul then myname = myname .."  (Oversoul)" end
   RPG.SetName(tag,myname); CSay("Compiling "..tag.." << "..RPG.GetName(tag))
   for key,v in pairs(data) do
       local stat
       if      oversoul and prefixed(key,"oversoul_") then stat=right(key,#key-9) CSay("Oversoul Stat: "..stat) RPG.SetStat(tag,"BASE_"..stat,v) RPG.SetStat(tag,"BUFF_"..stat) RPG.SetStat(tag,"END_"..stat) RPGChar.ScriptStat(tag,"END_"..stat,"Script/Char/Char.lua",upper(stat)) end
       if (not oversoul) and prefixed(key,"normal_") then stat=right(key,#key-7) CSay("normal Stat:"..stat) RPG.SetStat(tag,"BASE_"..stat,v) RPG.SetStat(tag,"BUFF_"..stat) RPG.SetStat(tag,"END_"..stat) RPGChar.ScriptStat(tag,"END_"..stat,"Script/Char/Char.lua",upper(stat)) end
   end
   RPG.Points(tag,'HP',1).MaxCopy="END_HP"
   RPG.Points(tag,'HP').Have = RPG.Points(tag,'HP').Maximum
   Image.Load(data.Image,"FIGHT_"..tag)
   Image.Hot("FIGHT_"..tag,Image.Width("FIGHT_"..tag)/2,Image.Height("FIGHT_"..tag)) -- Hotspot bottom center
   local x = math.ceil(id/3)
   local y = (id - x)+1
   myfoe.x = (x * (Center_X/100)) + 50
   myfoe.y = (y * ((Center_Y-100)/4))+Center_Y    
   -- Compile ability list
   myfoe.abilities = {}
   for k,i in pairs(data) do
       if prefixed(k,'RATE_') and i>0 then
          local abl = right(k,#k-5)
          local abldat = { abl = abl,
                           target = data['TARGET_'..abl],                           
                         }
          local alright = true
          if (not oversoul) then alright = alright and data['NORMAL_'..abl] end dbg(sval(alright).." Normal check done")
          if (oversoul) then alright = alright and data['OVERSOUL_'..abl] end dbg(sval(alright).." Oversoul check done")
          alright = alright and data['SKILL'..skill.."_"..abl] dbg(sval(alright).." Skill "..skill.." check done")
          if alright then
             for j=1,i do
                 myfoe.abilities[#myfoe.abilities+1] = abldat dbg("adding "..abldat.abl)
             end                 
          end               
       end
   end
   dbg("Result "..serialize('foe.'..tag,myfoe))
end
