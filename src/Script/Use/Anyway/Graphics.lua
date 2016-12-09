--[[
  Graphics.lua
  
  version: 16.12.09
  Copyright (C) 2016 Jeroen P. Broks
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

Cls = Image.Cls
cls = Cls
Color = Image.Color
color = Color

function Graphics_Init()
  LC = LAURA.LauraStartUp
  local inputstr = LC('ALTSCREENMODE')
  local t={} ; local i=1
  for str in string.gmatch(inputstr, "([^"..','.."]+)") do
      t[i] = str
      i = i + 1
  end
  Graph_ASM = t  
  SW = Graph_ASM[1] -- Screen.Width()
  SH = Graph_ASM[2] -- Screen.Height()
  Center_X = SW/2
  Center_Y = SH/2
end Graphics_Init()  

function GetViewport()
  Image.GetViewport()
  return Image.GVP_X,Image.GVP_Y,Image.GVP_W,Image.GVP_H
end GetViewPort = GetViewport


function QScale(x,y) -- Quick Scale
  Image.ScalePC(x or 100,y or x or 100)
end  
