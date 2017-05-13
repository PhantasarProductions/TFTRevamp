local RPG = RPGStat

local Krandar = {}

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

function Krandar.requirement() return true end -- Map script already handles this part.

Krandar.abl = {
         Jake         = 'abl_master_Krandar_5PS',
         Marrilona    = 'abl_master_krandar_catastrophe',
         Dandor       = 'abl_master_Krandar_charge',
         HandoStillor = 'abl_master_krandar_holyshit'
}         
Krandar.abl.Jake_Human = Krandar.abl.Jake
Krandar.abl.Jake_Fairy = Krandar.abl.Jake

function Krandar.teach(ch) -- Should return true if master actually decides to teach something
   local all,rabl
   local uch = upper(ch); if prefixed(uch,"JAKE") then uch="JAKE" end
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
   return Krandar.abl[chi]
end   

Krandar.HideRates = true

return Krandar
