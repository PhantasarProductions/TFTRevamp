--[[
  ZombieShopHoerSpellScript.lua
  Version: 17.07.15
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
local SpellScript
-- @FI

	function SpellScript.ZombieShopHoer(victim,e,a)
	   local stock = JINC('Script/JINC/BIG/ZombieShopHoerStock.lua')
	   local ri = rand(1,#stock)
	   local it = stock[ri]
	   local svictim = victim; if prefixed(victim,'Jake_') then svictim = 'Jake' end
	   Var.D('$ZSH.VICTIM',svictim) 
	   Var.D('%ZSH.PRICE',it.Price)
	   Var.D('$ZSH.ITEM',it.Title)
	   MapText('BAT_ZSH_OFFER','FLOW_COMBAT')
	   if CVV('%CASH')<it.Price then
	      MapText('BAT_ZSH_POOR','FLOW_COMBAT')
	      Hurt(victim,rand(123456789,200000000))
	      return true
	   end
	   if ItemHas(it.itemtag)>=itemmax then   
        MapText('BAT_ZSH_OVERSTOCKED','FLOW_COMBAT')
        Hurt(victim,rand(123456789,200000000))
        return true
     end
     ItemGive(it.itemtag)
     dec('%CASH',it.Price)
     SFX('Audio/Shopping/ChaChing.ogg')
     return true   
	end
	
-- @IF GINORE
return SpellScript
-- @FI
