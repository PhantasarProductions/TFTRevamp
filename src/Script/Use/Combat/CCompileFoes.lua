--[[
  CCompileFoes.lua
  Version: 17.07.15
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

-- @UNDEF CPF_DBG


function CompileFoe(tag,data,foefile,oversoul)
   local function dbg(t) 
      -- @IF CPF_DBG
      CSay("COMPILEFOE:>"..t)
      -- @FI
   end
   CSay("XCompile.prior."..upper(foefile).."('"..tag.."');")   
   ;(XCompile.prior[upper(foefile)] or Nothing)(tag)
   dontcure[tag] = dontcure[tag] or {}
   local id = oversoul or (#Fighters.Foe + 1)
   local letter = string.char(id+64); if id>26 then letter="?" end
   local myfoe = { tag = tag, R=255, G=255, B=255, letter=letter, id = id, fidtag = upper(foefile) }
   if oversoul then myfoe.R=200; myfoe.G=150 myfoe.B=255 end
   Fighters.Foe[id] = myfoe    
   fighterbytag[tag] = myfoe
   myfoe.group='Foe'
   myfoe.id=id
   myfoe.AI = data.AI
   myfoe.data = data
   myfoe.exp = data.normal_EXP
   myfoe.voicetag = data.VocalTag
   myfoe.HitBy = data.HitBy
   if oversoul then
      if skill==3 then myfoe.exp = 0 else myfoe.exp = data.oversoul_EXP end
   end
   RPG.CreateChar(tag)
   local myname = letter..". "..data.Name; if oversoul then myname = myname .."  (Oversoul)" end
   RPG.SetName(tag,myname); CSay("Compiling "..tag.." << "..RPG.GetName(tag))
   for key,v in pairs(data) do
       local stat
       if not suffixed(key,'_EXP') then
          if      oversoul and prefixed(key,"oversoul_") then stat=right(key,#key-9) CSay("Oversoul Stat: "..stat) RPG.SetStat(tag,"BASE_"..stat,v) RPG.SetStat(tag,"BUFF_"..stat) RPG.SetStat(tag,"END_"..stat) RPGChar.ScriptStat(tag,"END_"..stat,"Script/Char/Char.lua",upper(stat)) end
          if (not oversoul) and prefixed(key,"normal_") then stat=right(key,#key-7) CSay("normal Stat:"..stat) RPG.SetStat(tag,"BASE_"..stat,v) RPG.SetStat(tag,"BUFF_"..stat) RPG.SetStat(tag,"END_"..stat) RPGChar.ScriptStat(tag,"END_"..stat,"Script/Char/Char.lua",upper(stat)) end
          if prefixed(key,'ER_') or prefixed(key,'SR_') then stat=key CSay("ER/SR Stat:"..stat) RPG.SetStat(tag,"BASE_"..stat,v) RPG.SetStat(tag,"BUFF_"..stat) RPG.SetStat(tag,"END_"..stat) RPGChar.ScriptStat(tag,"END_"..stat,"Script/Char/Char.lua",upper(stat)) end
          if prefixed(key,'STSTART_') and v then  
             local sk = right(key,#key-8)
             CSay("= Attaching status: "..sk)
             myfoe.StatusChanges = myfoe.StatusChanges or {}
             myfoe.statuschanges = myfoe.StatusChanges
             myfoe.statuschanges[sk] = StatusChanges[sk]
             CSay("Status exist: "..sval(StatusChanges[sk]~=nil))
             for k,vl in spairs(myfoe.statuschanges) do CSay('We now got: '..k) end
             for k,vl in spairs(StatusChanges) do CSay('Defined: '..k.."      "..sval(k==sk)) end
             dontcure[tag][sk] = true
          end   
       end   
   end
   RPG.Points(tag,'HP',1).MaxCopy="END_HP"
   RPG.Points(tag,'HP').Have = RPG.Points(tag,'HP').Maximum
   if not oversoul then
      if suffixed(data.Image,"/") then
         local list = {}
         CSay('Searching for random pics in: '..data.Image)
         for file in iJCR6Dir(true) do
           if prefixed(upper(file),upper(data.Image)) and suffixed(upper(file),".PNG") then
              list[#list+1] = file
              CSay("= Added: "..file)
           end   
         end
         Image.Load(list[rand(1,#list)],"FIGHT_"..tag..upper(sval(false)))
      else
         Image.Load(data.Image,"FIGHT_"..tag..upper(sval(false)))
      end
      if JCR6.Exists(replace(data.Image,".png",".hot"))==1 then
        Image.Negative("FIGHT_"..tag..upper(sval(false)),"FIGHT_"..tag..upper(sval(true)))
        local i = Image.Image("FIGHT_"..tag..upper(sval(false)))
        Image.Hot("FIGHT_"..tag..upper(sval(true)),i.handle_x,i.handle_y)
      else   
        Image.Negative("FIGHT_"..tag..upper(sval(false)),"FIGHT_"..tag..upper(sval(true)))
        Image.Hot("FIGHT_"..tag.."FALSE",Image.Width("FIGHT_"..tag.."FALSE")/2,Image.Height("FIGHT_"..tag.."FALSE")) -- Hotspot bottom center
        Image.Hot("FIGHT_"..tag.."TRUE" ,Image.Width("FIGHT_"..tag.."TRUE" )/2,Image.Height("FIGHT_"..tag.."TRUE" )) -- Hotspot bottom center
      end  
   end   
   local x --= math.ceil(id/3)
   local y --= (id - x)+1
   if id<4 then x=1; y=id
   elseif id<7 then x=2; y=id-3
   else x=3;y=id-6 end
   myfoe.x = (x * (Center_X/10)) + 50
   myfoe.y = (y * ((Center_Y-100)/4))+Center_Y    
   local altcoords = CVVN('$COMBAT.POS'..tag)
   if altcoords=='CENTER' then
      myfoe.x = math.floor(Center_X/2)
      myfoe.y = Center_Y+((Center_Y-100)/2)
   elseif altcoords=="DRAGON" then
      Image.Hot("FIGHT_"..tag.."FALSE",0,0) -- Hotspot bottom center
      Image.Hot("FIGHT_"..tag.."TRUE" ,0,0) -- Hotspot bottom center
      c_dragon = {
           x = - Image.Width("FIGHT_"..tag.."TRUE"),
           y = - Image.Height("FIGHT_"..tag.."TRUE"),
           w =   Image.Width("FIGHT_"..tag.."TRUE"),
           h =   Image.Height("FIGHT_"..tag.."TRUE")           
      }
      c_dragon.maxx = (SW/2)-c_dragon.w
      c_dragon.maxy = (SH-180)-c_dragon.h
      myfoe.x=c_dragon.x
      myfoe.y=c_dragon.y   
   elseif altcoords then
      local ac = mysplit(altcoords)
      myfoe.x = Sys.Val(ac[1])
      myfoe.y = Sys.Val(ac[2])
      -- Sys.Val will return 0 when the string value is not correct. tonumber() will return 'nil' in that case, and that will surely crash the game as a whole, so Sys.Val is the safer route here.   
   end    
   myfoe.boss = data.Boss
   -- Compile ability list
   myfoe.abilities = {}
   for k,i in pairs(data) do
       if prefixed(k,'RATE_') and i>0 then
          local abl = right(k,#k-5)
          local abldat = { abl = abl,
                           target = data['TARGET_'..abl],                           
                         }
          local alright = true
          if (not oversoul) then alright = alright and data['NORMAL_'..abl] end dbg(sval(alright).." Normal check done")
          if (oversoul) then alright = alright and data['OVERSOUL_'..abl] end dbg(sval(alright).." Oversoul check done")
          alright = alright and data['SKILL'..skill.."_"..abl] dbg(sval(alright).." Skill "..skill.." check done")
          if alright then
             for j=1,i do
                 myfoe.abilities[#myfoe.abilities+1] = abldat dbg("adding "..abldat.abl)
             end                 
          end               
       end
   end
   ---dbg("Result "..serialize('foe.'..tag,myfoe))
   CSay("XCompile.post."..upper(foefile).."('"..tag.."');")
   ;(XCompile.post[upper(foefile)] or Nothing)(tag)
end
