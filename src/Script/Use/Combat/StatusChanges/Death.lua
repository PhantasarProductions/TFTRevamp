--[[
  Death.lua
  Version: 17.03.20
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
StatusChanges = {}
-- @FI

function KillAward(myfoe)
    local itemgiven = false
    -- Experience
    for i=0,3 do  
        local ch = RPG.PartyTag(i)
        if ch~="" and RPG.Stat(ch,'Level')<CVV('%LEVELCAP') and RPG.Points(ch,'HP').Have>0 then
           local rate = exprate[ch] or 1
           local get = (myfoe.exp or 1)*(rate)
           get = math.ceil(get)
           RPG.IncStat(ch,'EXP', -get) 
           charmsg(ch,"EXP "..get,rand(0,255),rand(0,255),rand(0,255))
           if RPG.Stat(ch,"EXP")<=0 then charmsg(ch,"LEVEL UP!",rand(0,255),rand(0,255),rand(0,255)) end
           RPG.Points(ch,'AP').Inc(30-(skill*10))
        end
    end
    -- Drop items
    for i=1,3 do
        if rand(1,100)<(myfoe.data["Rate Drop "..i] or 0) then
           local item = myfoe.data["Item Drop "..i]
           local idat = ItemGet(item)
           local have = ItemHave(item)
           local itemmax = ({50,25,10})[tonumber(Var.C("%SKILL"))]
           if have<itemmax then
              ItemGive(item,1)
              ChMiniMsg(myfoe.tag,'Dropped '..idat.Title,0,180,255)
              itemgiven = true
           end
        end
    end
    -- If no items are dropped, drop money in stead of this foe has it.
    if myfoe.data.Cash and myfoe.data.Cash>0 and (not itemgiven) then
       local acash = math.ceil(myfoe.data.Cash * ({2,1,.5})[skill])
       local shilders = "shilders"; if acash==1 then shilders='shilder' end
       ChMiniMsg(myfoe.tag,"Dropped "..acash.." "..shilders,0,180,255)
       MasterAllInc('Rubine','RubinePoints')
       inc("%CASH",acash)
    end
    -- Bodycount
    MasterAllInc("Russell","RussellKills")
    inc('%KILLS')
    bestiary[myfoe.fidtag] = (bestiary[myfoe.fidtag] or 0) + 1
    oversoul[myfoe.fidtag] = (oversoul[myfoe.fidtag] or 0) + 1    
    -- Achievements based on kills
    MS.LoadNew("ACH","Script/Subs/Achievements.lua")
    MS.Run('ACH','AchByKill')
end

StatusChanges.Death = {

         IgnoreDeath = true,
         OnCure = function(ch) 
                      if RPG.Points(ch,"HP").Have<=0 then RPG.Points(ch,"HP").Have=1 end
                  end,
         BlockHeal = true,         
         StillorHelp = function(ch)
                       if prefixed(ch,"FOE") then return end -- Hando Stillor is not gonna help his foes
                       if RPG.CharExists("HandoStillor")==0 then return end
                       if not fighterbytag.HandoStillor then return end
                       if RPG.Points("HandoStillor","HP").Have==0 then return end -- If Hando Stillor is out himself, then sorry, no go.
                       if not CVVN("%HANDO.NOODHULP") then Var.D("%HANDO.NOODHULP",skill) end
                       if fighterbytag.HandoStillor.Petrified then return end -- Petrified? That won't do!
                       if fighterbytag.HandoStillor.Sleep then return end -- Asleep? That won't do!
                       if fighterbytag.HandoStillor.Paralysis then return end -- Paralyzed? That won't do!
                       if rand(1,CVV('%HANDO.NOODHULP'))~=1 then return end
                       SerialBoxText("COMBATLEARN","AUTO_HANDOSTILLOR","FLOW_COMBAT")
                       local card2add = { group = 'Hero', tag='HandoStillor', auto=true }
                       card2add.nextact = { executor = { group="Hero",tag="HandoStillor"}, act="AUTO_NOODHULP"}
                       for i=0,3 do
                           if RPG.PartyTag(i)==ch then
                              card2add.nextact.group = "Hero"
                              card2add.nextact.targetidx=i
                           end
                       end
                       AddCard(card2add,1)
                       local r=rand(1,10)
                       if r<=skill^2 then inc('%HANDO.NOODHULP') end
                  end,         
         OnGiven = function(ch) 
                        -- Boss vocal?
                        if prefixed(ch,"FOE") then
                           local myfoe=fighterbytag[ch]
                           if myfoe.data.Boss then VicQ="BOSS" end
                        elseif VicQ~="BOSS" then
                            VicQ="DEAD"   
                        end   
                        -- Kill him!
                        RPG.Points(ch,"HP").Have=0
                        local dat = fighterbytag[ch]
                        local scl = dat.StatusChanges
                        local remove = {}
                        for s,d in pairs(scl) do
                            if not d.IgnoreDeath then remove[#remove+1] = s end
                        end 
                        for s in each(remove) do
                            scl[s] = nil
                            CSay("Death removed status"..s.." from "..ch)
                        end
                        StatusChanges.Death.StillorHelp(ch)
                   end, 
         DrawFighter = function(ch)
                         local mychar = fighterbytag[ch]
                         if mychar.group=='Foe' then
                            DeathScale = DeathScale or {}
                            DeathScale[ch] = DeathScale[ch] or {100,100}
                            local ds = DeathScale[ch]
                            ds[1] = ds[1] - 1
                            ds[2] = ds[2] + 1
                            Image.ScalePC(ds[1],ds[2])
                            DrawFoe(mychar.id)
                            Image.ScalePC(100,100)
                            if ds[1]<=0 then
                               KillAward(fighterbytag[ch])
                               fighterbytag[ch] = nil
                               fighters.Foe[mychar.id] = nil
                            end   
                         else
                           local itag = "DEATH TO "..ch                           
                           Image.LoadNew(itag,"GFX/Combat/Fighters/Hero/"..ch..".dead.png"); Image.Hot(itag,Image.Width(itag)/2,Image.height(itag))
                           Image.Show(itag,mychar.x,mychar.y)                            
                         end 
                       end,   
         DrawReplace = true,                                          
         SkipTurn = true         
         
}



-- @IF IGNORE
return StatusChanges
-- @FI
