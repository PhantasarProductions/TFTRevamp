--[[
  Curse.lua
  Version: 17.02.23
  Copyright (C) 2017 Jeroen Petrus Broks
  
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


StatusChanges.Curse = {

      mystat = { },

      CreateMe = function(self)
           local skill=Sys.Val(Var.C("%SKILL"))
           if skill==1 then
              self.mystat = {"Poison","Disease","Zombie","Sleep"}
           elseif skill==2 then
              self.mystat = {"Poison","Disease","Zombie","Sleep","Death","Poison","Paralysis"}
           elseif skill==3 then
              self.mystat = {"Zombie","Death","Death","Petrification","Poison"}
           end      
      end,

      DrawFighter = function(ch)
         color(0,255,0)
      end   ,
      
      PreTurn = function(ch)
          local me = StatusChanges.Curse
          local HP = RPG.Points(ch,'HP')
          local AP = RPG.Points(ch,"AP")
          local forf = 'Hero' -- Friend or foe?
          if prefixed(ch,'FOE') then forf='Foe' end
          local r=rand(1,skill*10)
          if r==1 or r==21 or r==29 then
             HP.Have=1
          elseif r==2 and skill~=1 then
             HP.Have = HP.Maximum
          elseif r==3 and r>24 then
             HP.Have = rand(1,HP.Maximum)
          elseif r==11 and r==22 then
             AP.Have=0
          elseif r==12 and skill~=3 then
             AP.Have = AP.Maximum
          elseif r==13 and skill==3 then
             HP.Have=1
             AP.Have=0
          elseif (r>14 and r<20) or (r==23) then
             SetStatus(ch,me.mystat[rand(1,#me.mystat)])   
          end                              
      end 

}

StatusChanges.Curse:CreateMe()

-- @IF IGNORE
return StatusChanges
-- @FI
