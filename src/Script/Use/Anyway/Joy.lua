--[[
  Joy.lua
  Version: 16.10.23
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
joy_left = -1
joy_right = -2
joy_up = -3
joy_down = -4

Var.N("%JOY.CONFIRM",1)
Var.N("%JOY.CANCEL",2)
Var.N("%JOY.MENU",3)
Var.N("%JOY.XTRA",4)
Var.N("%JOY.L1",4)
Var.N("%JOY.L2",6)
Var.N("%JOY.R1",7)
Var.N("%JOY.R2",5)
Var.N("%JOY.START",8)
Var.N("%JOY.SELECT",9)

function joypos()
  return INP.JoyX(),INP.JoyY()
end

function joyhit(code)
  local x,y = joypos()
  if type(code)=='number' and code<0 then
     --[[
     if old_joy_x~=x and old_joy_y~=y then
        old_joy_x=x
        old_joy_y=y
        if code==joy_up    and y==-1 then return true end
        if code==joy_down  and y== 1 then return true end
        if code==joy_left  and x==-1 then return true end
        if code==joy_right and x== 1 then return true end        
     end
     ]]
     local ret = false
     while code==joy_up    and INP.JoyY()==-1 do ret=true end
     while code==joy_down  and INP.JoyY()== 1 do ret=true end
     while code==joy_left  and INP.JoyX()==-1 do ret=true end
     while code==joy_right and INP.JoyX()== 1 do ret=true end
     return ret
  elseif type(code)=='string' then
     return INP.JoyH(CVV('%JOY.'..code)) == 1
  else
     return INP.JoyH(code)==1   
  end   
end

function joydown(code)
  local x,y = joypos()
  if type(code)=='number' and code<0 then
     local ret = false
     if code==joy_up    and INP.JoyY()==-1 then ret=true end
     if code==joy_down  and INP.JoyY()== 1 then ret=true end
     if code==joy_left  and INP.JoyX()==-1 then ret=true end
     if code==joy_right and INP.JoyX()== 1 then ret=true end
     return ret
  elseif type(code)=='string' then
     return INP.JoyD(CVV('%JOY.'..code)) == 1
  else
     return INP.JoyD(code)==1   
  end   
end



getpress = {
                up = function() return joyhit(joy_up) or INP.KeyH(KEY_UP)==1 end,
                down = function() return joyhit(joy_down) or INP.KeyH(KEY_DOWN)==1 end,
                left = function() return joyhit(joy_left) or INP.KeyH(KEY_LEFT)==1 end,
                right = function() return joyhit(joy_right) or INP.KeyH(KEY_RIGHT)==1 end,
                confirm = function() return joyhit('CONFIRM') or INP.KeyH(KEY_ENTER)==1 or INP.KeyH(KEY_RETURN)==1 or INP.KeyH(KEY_SPACE) end,
                cancel = function() return joyhit('CANCEL') or INP.KeyH(KEY_ESCAPE)==1 end
           }

