--[[
**********************************************
  
  Midas.lua
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
 
version: 17.08.07
]]
local Midas = {}



local skill = Sys.Val(Var.C('%SKILL'))

local RPG = RPGStat



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

function Midas.requirement() return true end


Midas.abl = {[10000]='abl_master_midas_hardforthemoney',[25000]='abl_master_midas_stealmoney'}
if skill==1 then Midas.abl = {[5000]='abl_master_midas_hardforthemoney',[15000]='abl_master_midas_stealmoney'} end

function Midas.teach(ch)
    local score = CVV('%CASH')-RPG.Stat(ch,'MidasStart')
    local min1=10000; if skill==1 then min1= 5000 end
    local min2=25000; if skill==1 then min2=15000 end
    if score<=min1 then return end
    if not(Done('&DONE.MASTER.MIDAS.'..ch..".ONE")) then return Midas.abl[min1],false end
    if score<=min2 then return end
    if not(Done('&DONE.MASTER.MIDAS.'..ch..".TWO")) then return Midas.abl[min2],true  end    
end 

function Midas.appoint(ch)
      Master_DefStat(ch,"MidasStart",CVV('%CASH'))
end

function Midas.dismiss(ch)
     RPG.DelStat(ch,"MidasStart")
end


Midas.stats = {
                   -- Acc +100% Eva+100% AP -25% HP -25%
                   Accuracy = 100,
                   Evasion = 100,
                   AP = -25,
                   HP = -25
}

function Midas.ShowScore(ch)
    local score = CVV('%CASH')-RPG.Stat(ch,'MidasStart')
    return score.." shilders"
end

Midas.Desc = {"Midas knows all about making money","Money you make while being his apprentice","may give you new skills","However, money you lose or spend WILL","be subtracted from your score","","Will he make you rich or rip you off?","","When you study under Midas","The enemies may drop more money","when they die."}


return Midas
