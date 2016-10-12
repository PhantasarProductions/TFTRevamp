--[[
  EXP_Table.lua
  Version: 16.10.12
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
EXP = {
      --[[ Not working the way I want. Too large numbers already on low levels.
         minlevel = 2,
         minexp   = 10,
         maxlevel = 5000,
         maxexp   = 1000000000
      --]]
         minlevel = 2,
         maxlevel = 300,
         startexp = 10   
      }
      
function EXP.ByLvl(self,lvl)
     --[[
     local rng = self.maxlevel - self.minlevel
     assert(rng>0,"Invalid exp settings")
     if lvl==self.minlevel then return self.minexp end
     if lvl==self.maxlevel then return self.maxexp end
     local bexp = self.maxexp/rng
     local ret  = math.ceil(bexp*lvl)
     return ret
     ]]
     assert(lvl>=self.minlevel,"Invalid level")
     local ret = self.startexp
     for i=self.minlevel,lvl do
         ret = ret + ret/7
         if ret>2000000000 then return 2000000000 end -- Above 2 billion systems and underlying APIs will malfunction.
     end     
     return math.floor(ret)
end    
  


-- The code below is destinied to always be ignored iN GALE, but in a test in the Lua CLI tool, the pre-processor tags are ignored, and thus.... 

-- @IF TEST_ON_CONSOLE

for i=EXP.minlevel,EXP.maxlevel do

    print( i.." requires "..EXP:ByLvl(i).." experience points" )
    
end

os.exit()

return EXP -- And this line is just to fool my outliner for "better" effect ;)

-- @FI    
