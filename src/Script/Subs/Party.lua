--[[
  Party.lua
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

LC = LAURA.LauraStartUp -- Quick reference to get the LAURA start up configuration. Yes, I know, I'm lazy!

function GALE_OnLoad()
    totalwidth  = SW
    totalheight = SH
    origin = {0,0}
    if tonumber(LC('screen.margin.left')  )~=0 then origin[1] = 25; totalwidth=totalwidth -25 end
    if tonumber(LC('screen.margin.top')   )~=0 then origin[2] = 25; totalwidth=totalheight-25 end
    if tonumber(LC('screen.margin.right') )~=0 then                 totalwidth=totalwidth -25 end
    if tonumber(LC('screen.margin.bottom'))~=0 then                 totalwidth=totalheight-25 end
    charentrywidth = totalwidth / 4
end

function ShowMargins()
    black()
    if tonumber(LC('screen.margin.left')  )~=0 then Image.Rect(    0,    0,25,SH) end
    if tonumber(LC('screen.margin.top')   )~=0 then Image.Rect(    0,    0,SW,25) end
    if tonumber(LC('screen.margin.right') )~=0 then Image.Rect(SW-25,    0,25,SH) end
    if tonumber(LC('screen.margin.bottom'))~=0 then Image.Rect(    0,SH-25,SW,25) end  
end

function ShowParty()
   local sy=(totalheight-100)+origin[2]
   local sx=origin[1]
   for i=0,3 do
       Box(sx+(i*charentrywidth),sy,charentrywidth,100)
   end
   ShowMargins()
end

function SyncLevel(ch)
end

function CreateChar(ch,name)
  -- Create
  RPGChar.CreateChar(ch)
  -- Name
  RPGChar.SetName(ch,name or ch)
  -- Stats  
  local stats = {'Power','Endurance','Intelligence','Resistance','Speed','Accuracy','Evasion',"Counter","Critical",'HP','AP'}
  local works = {'BASE','BUFF','EQP','POWERUP','END'}
  for st in each(stats) do
      for w in each(works) do
          RPGChar.SetStat(ch,w.."_"..stat,0)
      end
      RPGChar.ScriptStat(ch,"END_"..stat,"Script/Char/Char.lua",upper(st))
  end
  -- Points
  RPGChar.Points(ch,"HP",1).MaxCopy="END_HP"
  RPGChar.Points(ch,"AP",1).MaxCopy="END_AP"
  RPGChar.Points(ch,"VIT",1).Maximum=100
  -- Experience
  RPGChar.SetStat(ch,"Level",1)
  RPGChar.SetStat(ch,"EXP",1000)
  SyncLevel(ch)          
end
