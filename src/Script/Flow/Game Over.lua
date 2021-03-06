--[[
  Game Over.lua
  Version: 17.01.05
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

-- Reminder to self
-- Music Music/Game Over/Going-Different-Ways.ogg

function GALE_OnLoad()
   ori = Image.GrabScreen()
   Music('Game Over/Going-Different-Ways.ogg')
   gameover = Image.Load('GFX/Logo/Game Over.png')
   Image.HotCenter(gameover)
   alpha = 0
end   

function MAIN_FLOW()
   white()
   Image.SetAlphaPC(100)
   Image.Show(ori)
   Image.SetAlphaPC(alpha)
   Image.Tile('PCS_BACK')
   Image.Show(gameover,Center_X,Center_Y)
   if alpha<100 then alpha = alpha + .1 end
   for i=1,255 do
       if INP.KeyH(i)==1 or (i<3 and mousehit(i)) or (i<16 and joyhit(i)) then Sys.Bye() end
   end
   Flip()
end   
   
   
