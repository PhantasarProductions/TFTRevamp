--[[
  Master.lua
  Version: 17.01.03
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

Unlocked = Unlocked or {}
sptag = { [false]="INTRO",[true]="BACK"}
pointer = Image.Load("GFX/Algemeen/CharPointer.png")
Image.Hot(pointer,Image.Width(pointer)/2,Image.Height(pointer))

function GALE_OnLoad()
  stx = LC('screen.margin.left')
  sty = LC('screen.margin.top')
end  

function Master(id)
   cMaster = jinc('Script/JINC/Masters/'..id..".lua")
   cMaster.name = cMaster.name or id
   cMaster.id = id
   cMaster.id = id
   if (not Unlocked[id]) and cMaster.requirement and (not cMaster.requirement()) then
      MapText(upper(id).."_NOTREADY")
      return
   end   
   MapText(upper(id).."_"..sptag[Unlocked[id]==true])
   for i=0,3 do
       local ch=RPG.PartyTag(i)
       if ch~="" and RPG.GetData(ch,"Master")==id then 
          local teach,allteach = cMaster.teach(ch) 
          CSay("teach = "..sval(teach))
          CSay("alltech = "..sval(allteach))
          if teach and TeachSkill(ch,teach) then             
             local i = ItemGet(teach) --Var.C('$MASTERABLCODE'))
             Var.D("$MASTERCHAR",RPG.GetName(ch))
             Var.D("$MASTERMOVE",i.Title)
             MapText(upper(id).."_LEARN")
          end
          if allteach then 
             MapText(upper(id).."_ALL")
             Done("&MASTER.ALL."..id) 
          end
       end
   end    
   Unlocked[id] = true
   AppSet = {}
   for i=0,3 do
       local ch = RPG.PartyTag(i)
       if ch~="" then AppSet[i] = RPG.DataExists(ch,"Master")~=0 and RPG.GetData(ch,"Master")==id end
   end     
   LAURA.Flow('MASTER')   
end

function MasterEyes(mid,mdata,x,y)
    SetFont("MasterContent")
    for i,ch in iParty() do
        if RPG.GetData(ch,'Master')==mid then
           white()
           Eyes(ch,x-100,y+(i*21))
           DarkText(mdata.ShowScore(ch),x-110,y+(i*21)+20,2,1,0,180,255)
        end
    end
end


function MasterAbl(mid,mdata,x,py)
       SetFont("MasterContent")
       local y = py
       local item
       for i,a in pairs(mdata.abl) do
           y = y+20
           if not mdata.HideRates then DarkText(i,x+100,y,1,0,0,180,255) end
           item = ItemGet(a)
           DarkText(item.Title,x+110,y,0,0,255,255,255)
       end    
end



function Master_Dismiss(ch,master,nomorejake)
   CSay("Dismiss master "..master.." from "..sval(ch))
   local stats = mysplit(RPG.StatFields(ch),";")
   for st in each(stats) do
       if prefixed(st,"MASTER_") then RPG.DelStat(ch,st) CSay(' =  Flush Stat: '..st) else CSay(" = Ignore Stat: "..st) end
   end
   local tmaster = jinc('Script/JINC/Masters/'..master..".lua")
   ;(tmaster.dismiss or Nothing)(ch)
   RPG.SetData(ch,"Master","")
   if not nomorejake then
      if ch=="Jake_Human" and RPG.CharExists('Jake_Fairy')==1 then Master_Dismiss('Jake_Fairy',master,true) end
      if ch=='Jake_Fairy' then Master_Dismiss('Jake_Human',master,true) end
   end 
end

function Master_DefStat(ch,stat,value)
    RPG.DefStat(ch,stat,Sys.Val(value))
    if ch=='Jake_Human' and RPG.CharExists('Jake_Fairy')==1 then RPG.LinkStat('Jake_Human','Jake_Fairy',stat) end
    if ch=='Jake_Fairy'                                     then RPG.LinkStat('Jake_Fairy','Jake_Human',stat) end
end

function Master_Appoint(ch,master)
    CSay("Appoint master "..master.." to "..sval(ch))
    jincdebug = true -- Something went wrong here, and I need to investigate. Must be on 'rem' in release. ;)
    local tmaster = jinc('Script/JINC/Masters/'..master..".lua","local function Master_DefStat(c,s,v) MS.Run('MASTER','Master_DefStat',c..';'..s..';'..v) end")
    for key,value in spairs(tmaster.stats) do
        Master_DefStat(ch,"MASTER_"..key,value)        
    end
    (tmaster.appoint or Nothing)(ch)
   RPG.SetData(ch,"Master",master)
end

function Master_EndSession()
   local id = cMaster.id
   for i,ch in iParty(true) do
       CSay("Checking: "..i.."; "..sval(ch))
       local oldmaster = ""
       if RPG.DataExists(ch,"Master")~=0 then oldmaster = RPG.GetData(ch,"Master") end
       if oldmaster~="" and oldmaster~=id and AppSet[i] then Master_Dismiss(ch,oldmaster) end
       if (not AppSet[i]) and oldmaster==id then Master_Dismiss(ch,id) end
       if AppSet[i] and oldmaster~=id then Master_Appoint(ch,id) end
   end
   LAURA.Flow('FIELD')
   MapText(upper(id).."_BYE")
