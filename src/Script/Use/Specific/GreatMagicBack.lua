--[[
  GreatMagicBack.lua
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


-- @USE /Script/Use/Specific/MoveTex.Lua

--[[
    data keys
       texprefix = Texture prefix to create a plasma on.
       colors    = Colors
       speed     = Movement speed
]]

-- @IF IGNORE
local gm_default
-- @FI

gm_default = {}
gm_default.textures = {"GFX/TEXTURES/SINUS/DARK SINUS/HSINUS.PNG",
                       "GFX/TEXTURES/SINUS/LIGHT SINUS/HSINUS.PNG",
                       "GFX/TEXTURES/SINUS/DARK SINUS/VSINUS.PNG",
                       "GFX/TEXTURES/SINUS/LIGHT SINUS/HSINUS.PNG"}
gm_default.colors = { {125,  0, 0},    
                      {120, 60, 0},
                      {120, 20, 0},
                      {115, 15, 0}}       
gm_default.speed = { {1,0},{2,0},{0,1},{0,2}}      

gm_default.hide = "/F.PNG"                            

function SetUpGreatMagicDo(data,layer)      
      local retv = {} 
      local added = 0
      for obj in KthuraEach("TiledArea") do
          if prefixed(obj.Texturefile,data.texprefix or "GFX/TEXTURES/CAVES/DOORZICHTIG/") then
             if suffixed(obj.TextureFile,gm_default.hide) then obj.Visible=0 end
             for i=1,#data.textures do
                 local cobj = Maps.Obj.CreateObject("TiledArea") --,obj.IDNum.."/"..i)
                 retv[i] = retv[i] or { tiles = {} }
                 local ret = retv[i]
                 ret.movx = data.speed[i][1]
                 ret.movy = data.speed[i][2]
                 ret.Width=0
                 ret.Height=0
                 ret.tiles[#ret.tiles+1] = cobj
                 cobj.TextureFile = data.textures[i]
                 cobj.AltBlend = Blends.Light
                 cobj.X = obj.X
                 cobj.Y = obj.Y
                 cobj.W = obj.W
                 cobj.H = obj.H
                 cobj.Impassible = 0
                 cobj.Dominance = 0
                 cobj.R = data.colors[i][1]
                 cobj.G = data.colors[i][2]
                 cobj.B = data.colors[i][3]
                 cobj.InsertX = -cobj.X
                 cobj.InsertY = -cobj.Y    
                 cobj.Labels = obj.Labels
                 added = added + 1             
              end      
          end
      end
      CSay(added.." extra objects added for the \"Great Magic\".")
      return retv
end

function SetupGreatMagic(pdata,process)
      local data = pdata or {}
      local ret = {}
      for k,v in pairs(gm_default) do data[k] = data[k] or v end
      local layers = mysplit(Maps.Layers(),";")
      local pr = 1
      for layer in each(layers) do
          if process then
             Cls()
             Image.NoFont()
             Color(255,180,0)
             Image.Text(0,0,"Configuring extra data...")
             Color(180,0,255)
             Image.Text(0,20,math.ceil((pr/process)*100).."%")
             Image.Flip()
             pr = pr + 1
          end   
          Maps.GoToLayer(layer) 
          ret[layer] = SetUpGreatMagicDo(data,layer) 
      end
      for k,a in spairs(ret) do CSay("MAGIC TILES: "..k.."> "..#a) end
      Maps.Remap()
      return ret
end
