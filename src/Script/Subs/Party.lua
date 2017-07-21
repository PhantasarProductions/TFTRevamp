--[[
  Party.lua
  Version: 17.07.21
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

LC = LAURA.LauraStartUp -- Quick reference to get the LAURA start up configuration. Yes, I know, I'm lazy!

lvani = {}
lvmaxexp = {}
lvupimg = Image.Load('GFX/Party/Level Up.png')
lvupimgw = Image.Width(lvupimg)
lvupimgh = Image.Height(lvupimg)
Image.Hot(lvupimg,lvupimgw/2,lvupimgh)

function GALE_OnLoad()
    totalwidth  = SW
    totalheight = SH
    origin = {0,0}
    if tonumber(LC('screen.margin.left')  )~=0 then origin[1] = 25; totalwidth =totalwidth -25 end
    if tonumber(LC('screen.margin.top')   )~=0 then origin[2] = 25; totalheight=totalheight-25 end
    if tonumber(LC('screen.margin.right') )~=0 then                 totalwidth =totalwidth -25 end
    if tonumber(LC('screen.margin.bottom'))~=0 then                 totalheight=totalheight-25 end
    charentrywidth = totalwidth / 4

end

function ShowMargins()
    black()
    if tonumber(LC('screen.margin.left')  )~=0 then Image.Rect(    0,    0,25,SH) end
    if tonumber(LC('screen.margin.top')   )~=0 then Image.Rect(    0,    0,SW,25) end
    if tonumber(LC('screen.margin.right') )~=0 then Image.Rect(SW-25,    0,25,SH) end
    if tonumber(LC('screen.margin.bottom'))~=0 then Image.Rect(    0,SH-25,SW,25) end  
end

function ToLevel(ch,tolv)
  RPG.DefStat(ch,tolv)
  local exp = RPG.Stat(ch,"EXP")
  local newexp
  newexp = EXP:ByLvl(tolv) + exp -- I don't have to loop this, since EXP up will count instantly anyway. ;)
  RPG.DefStat(ch,"Level",tolv)
  RPG.DefStat(ch,"EXP",newexp)
  SyncLevel(ch)   
end

function CheckEXP(ch)
  local exp = RPG.Stat(ch,"EXP")
  local lv  = RPG.Stat(ch,"Level")
  local cap = CVV("%LEVELCAP")
  if lv>=cap then return end -- Above the level cap? Then go away!
  lvmaxexp[ch] = lvmaxexp[ch] or EXP:ByLvl(lv+1)
  if exp<=0 then 
     ToLevel(ch,lv+1) lvani[ch] = {scx=0, time=500}
     local hp = RPG.Points(ch,"HP")
     local ap = RPG.Points(ch,"AP")
     local vt = RPG.Points(ch,"VIT")
     if skill~=3 then hp.Have = hp.Maximum vt.Have=vt.Maximum end
     if skill==1 then ap.Have = ap.Maximum end     
     SFX('Audio/Party/Level Up.ogg')     
     return 
  elseif lvmaxexp[ch] and exp>lvmaxexp[ch] then
     RPG.DefStat(ch,"EXP",lvmaxexp[ch])
  end
end

function ShowParty()
   local sy=(totalheight-100)+origin[2]
   local sx=origin[1]
   local ch
   local bsx 
   local imgtag
   p_sc = p_sc or {}
   black()
   Image.Rect(0,sy,SW,SH-sy)
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
       p_sc[ch] = p_sc[ch] or math.ceil(120/(Image.Height("CL_FACE_"..ch))*100)
       Image.ScalePC(p_sc[ch],p_sc[ch]) 
       Image.Show("CL_FACE_"..ch,bsx,(totalheight+origin[2])-120) --(totalheight+origin[2])-Image.Height("CL_FACE_"..ch))
       Image.ScalePC(100,100)
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
   -- Draw the levels
   for i=0,3 do if RPGStat.PartyTag(i)~="" then
       ch = RPGStat.PartyTag(i)
       local lv = RPGStat.Stat(ch,'Level')
       local lvx,lvy = 3+(i*charentrywidth),sy+97
       if lv<=CVV('%LEVELCAP') then
          SetFont('Lv1')
          DarkText("Lv",lvx,lvy,0,1,255,255,255)
          lvx = lvx + Image.TextWidth("Lv")
          SetFont('Lv2')
          DarkText(lv,lvx,lvy,0,1,255,180,0)   
          CheckEXP(ch)
          if lvani[ch] then
             local ani = lvani[ch]
             local tm  = ani.scx/100
             local siz = lvupimgw * tm
             local isx = i * charentrywidth
             if siz*tm<charentrywidth and ani.scx<100 then ani.scx = ani.scx + 1 end
             white()
             Image.ScalePC(ani.scx,100); Image.Show(lvupimg,isx+(charentrywidth/2),sy-5); Image.ScalePC(100,100)
             ani.time = ani.time - 1
             if ani.time<0 then lvani[ch] = nil end
          end       
       end
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

function CreateKrandar()
     RPG.LinkStat('Dandor','Krandar','BASE_Power')
     RPG.LinkStat('Jake_Human','Krandar','BASE_Endurance')
     RPG.LinkStat('HandoStillor','Krandar','BASE_Intelligence')
     RPG.LinkStat('Marrilona','Krandar','BASE_Resistance')
     RPG.LinkStat('HandoStillor','Krandar','BASE_Speed')
     RPG.SetStat('Krandar','Critical',90-(skill*30))
     RPG.LinkStat('Dandor','Krandar','BASE_HP')
     RPG.LinkStat('Marrilona','Krandar','BASE_AP')
     RPG.LinkStat('Jake_Human','Krandar','BASE_Accuracy')
     RPG.LinkStat('Marrilona','Krandar','BASE_Evasion')
     RPG.SetStat("Krandar",'Level',200000) -- Make sure Krandar will NEVER gain EXP
end

function CreateNostramantu()
     RPG.SetStat('Nostramantu','BASE_Power',40)
     RPG.SetStat('Nostramantu','BASE_Endurance',1)
     RPG.SetStat('Nostramantu','BASE_Intelligence',9999)
     RPG.SetStat('Nostramantu','BASE_Resistance',500)
     RPG.SetStat('Nostramantu','BASE_Evasion',5)
     RPG.SetStat('Nostramantu','BASE_Accuracy',95)
     RPG.SetStat('Nostramantu','BASE_HP',80000)
     RPG.SetStat('Nostramantu','BASE_AP',20000)
     RPG.SetStat("Nostramantu",'Level',200000)
     for p in each({'HP','AP','VIT'}) do
         local cp = RPGChar.Points('Nostramantu',p,1)
         cp.Have = cp.Maximum
     end
     RPG.LinkData('Marrilona','Nostramantu','EQP_Weapon')
     RPG.LinkData('Jake_Human','Nostramantu','EQP_Armor')
     RPG.LinkData('HandoStillor','Nostramantu','EQP_Acc') 
     RPG.Points('Nostramantu','SK_LVL_1',1).Maximum=500
     RPG.Points('Nostramantu','SK_LVL_1'  ).Have=500
     RPG.Points('Nostramantu',"SK_EXP_1",1).Maximum=123456789
     RPG.Points('Nostramantu','SK_EXP_1'  ).Have=0         
end


function CreateNostramantuHuman()
   local nh='Nostramantu_Human'
   RPGChar.SetName(nh,'Nostramantu')
   RPG.LinkStat('Marrilona'   ,nh,'BASE_Power')
   RPG.LinkStat('HandoStillor',nh,'BASE_Endurance')
   RPG.LinkStat('Marrilona'   ,nh,'BASE_Intelligence')
   RPG.LinkStat('Marrilona',   nh,'BASE_Resistance')
   RPG.LinkStat('Dandor'      ,nh,'BASE_Speed')
   RPG.LinkStat('Dandor',      nh,'BASE_Accuracy')
   RPG.LinkStat('Marrilona',   nh,'BASE_HP')
   RPG.Points(nh,'AP',1).Maximum=0
   for p in each({'HP','AP','VIT'}) do
         local cp = RPGChar.Points(nh,p,1)
         cp.Have = cp.Maximum
   end
   RPG.SetData(nh,'EQP_Weapon','FLASHBACK_NOSWEAPON')  
   RPG.SetData(nh,'EQP_Armor','FLASHBACK_NOSARMOR')
   RPG.LinkData('Jake_Human',nh,'EQP_Acc')  
   RPG.SetStat(nh,'Level',200000)
end

function CreateFeenaHuman()
   local fh="Feenalaria_Human"
   RPGChar.SetName(fh,"Feenalaria")
   RPG.LinkStat("Dandor",      fh,"BASE_Power")
   RPG.LinkStat("Jake_Human"  ,fh,"BASE_Endurance")
   RPG.LinkStat("Marrilona"   ,fh,"BASE_Intelligence")
   RPG.LinkStat('Marrilona',   fh,"BASE_Resistance")
   RPG.LinkStat('HandoStillor',fh,"BASE_Speed")
   RPG.SetStat(fh,'BASE_Accuracy',100)
   RPG.LinkStat('Marrilona'   ,fh,"BASE_Evasion")
   RPG.LinkStat('Dandor',      fh,"BASE_HP")
   RPG.LinkStat('HandoStillor',fh,"BASE_AP")
   for p in each({'HP','AP','VIT'}) do
         local cp = RPGChar.Points(fh,p,1)
         cp.Have = cp.Maximum
   end
   RPG.SetData(fh,'EQP_Weapon','FLASHBACK_FEENAWEAPON')  
   RPG.SetData(fh,'EQP_Armor','FLASHBACK_FEENAARMOR')
   RPG.LinkData('Marrilona',fh,'EQP_Acc')  
   RPG.SetStat(fh,'Level',200000)
end   

function LinkAllStats(original,target)
   local fieldsstring = RPGChar.StatFields(original)
   local fields = mysplit(fieldsstring,";")
   local blockpref = {'END_','EQP_'}
   CSay('- Linking Stats from '..original..' to '..target)
   for f in each(fields) do
       local allow=true
       for bpf in each(blockpref) do allow = allow and (not prefixed(f,bpf)) end
       if allow then
          CSay(" = Stat: "..f)
          RPG.LinkStat(original,target,f)
       end   
   end    
end


function LinkAllPoints(original,target)
   local fieldsstring = RPGChar.PointsFields(original)
   local fields = mysplit(fieldsstring,";")
   for f in each(fields) do
       RPG.LinkPoints(original,target,f)
   end    
end

function CreateFeenaHuman2()
   RPGChar.SetName('Feenalaria_Human2',"Feenalaria")
   local LinkData = RPG.LinkData
   LinkAllStats ('Feenalaria_Human','Feenalaria_Human2')
-- LinkAllPoints('Feenalaria_Human','Feenalaria_Human2')
   LinkData     ('Jake_Human',      'Feenalaria_Human2','EQP_Weapon')
   LinkData     ('Marrilona',       'Feenalaria_Human2','EQP_Armor')
   LinkData     ('Marrilona',       'Feenalaria_Human2','EQP_Acc')
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
          if prefixed(st,"SR_") and w=='BASE' then RPGChar.SetStat(ch,w.."_"..st,100-math.floor(33*skill)) end
      end
      if ch=='Jake_Human' then RPGChar.SetStat(ch,'BASE_SR_Paralysis',90/skill) 
      elseif ch=='Jake_Fairy' or ch=='Marrilona' then RPGChar.SetStat(ch,'BASE_SR_Curse',90/skill); RPGChar.SetStat(ch,'BASE_SR_Silence',72/skill)
      elseif ch=='Dandor' then RPGChar.SetStat(ch,'BASE_SR_Poison',90/skill) RPGChar.SetStat(ch,'BASE_SR_Disease',90/skill) 
      elseif ch=='HandoStillor' then RPGChar.SetStat(ch,'BASE_SR_Silence',90/skill) RPGChar.SetStat(ch,'BASE_SR_Undead',100) end
      RPGChar.ScriptStat(ch,"END_"..st,"Script/Char/Char.lua",upper(st))
  end
  -- Points
  RPGChar.Points(ch,"HP",1).MaxCopy="END_HP"
  RPGChar.Points(ch,"AP",1).MaxCopy="END_AP"
  RPGChar.Points(ch,"VIT",1).Maximum=100
  -- Experience
  RPGChar.SetStat(ch,"Level",1)
  RPGChar.SetStat(ch,"EXP",1000*(skill/2))
  if ch~='Krandar' and (not prefixed(ch,'Nostramantu')) and (not prefixed(ch,'Feena')) then SyncLevel(ch) end          
  -- Maxout
  local cp
  for p in each({'HP','AP','VIT'}) do
      cp = RPGChar.Points(ch,p,1)
      cp.Have = cp.Maximum
  end
  -- Portrait
  RPGStat.SetData(ch,'Face',ch)
  -- Alt chars
  if ch=="Krandar" then CreateKrandar() return end  
  if ch=='Nostramantu' then CreateNostramantu() return end
  if ch=='Nostramantu_Human' then CreateNostramantuHuman() return end
  if ch=='Feenalaria_Human' then CreateFeenaHuman() return end
  if ch=='Feenalaria_Human2' then CreateFeenaHuman2() return end
end

function ClickedChar(ch,dump)
   local sy=(totalheight-100)+origin[2]
   local sx=origin[1]
   local minx = sx+(Sys.Val(ch)*charentrywidth)
   local miny = sy
   local maxx = charentrywidth+minx
   local maxy = miny+100
   local muisx,muisy = GetMouse()
   local ret = muisx>=minx and muisx<=maxx and muisy>=miny and muisy<=maxy and RPG.PartyTag(ch)~=""
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
