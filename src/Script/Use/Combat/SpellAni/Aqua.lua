--[[
  Aqua.lua
  Version: 17.07.03
  Copyright (C) 2017 Jeroen Petrus Broks
  
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
local SpellAni = {}
-- @FI

-- -- @DEFINE TSUNAMIDEBUG

function SpellAni.Tsunami(actG,actT,tarG,tarT)
   local water = Image.Load('gfx/textures/Water/water.png')
   local alpha = 50
   local ox,oy,ow,oh = GetViewport()
-- local y = {Sys.Val(SH),Sys.Val(SH)}
   local y = {oh,oh}
   local spd = {5,2}
   local allemaalnul = true
   while alpha>=0 do
      Image.SetAlphaPC(100)
      Cls()
      DrawScreen()
      Image.SetAlphaPC(alpha)
      allemaalnul=true
      for i=#y,1,-1 do
          Image.ViewPort(0,y[i],ow,oh-y[i])
          Image.Tile(water,0,y[i])
          y[i]=y[i]-spd[i]
          if y[i]>=0 then allemaalnul=false end
      end
      if allemaalnul then alpha = alpha - 1 end
      Flip()
      Image.ViewPort(ox,oy,ow,oh)
   end
   Image.Free(water)
end  

function SpellAni.Splash(ag,at,tg,tt)
   local water = Image.Load('gfx/textures/Water/water.png')
   local alpha = 25
   local ox,oy,ow,oh = GetViewport()
   local x,y = FighterCoords(tg,tt)
   for i=0,25 do
       Cls()
       DrawScreen()
       Image.SetALphaPC(alpha)
       Image.ViewPort(x-5,0,10,y)
       for j=0,5 do
           my = my or {}
           my[j]=(my[j] or j) + j
           Image.Tile(water,0,my[j])
       end
       Image.ViewPort(ox,oy,ow,oh)
       Flip()    
   end
   Image.Free(water)   
end

-- @IF IGNORE
return SpellAni
-- @GI
