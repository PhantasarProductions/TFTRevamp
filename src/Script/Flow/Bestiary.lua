--[[
  Bestiary.lua
  Version: 17.07.05
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

mx,my=0,0

--local loaded = {}
local order = {}
local bestiary = {}
local PM=0
local P=1

local STATS = {'HP','Power','Endurance','Intelligence','Resistance','Accuracy','Evasion'}
local PRC = {Accuracy='%',Evasion='%'}
local ELEM = {'Flame','Wind','Water','Earth','Frost','Lightning','Light','Darkness'}

function getenemy(k)
   local f = JINC('Script/JINC/Foes/'..k..".lua")
   return f
end   

function Update()
   Cls()
   Loading()
   MS.Load('COMBAT',"Script/Flow/Combat.lua")
   MS.Run('COMBAT','TransferBestiary')
   MS.Destroy('COMBAT')
   local succ,bget = pcall(loadstring,Var.C('$TRANSFER.BESTIARY'))
   if not succ then Cls() Image.DText("Error:"..bget) Flip() Time.Sleep(2500) LAURA.Flow('FIELD') end
   local bst = bget() 
   -- This overrides the normal config, I know, but at least no conflicts will come along the way now.    
   SW = Screen.Width()
   SH = Screen.Height()    
   local temp = {}
   for k,v in pairs(bst) do temp[#temp+1]={k=k,killed=v} end
   for i,d in pairs(temp) do
       Cls()
       Image.NoFont()
       Color(255,180,0)
       Image.Text(0,0,"Loading enemy data")
       Color(0,180,255)
       Image.Text(0,20,math.ceil((i/#temp)*100).."%")
       Flip()
       bestiary[d.k] = bestiary[d.k] or { key = d.k }
       bestiary[d.k].killed = d.killed
       bestiary[d.k].data = bestiary[d.k].data or getenemy(d.k)
   end
   local o = {}
   order = {}
   for k,d in pairs(bestiary) do o[d.data.Name] = k end
   for n,k in spairs(o) do order[#order+1]=bestiary[k] end
end


function MAIN_FLOW()
    local bw1 = math.floor(Sys.Val(SW)*.25)
    local bw2 = Sys.Val(SW)-bw1
    local bh1 = SH - 100
    local bh2 = bh1
    mx,my = GetMouse()
    -- Enemy list
    box(0,0,bw1,bh1)
    Scroller('MONSTERLIST',10,10,bw1-20,bh1-20)
    local y = 0
    for i,d in ipairs(order) do
        SetFont('BoxTextContent')
        local r,g,b=255,255,255
        if i==P then 
           r,g,b=255,180,0
           DarkText("Killed: "..sval(d.killed),bw1-20,y,1,0,0,180,255) 
        end
        DarkText(d.data.Name,0,y,0,0,r,g,b)
        y = y + 25
        ScrollMax('MONSTERLIST',y+50)
    end
    EndScroller('MONSTERLIST')
    -- Enemy data
    local d=order[P]
    if oldP~=P then 
       oldP=P
       Image.Load(d.data.Image,'BESTIMAGE')
       Image.Hot('BESTIMAGE',Image.Width('BESTIMAGE'),0)
    end    
    local x = bw1+10
    local y = 10
    setfont("BestiaryHeader")    
    box(bw1,0,bw2,bh2)
    white()
    Image.Show('BESTIMAGE',(bw1+bw2)-20,y)
    DarkText(d.data.Name,x,y,0,0,255,180,0)
    local desc = mysplit(d.data.Desc,"\n")
    local fs=20
    local ok
    for dl in each(desc) do
        ok=false
        repeat      
          --Sys.Alert('fs = '..fs)
          Image.Font('Fonts/Coolvetica.ttf',fs)
          if Image.TextWidth(dl)>bw2-30 then fs=fs-1 else ok=true end
        until ok           
        --Sys.Alert('end')
    end
    local dy=30
    for dl in each(desc) do
        DarkText(dl,x,dy,0,0,255,255,255)
        dy = dy + Image.TextHeight(dl)
    end    
    setfont('Stats')
    local sy=(bh2-40)-(#STATS*22)
    local smid = bh2/2
    local snx = math.floor(smid*.75)
    for i,st in ipairs(STATS) do
        DarkText(st,bw1+10,sy+(i*22),0,0,255,255,255)
        local nrm,ovs
        if d.data.Boss then
           ovs=""
           nrm="---"
        else
           nrm=d.data["normal_"..st] or 0
           ovs=""
           if d.data.Oversoul then ovs=d.data["oversoul_"..st] or 0 end
        end
        DarkText(nrm..(PRC[st] or ''),bw1+snx ,sy+(i*22),1,0,255,180,0)
        if ovs~="" then DarkText(ovs..(PRC[st] or ''),bw1+smid,sy+(i*22),1,0,0,180,255) end
    end
    local ey=(bh2-40)-(#ELEM*22)
    local ex=smid+bw1+40
    for i,el in ipairs(ELEM) do    
        local iy = ey + (i*22)
        DarkText(el,ex,iy,0,0,255,255,255)
        local r,g,b,m
        local er = d.data['ER_'..el] or 0
        if er<-200 then
           r,g,b=255,0,0
           m = "!! FATAL !!"
        elseif er<0 then
           r,g,b=255,180,50
           m = "Weak "..math.abs(er).."%"
        elseif er>100 then
           r,g,b=180,255,0
           m = "Absorbs "..math.abs(er-100).."%"
        elseif er==100 then
           r,g,b=80,80,80
           m = "Immune"
        elseif er>0 then
           r,g,b = 180,0,255
           m = "Resists "..er.."%"
        else
           m = "--"
           r,g,b=255,255,255
        end
        DarkText(m,SW-30,iy,1,0,r,g,b)                
    end
    -- Get out
    if INP.MouseH(2)==1 or INP.KeyH(KEY_ESCAPE)==1 or joyhit('CANCEL') then LAURA.Flow('FIELD') end
    -- Keyboard and joypad
    if (INP.KeyH(KEY_DOWN)==1 or joyhit('DOWN')) and P<#order then P=P+1 end
    if (INP.KeyH(KEY_UP  )==1 or joyhit('UP')  ) and P>     1 then P=P-1 end
    -- Finishing touches
    ShowParty()
    ShowMouse()
    Flip()
end
