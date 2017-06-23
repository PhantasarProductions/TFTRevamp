--[[
  ManaCave.lua
  Version: 17.06.23
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
local AltArena = {}
-- @FI

-- CSay("ManaCave Script import")

ManaCavePlasma = ManaCavePlasma or {}


AltArena.ManaCave = {}

function AltArena.ManaCave.Before()
    Image.LoadNew('MCTPLASMA','gfx/Textures/Plasma/TiledPlasma.png')
    --local plasma = ManaCavePlasma
    ManaCavePlasma.initiated = ManaCavePlasma.initiated or (function (plasma)
      --plasma.textures = {'gfx/Textures/Plasma/TiledPlasma.png','gfx/Textures/Plasma/TiledPlasma.png','gfx/Textures/Plasma/TiledPlasma.png','gfx/Textures/Plasma/TiledPlasma.png','gfx/Textures/Plasma/TiledPlasma.png','gfx/Textures/Plasma/TiledPlasma.png'}
      plasma.colors = { {180,0,0}, {0,180,0}, {0,0,180},{180,0,0}, {0,180,0}, {0,0,180}}
      plasma.speed = {{1,0},{0,1},{-1,-1},{-1,0},{0,-1},{1,1}}
      plasma.x = {}
      plasma.y = {}
      for i=1,#plasma.colors do
          plasma.x[i]=rand(0,800)
          plasma.y[i]=rand(0,800)
      end    
      plasma.max=#plasma.colors
      CSay('Plasma stream initiated -- '..plasma.max.." layers")
      return true
    end)(ManaCavePlasma)
    local plasma=ManaCavePlasma
    Image.SetBlend(LightBlend)
    for i=1,ManaCavePlasma.max do
        --CSay("Plasma layer "..i.."/"..plasma.max)
        plasma.x[i] = plasma.x[i] + plasma.speed[i][1] 
        plasma.y[i] = plasma.y[i] + plasma.speed[i][1]
        if     plasma.x[i]<0   then plasma.x[i] = plasma.x[i] + 640 
        elseif plasma.x[i]>600 then plasma.x[i] = plasma.x[i] - 640 end
        if     plasma.y[i]<0   then plasma.x[i] = plasma.y[i] + 400 
        elseif plasma.y[i]>400 then plasma.x[i] = plasma.y[i] - 400 end 
        local c = plasma.colors[i]
        Color(c[1],c[2],c[3])
        Image.Tile('MCTPLASMA',plasma.x[i],plasma.y[i])
    end
    Image.SetBlend(AlphaBlend)  
end    


AltArena.manacave = AltArena.ManaCave

-- @IF IGNORE
return AltArena
-- @FI
