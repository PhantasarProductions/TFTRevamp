--[[
  MiniMsg.lua
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
tminimsg = {}

function MiniMsg(msg,x,y,r,g,b)
   local newmsg = {
                        msg=msg,
                        x=tonumber(x) or 25, 
                        y=tonumber(y) or SW, 
                        r=tonumber(r) or 255, 
                        g=tonumber(g) or 255, 
                        b=tonumber(b) or 255, 
                        time=100
                  }
   tminimsg[#tminimsg+1] = newmsg
   CSay("MiniMsg: "..msg)
end

function ResetMiniMsg()
    tminimsg = tminimsg or {}
    ClearTable(tminismg)
end    

function ShowMiniMsg()
   if oldflow~=LAURA.GetFlow() then tminimsg = {} oldflow=LAURA.GetFlow() end
   Image.Rotate(0)
   SetFont('MiniMsg')
   local s = (math.sin(Time.MSecs())/100)+.5
   for i,d in pairs(tminimsg) do
       if d.x<25   then d.x=d.x+1 elseif d.x>25   then d.x=math.floor(d.x-1) end
       if d.y<i*25 then d.y=d.y+1 elseif d.y>25*i then d.y=math.floor(d.y-2) elseif d.x<=25 then d.time=d.time-1 end
       DarkText(d.msg,d.x,d.y,0,0,d.r*s,d.g*s,d.b*s)
   end
   if tminimsg[1] and tminimsg[1].time<=0 then table.remove(tminimsg,1) end 
end
