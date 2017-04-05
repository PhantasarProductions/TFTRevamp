--[[
**********************************************
  
  Russell.lua
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
 
version: 17.04.05
]]
local RPG = RPGStat

local Russell = {}

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

function Russell.requirement() return true end

Russell.abl = {
                 [  50*skill] = 'abl_master_russell_decapitate',
                 [  75*skill] = 'abl_master_russell_safeshot',
                 [ 150*skill] = 'abl_master_russell_genocide',
                 [1250*skill] = 'abl_foe_distract',
                 [  60^skill] = 'abl_foe_takeover'               
              }


function Russell.teach(ch) -- Should return true if master actually decides to teach something
    local all = true
    local maylearn = true
    local rabl = false
    for truereq,abl in pairs(Russell.abl) do -- DEFINITELY NOT ipairs!!!!!
        local req = truereq*(skill-1)
        if maylearn and RPG.Stat(ch,"RussellKills")>=req and (not Done('&MASTER.Russell.'..ch.."."..abl)) then
           Console.Write(RPG.Stat(ch,"RussellKills")..">="..req.." so let's teach!",180,255,0)
           maylearn=false
           rabl=abl
        else
           all = all and CVV('&MASTER.Russell.'..abl)   
        end   
    end
    return rabl,all
end

function Russell.appoint(ch)
      Console.Write('Creating point for Russell on '..ch,255,255,255)
      Master_DefStat(ch,"RussellKills",0)
end

function Russell.dismiss(ch)
     RPG.DelStat(ch,"RussellKills")
end


Russell.stats = {
                         -- HP +10%; AP -20%, Str -10%, Acc +100%
                          HP = 100,
                          AP = -20,
                          Endurance = -10, -- Originally power, but that seemed illogical for a master like this.
                          Accuracy = 100,
               }

Russell.Desc = {"A pirate's life for Russell","Although nobody on Phantasar knows what a 'pirate' is.","","Russell teaches moves based on how many kills you did"}

function Russell.ShowScore(ch)
     local r = RPGStat.Stat(ch,"RussellKills")
     return r .. ({[true]=' kill',[false]=' kills'})[r==1]
end

return Russell
