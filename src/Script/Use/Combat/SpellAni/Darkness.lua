--[[
  Darkness.lua
  Version: 17.08.09
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

-- Dark, dark, dark
function SpellAniDarkness(x,y,ak)
  SpellAniExplosion = SpellAniExplosion or Image.LoadAnim('GFX/Combat/SpellAni/Explosion.png',64,64,0,16)           
  Image.Hot(SpellAniExplosion,32,64)
  Image.Color(0,0,0)
  Image.Draw(SpellAniExplosion,x,y,ak)
  Image.Color(255,255,255)
end


function SpellAni.Darkness(AG,AT,TG,TT)
 local ak
 local x,y = FighterCoords(TG,TT)
 for ak=0,15 do
     DrawScreen()
     SpellAniDarkness(x,y,ak)
     Flip()
 end
 Image.Free(SpellAniExplosion)
 SpellAniExplosion=nil
end

function SpellAni.AllDarkness(AG,AT,TG,TT)
local x,y
local tlist = {}
local t
--- @SELECT StN[TA.TargetGroup]
--- @CASE 1
   for ak,poep in pairs(Fighters[TG])  do
       x,y = FighterCoords(TG,ak)   
       --if party[ak] and char[party[ak]].HP[1]>0 then 
       table.insert(tlist,{x=x,y=y}) --end
       end
--[[       
-- @CASE 2
   for ak=1,9 do
       x,y = Combat_EnemySpot(ak)
       if FoeData[ak] and FoeData[ak].HP>0 then table.insert(tlist,{x=x,y=y}) end 
       end       
-- @ENDSELECT   
]]    
for ak=0,15 do
    DrawScreen()
    for _,t in ipairs(tlist) do
        --Image.Draw(SAP_Flame,t.x,t.y,ak)
        SpellAniDarkness(t.x,t.y,ak)
        end
    Flip()
    --Time.Sleep(75)
    end 
Image.Free(SpellAniExplosion)    
SpellAniExplosion=nil
end
