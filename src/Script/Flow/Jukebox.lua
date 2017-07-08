--[[
  Jukebox.lua
  Version: 17.07.08
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
-- @USE /Script/Use/Specific/Scroller.lua

local w = Screen.Width()
local h = Screen.Height()
local data
local playing
local mx,my,omx,omy
local qd,qn
P = P or 1

function GALE_OnLoad()
   data = JINC('Script/JINC/big/JukeboxData.lua')
   mx,my=GetMouse()
   omx,omy=mx,my
end   

function MAIN_FLOW()
    mx,my=GetMouse()
    local moved
    if mx~=omx and my~=omy then
       omy,omy=mx,my
       moved=true
    else
       moved=false
    end
    
    local cnt=0
    box(0,0,w,h)
    Scroller('JUKEBOX',20,20,w-40,h-40)
    setfont('BoxTextContent')
    for n,d in spairs(data) do
        cnt = cnt + 1
        local y= cnt * 22
        local x = 0
        local r,g,b=255,255,255
        if playing==n then r,g,b=255,180,0 end
        if cnt==P then x=45 qn=n qd=d end
        DarkText(n,x,y,0,0,r,g,b)
        DarkText('by '..d.Artist,(w-160)-x,y,1,0,r,g,b)
        -- Mouse select
        if moved and ScrollArea('JUKEBOX',mx,my,0,y,w-160,20) then P=cnt end
        ScrollMax('JUKEBOX',y+50)
    end    
    EndScroller('JUKEBOX')
    -- Get out
    if INP.MouseH(2)==1 or INP.KeyH(KEY_ESCAPE)==1 or joyhit('CANCEL') then LAURA.Flow('FIELD') Music('Hub/Hall Of Heroes.ogg') end
    -- Keyboard and joypad
    if (INP.KeyH(KEY_DOWN)==1 or joyhit('DOWN')) and P<cnt then P=P+1 end
    if (INP.KeyH(KEY_UP  )==1 or joyhit('UP')  ) and P>  1 then P=P-1 end
    -- play
    if (INP.KeyH(KEY_ENTER)==1 or INP.KeyH(KEY_SPACE)==1 or joyhit('ACTION') or (INP.MouseH(1)==1 and mx<w-160)) and qd then
       Music(qd.File)
       playing=qn
    end    
    
    -- Scroll
    ScrollBoundsCorrection('JUKEBOX',P*22,25)
    -- Finishing touches
    ShowMouse()
    Flip()        
end
