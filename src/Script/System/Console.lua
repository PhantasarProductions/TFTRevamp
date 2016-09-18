--[[
  Console.lua
  Version: 16.09.17
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

-- TFT REVAMPED

function SHOWTIME()
     CSay(CVV("%GAMETIME.SECONDS").." seconds")
     CSay(CVV("%GAMETIME.MINUTES").." Minutes")
     CSay(CVV("%GAMETIME.HOURS").." hours")
     CSay(PlayTime())
end     

function RESETPLAYTIME()
  Var.Clear("%GAMETIME.HOURS")
  Var.Clear("%GAMETIME.MINUTES")
  Var.Clear("%GAMETIME.SECONDS")
  CSay("Play time reset")
end

function SAVE(file)
if LAURA.GetFlow()~="FIELD" then return CWrite("? You can only save in the field!",255,0,180) end
SaveMeta()
if (not file) or file=="" then
    GotoSave()
    CWrite("Leaving the console now will pop-up the save screen",0,180,255) 
    return 
    end
local myfile=file
local dir = mysplit(file,"/")
if #dir==1 then myfile = "Debug/"..myfile; dir = mysplit(myfile,"/") end 
if #dir~=2 then return CWrite("? I cannot save that file. Only one directory please!",255,0,0) end
LAURA.Save(myfile)
end

function LISTCLICKABLES()
  MS.Run("FIELD","ListClickables")
end

function RELOADCHAR(ch)
  MS.Run("PARTY",'CreateChar',ch)
end  
