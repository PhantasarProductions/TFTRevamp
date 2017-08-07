--[[
**********************************************
  
  Rubine.lua
  (c) Jeroen Broks, 2016, 2017, All Rights Reserved.
  
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

local RPG = RPGStat

local Rubine = {}

local skill = Sys.Val(Var.C('%SKILL'))

local newgameplus = Var.C("&NEWGAMEPLUS")=="TRUE"

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

function Rubine.requirement() return true end

Rubine.abl = {
                     [ 20] = 'abl_master_rubine_pickpocket',
                     [ 40] = 'abl_master_rubine_poisonstab',
                     [ 60] = 'abl_master_rubine_invade',
                     [200] = 'abl_master_rubine_backstab',
                     [400] = 'abl_master_rubine_followme'
              }

if newgameplus then Rubine.abl[30] = 'abl_master_rubine_fastdraw' end

function Rubine.teach(ch) -- Should return true if master actually decides to teach something
    local all = true
    local maylearn = true
    local rabl = false
    for truereq,abl in pairs(Rubine.abl) do -- DEFINITELY NOT ipairs!!!!!
        local req = truereq*(skill-1)
        if maylearn and RPG.Stat(ch,"RubinePoints")>=req and (not Done('&MASTER.RUBINE.'..ch.."."..abl)) then
           Console.Write(RPG.Stat(ch,"RubinePoints")..">="..req.." so let's teach!",180,255,0)
           maylearn=false
           rabl=abl
        else
           all = all and CVV('&MASTER.RUBINE.'..abl)   
        end   
    end
    return rabl,all
end

function Rubine.appoint(ch)
      Console.Write('Creating point for Rubine on '..ch,255,255,255)
      Master_DefStat(ch,"RubinePoints",0)
end

function Rubine.dismiss(ch)
     RPG.DelStat(ch,"RubinePoints")
end


Rubine.stats = {
                      -- Spd +25%, Atk -10%, End -5%, Int -10%, Res - 5%, Acc +5%, eva +5%
                      Speed = 25,
                      Power = -10,
                      Endurance = -10,
                      Intelligence = -10,
                      Resistance = -10,
                      Accuracy = 5,
                      Evasion = 5
               }

Rubine.Desc = {"Rubine is a female thief","She rewards the ability to find money","You score a point each time you find money","Score enough points to learn new skills","","While you study under Rubine,","there is 1 to "..math.abs((skill*2)^2).." chance","an attack can be completely voided"}

function Rubine.ShowScore(ch)
     return RPGStat.Stat(ch,"RubinePoints")
end

return Rubine
