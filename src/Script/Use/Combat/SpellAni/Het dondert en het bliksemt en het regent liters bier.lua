--[[
  Het dondert en het bliksemt en het regent liters bier.lua
  Version: 17.01.03
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
SpellAni = {}
-- @FI

function SpellAni.Spark(ActG,ActT,TarG,TarT)
local sx,sy = FighterCoords(TarG,TarT)
local ak,x,y
Image.LoadNew("SA_SPARK","GFX/COMBAT/SPELLANI/THUNDER/SPARK.PNG")
SFX('Audio/SpellAni/Thunder/Spark.ogg')
for ak=1,50 do
    DrawScreen()    
    White()
    for al=1,25 do
        x = rand(sx-16,sx+16)
        y = rand(sy-64,sy)
        Image.Rotate(rand(0,360))
        Image.Draw('SA_SPARK',x,y)
        Image.Rotate(0)
        end
    Flip()
    end
end

function SpellAni.Jolt(ActG,ActT,TarG,TarT)
local ak,x,y
local sx,sy
Image.LoadNew("SA_SPARK","GFX/COMBAT/SPELLANI/THUNDER/SPARK.PNG")
SFX('Audio/SpellAni/Thunder/Spark.ogg')
for ak=1,50 do
    DrawScreen()    
    White()
    for i,v in pairs(Fighters[TarG]) do -- Certainly NOT ipairs() even though i will only contain numbers. This array does not always have all numbers present which is a requirement for ipairs().
        sx,sy = FighterCoords(TarG,i)
        for al=1,25 do
            x = rand(sx-16,sx+16)
            y = rand(sy-64,sy)
            Image.Rotate(rand(0,360))
            Image.Draw('SA_SPARK',x,y)
            Image.Rotate(0)
            end
        end
    Flip()
    end
end

function SpellAni.Mjolnir(ActG,ActT,TarG,TarT)
local sx,sy = FighterCoords(TarG,TarT)
local scl = 1
Image.LoadNew("SA_LIGHTNING","GFX/COMBAT/SPELLANI/THUNDER/LIGHTNING.PNG")
SFX("Audio/SpellAni/Thunder/ThunderStrike.ogg")        
for ak=1,20 do
    DrawScreen()
    White()
    Image.Scale(scl,1); scl=scl*-1
    Image.Show("SA_LIGHTNING",sx,sy)
    Image.Scale(1,1)
    Flip()
    end
end    

-- @IF IGNORE
return SpellAni
-- @FI
