--[[
  Combat.lua
  Version: 17.08.06
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

-- The Fairy Tale REVAMPED

-- @UNDEF COMBAT_FPS


-- @USEDIR Script/Use/Combat

-- @IF IGNORE
combat={} -- Just a line to fool the outliner
-- @FI

fighters={ Foe={}, Hero={}}
Fighters=fighters
fighterbytag = {}; fightersbytag = fighterbytag
order={} -- No this is not the British parliament.
bestiary = bestiary or {}
oversoul = oversoul or {}
groupmax = 100
learn = learn or { Jake_Human={}, Marrilona={}, Dandor={}, HandoStillor={} } -- In GALE_OnLoad Jake_Human and Jake_Fairy are linked


exprate = {}

function TransferBestiary()
    Var.D('$TRANSFER.BESTIARY',serialize('local ret',bestiary).."; return ret")
end    

function SetUpCards()
    Cards = {}
    cards = Cards
end    

function YCards()
    for i=1,25 do
        Cards[i] = Cards[i] or {}
        Cards[i].x=-25
        Cards[i].y=SH+((25-i)*100)        
    end
end

function SetupArena()
    Image.Load("GFX/Combat/Arena/"..(CVVN("$COMBAT.ARENA") or "Caves.png"),"ARENA")
    Image.HotCenter("ARENA")
    CSay("Arena size: "..Image.Width("ARENA").."x"..Image.Height("ARENA"))
    local a = lower(CVVN("$COMBAT.ARENA") or "Caves.png")
    a = left(a,#a-4) -- remove .png
    CurArena = AltArena[a] or {}
    CurArena.Before = CurArena.Before or Nothing -- Before Arena
    CurArena.After  = CurArena.After  or Nothing -- After Arena
    CurArena.Over   = CurArena.Over   or Nothing -- Over everything except the party bar
end

function LoadFoes()
    dontcure = {}    
    -- CSay(serialize("combat",combat))
    for key,foe in spairs(combat) do
        CSay(key.." = "..foe)
        local foefile = foe
        local foefiledirsplit = mysplit(foefile,"/")
        if #foefiledirsplit<2 then foefile = "Reg/"..foefile end
        if prefixed(key,"FOE_") then 
           CompileFoe(key,JINC('Script/JINC/Foes/'..foefile..".lua"),foefile) 
        end
    end
end

function LoadHeros()
    local myhero
    local count = 0
    for i=0,3 do
        if RPG.PartyTag(i)~="" then
           count = count + 1
           Fighters.Hero[i] = Fighters.Hero[i] or { R=255, G=255, B=255}
           myhero = Fighters.Hero[i]
           myhero.tag = RPG.PartyTag(i)
           myhero.stance = "Idle"
           myhero.id = i
           myhero.group='Hero'
           myhero.voicetag = myhero.tag         
           fighterbytag[myhero.tag] = myhero
           if prefixed(myhero.voicetag,'Jake') then myhero.voicetag='Jake' end
           exprate[myhero.tag] = 1
           if     skill>1 and rand(1,4)==1 then exprate[myhero.tag] = .5 
           elseif skill<3 and rand(1,4)==1 then exprate[myhero.tag] =  2 end
        end  
    end
    -- Set up coordinates (this is pending on the number of heroes, yes, so this must be done in a separate loop)
    for i,hero in pairs(Fighters.Hero) do  -- ipairs certainly not!!!! The order doesn't matter index 0 is there that ipairs simply doesn't accept!
        local x = SW - ((count-i)*((Center_X/2)/count))
        local y = Center_Y + (((Center_Y-120)/4)*(i+1))
        hero.x = x
        hero.y = y
    end
end

function CreateOrder()
     order = { speedtable = {}, tagorder = {}, iorder = {} }
     local sid,strid
     -- first set up a table easily usable by spairs.
     for group,groupdata in pairs(Fighters) do
         for idx,data in pairs(groupdata) do
             sid = 10000 - RPG.Stat(data.tag,"END_Speed")
             strid = right("00000"..sid,5)
             while order.speedtable[strid] do
                sid = sid + 1 
                strid = right("00000"..sid,5)
             end
             order.speedtable[strid] = {group=group,idx=idx,tag=data.tag}
         end
     end
     -- And let us now set up the actual work order
     local oid = 0
     for key,fid in spairs(order.speedtable) do
         oid = oid + 1
         order.tagorder[fid.tag]=oid
         order.iorder[oid] = fid
         if fid.group=="Foe" then fid.letter=Fighters.Foe[fid.idx].letter end
     end
end

function SetupInitialCards(empty)
   CreateOrder()
   Cards = Cards or {}
   if empty then ClearTable(Cards) end
   local card,cidx
   for i,data in pairs(order.iorder) do
       cidx=i*3
       Cards[cidx] = Cards[cidx] or {}
       card = Cards[cidx]
       card.data=data
       CSay("Defining card: "..cidx) CSay(serialize("card["..cidx.."]",card))
   end
   CSay(serialize('Cards',Cards))
end

function ResetCards() SetupInitialCards(true) end


function CombatMusic()
    --CSay(CVV("$COMBAT.MUSIC"))
    if Var.C("$COMBAT.MUSIC")=="*NOCHANGE*" or Var.C("$COMBAT.MUSIC")=="*NOCHANGE*.ogg" then return end
    PushMusic()
    if not CVVN("$COMBAT.MUSIC") then RandomEncounterTune() return end
    Music(Var.C("$COMBAT.MUSIC"))
end

function CombatStartEvent()
   local e = CVVN("$COMBAT.STARTEVENT")
   if not e then return end
   local a = mysplit(e,",")
   MS.Run(a[1],a[2])
end

function InitCombat()
   ResetMiniMsg()   
   Var.Clear("$SELECTEDABILITY") -- Prevent conflicts with looking to the abilities in the field
   combat = Var2Table("COMBAT.",true)
   SetUpCards()
   YCards()
   SetupArena()
   LoadHeros()
   LoadFoes()
   SetupInitialCards()
   CombatMusic()
   CombatStartEvent()
end

function FPS()
   -- @IF COMBAT_FPS
   white()
   FPS_Sec = FPS_Sec or 0
   if Time.Time()~=FPS_Old then FPS_Sec=FPS_Sec+1; FPS_Old=Time.Time() end
   FPS_Frames = (FPS_Frames or 0) + 1
   local tfps = FPS_Frames/FPS_Sec
   Image.Rotate(0)
   Image.ScalePC(100,100)
   Image.DText(FPS_Frames.." Frames /"..FPS_Sec.." Secs >> "..tfps.." FPS",100,100)
   -- @FI 
end

Defeated = {}

function Defeated.Hero()
     --if CVV("&COMBAT.RANDOMENCOUNTER") then
        -- Go back to the last inn or spawning point
        --Sys.Error("Respawn not scripted yet")
     --else
        flow = "Defeat"
     --end   
end

function Defeated.Foe()
     flow = "Victory"
end

function VicCheck()
   local defeated,cntc,cnti
   for group,ga in pairs(fighters) do
       cntc = 0; cnti = 0
       for i,dat in pairs(ga) do
           dat.StatusChanges = dat.StatusChanges or {}
           defeated = false
           for s,d in pairs(dat.StatusChanges) do
               --CSay('Detected status change: '..s..' on '..dat.Tag)
               defeated = defeated or (d.SkipTurn and (not d.ExpireRoll))
           end
           cntc = cntc + 1    
           if defeated then cnti = cnti + 1 end
       end
       if cntc<=cnti then Defeated[group]() return end       
   end
end

function DebugFighter()
   local a = mysplit(showserialize("fighters",fighters),"\n")
   for l in each(a) do CSay(l) end
end

function GALE_OnLoad()
   learn.Jake_Fairy = learn.Jake_Human
end

function AdeptNextAct(na)
   CSay('AdeptNextAct --> '..sval(na))
   local nadf = loadstring('return { '..na..' }')
   if not nadf then CSay('Transferring data failed') CSay(na) return end
   local nad = nadf()
   local aa = { [true]= 'Changing: ', 
                [false]='  Adding: '}
   for k,v in spairs(nad) do
       CSay(aa[nextact[k]~=nil]..k.." = "..sval(v).." ("..type(v)..")")
       nextact[k] = v
   end
   CSay('Done')
end


function MAIN_FLOW()
    DrawScreen()
    CombatFlow()
    VicCheck()
    FPS()
    Flip() -- Must be last
end
