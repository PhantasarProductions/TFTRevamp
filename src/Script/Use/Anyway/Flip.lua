--[[
  Flip.lua
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

if Var.C("$OLDTIME") then Var.D("$OLDTIME",Time.Time()) end

function PlayTime()
  local ret
  local hours = CVVN("%GAMETIME.HOURS")
  local minutes = CVVN("%GAMETIME.MINUTES")
  local seconds = CVVN("%GAMETIME.SECONDS")
  if hours then return hours..":"..right("0"..minutes,2)..":"..right("0"..seconds,2) end
  if minutes then return minutes..":"..right("0"..seconds,2) end
  return sval(seconds)
end

function Chapter(file)
   Image.Load(file,'CHAP')
   Image.HotCenter('CHAP')
   Var.D('%CHAPTIME',500)
   CSay('Chapter picture: '..file)
end      

function Flip()
    LAURA.TerminateBye() -- This function will terminate the game, if a user request was done to it by either clicking the close icon of the window, or on mac using the "Quit LAURA2" menu option.

    MS.Run("ACH","AchFlip") -- Render any gotten achievements before we show the screen to the player!
    
    if CVV('%CHAPTIME')>0 and Image.Exist("CHAP")~=0 then
       if CVV('%CHAPALPHA')<100 and CVV('%CHAPTIME')>100 then inc('%CHAPALPHA') end
       if CVV('%CHAPTIME')<100 then Var.D('%CHAPALPHA',CVV('%CHAPTIME')) end
       Image.SetAlphaPC(CVV('%CHAPALPHA'))
       Image.Show('CHAP',Center_X,Center_Y)
       Image.SetAlphaPC(100)
       dec('%CHAPTIME')       
    end
    Image.Flip() -- Show it!
    -- And recalcute the game time.
    local t = Time.Time()
    if t~=Var.C("$OLDTIME") then
       Var.D("$OLDTIME",t)
       inc("%GAMETIME.SECONDS")
       if CVV('%GAMETIME.SECONDS')>=60 then
          Var.D("%GAMETIME.SECONDS",0)
          inc("%GAMETIME.MINUTES")
       end
       if CVV('%GAMETIME.MINUTES')>=60 then
          Var.D("%GAMETIME.MINUTES",0)
          inc("%GAMETIME.HOURS")
          if CVV("%GAMETIME.HOURS")>=24 then Award("HOURS024") end
       end             
    end
end
