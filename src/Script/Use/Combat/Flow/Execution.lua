--[[
  Execution.lua
  Version: 16.09.30
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


fflow.SpellAni = {[true]=function(act) MS.Load("X_SPELLANI","Script/SpellAni/"..act.SpellAni..".lua") MS_Run("X_SPELLANI","SPELLANI",act.SpellAni_Args) end, [false]=function(act) SpellAni[act.SpellAni](act.SpellAni_Args) end}


function PerformAction(act,group,i)
     local effect = nil
     -- Accuracy check if needed. If it fails, byebye
     -- Dodge check if needed. If it succeeds, byebye
     -- Cure status changes (this always comes first)
     -- Recover HP or AP
     -- Attack
     if act.Attack and act.Attack>0 then effect=effect or Attack(act,group,i,nextact) end
     -- Scripted stuff
     -- Cause status changes (this always comes last)
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
   -- Init
   e_act = e_act or ItemGet(nextact.act); local act=e_act
   local acttag = nextact.act
--   Var.D('$EXE.EXECUTOR',"--")
--   Var.D('$EXE.TARGET',"--")
   -- Show Box
   assert ( act.Title,serialize("act",act))
   ExeShowMsg = ExeShowMsg or CardMessage(act.Title,1)
   -- if (not ExeShowMsg.Timer) or (ExeShowMsg.Timer>50) then return end
   while (not ExeShowMsg.Timer) or (ExeShowMsg.Timer>50) do
         DrawScreen(); FPS()
         Flip()
   end
   -- SpellAni
   if act.SpellAni then 
      fflow[act.SpellAni_External==true](act)
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
   flow = nextact.afterperform or 'idle' 
   nextact = nil
   table.remove(cards,1)
   e_act = nil
end


-- @IF IGNORE
return fflow
-- @FI
