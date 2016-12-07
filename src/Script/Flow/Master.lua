--[[
  Master.lua
  Version: 16.12.07
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
   if (not Unlocked[id]) and cMaster.requirement and (not cMaster.requirement()) then
      MapText(upper(id).."_NOTREADY")
      return
   end   
   MapText(upper(id).."_"..sptag[Unlocked[id]==true])
   for i=0,3 do
       local ch=RPG.PartyTag(i) 
       if ch~="" and cMaster.teach(ch) then
          local i = ItemGet(Var.C('$MASTERABLCODE'))
          Var.D("$MASTERCHAR",RPG.GetName(ch))
          Var.D("$MASTERMOVE",i.Title)
          MapText(upper(id).."_LEARN")
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

function Master_Dismiss(ch,master)
   CSay("Dismiss master "..master.." from "..sval(ch))
   local stats = mysplit(RPG.StatFields(ch),";")
   for st in each(stats) do
       if prefixed(st,"MASTER_") then RPG.DelStat(ch,st) end
   end
   local tmaster = jinc('Script/JINC/Masters/'..master..".lua")
   ;(tmaster.dismiss or Nothing)(ch)
   RPG.SetData(ch,"Master","")
end

function Master_Appoint(ch,master)
    CSay("Appoint master "..master.." to "..sval(ch))
    local tmaster = jinc('Script/JINC/Masters/'..master..".lua")
    for key,value in spairs(tmaster.stats) do
        RPG.DefStat(ch,"MASTER_"..key,value)        
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
       if oldmaster~="" and oldmaster~=id then Master_Dismiss(ch,oldmaster) end
       if (not AppSet[i]) and oldmaster==id then Master_Dismiss(ch,id) end
       if AppSet[i] and oldmaster~=id then Master_Appoint(ch,id) end
   end
   LAURA.Flow('FIELD')
   MapText(upper(id).."_BYE")
end


A_Col = { [true]={255,180,0},[false]={50,50,50}}
function MAIN_FLOW()   
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
    CHW = CHW or (SW/4)
    for i=0,3 do
        if AppSet[i]~=nil then
           local C=A_Col[AppSet[i]]
           Image.Color(C[1],C[2],C[3])
           local CHX = (CHW*i)+(CHW/2)
           Image.Show(pointer,CHX,(SH-sty)-120)
           -- DarkText(CHW..";"..i..";"..sval(CHW*i)..";"..sval((SH-sty)-10),0,i*25)
           if mousehit(1) and ClickedChar(i) then AppSet[i]=not AppSet[i] end
        end
    end
    if mousehit(2) or joyhit('CANCEL') or INP.KeyH(KEY_ESCAPE)==1 then Master_EndSession() end
    ShowParty()
    ShowMouse()
    Flip()
end

