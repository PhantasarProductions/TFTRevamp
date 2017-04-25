--[[
  DarkVision.lua
  Version: 17.04.25
  Copyright (C) 2014, 2017 Jeroen Petrus Broks
  
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

-- This script was originall written for The Secrets of Dyrt...
-- Ths script has been adapted for use in The Fairy Tale Revamped

-- @IF IGNORE
local SpellAni = {}
-- @FI

function ShowDARKVISION(Death)
local screen = Image.GrabScreen()
local rad=0
local mul=1
local c
SFX("Audio/Combat/SpellAni/DarkVision.ogg")
for mul=255,0,-.75 do
    Image.Cls()
    c = math.abs(math.cos(rad) * mul)
    rad = rad + 0.05
    Image.Color(c,c,c)
    Image.Draw(screen,0,0)
    if Death then
       Image.Color(255,255,255)
       Image.Draw(Death)
       end
    Image.Flip()
    end
Image.Free(screen)    
end    


function SpellAni.DARKVISION(G,T)
ShowDARKVISION()
end

function SpellAni.Death(G,T)
  local img = Image.Load('GFX/Combat/SpellAni/Death/Death.png')
  ShowDARKVISION(img)
  Image.Free(img)
end

-- @IF IGNORE
return SpellAni
-- @FI
