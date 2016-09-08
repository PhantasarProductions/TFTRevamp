--[[
  PrologueSelectChar.lua
  Version: 16.09.08
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

chars = {"Jake","Marrilona","Dandor","Hando Stillor"}
icards = {}
card  = {}

function PrologueOver()
    Sys.Error("The post-prologue stuff is not yet done")
end

function Repos()
   pos = 1
   local x = 0
   local newcard   
   for i = 1,#chars do
       newcard = {}
       if not CVV("&DONE.PROLOGUE["..i.."]") then
          newcard.x = x
          x = x + 400
          newcard.char = chars[i]
          newcard.img  = icards[chars[i]]
          card[#card+1] = newcard
          CSay("REPOS: "..#card.."> "..chars[i])
       end
   end
   if #card==0 then PrologueOver() end
end     

function GALE_OnLoad()
   Image.LoadNew('PCS_BACK','GFX/System/Console.png')
   for f in each(chars) do 
       icards[f] = Image.Load("GFX/Prologue_CharSelect/"..f..".png")
       Image.HotCenter(icards[f])
   end
   Repos()       
   repeat
       INP.Grab()
   until INP.MouseH(1)==0 
end


function MAIN_FLOW()
   local x
   local mx,my = MouseCoords()
   local mh = mousehit(1)
   white()
   Image.Tile('PCS_BACK',sin(Time.MSecs()/10000)*5,cos(Time.MSecs()/1500)*100)
   -- DarkText("Cards = "..#card,0,0)   
   for i,c in ipairs(card) do
       if i==pos then Image.ScalePC(110,110) else Image.ScalePC(75,75) end
       x = (Center_X-((pos-1)*400))+(c.x)
       Image.Show(c.img,x,Center_Y)
       -- Image.NoFont() DarkText(x,5,i*20); -- debug
       Image.ScalePC(100,100)
       Image.Font("Fonts/master_of_break.ttf",50)
       if mh and mx>x-125 and mx<x+125 then
          mh = false
          if i==pos then
             SelChar()
          else
             pos=i
          end
       end
   end
   DarkText("Choose your character",Center_X,10,2,0)
   if (INP.KeyH(KEY_RIGHT)==1 or joyhit(joy_right)) and pos<#card then pos = pos + 1 end
   if (INP.KeyH(KEY_LEFT )==1 or joyhit(joy_left )) and pos>1     then pos = pos - 1 end   
   if INP.KeyH(KEY_SPACE)==1 or INP.KeyH(KEY_RETURN)==1  then SelChar() end
   for joy=0,15 do 
       if INP.JoyH(joy)==1 then SecChar() end
   end
   ShowMouse()
   Flip()
end   
