--[[
**********************************************
  
  ShowParty.lua
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
 
version: 17.01.03
]]

ShowParty = ShowParty or function() 
  MS.LN_Run('PARTY','Script/Subs/Party.lua','ShowParty')
end  

Party = Party or function(p)
  MS.LN_Run('PARTY','Script/Subs/Party.lua','Party',p)
end

function CountPartyMembers()
  local ret = 0
  for i=0,3 do
      if RPG.PartyTag(i)~="" then ret = ret + 1 end
  end
  return ret
end      

function PartyTable(truenum)
  local tn = { [true] = 0, [false]=1}
  local plus = tn[truenum~=false and truenum~=nil]
  local ret = {}  
  for i=0,3 do
      if RPG.PartyTag(i)~="" then ret[i+plus] = RPG.PartyTag(i) end
  end
  return ret  
end

ClickedChar = ClickedChar or function(num)
   MS.LN_Run('PARTY','Script/Subs/Party.lua','ClickedChar',num..";DUMP")
   local ret = CVV("&CLICKEDCHAR")
   Var.Clear("&CLICKEDCHAR")
   return ret
end

function Recover(ch,full)
   RPG.Points(ch,"HP").Have = RPG.Points(ch,"HP").Maximum
   if skill==1 or full then
      RPG.Points(ch,"AP" ).Have = RPG.Points(ch,"AP" ).Maximum
   end   
   if skill<=2 or full then
      RPG.Points(ch,"VIT").Have = RPG.Points(ch,"VIT").Maximum
   end   
   if skill==3 then
      RPG.Points(ch,"AP").Have = 0
   end      
end

function PartyRecover(full)
   for i=0,3 do
       local ch = RPG.PartyTag(i)
       if ch~="" then Recover(ch,full) end
   end    
end


function iParty()
   local i=-1
   return function()
       i = i + 1
       if i>3 then return end
       local ret = RPG.PartyTag(i)
       if ret=="" then return end
       return i,ret        
   end
end


function EachParty()
   local i=-1
   return function()
       i = i + 1
       if i>3 then return end
       local ret = RPG.PartyTag(i)
       if ret=="" then return end
       return ret        
   end
end
EachChars=EachParty

function InParty(pch,pure)
   local ret
   for ich in EachParty() do
       if prefixed(pch,"Jake") and prefixed(ich,"Jake") and (not pure) then return true end
       ret = ret or pch==ich
   end
   return ret 
end

function MarrilonaLow()
   local H = RPG.Points("Marrilona",'HP')
   local P = H.Have/H.Maximum
   return P<.15/skill
end

function RecoverySpot()
   SFX('Audio/Sfx/SpellAni/Heal.ogg')
   PartyRecover(false)     
end
NewParty = Party

function Shift(pform)
   local chi,current
   local form = pform
   for i,ch in iParty() do
       if prefixed(ch,"Jake_") then chi=i current=right(ch,#ch-5) end
   end
   if current==pform then return end
   if not form then if current=='Human' then form='Fairy' else form='Human' end end
   if RPG.CharExists('Jake_'..form)==0 then return end
   RPGChar.SetParty(chi,'Jake_'..form)
   TurnPlayer('South')
   MS.LN_Run('PARTY','Script/Subs/Party.lua','SyncLevel',"Jake_"..form)
   local j_old = RPG.Points('Jake_'..current,'HP')
   local j_new = RPG.Points('Jake_'..form   ,'HP')
   local j_prc = j_old.Have / j_old.Maximum
   j_new.Have = j_new.Maximum * j_prc
   j_old = RPG.Points('Jake_'..current,'AP')
   j_new = RPG.Points('Jake_'..form   ,'AP')
   j_prc = j_old.Have / j_old.Maximum
   j_new.Have = j_new.Maximum * j_prc
   return true
end


function Eyes(pch,x,y)
    local ch = pch
    if prefixed(ch,"Jake") then ch="Jake" end 
    Image.LoadNew('EYES_'..ch,"GFX/EYES/"..ch..".png")
    Image.Show('EYES_'..ch,x,y)
end    
