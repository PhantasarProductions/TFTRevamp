--[[
  Boxes.lua
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
function BoxBorder(x,y,pw,ph)
   local a = Image.GetAlphaPC()
   local w = x + pw
   local h = y + ph
   Image.SetAlphaPC(50)   
   for i=0,5 do
       Image.Color(255,255,255)
       Image.Line(x,y+i,w-i,y+i) -- top
       Image.line(x+i,y+6,x+i,h-i) -- left
       Image.Color(10,10,10)
       Image.Line(x+i,h-i,w,h-i) -- bottom
       Image.line(w-i,h-6,w-i,y+i) -- right
   end
   Image.SetAlphaPC(a)
   -- DarkText("BoxBorder("..x..","..y..","..w..","..h..")",x,y,0,0,255,255,255) -- debug only!!!
   -- CSay("BoxBorder("..x..","..y..","..w..","..h..")") -- debug only!!!)
end   
       
function Box(x,y,w,h,picturetag)
   local tag = picturetag or 'PCS_BACK'
   local ox,oy,ow,oh = GetViewport()
   white()
   --CSay("Original Viewport "..ox..","..oy..","..ow..","..oh)
   -- --[[
   Image.ViewPort(x,y,w,h)
   Image.Tile(tag)
   Image.ViewPort(ox,oy,ow,oh)
   -- ]]   
   BoxBorder(x,y,w,h)
   -- DarkText("Box("..x..","..y..","..w..","..h..",'"..tag.."')",x,y,0,0,255,255,255) -- debug only!!!
   --CSay("Box("..x..","..y..","..w..","..h..",'"..tag.."')") -- debug only!!!
end