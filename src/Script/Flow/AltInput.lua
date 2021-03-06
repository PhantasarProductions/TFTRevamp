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
     keys [c(i+48)] = {x=i*40, y=0, group='num'} 
 end

 -- Init letters
 local x=0
 local y=40
 --local r=2
 local k=0
 for i=65,90 do   
    keys  [c(i)] = { x=x, y=y, group='alpha' } 
    k = k + 1
    x = x + 40
    if k>=10 then
       k=0
       x=0
       y=y+40
    end
 end   
 
 -- End checkup
 CSay('Serialize:')
 CSay(serialize('keys',keys)) 
end  



function ComeToMe(InputText,defaultvalue,whattoallow)
   myvalue = defaultvalue
   myinputtext = InputText
   LeaveMeFlow = LAURA.GetFlow()
   LAURA.Flow("ALTINPUT")
   if (not whattoallow) or whattoallow=="" then allow = { num = true, alpha=true } return end
   local wta = mysplit(whattoallow)
   allow.num = tablecontains(wta,"num")
   allow.alpha = tablecontains(wta,"alpha")
   CSay(serialize('allow',allow))
end   

function LeaveMe()
   Var.D("$INPUT.RETURN",myvalue)
   LAURA.Flow(LeaveMeFlow)
   MS.Destroy('ALTINPUT')
end   

function GALE_OnLoad()
  Init() Init=nil
  cursor = {[true]="|", [false]=''}
  starty = 180
  startx = Center_X - 200
end  

function GetLetter(LETTER)
   if (#myvalue/50)<SW-60 then
      myvalue = myvalue .. LETTER
   end
end   

function MAIN_FLOW()
   local mx,my = MouseCoords()
   local r = {[true]=255,[false]=255}
   local g = {[true]=180,[false]=255}
   local b = {[true]=  0,[false]=255}
   local hl
   Box(0,0,SW,SH)
   SetFont('AltInputHead')
   DarkText(myinputtext,20,20)
   Box(20,90,SW-40,70)
   local c = cursor[Sys.Val(right(math.floor(Time.MSecs()/2),1))>=5]
   SetFont('AltInputInput')
   DarkText(myvalue..c,40,100)
   SetFont('AltInputKeys')
   --[[
   if round(JoyX())~=0 or round(JoyY())~=0 then INP.MoveMouse(mx+round(JoyX()),my+round(JoyY()))
   elseif INP.KeyD(KEY_RIGHT)~=0 or INP.KeyD(KEY_DOWN) then INP.MoveMouse(mx+INP.KeyD(KEY_RIGHT),my+INP.KeyD(KEY_DOWN))
   else INP.MoveMouse(mx-INP.KeyD(KEY_LEFT ),my-INP.KeyD(KEY_UP  )) end
   ]]
   local movex = ((round(joyx()) + INP.KeyD(KEY_RIGHT)) - INP.KeyD(KEY_LEFT))*2 
   local movey = ((round(joyy()) + INP.KeyD(KEY_DOWN )) - INP.KeyD(KEY_UP  ))*2
   if movex~=0 or movey~=0 then INP.MoveMouse(mx+movex,my+movey) end 
   for kc,data in pairs(keys) do
       if allow[data.group] then
          Box(data.x+startx,data.y+starty,38,38)
          if INP.KeyH(string.byte(kc))==1 then GetLetter(kc) end
          hl = mx>data.x+startx and mx<data.x+startx+40
          and  my>data.y+starty and my<data.y+starty+40
          DarkText(kc,startx+data.x+20,starty+data.y+20,2,2,r[hl],g[hl],b[hl])
          if (mousehit(1) or joyhit('CONFIRM')) and hl then GetLetter(kc) end 
       else   
          Box(data.x+startx,data.y+starty,38,38)
          DarkText(kc,startx+data.x+20,starty+data.y+20,2,2,50,50,50)
       end
    end   
    if (INP.KeyH(KEY_BACKSPACE)==1 or joyhit('CANCEL') or mousehit(2)) and #myvalue>0 then myvalue=left(myvalue,string.len(myvalue)-1) end 
    local enterx = SW-200
    local entery = SH-60
    local enterhl = mx>enterx and mx<enterx+180 and my>entery and my<entery+40
    Box (enterx,entery,180,40)
    DarkText('Confirm',enterx+90,entery+20,2,2,r[enterhl],g[enterhl],b[enterhl])
    if (INP.KeyH(KEY_ENTER)==1 or INP.KeyH(KEY_RETURN)==1) and #myvalue>0 then LeaveMe() end
    if enterhl and #myvalue>0 and (joyhit('CONFIRM') or mousehit(1)) then LeaveMe() end 
    ShowMouse()
    Flip()
end   
