--[[
  Execution.lua
  Version: 17.08.07
  Copyright (C) 2016, 2017 Jeroen Petrus Broks
  
  ===========================
  This file is part of a project related to the Phantasar Chronicles or another
  series or saga which is property of Jeroen P. Broks.
  This means that it may contain references to a story-line plus characters
  which are property of Jeroen Broks. These references may only be distributed
  along with an unmodified version of the game. 
  
  As soon as you remove or replace ALL references to the storyline or character
  references, or any termology specifically set up for the Phantasar universe,
  or any other univers a story of Jeroen P. Broks is set up for,
  the restrictions of this file are removed and will automatically become
  zLib licensed (see below).
  
  Please note that doing so counts as a modification and must be marked as such
  in accordance to the zLib license.
  ===========================
  zLib license terms:
  This software is provided 'as-is', without any express or implied
  warranty.  In no event will the authors be held liable for any damages
  arising from the use of this software.
  Permission is granted to anyone to use this software for any purpose,
  including commercial applications, and to alter it and redistribute it
  freely, subject to the following restrictions:
  1. The origin of this software must not be misrepresented; you must not
     claim that you wrote the original software. If you use this software
     in a product, an acknowledgment in the product documentation would be
     appreciated but is not required.
  2. Altered source versions must be plainly marked as such, and must not be
     misrepresented as being the original software.
  3. This notice may not be removed or altered from any source distribution.
]]






-- @IF IGNORE
local fflow = {}
-- @FI


fflow.SpellAni = {  [true]=function(ag,at,tg,ti,act) MS.Load("X_SPELLANI","Script/SpellAni/"..act.SpellAni..".lua") MS_Run("X_SPELLANI","SPELLANI",act.SpellAni_Arg) end, 
                    [false]=function(ag,at,tg,ti,act) 
                              SpellAni[act.SpellAni](ag,at,tg,ti,act.SpellAni_Arg) 
                              end
                 }

function AltHealing(group,i,Heal)
end

