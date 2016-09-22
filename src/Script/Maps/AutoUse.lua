--[[
  AutoUse.lua
  Version: 16.09.21
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

-- @USEDIR Script/Use/Anyway

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
SerialBoxText("MAP",tag,mapaltMS or "BOXTEXT.KTHURA")
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

function NPC_MapText()
  TurnPlayer("North")
  MapText(upper(Var.C("$NPC_MAPTEXT")))
end


function MAPSAVE()
   MS.Run("FIELD","GotoSave") -- Dirty code straight from hell, but I was lazy :-P
end