end


A_Col = { [true]={255,180,0},[false]={50,50,50}}
function MAIN_FLOW()   
    local jl,jr = joyhit(joy_left),joyhit(joy_right)
    local jp = 0
    local mx,my = MouseCoords()
    Cls()
    Box(stx,sty,SW,SH-100)
    SetFont('MasterHeader')
    DarkText(cMaster.name,20,20,0,0,255,180,0)
    SetFont("MasterContent")
    DarkText("Click characters to appoint them to this master or to dismiss them",20,80)
    local gy={120,120}
    local col={{180,255,0},{255,0,0}}
    local gx = {{20,Center_X-10},{Center_X+20,SW-100}}
    for key,value in spairs(cMaster.stats or {}) do
        local rij=1
        if value<0 then rij=2 end
        DarkText(key,gx[rij][1],gy[rij])
        DarkText(value.."%",gx[rij][2],gy[rij],1,0,col[rij][1],col[rij][2],col[rij][3])
        gy[rij]=gy[rij]+20
    end
    for i,l in ipairs(cMaster.Desc or {}) do
        DarkText(l,20,gy[1]+20+(i*20))
    end    
    MasterEyes(cMaster.id,cMaster,SW-40,40)
    MasterAbl(cMaster.id,cMaster,gx[2][1],gy[2]+20)
    CHW = CHW or (SW/4)
    for i=0,3 do
        if AppSet[i]~=nil then
           local C=A_Col[AppSet[i]]
           Image.Color(C[1],C[2],C[3])
           local CHX = (CHW*i)+(CHW/2)
           Image.Show(pointer,CHX,(SH-sty)-120)
           -- DarkText(CHW..";"..i..";"..sval(CHW*i)..";"..sval((SH-sty)-10),0,i*25)           
           if (mousehit(1) or joyhit('CONFIRM')) and ClickedChar(i) then AppSet[i]=not AppSet[i] end
           if (INP.KeyH(i+49)==1) then AppSet[i]=not AppSet[i] end
           --if mx>=CHW*i and mx<=CHW*(i+1) then jp=i end 
        end
    end
    jp = math.floor(mx/CHW)
    if      jl and jp>0 then INP.MoveMouse(((jp-1)*CHW)+(CHW/2),SH-25)
    elseif  jr and jp<3 then INP.MoveMouse(((jp+1)*CHW)+(CHW/2),SH-25) end
    if mousehit(2) or joyhit('CANCEL') or INP.KeyH(KEY_ESCAPE)==1 then Master_EndSession() end
    ShowParty()
    ShowMouse()
    Flip()
end

-- Menu overview functions
omd = nil
function MasterData(id,sizes)
     if omd~=id then OverViewMaster = jinc('Script/JINC/Masters/'..id..".lua") omd = id end
     local mymaster = OverViewMaster -- I am LAZY!!!
     SetFont('MasterHeader')
     DarkText(mymaster.name,20,20,0,0,255,180,0)
     SetFont("MasterContent")
     local gy={sizes.y+20,sizes.y+20}
     local col={{180,255,0},{255,0,0}}
     local gx = {{Center_X/2,Center_X-10},{Center_X+20,(Center_X+20)+(Center_X/2)}}
     for key,value in spairs(mymaster.stats or {}) do
         local rij=1
         if value<0 then rij=2 end
         DarkText(key,gx[rij][1],gy[rij])
         DarkText(value.."%",gx[rij][2],gy[rij],1,0,col[rij][1],col[rij][2],col[rij][3])
         gy[rij]=gy[rij]+20
     end
     for i,l in ipairs(mymaster.Desc or {}) do
        DarkText(l,100,gy[1]+20+(i*20))
     end    
     MasterAbl(id,mymaster,gx[2][1],gy[2]+20)
     MasterEyes(id,mymaster,sizes.w-20,sizes.y+20)
end

function MasterOverview(ssizes)
    local fsizes = loadstring('return '..ssizes); if not fsizes then Sys.Crash('Sizes wrong!','Sizes,',ssizes) end
    local sizes = fsizes()
    MasterPos = MasterPos or 1
    local i=0
    local c = {[true]={255,180,0},[false]={255,255,255}}
    local count = 0    
    local mx,my = MouseCoords()
    for masterid,_ in spairs(Unlocked) do
        i = i + 1
        SetFont('MastersList')
        DarkText(masterid,sizes.x+10,sizes.y+(i*15),0,0,c[i==MasterPos][1],c[i==MasterPos][2],c[i==MasterPos][3])
        if i==MasterPos then MasterData(masterid,sizes) end
        count=i
        if mx<200 and my>sizes.y+(i*15) and my<sizes.y+(i*15)+15 and mousehit(1) then MasterPos=i end
    end
    if (INP.KeyH(KEY_DOWN)==1 or joyhit(joy_down)) and MasterPos<count then MasterPos = MasterPos + 1 end
    if (INP.KeyH(KEY_UP  )==1 or joyhit(joy_up  )) and MasterPos>    1 then MasterPos = MasterPos - 1 end
    local count=1  
end    
