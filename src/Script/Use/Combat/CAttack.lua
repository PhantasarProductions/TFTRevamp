--[[
**********************************************
  
  CAttack.lua
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
 
version: 17.06.12
]]
function Hurt(tag,damage,element)
      local eleprot = RPG.SafeStat(tag,"END_ER_"..(element or 'None'))
      local hp  = RPG.Points(tag,'HP')
      local mod = -(eleprot/100)
      local dmg = damage 
      dmg = round(dmg + round(dmg*mod))
      fighterbytag[tag].StatusChanges = fighterbytag[tag].StatusChanges or {}
      -- alt damage routine
      for s,d in pairs(fighterbytag[tag].StatusChanges) do
          if d.HalfDamage then dmg=math.ceil(dmg/2) end
          if d.BlockHurt and dmg>=0 then dmg=0 end
      end
      -- default damage routine
      if eleprot<-200 then -- Fatal
         if dmg>0 then dmg = hp.Have end
         charmsg(tag,"DEATH!",255,0,0)
      elseif eleprot<-100 then -- Very weak
         charmsg(tag,dmg,255,0,0)
      elseif eleprot<0 then -- weak
         charmsg(tag,dmg,200,10,0)
      elseif eleprot==0 then -- No weak no defense either
         charmsg(tag,dmg,255,255,255)
      elseif eleprot<100 then -- Higher resistant
         charmsg(tag,dmg,140,140,140)
      elseif eleprot==100 then -- Immune
         dmg=0
         charmsg(tag,"NO EFFECT!",255,180,0)
      else  -- Absorb
         for k,d in pairs(fighterbytag[tag].StatusChanges ) do
             if d.BlockHeal then dmg=0 end 
         end 
         charmsg(tag,math.abs(dmg),180,255,0)                
      end
      if fighterbytag[tag].group=='Hero' then
         if  CVV('&CHEAT.GOD') then dmg=0 end -- God Mode
         RPG.Points(tag,"AP").Inc(6/skill)
      end         
      hp.Have = hp.Have - dmg -- Yeah that even works for absorb, as a negative value is then in dmg and two negatives make one positive.
      CSay(tag.." has "..hp.Have.." HP left")
      RPG.Points(tag,'HP') -- Any minimums and maximums are now taken in order automatically.
      if hp.Have<=0 then SetStatus(tag,'Death',true)
      elseif tag=="Marrilona" and CVVN("%HANDICAP.MARRILONA") then
             inc('%HANDICAP.MARRILONA',math.ceil(dmg/skill)) 
      end 
      CSay(sval(tag).." suffered "..dmg.." damage")
      if (not prefixed(tag,"FOE")) and ((not VicQ) or upper(VicQ)=="PERFECT") then VicQ="General" end      
      return dmg            
end


function Attack(act,g,i,na)
    CSay("Attack on: "..sval(g).."/"..sval(i))
    -- Init
    local ttag = Fighters[g][i].tag
    local atag = na.executor.tag
    local atk = RPG.Stat(atag,"END_"..act.Attack_AttackStat) * ((act.Attack or 100)/100)
    local def = 0 
    if act.Attack_DefenseStat~="None" then def = RPG.Stat(ttag,"END_"..act.Attack_DefenseStat) end
    -- Defense modifier based on difficulty settings
    local defmod = { Foe = {.25,.50,.75},Hero={.50,.30,.15}}
    def = def * defmod[g][skill]
    -- Damage itself
    local rate = atk-def
    local damage = rate + rand(rate/4)
    if damage<1 then damage=1 end -- Never less than 1 HP damage.
    -- Critical
    local criticalrate = 0
    local critical = false
    critical = RPG.SafeStat(atag,"END_Critical")>0 
    critical = critical and rand(0,100)<RPG.SafeStat(atag,"END_Critical")
    critical = critical or act.Attack_Desperate -- Must be last (and most be "or" in stead of "and" or this doesn't work).
    if critical then 
       damage = rand(damage,damage*2)
       charmsg(ttag,'Critical!',255,0,0) 
    end
    -- Dandor skills
    if ttag=="Dandor" and prefixed(atag,"FOE") then -- Attacks from confused allies won't count!
       if act.Attack_DefenseStat=="Power" or act.Attack_DefenseStat=="Endurance" and RPG.PointsExists("Dandor","SK_EXP_2")~=0 then RPG.Points("Dandor","SK_EXP_2").inc(damage)
       elseif act.Attack_DefenseStat=="Intelligence" or act.Attack_DefenseStat=="Resistance" and RPG.PointsExists("Dandor","SK_EXP_3")~=0 then RPG.Points("Dandor","SK_EXP_3").inc(damage) end
    end
    -- And let's put it all through now... 
    Hurt(ttag,damage,act.Attack_Element)
    local mychar = fighterbytag[ttag]
    if mychar.statuschanges then
       for s,d in pairs(mychar.statuschanges) do
           if d.AttackExpire then mychar.statuschanges[s] = nil end
       end
    end       
    return true
end
