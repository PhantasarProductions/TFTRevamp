--[[
  CDrawScreen.lua
  Version: 16.09.23
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

function ShowCards()
   white()
   for i=25,1,-1 do  -- Certainly NOT ipairs, tempting as it seems in this situation. It would not work considering the way this is set up.
       local x=(SW-100)-(i*20)
       if i==1 then x=SW-40 end
       Cards[i] = Cards[i] or {}
       if Cards[i].x< x then Cards[i].x = Cards[i].x + 2 elseif Cards[i].x> x then Cards[i].x= x end
       if Cards[i].y>40 then Cards[i].y = Cards[i].y - 4 elseif Cards[i].y<40 then Cards[i].y=40 end
       local show = "BACKSIDE"
       LoadedCardImage = LoadedCardImage or {}
       if not LoadedCardImage[show] then
          LoadedCardImage[show] = true 
          Image.LoadNew("CARD_"..show,"GFX/Combat/Cards/"..show..".png")
          Image.Hot('CARD_'..show,21,0) -- Makes turning easier if I'm actually gonna do that.
       end
       Image.Show('CARD_'..show,Cards[i].x,Cards[i].y)    
       -- Image.NoFont(); DarkText('Card #'..i.." must go to ("..x..",40) and is now on ("..Cards[i].x..","..Cards[i].y..")  Frmt: "..SW.."x"..SH,5,i*20,0,0,255,180,0) -- Debug
   end
end

function DrawScreen()
   -- Clear Screen
   Cls()
   -- Arena
   White()
   Image.LoadNew("ARENA","GFX/Combat/Arena/"..(CVVN("$COMBAT.ARENA") or "Caves.png")) -- Crash prevention!
   Image.Draw("ARENA",Center_X,Center_Y)
   -- Fighters
   DrawFighters()
   -- Cards
   ShowCards()
   -- Party
   ShowParty()
end
