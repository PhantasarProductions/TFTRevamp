--[[
  Death.lua
  Version: 16.10.01
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
-- @IF IGNORE
StatusChanges = {}
-- @FI

StatusChanges.Death = {

         IgnoreDeath = true,
         OnCure = function(ch) 
                      if RPG.Points(ch,"HP").Have<=0 then RPG.Points(ch,"HP").Have=1 end
                  end,
         OnGiven = function(ch) 
                        RPG.Points(ch,"HP").Have=0
                        local dat = fighterbytag[ch]
                        local scl = dat.StatusChanges
                        local remove = {}
                        for s,d in pairs(scl) do
                            if not d.IgnoreDeath then remove[#remove+1] = s end
                        end 
                        for s in each(remove) do
                            scl[s] = nil
                        end
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
                               fighterbytag[ch] = nil
                               fighters.Foe[mychar.id] = nil
                            end   
                         else
                         end 
                       end,   
         DrawReplace = true,                                          
         SkipTurn = true         
         
}
