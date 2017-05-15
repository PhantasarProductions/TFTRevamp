--[[
  TheEnd.lua
  Version: 17.05.15
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
fflow = {}
-- @FI


function VicCount()
    inc('%VICTORIES')
    MS.LoadNew("ACH","Script/Subs/Achievements.lua")
    MS.Run('ACH','AchByVictories')
    MasterAllInc('Feenalaria','FeenalariaPoints')
end

function f_vicinit()   
   VicCount()
   if musicavailable then
      if not ( Var.C("$COMBAT.MUSIC")=="*NOCHANGE*" or Var.C("$COMBAT.MUSIC")=="*NOCHANGE*.ogg" ) then
         Music("Sys/Silence.ogg")
         -- SFX("Music/Combat/Victory.ogg")
         Audio.Load('Music/Combat/Victory.ogg','CVIC',1)
         Audio.Play('CVIC','CVICC')
      end   
   end
   if LastAction and vocals then
      local stances = {LastAction}
      if upper(VicQ)=='BOSS' then 
         stances = {} -- PartyTable
         for i=0,3 do if RPG.PartyTag(i)~="" then stances[#stances+1]=RPG.PartyTag(i) end end 
      end
      for tag in each(stances) do fighterbytag[tag].stance='Victory' end
      if prefixed(LastAction,"Jake") then LastAction="Jake" end
      SFX('VOCALS/Combat/Hero/'..LastAction.."/Victory/"..(VicQ or "Perfect")..".ogg")
   end   
   return true
end

function fflow.Victory()   
   local altvic = CVVN("$COMBAT.ALT_VICTORY")
   if altvic then
      AltVictory[altvic]()
      return
   end
   vicinit = vicinit or f_vicinit()
   Image.LoadNew('YOUWIN',"GFX/Combat/End/YouWin.png"); Image.HotCenter("YOUWIN")
   youwinvalue=(youwinvalue or 0)+1
   if youwinvalue>100 then 
      youwinvalue=100
      youwintimer = (youwintimer or 150) - 1
      if youwintimer<=0 and Audio.Playing('CVICC')==0 then
         if not ( Var.C("$COMBAT.MUSIC")=="*NOCHANGE*" or Var.C("$COMBAT.MUSIC")=="*NOCHANGE*.ogg" ) then PullMusic() end
         inc('%VICTORIES')
         MS.LoadNew("ACH","Script/Subs/Achievements.lua")
         MS.Run('ACH','AchByVictory')
         LAURA.Flow(CVVN("$COMBAT.BACKCHAIN") or "FIELD")    
         DestroyAllFoes()
         NeutralAllBuffs()
      end
   end   
   Image.ScalePC(youwinvalue,100)
   white()
   Image.Show("YOUWIN",Center_X,youwinvalue)
   Image.ScalePC(100,100)
   local vit,hp,tag
   for i=0,3 do
       tag=RPG.PartyTag(i)
       if tag~="" then
          vit = RPG.Points(tag,"VIT")
          hp  = RPG.Points(tag,"HP")
          if hp.Have==0 then 
             hp.Have=1
             exprate[tag] = 0 
          end
          if vit.Have>0 and hp.Have<hp.Maximum then 
             hp.Have = hp.Have + math.ceil(hp.Maximum/(200/skill))
             vit.Have = vit.Have - 1
          end  
       end
   end          
end

function fflow.Defeat()
   DestroyAllFoes() -- Must be put in in a more proper way later. 
   NeutralAllBuffs()
   local defact = CVVN("$COMBAT.LOSE") or "GameOver";
   (Defeat[defact] or function() Sys.Error("I do not not defeat act '"..defact.."'") end)()
end

-- @IF IGNORE
return fflow
-- @FI
