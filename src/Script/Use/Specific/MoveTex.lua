--[[
  MoveTex.lua
  Version: 16.12.25
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

function InitMoveTex(data)
   local ret = {tiles = {} }
   local layers = mysplit(Maps.Layers(),";")
   assert(type(data)=="table","HUH? No valid data! I want a table!!")
   -- cleartable(ret.tiles)
   for lay in each(layers) do
       CSay('- Scanning layer '..lay) 
       Maps.GotoLayer(lay)
       for obj in KthuraEach('TiledArea') do
           if suffixed(obj.TextureFile,data.suffix or "WATER.PNG") then 
              ret.tiles[#ret.tiles+1] = obj
              obj.SetAlpha(data.alpha or 1000) 
              CSay("  = Added object #"..obj.IDNum) 
              ret.Height = ret.Height or obj.TexHeight()
              ret.Width  = ret.Width  or obj.TexWidth ()
              ret.movx   = data.X or 0
              ret.movy   = data.Y or 0
              if data.InsertCorrection then obj.InsertX=-obj.X obj.InsertY=-obj.Y end -- Yeah this will trigger the flower itself, but that doesn't really matter, as the user won't notice. Dirty code straight from hell, don't you just love it?
           end
       end
   end
   Maps.Remap()     
   return ret
end

function FlowMoveTex(data)
   for obj in each (data.tiles) do
       obj.InsertX = obj.InsertX + data.movx
       obj.InsertY = obj.InsertY + data.movy       
       if obj.InsertX<-data.Width then obj.InsertX = obj.InsertX+data.Width end
   end
end
