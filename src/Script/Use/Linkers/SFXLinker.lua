--[[
  SFXLinker.lua
  Sound Effects - Linker
  version: 16.12.08
  Copyright (C) 2015, 2016 Jeroen P. Broks
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
SFX = SFX or function(sound,channel,once)
   MS.LN_Run("SFX","Script/Subs/SFX.lua","SFX",sound..";"..(channel or 'nil')..";"..boolyn[nonil(once)])
end


WaitSFX = WaitSFX or function(channel)
   MS.LN_Run("SFX","Script/Subs/SFX.lua","WaitSFX",channel)
end

SFXWait = WaitSFX
