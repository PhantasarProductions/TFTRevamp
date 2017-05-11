--[[
  PlayWithPoints.lua
  Version: 17.05.10
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
-- @IF IGNORE
SpellScript = {}
-- @FI

function SpellScript.PointAlter(tartag,extag,param)
    local sp = mysplit(param," ")
    if RPG.PointsExists(tartag,sp[1])==0 then return end
    local p = RPG.Points(tartag,sp[1])
    p.Have = (({ RAND = function (p) return rand(1,p.Maximum) end,
                 MAX = function(p) return p.Maximum end})[upper(sp[2])] or function(p,tp) return Sys.Val(tp) end)(p,sp[2])
    CSay(tartag.."'s "..sp[1].." is now "..p.Have)
    if (not prefixed(tartag,"FOE_")) and prefixed(sp[1],"SL_EXP_") then IncSkill(tartag,Sys.Val(right(sp[1],1)),0)                 end
    return true
end

function SpellScript.MultiPointAlter(tartag,extag,paramsequence)
   for seq in each(mysplit(paramsequence,";")) do SpellScript.PointAlter(tartag,extag,seq) end
   return true
end   

function SpellScript.RecoverAP(tartag,extag,param)
   local n = Sys.Val(param)
   RPG.Points(tartag,'AP').Inc(n)
   return true
end   

function SpellScript.APNUL(tartag,extag,param)
   RPG.Points(tartag,'AP').Have=0
   if param and param~="" then
      charmsg(tartag,param,255,0,0)
   end
   return true
end   

function SpellScript.APFull(tartag,extag,param)
   local a = RPG.Points(tartag,'AP')
   a.Have = a.Maximum
   if param and param~="" then
      charmsg(tartag,param,0,180,255)
   end
end
   
function SpellScript.Disintegrate(tartag,extag)
   local thp = RPG.Points(tartag,'HP')
   local ehp = RPG.Points( extag,'HP')
   local foe = prefixed(tartag,'FOE_')
   if (not foe) and skill==1 and rand(1,10)<5 then return end -- In the easy mode you're not disintegrated that easily.
   if rand(0,thp)>rand(0,ehp) then
      SetStatus(tartag,'Death')
      charmsg(tartag,"!! DISINTEGRATED !!",255,0,0)
      return true
   end
end

function SpellScript.Resurrect(tartag,extag)
   if prefixed(tartag,"FOE_") then return end -- Not usable on foes
   local t = fighterbytag[tartag]
   if not t.statuschanges then return end -- No crashes :P
   if not t.statuschanges.Death then return end -- This only works when you are dead.
   ClearTable(t.statuschanges)
   SpellScript.PointAlter(tartag,extag,'MAX')
   charmsg(tartag,"RESURRECTION",0,255,0)
end   

function SpellScript.Gravity(tar,exe)
   local procent
   if prefixed(tar,"FOE_") then
      procent = ({.75,.50,.25})[skill]
   else 
      procent = ({.25,.50,.75})[skill]
   end   
   hp = RPG.Points(tar,'HP')
   dmg = math.floor(hp.Have*procent)
   Hurt(tar,dmg)
end
   
-- @IF INGORE
return SpellScript 
-- @FI