function PerformAction(act,group,i)
     CSay('Action on '..sval(group).." #"..sval(i))
     -- Set up variables
     local effect = nil
     local myfighter = Fighters[group][i]
     local myexecutor = fighterbytag[nextact.executor.tag]
     assert(myfighter,"No fighter known on this index: "..group..":"..i)
     if not myexecutor then return CSay('WARNING! No executor on tag: '..sval(nextact.executor.tag)) end
     -- Accuracy check if needed. If it fails, byebye
     if act.Attack_AllowAccuracy and (rand(1,100)>RPG.Stat(myexecutor.tag,"END_Accuracy")) then charmsg(myfighter.tag,'miss',155,155,155) return end     
     -- Dodge check if needed. If it succeeds, byebye
     if act.Attack_AllowDodge and (rand(1,100)<RPG.Stat(myfighter.tag,"END_Evasion")) then 
        charmsg(myfighter.tag,'dodged',155,155,155)
        if myfighter.group=='Hero' then RPG.Points(myfighter.tag,'AP',20-(5*skill)) end 
        return 
    end
     -- Cure status changes (this always comes first)
     for k,b in pairs(act) do
         if prefixed(k,"Cure") then
            if not ( dontcure[myfighter.tag] and dontcure[myfighter.tag][right(k,#k-4)] ) then  
               local s = right(k,#k-4)
               if myfighter.statuschanges and myfighter.statuschanges[s] then 
                  myfighter.statuschanges[s]=nil
                  effect = true
                  charmsg(myfighter.tag,'Cure:'..s,0,155,0)
               end  
            end
         end   
     end    
     -- Revive     
     myfighter.statuschanges = myfighter.statuschanges or myfighter.StatusChanges or {}
     if act.Revive and group=="Hero" and (myfighter.statuschanges.Death or RPG.Points(myfighter.tag,"HP").Have<=0) then
        ClearTable(myfighter.statuschanges) 
        RPG.Points(myfighter.tag,"HP").Have=1
        charmsg(myfighter.tag,"REVIVE",180,255,0)
     end
     -- Dispell Buffs 
     -- Recover HP or AP     
     local heal = ItemHeal(myfighter.tag,act,true,nextact.executor.tag)
     local block = false
     local hurt = false
     --CSay(serialize('target',myfighter.statuschanges))
     CSay('Target recheck:'..myfighter.tag)
     for st,data in pairs(myfighter.statuschanges or {}) do
         block = block or data.BlockHeal 
         hurt = hurt or data.HurtHeal
         --CSay(serialize(st,data)); CSay('block='..sval(block)) 
     end
     effect = effect or (heal and heal>0)
     if heal and heal>0 then
        if block then heal=0 end
        if hurt then RPG.Points(myfighter.tag,"HP").Inc(-heal) charmsg(myfighter.tag,heal,255,180,0)
        elseif not AltHealing(group,i,heal) then 
            if myfighter.tag=="Marrilona" and CVVN('%HANDICAP.MARRILONA') then inc('%HANDICAP.MARRILONA',6-(skill*2)) end 
            RPG.Points(myfighter.tag,"HP").Inc(heal) charmsg(myfighter.tag,heal,0,255,0)
        end
        if RPG.Points(myfighter.tag,"HP").Have<=0 then 
           ClearTable(myfighter.statuschanges)
           myfighter.statuschanges.Death=StatusChanges.Death
        end   
     end
     -- Attack
     if act.Attack and act.Attack>0 then effect=effect or Attack(act,group,i,nextact) end
     -- Put on buffs
     for sn,value in pairs(act) do
         if prefixed(sn,"BUFF_") then
            CSay('Buff request found! '..sn..' '..value.."%")
            local cval = RPG.SafeStat(myfighter.tag,sn)
            local oval = RPG.SafeStat(myfighter.tag,"BASE_"..right(sn,#sn-5))
            local nval = oval * (value/100)
            local ok
            ok = (nval<0 and cval>0) or (cval<0 and nval>0) or (cval<=0 and nval<0 and cval>nval) or (cval>=0 and nval>0 and cval<nval)         
            -- CSay(serialize('ok',ok)..serialize('nval',nval)..serialize('cval',cval))   
            if ok then 
               RPG.SetStat(myfighter.tag,sn,nval)
               local d=value.."%"
               if value > 0 then d = "+"..d end
               charmsg(myfighter.tag,right(sn,#sn-5).." "..d,255*bool2int(value<0),255*bool2int(value>0),0)
               effect=true
            end     
         end
     end
     -- Scripted stuff
     if act.EffectScript and act.EffectScript~="" then
        if act.EffectScript_External then
           Sys.Error("External effect scripts not yet scripted")
        else
           effect = SpellScript[act.EffectScript](myfighter.tag,myexecutor.tag,act.EffectScript_Arg) or effect
        end   
     end
     -- Target Card Addition
     local card2add = { group = group, tag=myfighter.tag, letter=myfighter.letter }
     if act.ADDCARD_Char_Number then
        for ak=1,act.ADDCARD_Char_Number do
            AddCard(card2add,ak*(act.ADDCARD_Char_Interval or 2))
            effect=true
        end
     end
     -- Cause status changes (this always comes last)
     for k,b in pairs(act) do
         if prefixed(k,"Cause") then 
            local s = right(k,#k-5)
            local roll=rand(1,100)
            if roll>RPG.SafeStat(myfighter.tag,"END_SR_"..s) then SetStatus(myfighter.tag,s) effect = true end
         end   
     end    
     -- Throw "miss" if there is no effect (very last)
     if not effect then charmsg(myfighter.tag,'miss',155,155,155) end
end

fflow.Range = { ['1F'] = function(act)
                            PerformAction(act,nextact.group,nextact.targetidx)                             
                         end,
                AF     = function(act)
                            for i,_ in pairs(Fighters[nextact.group]) do 
                                PerformAction(act,nextact.group,i)
                            end    
                         end,  
                OS      = function(act)
                            local ret
                            for i,d in pairs(Fighters[nextact.executor.group]) do
                                if d.tag == nextact.executor.tag then ret = i end
                            end
                            -- nextact.targetidx=ret
                            PerformAction(act,nextact.executor.group,ret)     
                          end                
                         }
                         
fflow.Range['1A'] = fflow.Range['1F']
fflow.Range.AA = fflow.Range.AF                          

function fflow.Execution()   
   -- Check the teacher. If set it may override the selected attack.
   if nextact.executor.group=="Hero" and nextact.mayteach and (not nextact.auto) then
      LoadItemModule() -- Loads the items module if this wasn't done before. 
      MS.Run('ITEMS','CombatTeach',nextact.executor.tag)
   end      
   -- Init
   e_act = e_act or ItemGet(nextact.act); local act=e_act
   local acttag = upper(nextact.act)
   local myactor = fighterbytag[nextact.executor.tag]
   Var.D('$EXE.EXECUTOR',nextact.executor.tag)
   -- Var.D('$EXE.TARGET',"--")
   -- Is this move possible
   if not ActionPossible(act.Target) then 
      nextact = nil
      table.remove(cards,1)
      e_act = nil
      flow='idle' 
      return 
   end
   -- Show Box
   assert ( act.Title,serialize("act",act))
   local f 
   if prefixed(acttag,"JUG_") then f="PhanCombatBigMessage" end
   ExeShowMsg = ExeShowMsg or CardMessage(act.Title,1,f)
   -- if (not ExeShowMsg.Timer) or (ExeShowMsg.Timer>50) then return end
   while (not ExeShowMsg.Timer) or (ExeShowMsg.Timer>50) do   
         DrawScreen(); FPS()
         --DarkText(sval(ExeShowMsg.Timer),50,50,0,0,255,255,255) -- What the hell is wrong here?
         Flip()
   end
   -- Voice
   if not nextact.auto then 
       Voice(nextact.executor.tag,act.Voice or "NOTHING AT ALL")  -- The latter is just to prevent "nil" crashes.   
       -- Stance
       ;({ Foe = function(a)
                 local t = nextact.executor.tag
                 local h = fighterbytag[t]
                 for i = 1,5 do
                     h.negative = not h.negative
                     for f=1,5 do Cls() DrawScreen() Flip() end
                 end
                 h.negative = false
             end,
          Hero = function(a)
                 local t = nextact.executor.tag
                 local h = fighterbytag[t]
                 if a.Stance=='Attack' then
                    for i=1,2 do
                        h.stance='Attack.'..i
                        for f=1,25 do Cls() DrawScreen() Flip() end
                    end                             
                 else
                    h.stance=a.Stance
                    for f=1,25 do Cls() DrawScreen() Flip() end
                 end
                 h.stance='Idle'  
             end 
          })[nextact.executor.group](act)
   end       
   -- SpellAni
   if act.SpellAni then 
      white()
      local idx
      for i,d in pairs(Fighters[nextact.executor.group]) do if d.tag == nextact.executor.tag then idx=i end end -- Leftover from the past... Oh well...
      fflow.SpellAni[act.SpellAni_External==true](nextact.executor.group,idx,nextact.group,nextact.targetidx,act)
   end
   -- Perform the action
   ;(fflow.Range[act.Target] or function() Sys.Crash('Unknown target type: '..act.Target) end)(act)
   -- Any rewards due to this? 
   if nextact.executor.group=='Hero' and (not nextact.auto) then
      for i=1,5 do
           -- skill experience
           if act['rew_CreateSkill'..i] then 
              if CreateSkill(nextact.executor.tag,i,1)  then
                 charmsg(nextact.executor.tag,"Discovered new skill group",180,255,0) 
                 charmsg(nextact.executor.tag,CharacterMeta[nextact.executor.tag]['skill'..i],180,255,0) 
              end
           end      
           if act['rew_GainSkill'..i] and act['rew_GainSkill'..i]>0 and (RPG.PointsExists(nextact.executor.tag,'SK_EXP_'..i)==1) then
              local reward = act['rew_GainSkill'..i]
              if newgameplus then reward = reward * (4-skill) end
              if RPG.GetData(nextact.executor.tag,"Master")=='Fandalora' then reward = math.ceil(reward * ({6.7,3.1,1.25})[skill]) end
              IncSkill(nextact.executor.tag,i, reward )   
           end
      end
      -- AP recovery
      if act.Rew_GainAP then
         local rewap = act.Rew_GainAP
         if newgameplus then rewap = rewap * ({2,1.25,1})[skill] end
         if RPG.GetData(nextact.executor.tag,"Master")=='Fandalora' then rewap = math.ceil(rewap * ({1.25,1.10,1.01})[skill]) end
         RPG.Points(nextact.executor.tag,"AP").Inc(rewap)
      end     
   end     
   -- And now let's return to 'idle'
   while (not ExeShowMsg.Timer) or (ExeShowMsg.Timer>0) do   
         DrawScreen(); FPS()
         --DarkText(sval(ExeShowMsg.Timer),50,50,0,0,255,255,255) -- What the hell is wrong here?
         Flip()
   end   
   if nextact.executor.group=='Hero' then -- no anti-autocheck here. The hero may still claim victory of a by him or her cast repeating spell. I will block the stance change to make special stances like death not getting bugged. 
      LastAction=nextact.executor.tag 
      if not nextact.auto then myactor.stace='idle' end
   end
   -- Ability Card Addition
   local streak=nextact.streak and rand(1,nextact.streak)==1
   if streak then
        local card2add = { group = nextact.group, tag=nextact.tag, letter=nextact.letter, auto=true }
        card2add.nextact = {}
        for f,i in pairs(nextact) do card2add.nextact[f]=i; CSay("Added to new card: "..f) end
        --if act.ADDCARD_Action_Act~="Self" then card2add.nextact.act=act.ADDCARD_Action_Act end
        --for ak=1,act.ADDCARD_Action_Number do
            AddCard(card2add,1)
            --chmsg(nextact.executor.tag,'Move Streaked') 
            card2add.nextact.streak = nextact.streak + skill
            card2add.streak = card2add.nextact.streak
            SerialBoxText('COMBATLEARN',"AUTO_JAKE",'FLOW_COMBAT')            
        --end
   end
   if act.ADDCARD_Action_Number and (not nextact.auto) then
        local card2add = { group = nextact.group, tag=nextact.tag, letter=nextact.letter, auto=true }
        card2add.nextact = {}
        for f,i in pairs(nextact) do card2add.nextact[f]=i; CSay("Added to new card: "..f) end
        if act.ADDCARD_Action_Act~="Self" then card2add.nextact.act=act.ADDCARD_Action_Act end
        for ak=1,act.ADDCARD_Action_Number do
            AddCard(card2add,ak*(act.ADDCARD_Action_Interval or 2))            
        end
   end
   -- Is there a message? (Should only be used for learning new spells).
   if nextact.aftermsg then
      ChMiniMsg(nextact.executor.tag,nextact.aftermsg,0,180,255)
   end
   flow = nextact.afterperform or 'idle' 
   nextact = nil
   table.remove(cards,1)
   e_act = nil
   ExeShowMsg = nil
end


-- @IF IGNORE
return fflow
-- @FI
