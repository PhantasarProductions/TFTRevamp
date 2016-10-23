--[[
  Execution.lua
  Version: 16.10.23
  Copyright (C) 2016 Jeroen Petrus Broks
  
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
fflow = {}
-- @FI


fflow.SpellAni = {  [true]=function(ag,at,tg,ti,act) MS.Load("X_SPELLANI","Script/SpellAni/"..act.SpellAni..".lua") MS_Run("X_SPELLANI","SPELLANI",act.SpellAni_Args) end, 
                    [false]=function(ag,at,tg,ti,act) 
                              SpellAni[act.SpellAni](ag,at,tg,ti) 
                              end
                 }

function AltHealing(group,i,Heal)
end

function PerformAction(act,group,i)
     -- Set up variables
     local effect = nil
     local myfighter = Fighters[group][i]
     local myexecutor = fighterbytag[nextact.executor.tag]
     assert(myfighter,"No fighter known on this index: "..group..":"..i)
     -- Accuracy check if needed. If it fails, byebye
     if act.Attack_AllowAccuracy and (rand(1,100)>RPG.Stat(myexecutor.tag,"END_Accuracy")) then charmsg(myfighter.tag,'miss',155,155,155) return end     
     -- Dodge check if needed. If it succeeds, byebye
     if act.Attack_AllowDodge and (rand(1,100)<RPG.Stat(myfighter.tag,"END_Evasion")) then charmsg(myfighter.tag,'dodged',155,155,155) return end
     -- Cure status changes (this always comes first)
     -- Dispell Buffs 
     -- Recover HP or AP
     local heal = ItemHeal(myfighter.tag,act,true,nextact.executor.tag)
     effect = effect or (heal and heal>0)
     if heal and heal>0 then
        if not AltHealing(group,i,heal) then RPG.Points(myfighter.tag,"HP").Inc(heal) charmsg(myfighter.tag,heal,0,255,0) end
     end
     -- Attack
     if act.Attack and act.Attack>0 then effect=effect or Attack(act,group,i,nextact) end
     -- Put on buffs
     -- Scripted stuff
     -- Cause status changes (this always comes last)
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
                         end         
                         }
                         
fflow.Range['1A'] = fflow.Range['1F']
fflow.Range.AA = fflow.Range.AF                          

function fflow.Execution()
   -- Check the teacher. If set it may override the selected attack.
   if nextact.executor.group=="Hero" and nextact.mayteach then
      LoadItemModule() -- Loads the items module if this wasn't done before. 
      MS.Run('ITEMS','CombatTeach',nextact.executor.tag)
   end      
   -- Init
   e_act = e_act or ItemGet(nextact.act); local act=e_act
   local acttag = nextact.act
   local myactor = fighterbytag[nextact.executor.tag]
   Var.D('$EXE.EXECUTOR',nextact.executor.tag)
   -- Var.D('$EXE.TARGET',"--")
   -- Show Box
   assert ( act.Title,serialize("act",act))
   ExeShowMsg = ExeShowMsg or CardMessage(act.Title,1)
   -- if (not ExeShowMsg.Timer) or (ExeShowMsg.Timer>50) then return end
   while (not ExeShowMsg.Timer) or (ExeShowMsg.Timer>50) do   
         DrawScreen(); FPS()
         DarkText(sval(ExeShowMsg.Timer),50,50,0,0,255,255,255) -- What the hell is wrong here?
         Flip()
   end
   -- Stance
   -- Voice
   Voice(nextact.executor.tag,act.Voice or "NOTHING AT ALL") -- The latter is just to prevent "nil" crashes.   
   -- SpellAni
   if act.SpellAni then 
      white()
      fflow.SpellAni[act.SpellAni_External==true](nextact.executor.group,nextact.executor.tag,nextact.group,nextact.targetidx,act)
   end
   -- Perform the action
   fflow.Range[act.Target](act)
   -- Any rewards due to this? 
   if nextact.executor.group=='Hero' then
      for i=1,5 do
           if act['rew_CreateSkill'..i] then 
              if CreateSkill(nextact.executor.tag,i,1)  then
                 charmsg(nextact.executor.tag,"Discovered new skill group",180,255,0) 
                 charmsg(nextact.executor.tag,CharacterMeta[nextact.executor.tag]['skill'..i],180,255,0) 
              end
              if act['rew_GainSkill1'] and act['rew_GainSkill1']>0 then
                 IncSkill(nextact.executor.tag,i, act['rew_GainSkill1'] )   
              end   
           end     
      end
   end     
   -- And now let's return to 'idle'
   while (not ExeShowMsg.Timer) or (ExeShowMsg.Timer>0) do   
         DrawScreen(); FPS()
         DarkText(sval(ExeShowMsg.Timer),50,50,0,0,255,255,255) -- What the hell is wrong here?
         Flip()
   end   
   if nextact.executor.group=='Hero' then 
      LastAction=nextact.executor.tag 
      myactor.stace='idle'
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
