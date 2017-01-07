--[[
**********************************************
  
  Freya.lua
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
 
version: 17.01.07
]]

local RPG = RPGStat

local Freya = {}

local skill = Sys.Val(Var.C('%SKILL'))



local function FreyaL(ch)
       local ret = 0
       if (ch=="Jake_Fairy" or ch=='Jake_Human' or ch=='Marrilona') and RPG.PointsExists(ch,'SK_LVL_4')==1 then ret = RPG.Points(ch,'SK_LVL_4').Have 
       elseif ch=='HandoStillor' then ret = RPG.Points(ch,'SK_LVL_2').Have end
       return ret
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

function Freya.requirement() return true end -- Map script already handles this part.

Freya.abl = {
         [ 75] = 'abl_master_freya_rejuvenate',
         [150] = 'abl_master_freya_vigor',
         [200] = 'abl_master_freya_ultraheal'
}         

function Freya.teach(ch) -- Should return true if master actually decides to teach something
   local lv       = FreyaL(ch)
   local verschil = lv - RPG.Stat(ch,"FreyaInit")
   local all      = true
   local maylearn = true
   local rabl     = nil
   -- for i,a in pairs(Freya._abl) do all = all and CVV('&MASTER.FREYA.'..abl) end 
   for i,a in pairs(Freya.abl) do
       if (i<=lv or i<=verschil*((4-skill)*3)) and maylearn and (not Done('&MASTER.FREYA.'..ch.."."..a)) then 
           maylearn=false
           rabl=a
       else
           all = all and CVV('&MASTER.FREYA.'..a)
       end
   end
   return rabl,all           
end


function Freya.appoint(ch)
      local l = FreyaL(ch)
      Console.Write('Creating init point '..l..' for Freya on '..ch,255,255,255)
      Master_DefStat(ch,"FreyaInit",l)
end

function Freya.dismiss(ch)
     RPG.DelStat(ch,"FreyaInit")
end


Freya.stats = {
                      -- Str -40%, HP +100%, End -75%, Int +50%, Res -75%, Acc -80%, Eva -100%
                      Power = -40,
                      Endurance = -75,
                      Intelligence = 50,
                      Resistance = -75,
                      Accuracy = -80,
                      Evasion = -100,
                      HP = 100,
                      AP = 25
               }

Freya.Desc = {'Freya is a Fairy Healer','One of the best of her race',"She'll teach you powerful spells if you","practice water magic, or","your powers to healing gods","","Dandor cannot learn new spells here"}

function Freya.ShowScore(ch)
   if ch=="Dandor" then return "Cannot Learn" elseif ch=='HandoStillor' then return "Weniaria" else return "Water" end
end   

Freya.HideRates = true

return Freya
