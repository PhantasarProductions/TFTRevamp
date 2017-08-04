--[[
**********************************************
  
  Feenalaria.lua
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
 
version: 17.08.04
]]
local RPG = RPGStat

local Feenalaria = {}

local skill = Sys.Val(Var.C('%SKILL'))



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

function Feenalaria.requirement() return true end

Feenalaria.abl = {
                    [ 25]='abl_master_feena_magmablast',
                    [ 40]='abl_master_feena_cocytus',
                    [ 50]='abl_master_feena_drown',
                    [ 60]='abl_master_feena_megaquake',
                    [ 70]='abl_master_feena_katrina',
                    [ 80]='abl_master_feena_scylla',
                    [200]='abl_master_feena_fullpower'
                  
              }


function Feenalaria.teach(ch) -- Should return true if master actually decides to teach something
    if ch=="Dandor" then return end
    local all = true
    local maylearn = true
    local rabl = false
    for truereq,abl in pairs(Feenalaria.abl) do -- DEFINITELY NOT ipairs!!!!!
        local req = truereq*(skill-1)
        if maylearn and RPG.Stat(ch,"FeenalariaPoints")>=req and (not Done('&MASTER.FEENALARIA.'..ch.."."..abl)) then
           Console.Write(RPG.Stat(ch,"FeenalariaPoints")..">="..req.." so let's teach!",180,255,0)
           maylearn=false
           rabl=abl
        else
           all = all and CVV('&MASTER.FEENALARIA.'..abl)   
        end   
    end
    return rabl,all
end

function Feenalaria.appoint(ch)
      Console.Write('Creating point for Feenalaria on '..ch,255,255,255)
      Master_DefStat(ch,"FeenalariaPoints",0)
end

function Feenalaria.dismiss(ch)
     RPG.DelStat(ch,"FeenalariaPoints")
end


Feenalaria.stats = {
                      -- HP -50%, AP+200%, Str -50%, Int +200%, Res +200%; Spd -10%; Eva -200% End-75%
                      HP=-50,
                      AP=200,
                      Power=-50,
                      Intelligence=200,
                      Resistance=200,
                      Speed=-10,
                      Evasion=-200,
                      Endurance=-75
               }

Feenalaria.Desc = {"Nostramantu's wife","Despite her merriage, she's on your side","and she knows very powerful spells.","She'll teach you new spells","based on your victories while","apprenticing under her","","Dandor cannot learn spells from her"}

if skill~=3 then
   Feenalaria.Desc[#Feenalaria.Desc+1]=""
   Feenalaria.Desc[#Feenalaria.Desc+1]="When studying under Feenalaria"
   Feenalaria.Desc[#Feenalaria.Desc+1]="You'll recover "..math.abs(25*(3-skill)).." AP"
   Feenalaria.Desc[#Feenalaria.Desc+1]="At the start of each turn"
end   


function Feenalaria.ShowScore(ch)
     if ch=="Dandor" then return "Can't learn" end
     return RPGStat.Stat(ch,"FeenalariaPoints").." victories"
end

return Feenalaria
