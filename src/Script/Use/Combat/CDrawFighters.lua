--[[
  CDrawFighters.lua
  Version: 16.10.21
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
    --color(myfoe.R or 255,myfoe.G or 255,myfoe.B or 255)
    Image.Show("FIGHT_"..tag,myfoe.x,myfoe.y)
end

function DrawHero(i)
    local myhero = Fighters.Hero[i]
    local tag = myhero.tag
    --color(myhero.R or 255,myhero.G or 255,myhero.B or 255)
    local itag = "FIGHT_HERO_"..tag.."_"..myhero.stance
    Image.LoadNew(itag,"GFX/Combat/Fighters/Hero/"..tag.."."..myhero.stance..".png"); Image.Hot(itag,Image.Width(itag),Image.height(itag))
    Image.Show(itag,myhero.x,myhero.y)
    -- Image.NoFont() DarkText("Hero #"..i..": ("..myhero.x..","..myhero.y..")  screen:"..SW.."x"..SH,5,i*20)
end

function FighterCoords(g,i)
   if type(i)=='nil' then return fighterbytag[g].x,fighterbytag[g].y end
   return Fighters[g][i].x,Fighters[g][i].y
end   

function DrawFighter(g,i)
     -- Drawing the char itself
     local chdata = Fighters[g][i]
     color ( chdata.R or 255, chdata.G or 255, chdata.B or 255)
     local targetted = flow=='playerselectsingletarget' and nextact and nextact.group==g and nextact.targetidx==i
     if targetted then
        local c=200+(sin(Time.MSecs()/250)*55)
        color(c,255-c,0)
     end
     local altdraw = false
     for st,stdat in pairs(chdata.statuschanges or {}) do
         -- CSay(st) -- Debugline. Slows the system down like crazy, so must be in comment form when not used.
         altdraw = altdraw or stdat.DrawReplace;
         (stdat.DrawFighter or Nothing)(chdata.tag)
     end    
     if not altdraw then ({Foe=DrawFoe,Hero=DrawHero})[g](i) end -- Perhaps I need to do this otherwise, if there are serious performance issues.
     -- Show damage or other messages if any
     if array_charmessages and array_charmessages[chdata.tag] and array_charmessages[chdata.tag][1] then
        local acma = array_charmessages[chdata.tag]
        local acm=acma[1]
        SetFont('CombatCharMessage')
        Image.ScalePC(acm.scale,acm.scale) 
        DarkText(acm.msg,chdata.x,chdata.y-30,2,1,acm.r,acm.g,acm.b)
        Image.ScalePC(100,100)
        if acm.scale<100 then 
           acm.scale = acm.scale + 1
        elseif #acma>1 or acm.time<=0 then
           table.remove(acma,1)
        else
           acm.time = acm.time - 1       
        end
     end
     -- Targetted information
     if targetted then
        Image.LoadNew("BAT_COLPOINT","GFX/Combat/Sys/Collision.png")
        local name = RPG.GetName(chdata.tag)
        local align = {Foe=0,Hero=1}
        local col = {Foe = {255,0,0},Hero={180,255,0}}
        local php = RPG.Points(chdata.tag,"HP")
        local hp  = php.have
        local hpm = php.Maximum
        local bw  = Image.TextWidth(name)
        local bx  = ({Foe=chdata.x,Hero=chdata.x-bw})[g] 
        SetFont('Target')
        DarkText(name,chdata.x,chdata.y-25,align[g],1,col[g][1],col[g][2],col[g][3])
        color(50,50,50)
        if skill~=3 then
           Image.Rect(bx,chdata.y-25,bw,25)
           color(180,255,0)
           -- if skill==2 and (not bestiary[chdata.file]) then
           -- else
              Image.Rect(bx,chdata.y-25,(hp/hpm)*bw,25)    
           -- end
        end  
     end
end

function DrawFighters()
  for group,grouparray in pairs(Fighters) do
      for idx,data in pairs(grouparray) do
          DrawFighter(group,idx)
      end 
  end
end
