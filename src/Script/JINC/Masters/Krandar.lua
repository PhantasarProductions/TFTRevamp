--[[
**********************************************
  
  Krandar.lua
  (c) Jeroen Broks, 2017, All Rights Reserved.
  
  This file contains material that is related 
  to a storyline that is which is strictly
  copyrighted to Jeroen Broks.
  
  This file may only be used in an unmodified
  form with an unmodified version of the 
  software this file belongs to.
  
  You may use this file for your study to see
  how I solved certain things in the creation
  of this project to see if you find valuable
  leads for the creation of your own.
  
  Mostly this file comes along with a project
  that is for most part released under an
  open source license and that means that if
  you use that code with this file removed
  from it, you can use it under that license.
  Please check out the other files to find out
  which license applies.
  This file comes 'as-is' and in no possible
  way the author can be held responsible of
  any form of damages that may occur due to 
  the usage of this file
  
  
 **********************************************
 
version: 17.05.14
]]
local RPG = RPGStat

local Krandar = {}

local skill = Sys.Val(Var.C('%SKILL'))

local function left(txt,l)
return Str.Left(txt,l or 1)
end

local function prefixed(m,s)
   return left(m,#s)==s
end   



local function CVV(k)
local CVF = {
   ["%"] = function(k) return Sys.Val(Var.C(k)) end,
   ["&"] = function(k) return string.upper(Var.C(k))=="TRUE" or string.upper(Var.C(k))=="YES" end,
   ["$"] = function(k) return Var.C(k) end
}
local prefix = string.sub(k,1,1)
local f = CVF[prefix] or CVF["$"]
return f(k)
end


local function Done(k)
 local r = CVV(k)
 if not r then Var.D(k,"TRUE") end
 return r
end 

function Krandar.requirement() return true end -- Map script already handles this part.

Krandar.abl = {
         Jake         = 'abl_master_Krandar_5PS',
         Marrilona    = 'abl_master_krandar_catastrophe',
         Dandor       = 'abl_master_Krandar_charge',
         HandoStillor = 'abl_master_krandar_holyshit'
}         

Krandar.ablname = { Jake="Penta Power Strike",Marrilona="Catastrophe",Dandor="Charge",HandoStillor="Holy Shit!"}
--Krandar.abl.Jake_Human = Krandar.abl.Jake
--Krandar.abl.Jake_Fairy = Krandar.abl.Jake

function Krandar.teach(pch) -- Should return true if master actually decides to teach something
   local all,rabl
   local ch=pch
   local uch = upper(ch); if prefixed(uch,"JAKE") then uch="JAKE"; ch='Jake' end
   if CVV('&MASTER.KRANDAR.TEACH.JAKE') and CVV('&MASTER.KRANDAR.TEACH.MARRILONA') and CVV('&MASTER.KRANDAR.TEACH.DANDOR') and CVV('&MASTER.KRANDAR.TEACH.HANDOSTILLOR') then 
      all=true
   elseif CVV('&DONE.SEAL.'..uch..'1') and CVV('&DONE.SEAL.'..uch..'2') and (not (Done('&DONE.MASTER.KRANDAR.TEACH.'..uch))) then
      rabl = Krandar.abl[ch] 
   end    
   return rabl,all           
end


function Krandar.appoint(ch)
end

function Krandar.dismiss(ch)
end


Krandar.stats = {
                      -- HP +5% AP+5% Str+5% Int+5% End-5% Res-5%
                      Power = 5,
                      Endurance = -5,
                      Intelligence = 5,
                      Resistance = -5,
                      HP = 5,
                      AP = 5
               }

Krandar.Desc = {"Krandar is the leader of the Black Winged Fairies","Proove yourself to him by collecting","the most powerful equipment, a character can find.","He has a different spell or skill for each character."}

function Krandar.ShowScore(ch)
   local chi=ch
   if prefixed(chi,"Jake") then chi="Jake" end
   return Krandar.ablname[chi]
end   

Krandar.HideRates = true

return Krandar
