--[[
  Items -- Linker.lua
  Version: 17.07.15
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

-- CSay("Item Linkers")


itemmax = ({50,25,10})[tonumber(Var.C("%SKILL"))]
cashmax = ({1000000000,500000000,100000000})[tonumber(Var.C("%SKILL"))]


LoadedItems = {}

function LoadItemModule()
   MS.LoadNew("ITEMS","Script/Subs/Items.lua")
end   

ItemGet = ItemGet or function(i)
   LoadItemModule()
   if LoadedItems[i] then return LoadedItems[i] end -- Don't load again if it was loaded before.
   MS.Run("ITEMS","ItemGet",i..";DUMPIT")
   local ret = loadstring(Var.C('$ITEMGET'))
   LoadedItems[i] = ret()
   Var.Clear('$ITEMGET')
   return ret()
end

ItemHave = ItemHave or function(i)
   LoadItemModule()
   MS.Run("ITEMS","ItemHave",i..";DUMPIT")
   local ret = CVV('%ITEMHAVE')   
   Var.Clear('%ITEMHAVE')
   return ret
end

ItemHas = ItemHave
   
         
ItemFilterReset = ItemFilterReset or function()
   LoadItemModule()
   MS.Run("ITEMS","ItemFilterReset")
end

ItemShowList = ItemShowList or function(showfilter,enablefilter,char,sizes)
   LoadItemModule()
   --CSay(serialize("Debug",sizes))
   MS.Run("ITEMS","ItemShowList",showfilter..";"..enablefilter..";"..char..";"..sizes[1]..","..sizes[2]..","..sizes[3]..","..sizes[4])
end

TreasureChest = TreasureChest or function(tag)
   LoadItemModule()
   MS.Run("ITEMS","TreasureChest",tag)
end

RemoveItem = RemoveItem or function (item,num)
   LoadItemModule()
  
   MS.Run("ITEMS","RemoveItem",item..";"..(num or 1))
end   

function SelectedItem() -- Returns the last selected item and kills the selected item afterward. If no item is selected 'nil' will be returened
   local ret = CVV("$SELECTEDITEM")  
   Var.Clear("$SELECTEDITEM")
   if ret=="" then return nil end
   CSay("Returning: "..sval(ret))
   return ret
end   

function SelectedAbility() -- Returns the last selected Ability and kills the selected Ability afterward. If no Ability is selected 'nil' will be returened
   local ret = CVV("$SELECTEDABILITY")  
   Var.Clear("$SELECTEDABILITY")
   if ret=="" then return nil end
   CSay("SelectedAbility(): Returning: "..sval(ret))
   return ret
end   

TeachSkill = TeachSkill or function(ch,skill)
   LoadItemModule()
   MS.Run('ITEMS','TeachSkill',ch..";"..skill)
   local ret = CVV('&TEACH.SKILL.OK')
   Var.Clear('&TEACH.SKILL.OK')
   return ret
end   

ItemGive = ItemGive or function(i,n)
   LoadItemModule()
   MS.Run("ITEMS","ItemGive",i..";"..(n or 1))
end

ShowSpellList = ShowSpellList or function (ch,sizes)
   LoadItemModule()
   --CSay(serialize("Debug",sizes))
   MS.Run("ITEMS","ShowSpellList",ch..";"..sizes[1]..","..sizes[2]..","..sizes[3]..","..sizes[4])
end

HealTypes = {
               Absolute    = function(ch,item) return item.Heal end,
               Percent     = function(ch,item) return math.ceil((item.Heal/100)*RPG.Points(ch,"HP").Maximum) end,
               StatPercent = function(ch,item,bytag) return math.ceil((item.Heal/100)*RPG.Stat(bytag,'END_'..item.Heal_StatPercent)) end
            }

function ItemHeal(ch,itemdata,retonly,bytag)
    if (not itemdata.Heal) then return --[[CSay('Heal nil -- '..serialize('itemdata',itemdata))]] end
    if (itemdata.Heal<=0) then return --[[CSay('Heal zero') ]] end
    local ret = (HealTypes[itemdata.Heal_Type] or Sys.Error("I don't know Heal Type "..sval(itemdata.Heal_Type)))(ch,itemdata,bytag)
    if not retonly then RPG.Points(ch,"HP").Inc(ret) end
    return ret
end

Teach = Teach or function(ch,ability)
   LoadItemModule()
   MS.Run("ITEMS",'Teach',ch..";"..ability)
end
