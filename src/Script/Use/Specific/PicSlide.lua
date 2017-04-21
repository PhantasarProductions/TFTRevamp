--[[
  PicSlide.lua
  Version: 17.04.20
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


slide = {

      Changes = {},
      PuzTiles = nil,
      PzIC = nil,
      EXP=2000,
      
      CheckSolved = function()
                       count=0
                       local correct=true
                       for y=1,5 do for x=1,5 do
                           correct=correct and slide.PuzTiles[y][x].Frame==count
                           count=count+1
                       end end
                       if correct then
                          SFX('Audio/sfx/General/Solved.ogg')
                          for i=0,3 do
                              local ch = RPG.PartyTag(i) 
                              RPG.IncStat(ch,"EXP",-slide.EXP)
                              CSay("And now I'll give "..slide.EXP.." to "..ch)
                          end
                          -- Remove barrier
                          for i=0,20 do
                              if Maps.Obj.Exists('Puz_Rem'..i) then Maps.Obj.Kill('Puz_Rem'..i,1) end
                          end
                          Done(slide.pzd())    
                          slide.PuzTiles=nil    
                          PartyUnFreeze()
                       end
                    end,
                    
      Repos = function()
                local PzIC = slide.PzIC
                for y=1,5 do for x=1,5 do
                    local o = slide.PuzTiles[y][x]
                    o.X=((x-1)*32)+PzIC.X 
                    o.Y=((y-1)*32)+PzIC.Y
                end end     
              end,              

      MoveRow = function (r,pm)
                    if not slide.PuzTiles then return end
                    local PuzTiles = slide.PuzTiles
                    if pm==-1 then
                       CSay("Moving row #"..r.." left")
                       PuzTiles[r][6] = PuzTiles[r][1]
                       for i=1,5    do PuzTiles[r][i]=PuzTiles[r][i+1] end
                    elseif pm==1 then   
                       CSay("Moving row #"..r.." right")
                       PuzTiles[r][0] = PuzTiles[r][5]
                       for i=5,1,-1 do PuzTiles[r][i]=PuzTiles[r][i-1] end
                    end
                    PuzTiles[r][6] = nil
                    PuzTiles[r][0] = nil
                    slide.Repos()
                    slide.CheckSolved()      
                end,
             
      MoveCol = function (c,pm)
                    if not slide.PuzTiles then return end
                    local PuzTiles = slide.PuzTiles
                    if pm==-1 then
                       CSay("Moving Collumn #"..c.." up")
                       PuzTiles[6][c] = PuzTiles[1][c]
                       for i=1,5    do PuzTiles[i][c]=PuzTiles[i+1][c] end
                    elseif pm==1 then   
                       CSay("Moving Collumn #"..c.." down")
                       PuzTiles[0][c] = PuzTiles[5][c]
                       for i=5,1,-1 do PuzTiles[i][c]=PuzTiles[i-1][c] end
                    end
                    PuzTiles[6][c] = nil
                    PuzTiles[0][c] = nil
                    slide.Repos()
                    slide.CheckSolved()      
                end,
                
      Init = function()
                for i=1,5 do
                   ZA_Enter("U"..i,slide.MoveCol,i,-1)
                   ZA_Enter("D"..i,slide.MoveCol,i, 1)
                   ZA_Enter("L"..i,slide.MoveRow,i,-1)
                   ZA_Enter("R"..i,slide.MoveRow,i, 1)
                end   
             end,           

      pzd = function() return "&DONE.PUZZLE.PICSLIDE."..upper(Maps.CodeName).."["..upper(Maps.LayerCodeName).."]" end,
      
      Start = function(Texture)
                  if CVV(slide.pzd()) then return end
                  PartyFreeze('Fr','South')
                  slide.PuzTiles = { {}, {}, {}, {}, {}, {} }
                  slide.PuzTiles[0] = {} 
                  CSay("Puzzle Setup -- "..sval(Texture))
                  for obj in KthuraEach('Obstacle') do
                    if obj.TextureFile==Texture then
                       local x,y
                       local frame=obj.Frame
                       y = math.floor(frame/5)
                       x = (frame - (y*5))
                       y = y + 1
                       x = x + 1
                       assert(slide.PuzTiles[y],"Row #"..y.." doesn't exist!")
                       assert(not slide.PuzTiles[y][x],"Duplicate puzzle frame ("..x..","..y..")")
                       slide.PuzTiles[y][x] = obj
                       if frame==0 then slide.PzIC = slide.PzIC or {X=obj.x,Y=obj.y} end                       
                       CSay("Tile #"..obj.IDNum.." with frame number: "..obj.Frame.." placed on row "..y.." collumn "..x)                       
                    else
                       CSay(" = ignored: "..obj.TextureFile)
                    end   
                  end
                  -- Nacontrole
                  for x=1,5 do for y=1,5 do
                      assert(slide.PuzTiles[y][x],"Missing tile ("..x..","..y..")")
                  end end -- 2 for commands require 2 end commands     
                  local m = {slide.MoveRow,slide.MoveCol}
                  local v = {-1,1}
                  -- Schuif
                  for i=1,slide.Changes[upper(Maps.LayerCodeName)] or 5 do
                      m[rand(1,#m)](rand(1,5),v[rand(1,#v)])
                  end     
                  -- debug
                  -- CSay(serialize('Puzzle',slide.PuzTiles))
              end


}
