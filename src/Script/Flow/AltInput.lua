--[[
  AltInput.lua
  Version: 16.12.30
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
function Init()
 -- Create variables
 allow = { num = true, alpha=true }
 keys = {}
 c = string.char

 -- Init numbers
 --keys[1] = {}
 for i=0,9 do
     keys={ [c(i+48)] = {x=i*40, y=0, group='num'} }
 end

 -- Init letters
 local x=0
 local y=40
 --local r=2
 local k=0
 for i=65,90 do
    keys = { [c(i)] = { x=x, y=y, group='alpha' } }
    k = k + 1
    x = x + 40
    if k>=10 then
       k=0
       x=0
       y=y+40
    end
 end   
end  



function ComeToMe(InputText,defaultvalue,whattoallow)
   LeaveMeFlow = LAURA.Flow
   LAURA.Flow="ALTINPUT"
   if (not whattoallow) or whattoallow=="" then allow =       { num = true, alpha=true } return end
   local wta = splitwhattoallow
   allow.num = tablecontains(wta,"num")
   allow.alpha = tablecontains(wta,"alpha")
   myvalue = defaultvalue
   myinputtext = InputText
end   

function LeaveMe()
   Var.D("$INPUT.RETURN",myvalue)
   LAURA.Flow=LeaveMeFlow
   MS.Kill('ALTINPUT')
end   

function GALE_OnLoad()
  Init() Init=nil
  cursor = {[true]="|", [false]=''}
  starty = 180
  startx = Center_X - 200
end  


function MAIN_Flow()
   local mx,my = MouseCoords()
   Box(0,0,SW,WH)
   SetFont('AltInputHeader')
   DarkText(myinputtext,20,20)
   Box(20,90,WH-40,70)
   local c = cursor[Sys.Val(right(Time.MSecs(),1))>=5]
   SetFont('AltInputInput')
   DarkText(myvalue..c,40,100)
   SetFont('AltInputKeys')
   for kc,data in pairs(keys) do
       if allow[data.group] then
          Box(data.x,data.y,38,38)
          DarkText(kc,data.x+20,data.y+20,2,2)
       end
    end   
    ShowMouse()
    Flip()
end   
