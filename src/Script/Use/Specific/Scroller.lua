--[[
  Scroller.lua
  Version: 17.07.09
  Copyright (C) 2016, 2017 Jeroen Petrus Broks
  
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
scrollers = scrollers or {}

Image.LoadNew('SCROLLUP','GFX/Scroll/Up.png')
Image.LoadNew('SCROLLDN','GFX/Scroll/Down.png')

scroll_imc = { [true]=255, [false]=100}
scroll_d   = { UP = -2, DN = 2}

function ScrollArrow(tag,itag,x,y)
    local tmx,tmy = GetMouse()
    local mx = tmx - scrollers[tag].x
    local my = tmy - scrollers[tag].y
    local inmouse = mx>x and mx<x+Image.Width ("SCROLL"..itag) and
                    my>y and my<y+Image.Height("SCROLL"..itag)
    color(scroll_imc[inmouse],scroll_imc[inmouse],scroll_imc[inmouse])                
    Image.Draw('SCROLL'..itag,x,y+scrollers[tag].down)
    if inmouse and INP.MouseD(1)==1 then scrollers[tag].down = scrollers[tag].down + scroll_d[itag] end
end

function ScrollPos(tag)
   return scrollers[tag].down
end   

function ScrollBoundsCorrection(tag,py,r)
    local y = py - scrollers[tag].down
    if     y<0 then scrollers[tag].down = scrollers[tag].down - 5 
    elseif y+math.abs(r or 0)>scrollers[tag].h then scrollers[tag].down = scrollers[tag].down + 5 end
    -- DarkText(tag.."/"..py.."/"..sval(r).."/"..y.."/"..scrollers[tag].down.."/"..scrollers[tag].max,SW/2,SH/2,2,2,0,180,255) -- debug line
end    

function ScrollArea(tag,cx,cy,x,y,w,h)
   local s=scrollers[tag]
   -- --[[
   if cx<s.x then return false end
   if cx>s.x+s.w then return false end
   if cy<s.y then return false end
   if cy>s.y+s.h then return false end
   --]]
   local ty = (y + s.y)-s.down
   -- CSay('ScrollArea:\n'..serialize('scroll',s).."\n"..cx.."/"..cy.."/"..x.."/"..y.."."..ty.."/"..w.."/"..h)
   return cx>x and cx<x+w and cy>ty and cy<ty+h
end

function ScrollMove(tag,value)
   scrollers[tag].down = scrollers[tag].down + (value or 2)
   if     scrollers[tag].down < ( scrollers[tag].min or 0    )      then scrollers[tag].down = scrollers[tag].min or 0
   elseif scrollers[tag].down+scrollers[tag].h > scrollers[tag].max then scrollers[tag].down = scrollers[tag].max - scrollers[tag].h end
end   

function Scroller(tag,x,y,w,h)
  -- CSay('Scroller("'..tag..'",'..x..','..y..','..w..','..h..")")
  scrollers[tag] = scrollers[tag] or { x=x, y=y, w=w, h=h, down=0, max=h}
  local myscroll = scrollers[tag]
  myscroll.ori = myscroll.ori or {}
  local ori=myscroll.ori
  ori.x,ori.y,ori.w,ori.h = GetViewPort()
  Image.ViewPort(myscroll.x,myscroll.y,myscroll.w,myscroll.h)
  Image.Origin(myscroll.x,myscroll.y-myscroll.down)
end

function EndScroller(tag)
  local myscroll = scrollers[tag]
  -- Checkstuff
  assert(myscroll,"No scoller tagged: "..tag)
  assert(myscroll.ori,"Original viewports not properly set")
  -- Scroller arrows (if applicable)
  if myscroll.down > 0 then ScrollArrow(tag,'UP',myscroll.w-50,5) end
  if myscroll.max and myscroll.down+myscroll.h < myscroll.max then ScrollArrow(tag,'DN',myscroll.w-50,myscroll.h-55) end
  -- Closure
  local ori=myscroll.ori
  Image.ViewPort(ori.x,ori.y,ori.w,ori.h)
  Image.Origin(ori.x,ori.y)
end    

function ScrollMax(tag,m)
   scrollers[tag].max = m
end   
