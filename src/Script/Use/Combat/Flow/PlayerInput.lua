--[[
  PlayerInput.lua
  Version: 16.09.25
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
-- @IF IGNORE
fflow = {}
-- @FI

 KEY_LEFT=37; KEY_UP=38; KEY_RIGHT=39; KEY_DOWN=40


fflow.inputicons = { attack = {
                            x = 0, y = 0,
                            allow = function() return true end,
                            key = nil,
                            joyx = 100, -- These values are never given, and will as a result prevent conflicts.
                            joyy = 100
                        },
                     ability = {
                                 x = 0, y = -50,
                                 allow = function()
                                         -- Actual content comes later when abilities are actually possible.
                                         end,
                                 key = KEY_UP,
                                 joyx = nil,
                                 joyy = -1        
                               }   ,
                     spirata = {
                                 x = 0, y = 50,
                                 allow = function()
                                           return CVV("&SPIRATA."..inputchar.tag)
                                         end,
                                 key = KEY_DOWN,
                                 joyx = nil,
                                 joyy = 1        
                               } ,
                     items = {
                                 x = -50, y = 0,
                                 allow = function()
                                           return true
                                         end,
                                 key = KEY_LEFT,
                                 joyx = -1,
                                 joyy = nil        
                               },
                     guard = {
                                 x = 50, y = 0,
                                 allow = function()
                                           return true
                                         end,
                                 key = KEY_RIGHT,
                                 joyx = 1,
                                 joyy = nil        
                               }
             }
inputicons = fflow.inputicons             

function fflow.setplayerinput(ch)
     SFX('Audio/Combat/Ready.ogg')
     inputchar = {tag =  ch, name=RPG.GetName(ch), face="CL_FACE_"..ch, facewidth=Image.Width("CL_FACE_"..ch)-10, fc=0 }
     flow = 'playerinput'
end

function fflow.playerinput()
     assert ( inputchar, "I don't know which char I must receive input for!" )
     local x = Center_X
     local y = Center_Y-(Center_Y/5)
     local c = inputchar.fc
     local menuy = y + 50
     local menux = x + 50
     local mousex,mousey = GetMouse()
     -- local dy
     -- Heading
     SetFont('CombatName')
     DarkText(inputchar.name,x,y-100,2,2,c,c,c)
     color(c,c,c) if c<255 then c=c+1 inputchar.fc=c end
     Image.Show(inputchar.face,x-inputchar.facewidth,y)
     -- Menu
     local citem = 'attack' -- If nothing is chosen, attack will be the selected option.
     for key,data in pairs(inputicons) do
         Image.LoadNew("COMBAT_ICON_"..key,"GFX/Combat/Menu/"..key..".png")
         -- dy = (dy or 0) + 20; Image.NoFont() DarkText('data.key='..sval(data.key)..' KeyDown('..sval(data.key)..')='..INP.KeyD(data.key).." ("..key..")",0,dy)
         if (INP.KeyD(data.key)==1 or (INP.JoyX()==(data.joyx or INP.JoyX()) and INP.JoyY()==(data.joyy or INP.JoyY()))) and data.allow() then citem=key end 
         white()
         if citem==key then 
            local sinc = 200 + (sin(Time.MSecs()/250)*55)
            color(sinc,sinc,sinc)
         end
         if not data.allow() then color(100,100,100) end
         Image.Show("COMBAT_ICON_"..key,data.x+menux,data.y+menuy)
     end     
     -- Showing the mouse comes last!
     ShowMouse()
end


-- @IF IGNORE
return fflow
-- @FI
