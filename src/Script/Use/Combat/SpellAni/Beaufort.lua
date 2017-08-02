--[[
  Beaufort.lua
  Version: 17.08.02
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


function SpellAni.Hurricane(actG,actT,tarG,tarT)
    local wind = Image.Load('GFX/Textures/4 Elements/Wind.png'); Image.HotCenter(wind)
    local b,e,s
    if tarG=='Foe' then b=1000 e=-1000 s=-10 else b=-1000 e=1000 s=10 end
    for i=b,e,s do 
        local sc = (math.sin(Time.MSecs()/2)*50)+75
        DrawScreen()
        Image.ScalePC(sc,sc)
        Image.Show(wind,i,Screen.Height()/2)
        Image.ScalePC(100,100)
        Flip()
    end
    Image.Free(wind)
end  

function SpellAni.Wind(ag,at,tg,tt)
    local wind = Image.Load('GFX/Textures/4 Elements/Wind.png'); Image.Hot(wind,Image.Width(wind)/2,Image.Height(wind))
    local x,y = FighterCoords(tg,tt)
    local b,e,s = 0,250,1
    for i=b,e,s do 
        local sc = (math.sin(Time.MSecs()/2)*25)+50
        DrawScreen()
        Image.ScalePC(sc,sc)
        Image.Show(wind,x,y)
        Image.ScalePC(100,100)
        Flip()
    end
    Image.Free(wind)
end

-- @IF IGNORE
return SpellAni
-- @GI
