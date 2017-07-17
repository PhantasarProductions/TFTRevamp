--[[
**********************************************
  
  Fandalora.lua
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
 
version: 17.07.17
]]
local RPG = RPGStat

local Fandalora = {}

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

function Fandalora.AllPoints(ch)
   local deler = 0
   local totaal = 0
   local chcheck = {Jake_Human={2,3,4,5},Marrilona={1,2,3,4,5},HandoStillor={2}}
   for tch,skills in pairs(chcheck) do     
       for _,d in ipairs(skills) do
           local keer = 1
           if tch == ch then keer = keer + 1 end
           for i=1,keer do 
               deler = deler + 1
               if RPG.PointsExists(tch,"SK_LVL_"..d)==1 then totaal = totaal + RPG.Points(tch,"SK_LVL_"..d).Have end
           end
       end
   end
   if deler==0 then deler=1 end -- Should prevent errors, although deler being 0 should be impossible.
   local gemiddelde = math.floor(totaal/deler)
   local gained = 0
   if ch and RPG.GetData(ch,"Master")=="Fandalora" then
      local gained = gemiddelde - RPG.SafeStat(ch,"StartFandalora")
   end
   return totaal,gemiddelde
end

function Fandalora.requirement() return true end

Fandalora.abl = {
                    [10] = 'abl_master_fandalora_darkness',
                    [15] = 'abl_master_fandalora_removecurse',
                    [20] = 'abl_master_fandalora_curse',
                    [25] = 'abl_master_fandalora_removecurse',
                    [30] = 'abl_master_fandalora_phantom',
                    [11+(skill^skill)] = 'abl_master_fandalora_void'                    
              }

Fandalora.abl[(3^skill)+5] = 'abl_master_fandalora_death' 

function Fandalora.teach(ch) -- Should return true if master actually decides to teach something
    local all = true
    local maylearn = true
    local rabl = false
    if ch=='Dandor' then return false,false end
    local points = Fandalora.ShowScore(ch)
    for i,a in pairs(Fandalora.abl) do
        if points>=i and (not rabl) then 
           if not Done('&MASTERLEARNING.FANDALORA['..a..']['..ch..']') then rabl=a 
           else all = all and CVV('&MASTERLEARNING.FANDALORA['..a..']['..ch..']') end
        else 
           all=false    
        end
    end
    return rabl,all
end

function Fandalora.appoint(ch)
      Console.Write('Creating point for Fandalora on '..ch,255,255,255)
      local start,troep = Fandalora.AllPoints()
      Master_DefStat(ch,"StartFandalora",start)
end

function Fandalora.dismiss(ch)
     RPG.DelStat(ch,"StartFandalora")
end


Fandalora.stats = {
                      -- Str -25%, End -15%, Int +25%, Res +15%                                            
                      Power = -25,
                      Endurance = -15,
                      Intelligence = 15,
                      Resistance = 15,
               }

Fandalora.Desc = {"Marrilona's father","Expert on dark magic and defense against it","May teach you some darker spells","Because you may need them"}

function Fandalora.ShowScore(ch)
     if ch=="Dandor" then return "N/A" end
     local tot,ret=Fandalora.AllPoints(ch)
     return ret
end

return Fandalora
