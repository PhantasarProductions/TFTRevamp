--[[
  Party.lua
  Version: 16.12.02
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

LC = LAURA.LauraStartUp -- Quick reference to get the LAURA start up configuration. Yes, I know, I'm lazy!

function GALE_OnLoad()
    totalwidth  = SW
    totalheight = SH
    origin = {0,0}
    if tonumber(LC('screen.margin.left')  )~=0 then origin[1] = 25; totalwidth=totalwidth -25 end
    if tonumber(LC('screen.margin.top')   )~=0 then origin[2] = 25; totalwidth=totalheight-25 end
    if tonumber(LC('screen.margin.right') )~=0 then                 totalwidth=totalwidth -25 end
    if tonumber(LC('screen.margin.bottom'))~=0 then                 totalwidth=totalheight-25 end
    charentrywidth = totalwidth / 4
end

function ShowMargins()
    black()
    if tonumber(LC('screen.margin.left')  )~=0 then Image.Rect(    0,    0,25,SH) end
    if tonumber(LC('screen.margin.top')   )~=0 then Image.Rect(    0,    0,SW,25) end
    if tonumber(LC('screen.margin.right') )~=0 then Image.Rect(SW-25,    0,25,SH) end
    if tonumber(LC('screen.margin.bottom'))~=0 then Image.Rect(    0,SH-25,SW,25) end  
end

function ShowParty()
   local sy=(totalheight-100)+origin[2]
   local sx=origin[1]
   local ch
   local bsx 
   local imgtag
   -- yes 3 for loops are required. Otherwise stuff might overlap each other, taking its toll on the readablitiy of the most vital stats of an RPG Game.
   
   -- Draw the boxes
   for i=0,3 do
       Box(sx+(i*charentrywidth),sy,charentrywidth,100)
   end
   -- Draw the portraits
   for i=0,3 do if RPGStat.PartyTag(i)~="" then
       ch = RPGStat.PartyTag(i)
       bsx = sx+(i*charentrywidth)
       imgtag = RPGStat.GetData(ch,"Face")
       white()
       Image.LoadNew("CL_FACE_"..ch,"GFX/Boxtext/Portret/"..imgtag.."/General.png")
       Image.Show("CL_FACE_"..ch,bsx,(totalheight-origin[2])-Image.Height("CL_FACE_"..ch))
   end end
   -- Draw the levels
   for i=0,3 do if RPGStat.PartyTag(i)~="" then
       ch = RPGStat.PartyTag(i)
       local lv = RPGStat.Stat(ch,'Level')
       local lvx,lvy = 3,sy+97
       if lv<=CVV('%LEVELCAP') then
          SetFont('Lv1')
          DarkText("Lv",lvx,lvy,0,1,255,255,255)
          lvx = lvx + Image.TextWidth("Lv")
          SetFont('Lv2')
          DarkText(lv,lvx,lvy,0,1,255,180,0)          
       end
   end end  
   -- Draw the statbars and numbers
   SetFont('Stats')
   local sg,P,breuk,bar,barx,barwidth
   for i=0,3 do if RPGStat.PartyTag(i)~="" then
       ch = RPGStat.PartyTag(i)
       bsx = sx+(i*charentrywidth)
       barx = bsx + 100
       barwidth = charentrywidth-110
       -- HP
       P = RPGChar.Points(ch,'HP')
       breuk = P.Have / P.Maximum
       sg = breuk * 255
       bar = breuk * barwidth
       Image.Color(50,50,50)
       Image.Rect(barx,sy+25,barwidth,10)
       Image.Color(255-sg,sg,0)       
       Image.Rect(barx,sy+25,bar,10)
       DarkText("HP",barx,sy+35,1,1,255-sg,sg,0)
       DarkText(P.Have,barx+barwidth,sy+35,1,1,255-sg,sg,0)
       -- AP
       P = RPGChar.Points(ch,'AP')
       breuk = P.Have / P.Maximum
       bar = breuk * barwidth
       Image.Color(50,50,50)
       Image.Rect(barx,sy+50,barwidth,10)
       Image.Color(0,0,255)       
       Image.Rect(barx,sy+50,bar,10)
       DarkText("AP",barx,sy+60,1,1,0,180,255)
       DarkText(P.Have,barx+barwidth,sy+60,1,1,0,180,255)
       -- Vitality
       P = RPGChar.Points(ch,'VIT')
       breuk = P.Have / P.Maximum
       bar = breuk * barwidth
       Image.Color(50,50,50)
       Image.Rect(barx,sy+75,barwidth,10)
       Image.Color(255,100,0)       
       Image.Rect(barx,sy+75,bar,10)
       DarkText("VIT",barx,sy+85,1,1,255,180,0)
       DarkText(P.Have.."%",barx+barwidth,sy+85,1,1,255,180,0)
   end end
   ShowMargins()
   white()
end

function SyncLevel(ch)
local linenumber,line,l
local ls,cs,clv
local lext = 0
local t
local lv=RPGStat.Stat(ch,"Level")
--[[ No value here
if lv>=100 then
   t = ""..lv
   lext = left(t,len(t)-2)
   end   
CSay("Getting stats for "..ch.." for "..lv.." from series "..lext)
]]   
for linenumber,line in ipairs(jcr6listfile("Data/CharStats/"..ch)) do
    l = Str.Trim(line)    
    ls = mysplit(l," ")
    if l~="" and ls[1]~="REM" then
       if #ls<2 then CSay("WARNING! Wrongly setup line in char "..ch.." file "..lext.." line #"..linenumber) return end
       cs = mysplit(ls[1],".")
       if ls[1]=="LEVEL" then clv = Sys.Val(ls[2])
       elseif cs[1]=="STAT" and clv==lv then
          RPGChar.DefStat(ch,"BASE_"..cs[2],Sys.Val(ls[2]))
          CSay("Char "..ch.." BASE_"..cs[2].." is now "..Sys.Val(ls[2]))
          end
       end
    end
end

function GrabLevel(ch,lv)
  RPGChar.DefStat(ch,"Level",lv)
  SyncLevel(ch)
end      


function CreateChar(ch,name)
  -- Create
  RPGChar.CreateChar(ch)
  -- Name
  RPGChar.SetName(ch,name or ch)
  -- Stats  
  local stats = {'Power','Endurance','Intelligence','Resistance','Speed','Accuracy','Evasion',"Counter","Critical",'HP','AP',"SR_Poison","SR_Disease","SR_Silence",'SR_Sleep','SR_Paralysis','SR_Death','SR_Destruction','SR_Curse','ER_None','ER_Flame','ER_Frost','ER_Water','ER_Wind','ER_Earth','ER_Thunder','ER_Darkness','ER_Light'}
  local works = {'BASE','BUFF','EQP','POWERUP','END'}
  for st in each(stats) do
      for w in each(works) do
          RPGChar.SetStat(ch,w.."_"..st,0)
          if prefixed(st,"SR_") then RPGChar.SetStat(ch,w.."_"..st,100-(25*skill)) end
      end
      RPGChar.ScriptStat(ch,"END_"..st,"Script/Char/Char.lua",upper(st))
  end
  -- Points
  RPGChar.Points(ch,"HP",1).MaxCopy="END_HP"
  RPGChar.Points(ch,"AP",1).MaxCopy="END_AP"
  RPGChar.Points(ch,"VIT",1).Maximum=100
  -- Experience
  RPGChar.SetStat(ch,"Level",1)
  RPGChar.SetStat(ch,"EXP",1000*(skill/2))
  SyncLevel(ch)          
  -- Maxout
  local cp
  for p in each({'HP','AP','VIT'}) do
      cp = RPGChar.Points(ch,p,1)
      cp.Have = cp.Maximum
  end
  -- Portrait
  RPGStat.SetData(ch,'Face',ch)
end

function ClickedChar(ch,dump)
   local sy=(totalheight-100)+origin[2]
   local sx=origin[1]
   local minx = sx+(Sys.Val(ch)*charentrywidth)
   local miny = sy
   local maxx = charentrywidth+sx
   local maxy = miny+100
   local muisx,muisy = GetMouse()
   local ret = muisx>=minx and muisx<=maxx and muisy>=miny and muisy<=maxy
   if dump then Var.D("&CLICKEDCHAR",upper(sval(ret))) end
   return ret
end


function Party(...)
RPGChar.NewParty(4)
if #arg>6 then Sys.Error("Party too big "..#arg) end
local ak,v
CSay("Initiating party...")
for ak,v in ipairs(arg) do
    CSay("Position #"..ak..": "..v)
    if RPGChar.CharExists(v)==0 then CreateChar(v) end
    CSay("Updating party")
    RPGChar.SetParty(ak-1,v) -- Remember for Lua everything starts at 1, but for nearly every other language (including BlitzMax) everything starts at 0.
    CSay("All done... next") 
    end    
end
