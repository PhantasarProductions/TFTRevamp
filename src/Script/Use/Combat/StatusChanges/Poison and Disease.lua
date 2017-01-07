--[[
  Poison and Disease.lua
  Version: 16.12.19
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

-- Poison time, hahaha!

-- @IF IGNORE
StatusChanges = {}
-- @FI



StatusChanges.Poison = {

      mydat = { rate = { Hero = ({.02,.1,.25})[Sys.Val(Var.C('%SKILL'))], Foe = ({.25,.1,.005})[Sys.Val(Var.C('%SKILL'))]}},

      DrawFighter = function(ch)
         color(0,255,0)
      end   ,
      
      PreTurn = function(ch)
          local HP = RPG.Points(ch,'HP')
          local forf = 'Hero' -- Friend or foe?
          if prefixed(ch,'FOE') then forf='Foe' end
          charmsg(ch,"Poison Damage",100,255,0)
          Hurt(ch,HP.Maximum*StatusChanges.Poison.mydat[forf])
      end 

}



StatusChanges.Disease = {

    mydat = { Crosses = {} },

    BlockHeal = true,
    
    DrawFighter = function(ch)
       local crosses = StatusChanges.Disease.mydat.Crosses
       local chx,chy = FighterCoords(ch)
       Image.LoadNew('ST_DISEASE','GFX/Combat/StatusChanges/Disease/Rode Kruis.png'); Image.HotCenter('ST_DISEASE')
       if rand(1,10)==1 then 
           crosses[#crosses+1] = { 
                     x = rand(chx-16, chx+16),
                     y = chy,
                     kill = 200                     
           } 
       end
       for i,cross in pairs(crosses) do -- ipairs is OUT OF THE QUESTION!!!
             cross.kill = cross.kill - 1
             if cross.kill<0 then crosses[i]=nil end -- This routine makes the usage of ipairs out of the question.
             cross.y = cross.y - 2
             Image.Draw('ST_Disease',cross.x,cross.y)
       end                        
    end

}

-- @IF IGNORE
return StatusChanges
-- @FI
