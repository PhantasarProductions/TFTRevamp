--[[
  AutoUse.lua
  Version: 17.02.25
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

-- @USEDIR Script/Use/Anyway

function DrawScreen(flow)
   MS.Run(flow or 'FIELD','DrawScreen')
end   

function OriMapMusic()
   local mf = Maps.GetData("Music")
   if not suffixed(upper(mf),".ogg") then mf = mf .. ".ogg" end
   Music(mf)
end

function VocalMusicStop()
   if vocals then
      Music('Sys/Silence.ogg')
   end
end
MapMusic = MapMusic or OriMapMusic 



ROOM_ME = Maps.CodeName

ThisIsAMapScript = true

-- Load the map scenario if available
function InitMapText()
MS.LoadNew("BOXTEXT","Script/Subs/BoxText.lua")
MS.Run("BOXTEXT","RemoveData","MAP")
-- Well, we MUST avoid "if"s, eh? Well, let me show you what kind of dirty code that can create.
local maptextfile = "Languages/"..Var.C("$LANG").."/Scenario/MAPS/"..Maps.CodeName
local letsgo = { 
  [0] = function() Console.Write("WARNING! No maptext found for map "..Maps.CodeName,255,180,0); Console.Write(">> "..maptextfile,0,180,255) end,
  [1] = function() MS.Run("BOXTEXT","LoadData","MAPS/"..Maps.CodeName..";MAP"); Console.Write("MapText for "..Maps.CodeName.." loaded",0,255,180) end }
local f = letsgo[JCR6.Exists(maptextfile)]
f()
-- Well, you gotta agree this could been done in a more efficient way :P
-- Oh yeah, Lua does accept 0 for an array index, it's rather that ipairs doesn't pick that up, but we didn't need ipairs anyway here :P   
-- I could not yet use the functions from BoxTextLinker, as they are not loaded on the moment this function is called, for the other functions, it doesn't matter.
end; InitMapText()

function MapText(tag,mapaltMS)
  SerialBoxText("MAP",tag,mapaltMS or "FLOW_FIELD") -- last string always ignored, but I need to make sure I can always fall back on that one.
end


-- The Zone Action routines
ZA = { Enter = {}, Leave = {}, Flow = {} }
ZAChkEnter = {}
ZAChkLeave = {}

function ZA_SetAction(Z,A,F,P)
table.insert(ZA[A],{Z = Z, F = F, P = P})
end

function ZA_Enter(Z,PF,P)
local F = PF
if F=="ALB_EXE" then F = ALB_EXE end
ZA_SetAction(Z,"Enter",F,P)
end

function ZA_Leave(Z,F,P)
ZA_SetAction(Z,"Leave",F,P)
end

function ZA_Flow(Z,F,P)
ZA_SetAction(Z,"Flow",F)
end


function ZA_Run(Z,A)
local F
for f in ipairs(ZA[Z][A]) do f() end
end

function ZA_CheckEnter(actor)
local b
local ZK,ZZ 
for ZK,ZZ in pairs(ZA.Enter) do
    if ROOM_ME==Maps.CodeName then
       b = Maps.Obj.Exists(ZZ.Z)==1 and Maps.ActorInZone(actor,ZZ.Z)==1
       if (not ZAChkEnter[ZZ.Z]) and b then 
          KillWalkArrival() 
          ZZ.F(ZZ.P) 
          end
       ZAChkEnter[ZZ.Z] = b
       end 
    end
end

function ZA_CheckLeave(actor)
local b
local ZK,ZZ 
for ZK,ZZ in pairs(ZA.Leave) do
    b = Maps.Obj.Exists(ZZ.Z)==1 and Maps.ActorInZone(actor,ZZ.Z)==1
    if Maps.Obj.Exists(ZZ.Z)==1 and ZAChkLeave[ZZ.Z] and (not b) then 
       KillWalkArrival() 
       ZZ.F(ZZ.P) 
       end
    ZAChkLeave[ZZ.Z] = b 
    end
end

function ZA_CheckFlow(actor)
local b
local ZK,ZZ 
for ZK,ZZ in pairs(ZA.Flow) do
    b = Maps.Obj.Exists(ZZ.Z)==1 and Maps.ActorInZone(actor,ZZ.Z)==1
    if b then
       KillWalkArrival() 
       ZZ.F(ZZ.P) 
       end
    end
end

ZA_Enter("Kokonora",function() WorldMap("Kokonora") end)
ZA_Enter("Delisto",function() WorldMap("Delisto") end)

function NPC_MapText()
  TurnPlayer("North")
  MapText(upper(Var.C("$NPC_MAPTEXT")))
end


function MAPSAVE()
   MS.Run("FIELD","GotoSave") -- Dirty code straight from hell, but I was lazy :-P
end

function MapHide(label,tag)
   GotoLayerAutoHide(label)
   ZA_Enter(tag or label,Maps.ShowLabel ,label)
   ZA_Leave(tag or label,Maps.HideLabels,label)
end

function Z_Go(v,spot)
   local layer = Maps.LayerCodeName
   local layn  = Sys.Val(right(layer,#layer-1))
   local nlay  = layn + v
   GoToLayer("#"..right('00'..nlay,3),spot)
end

function Z_Next() Z_Go( 1,"Start") end 
function Z_Prev() Z_Go(-1,"Einde") end

ZA_Enter("Next",Z_Next)
ZA_Enter("Prev",Z_Prev)

-- Autoboss
function AutoBossStart()
    if not Boss then return CSay("WARNING! No Boss function found in MapScript") end
    if Maps.Multi()==0 and Done("&DONE.BOSS.AUTO['"..Maps.CodeName.."']") then return
    elseif Maps.Multi()==1 and Done("&DONE.BOSS.AUTO['"..Maps.CodeName.."','"..Maps.LayerCodename.."']") then return end
    Maps.Obj.Kill("Boss",1)
    Maps.Remap()
    Boss()
end

ZA_Enter("StartBoss",AutoBossStart)


-- Inn
function RestRecover()
  local chars,foe = {},{}
  for t in ICHARS() do
    if prefixed(t,'FOE') then foe[#foe+1]=t else chars[#chars+1]=t end    
  end
  for f in each(foe) do RPG.DelChar(f) end
  for ch in each(chars) do
      RPG.Points(ch,'HP').Have = RPG.Points(ch,"HP").Maximum
      RPG.Points(ch,'VIT').Have = RPG.Points(ch,"VIT").Maximum
      RPG.Points(ch,'AP').Have = ({RPG.Points(ch,"AP").Maximum,RPG.Points(ch,"AP").Have,0})[skill]
  end
end

function SetRespawnSpot()
   local res = {
                   layer = Maps.LayerCodeName,
                   map = Maps.CodeName,
                   x = Actors.Actor('PLAYER').x,
                   y = Actors.Actor('PLAYER').y
               }
   Var.D("$SYS.RESPAWN",serialize('local respawn',res).."\nreturn respawn")            
end

function Inn(free)
  local innprice = 0
  local baseprice = {30,0,100}
  local multi = {0,5,10}
  if not free then
     innprice = baseprice[skill]
     for i=0,3 do
         if RPG.PartyTag(i)~="" then
            innprice = innprice + (multi[skill]*RPG.Stat(RPG.PartyTag(i),"Level"))
         end   
     end
  end
  Var.D("%INNPRICE",innprice)
  MapText('INN')
  local t = "INN"
  if free then t="INN_FREE" end
  local Ja = RunQuestion("INN",t)==1
  if Ja then     
     if CVV('%CASH')<innprice then
        MapText("INN_NOMONEY")
        return
     end
     dec('%CASH',innprice)
     if musicavailable then 
        StopMusic()
        SFX('Music/Gen/Sleep.ogg',"INN")
     end
     for alpha=1,100 do
         Cls()
         DrawScreen()
         black()
         Image.SetAlphaPC(alpha)
         Image.Rect(0,0,SW+100,SH+100)
         Image.SetAlphaPC(100)
         Flip()
     end    
     -- Time.Sleep(2500)
     SFXWait('INN')
     RestRecover()
     SetRespawnSpot()
     if musicavailable then
        StartMusic()
     end
  end
end

function Shop(tag,trade)
   Cls()
   Loading()
   local feat = "Shop"
   if trade then feat="ShopTrade" end
   MS.LN_Run("MENU","Script/Flow/Menu.lua","Menu_Init",feat)
   MS.Run("MENU","Shop_Load",tag)
   LAURA.Flow("MENU")
end

function BlackOrb(tag)
  inc('%ORBS')
  if CVV('%ORBS')==1 then
     MapText('TUTORIAL_BLACKORB')
     local barrier = Maps.Obj.Obj('ORB_BARRIER')
     barrier.Impassible=0
     barrier.ForcePassible=1
     Maps.PermaWrite([[local barrier = Maps.Obj.Obj('ORB_BARRIER')
     barrier.Impassible=0
     barrier.ForcePassible=1
     ]])
     Maps.Remap()
  elseif CVV('%ORBS')==255 then
     Sys.Error('Juggernaut not coded yet')     
  else
     MS.Run("BOXTEXT","LoadData","General/Items;ITEM")
     SerialBoxText("ITEM","BLACKORB","FLOW_FIELD")
  end      
  Maps.Obj.Kill(tag,1)    
end

function NPC_BlueSeal()
   SerialBoxText("BLUESEAL",'SEAL',"FLOW_FIELD")
end
 
 
function PartyPop(spot,wind,methode)
    local Walk = ({ Walk=Actors.WalkToSpot, Move=Actors.MoveToSpot})[methode or 'Walk']
    local guys = {}
    for i,guy in iParty() do        
         local a = "PLAYER"..i; if i==0 then a="PLAYER" end
         guys[#guys+1] = { ch = guy, actor=a, spot=spot.."_"..guy}
         if prefixed(guy,"Jake") then guys[#guys].spot=spot.."_Jake" end
    end
    for guy in each(guys) do
        Walk(guy.actor,guy.spot)
        CSay(guy.actor.." ("..guy.ch..") should walk to "..guy.spot)
    end
    if wind then TurnPlayers(wind) end 
    CSay(serialize('partypop.guys',guys))
end


FManaOrbRespond = { DONE = Nothing }

function FManaOrbRespond.WHO(a,ch)
    CSay("WHO: "..a)
    return ({'JAKE','MARRILONA'})[a],false
end

function FManaOrbRespond.JAKE(a,ch)
     local w = ({JAKE="Jake_Fairy",MARRILONA="Marrilona"})[ch]
     local e = a + 1
     local exp = "SK_EXP_"..e
     local lvl = "SK_LVL_"..e
     CSay("Activating "..exp.." and "..lvl)
     if e == 6 then
        FManaOrbDo="WHO"
        return nil,nil
     end
     if RPG.PointsExists(w,exp)==1 then
        CSay('Hey, you already have that one')
        SerialBoxText('MANAORB',ch.."_HAVE","FLOW_FIELD")
        FManaOrbDo="WHO"
        return nil,nil
     end
     RPG.Points(w,exp,1).Maximum=10
     RPG.Points(w,lvl,1).Maximum=1000/skill
     RPG.Points(w,lvl).Minimum=1
     RPG.Points(w,lvl).Have=1
     for i=1,5 do
         if RPG.PointsExists("Jake_Fairy","SK_EXP_"..i)==1 then RPG.LinkPoints('Jake_Fairy','Jake_Human','SK_EXP_'..i) end
         if RPG.PointsExists("Jake_Fairy","SK_LVL_"..i)==1 then RPG.LinkPoints('Jake_Fairy','Jake_Human','SK_LVL_'..i) end
     end
     return "DONE",true   
end   

FManaOrbRespond.MARRILONA = FManaOrbRespond.JAKE


function ManaOrb()
  FManaOrbDo="WHO"
  local next
  local ch
   SerialBoxText('MANAORB',"FOUND","FLOW_FIELD")
  repeat
     local answer = RunQuestion("MANAORB",FManaOrbDo) --,"FLOW_FIELD")
     ch,next = FManaOrbRespond[FManaOrbDo](answer,ch)
     FManaOrbDo = ch or FManaOrbDo 
  until next
end
