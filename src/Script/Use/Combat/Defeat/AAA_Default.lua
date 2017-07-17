--[[
  AAA_Default.lua
  Version: 17.07.17
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
Defeat = {

       GameOver = function() MS.Load('GO','Script/Flow/Game Over.lua'); LAURA.Flow('GO') end,
       
       Respawn = function ()
                      if not CVVN("$SYS.RESPAWN") then return Defeat.GameOver() end
                      if CVV('$SYS.RESPAWN')=='' then return Defeat.GameOver() end
                      if RPG.PartyTag(0)=='Nostramantu_Human' then return Defeat.GameOver() end
                      local resfunction = loadstring(CVV('$SYS.RESPAWN'))
                      local respawn = resfunction()
                      if not respawn then CSay(serialize('respawn',respawn)) Sys.Error('Illegal respawn data') end
                      LoadMap(respawn.map)
                      GoToLayer(respawn.layer,'Respawn')
                      MapText('RESPAWN')
                      LAURA.Flow('FIELD')
                      for ch in EachParty() do
                          local hp = RPG.Points(ch,'HP')
                          if skill==1 then hp.Have=hp.Maximum else hp.Have=1 end
                          if skill==3 then RPG.Points(ch,'AP').Have=0 end
                      end
                      if skill==2 then
                         Var.D('%CASH',CVV('%CASH')/2)
                      elseif skill==3 then
                         Var.D('%CASH',CVV('%CASH')/6)
                      end   
                 end


}
