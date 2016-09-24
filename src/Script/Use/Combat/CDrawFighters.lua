--[[
  CDrawFighters.lua
  Version: 16.09.24
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
function DrawFoe(i)
    local myfoe = Fighters.Foe[i]
    local tag = myfoe.tag
    color(myfoe.R or 255,myfoe.G or 255,myfoe.B or 255)
    Image.Show("FIGHT_"..tag,myfoe.x,myfoe.y)
end

function DrawHero(i)
    local myhero = Fighters.Hero[i]
    local tag = myhero.tag
    color(myhero.R or 255,myhero.G or 255,myhero.B or 255)
    local itag = "FIGHT_HERO_"..tag.."_"..myhero.stance
    Image.LoadNew(itag,"GFX/Combat/Fighters/Hero/"..tag.."."..myhero.stance..".png"); Image.Hot(itag,Image.Width(itag),Image.height(itag))
    Image.Show(itag,myhero.x,myhero.y)
    -- Image.NoFont() DarkText("Hero #"..i..": ("..myhero.x..","..myhero.y..")  screen:"..SW.."x"..SH,5,i*20)
end

function DrawFighter(g,i)
     ({Foe=DrawFoe,Hero=DrawHero})[g](i)
end

function DrawFighters()
  for group,grouparray in pairs(Fighters) do
      for idx,data in pairs(grouparray) do
          DrawFighter(group,idx)
      end 
  end
end
