--[[
  CDrawFighters.lua
  Version: 17.08.09
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

function DrawFoe(i)
    local myfoe = Fighters.Foe[i]
    local tag = myfoe.tag
    myfoe.negative = myfoe.negative == true -- Crash prevention
    --color(myfoe.R or 255,myfoe.G or 255,myfoe.B or 255)
    Image.Show("FIGHT_"..tag..sval(myfoe.negative),myfoe.x,myfoe.y)
end

function DrawHero(i)
    local myhero = Fighters.Hero[i]
    local tag = myhero.tag
    --color(myhero.R or 255,myhero.G or 255,myhero.B or 255)
    local itag = "FIGHT_HERO_"..tag.."_"..myhero.stance
    Image.LoadNew(itag,"GFX/Combat/Fighters/Hero/"..tag.."."..myhero.stance..".png"); Image.Hot(itag,Image.Width(itag)/2,Image.height(itag))
    Image.Show(itag,myhero.x,myhero.y)
    -- Image.NoFont() DarkText("Hero #"..i..": ("..myhero.x..","..myhero.y..")  screen:"..SW.."x"..SH,5,i*20)
end

function FighterCoords(g,i)
   if type(i)=='nil' then
      if not fighterbytag[g] then
         CSay("WARNING! FighterCooords('"..sval(g).."'): Non-Existent Character")
         return -100,-100
      end 
      return fighterbytag[g].x,fighterbytag[g].y 
   end
   return Fighters[g][i].x,Fighters[g][i].y
end   

function TargetedInfo(g,i,subalpha)
     -- Targetted information
     local chdata = Fighters[g][i]
     local shdata = chdata
     local targetted = flow=='playerselectsingletarget' and nextact and nextact.group==g and nextact.targetidx==i
     if targetted then
        Image.LoadNew("BAT_COLPOINT","GFX/Combat/Sys/Collision.png")
        SetFont('Target')
        Image.SetAlphaPC(subalpha or 100)
        local name = RPG.GetName(chdata.tag)
        local align = {Foe=0,Hero=1}
        local col = {Foe = {255,0,0},Hero={180,255,0}}
        local php = RPG.Points(chdata.tag,"HP")
        local hp  = php.have
        local hpm = php.Maximum
        local bw  = Image.TextWidth(name)
        local bx  = ({Foe=shdata.x,Hero=shdata.x-bw})[g] 
        DarkText(name,shdata.x,shdata.y-25,align[g],1,col[g][1],col[g][2],col[g][3])
        color(50,50,50)
        if skill~=3 then
           Image.Rect(bx,shdata.y-25,bw,25)
           color(180,255,0)
            if skill==2 and (not bestiary[upper(chdata.fidtag)]) and prefixed(chdata.tag,'FOE_') then
              DarkText('?',bx+(bw/2),shdata.y-12,2,2,rand(0,255),rand(0,255),rand(0,255))
            else
              Image.Rect(bx,shdata.y-25,(hp/hpm)*bw,25)    
            end
            local ty = shdata.y
            for st,_ in spairs(chdata.statuschanges or {}) do
                if st~="Oversoul" and st~="Hydra" then DarkText(st,bx,ty); ty=ty+25 end
            end           
        end  
     end
     Image.SetAlphaPC(100)
end

function DrawFighter(g,i)
     -- Drawing the char itself
     local chdata = Fighters[g][i]
     local mx,my = MouseCoords()
     local fx,fy = FighterCoords(g,i)
     dfomx,dfomy = dfomx or mx, dfomy or my
     color ( chdata.R or 255, chdata.G or 255, chdata.B or 255)
     if flow=='playerselectsingletarget' and nextact and nextact.group==g and mx>fx-16 and mx<fx+16 and my>fy-64 and my<fy and mx~=dfomx and my~=dfomy then 
        nextact.targetidx=i
     end
     if upper(chdata.fidtag)=='BOSS/VANDAR' then
        local ms = Time.MSecs()/5000
        local r = math.ceil(math.abs(math.sin(ms+1500)*255))
        local g = math.ceil(math.abs(math.sin(ms+3000)*255))
        local b = math.ceil(math.abs(math.cos(ms+4500)*255))
        color(r,g,b)
     end
     
     if targetted then
        local c=200+(sin(Time.MSecs()/250)*55)
        color(c,255-c,0)
     end
     local altdraw = false
     for st,stdat in pairs(chdata.StatusChanges or {}) do
         -- CSay(st) -- Debugline. Slows the system down like crazy, so must be in comment form when not used.
         altdraw = altdraw or stdat.DrawReplace;
         (stdat.DrawFighter or Nothing)(chdata.tag)
     end    
     if not altdraw then ({Foe=DrawFoe,Hero=DrawHero})[g](i) end -- Perhaps I need to do this otherwise, if there are serious performance issues.
     -- Show damage or other messages if any
     local shdata = chdata
     if c_dragon and prefixed(chdata.tag,"FOE_")then
        shdata={}
        shdata.x = SW/4
        shdata.y = SH-(SH/3)
     end 
     if array_charmessages and array_charmessages[chdata.tag] and array_charmessages[chdata.tag][1] then
        local acma = array_charmessages[chdata.tag]
        local acm=acma[1]
        --SetFont('CombatCharMessage')
        local fn = fonts['CombatCharMessage'][1]
        acm.fs = acm.fs or 1 -- fonts['CombatCharMessage'][2] * (acm.scale/100); fs = math.ceil(fs)
        --Image.ScalePC(acm.scale,acm.scale)
        Image.Font("fonts/"..fn,acm.fs) 
        --if shdata.x<10 then shdata.x = 100 end
        local usex=shdata.x
        if usex<50 then usex=125 end
        DarkText(acm.msg,usex,shdata.y-30,2,1,acm.r,acm.g,acm.b)
        -- Image.ScalePC(100,100)
        --if acm.scale<100 then 
        --   acm.scale = acm.scale + 1
        if acm.fs<fonts['CombatCharMessage'][2] then
           acm.fs = acm.fs + 1
        elseif #acma>1 or acm.time<=0 then
           table.remove(acma,1)
        else
           acm.time = acm.time - 1       
        end
     end
     TargetedInfo(g,i)
end

function DrawFighters()
  for group,grouparray in pairs(Fighters) do
      for idx,data in pairs(grouparray) do
          DrawFighter(group,idx)
      end 
  end
  if flow=='playerselectsingletarget' and nextact then
     TargetedInfo(nextact.group or 'Foe', nextact.targetindex or 1,70)
  end   
  if array_charmessages and array_charmessages.CENTER_SCREEN then
      local acma = array_charmessages.CENTER_SCREEN
      local acm=acma[1]
      if acma[1] then
        --SetFont('CombatCharMessage')
        local fn = fonts['CombatCharMessage'][1]
        acm.fs = acm.fs or 1 -- fonts['CombatCharMessage'][2] * (acm.scale/100); fs = math.ceil(fs)
        --Image.ScalePC(acm.scale,acm.scale)
        Image.Font("fonts/"..fn,acm.fs) 
        --if shdata.x<10 then shdata.x = 100 end
        --local usex=shdata.x
        --if usex<50 then usex=125 end
        DarkText(acm.msg,SW/2,SH/2,2,1,acm.r,acm.g,acm.b)
        -- Image.ScalePC(100,100)
        --if acm.scale<100 then 
        --   acm.scale = acm.scale + 1
        if acm.fs<fonts['CombatCharMessage'][2] then
           acm.fs = acm.fs + 1
        elseif #acma>1 or acm.time<=0 then
           table.remove(acma,1)
        else
           acm.time = acm.time - 1       
        end
      end
  end
end
