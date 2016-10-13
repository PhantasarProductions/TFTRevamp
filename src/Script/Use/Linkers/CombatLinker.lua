--[[
  CombatLinker.lua
  Version: 16.10.13
  Copyright (C) 2015, 2016 Jeroen Petrus Broks
  
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
function ClearCombatData()
  local remove = {}
  local k,v
  for k,v in IVARS() do
    if left(k,8)=="%COMBAT." then table.insert(remove,k) end
    if left(k,8)=="$COMBAT." then table.insert(remove,k) end
  end
  for _,k in ipairs(remove) do
    -- CSay("Clearing var: "..k)
    Var.Clear(k)
  end
end

function StartCombatAnimation()
  local w,h,d
  Image.GrabScreen('COMBATSTARTANIM') w = Image.Width('COMBATSTARTANIM') h = Image.Height('COMBATSTARTANIM') 
  Image.Image2Anim('COMBATSTARTANIM',1,h,0,w); Image.HotCenter("COMBATSTARTANIM")
  --[[
  for px=-100,w+100 do
      for ax=0,w-1 do
          d = math.abs(px-ax)
          if d<100 then Image.ScalePC(200-d) end
          Image.Show("COMBATSTARTANIM",ax,Center_Y,ax)
          Image.ScalePC(100)
      end
      Flip()
  end
  --]]
  local downunder -- No I'm not referring to Australia :-P
  local y,s={},{}
  white()  
  repeat
     downunder = true
     Cls()
     for x=0,w-1 do
         y[x] = y[x] or Center_Y
         s[x] = s[x] or rand(3,9)
         y[x] = y[x] + s[x]         
         if s[x]<10 then s[x]=s[x]+1 end
         downunder = downunder and y[x]>SH+50+(SH/2)
         Image.Show('COMBATSTARTANIM',x,y[x],x)
     end
     Flip()
  until downunder
end

function StartCombat()
  StartCombatAnimation()
  Loading()
  MS.Load("COMBAT","Script/Flow/Combat.lua") -- Make sure everything in the battle is properly reset!
  MS.Run("COMBAT","InitCombat")
  LAURA.Flow("COMBAT")
end


function StartBoss(desc,boss)
  StopMusic()
  if musicavailable then SFX('Music/Boss/BossIntro.ogg') end
  -- Base Setup
  local w = {
               { txt = desc, x=Center_X, y=Center_Y-50,  fontsize=20, alpha=-50  },
               { txt = boss, x=Center_X, y=Center_Y+100, fontsize=65, alpha=-125 }
            }
  -- Font adaption
  for fw in each(w) do
      Image.Font('Fonts/Coolvetica.ttf',fw.fontsize)
      while Image.TextWidth(fw.txt)>SW-100 do 
            fw.fontsize=fw.fontsize-1
            Image.Font('Fonts/Coolvetica.ttf',fw.fontsize)
      end
  end
  -- Make this all appear
  repeat
     local cont = true
     color(100,0,0)
     Image.Rect(0,0,SW+50,SH+50) -- Ruling out any trouble with border settings, as they don't matter in this screen.
     for fw in each(w) do
         Image.Font('Fonts/Coolvetica.ttf',fw.fontsize)
         if fw.alpha<100 then fw.alpha = fw.alpha + 1 end
         if fw.alpha>=0  then
            Image.SetAlphaPC(fw.alpha)
            DarkText(fw.txt,fw.x,fw.y,2,2,255,255,255)
         end
         cont = cont and fw.alpha>=100
     end
     Flip()    
  until cont
  StartCombat()                                          
end        
