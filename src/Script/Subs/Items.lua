--[[
  Items.lua
  Version: 16.09.19
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
-- @USE /Script/Use/Specific/Scroller.lua

itemmax = ({50,25,10})[tonumber(Var.C("%SKILL"))]
cashmax = ({1000000000,500000000,100000000})[tonumber(Var.C("%SKILL"))]

inventory = inventory or { ITM_APPLE = ({20,10,1})[tonumber(Var.C("%SKILL"))]}

itemfilter = {

                  All = function(i) return true end,
                  Equip = function(i,ch)
                            local char = ch
                            local ret
                            if prefixed(char,"Jake") then ch='Jake' end
                            if char=="Krandar" then return false end
                            ret = false
                            ret = ret or ((i.ITM_Type=="Weapon" or i.ITM_Type=='Armor') and i.ITM_EQP_for==char)
                            ret = ret or (i.ITM_Type=='Accesoiry' and i['ITM_ACC_'..char])
                            return ret 
                          end,
                  Combat = function(i)
                            return i.ITM_Type=='Consumable' and i.ITM_Combat
                           end,
                  Field = function(i)
                            return i.ITM_Type=='Consumable' and i.ITM_Field
                          end,
                  Key = function(i) return i.ITM_Type=="KeyItem" end       ,
                  Sellable = function(i) return i.ITM_Type=="KeyItem" and i.ITM_Sellable end,
                  FieldUse = function(i,ch)
                                return itemfilter.Field(i) or itemfilter.Equip(i,ch)
                             end                  
             }
             
shownitems = {}; showitems=shownitems
enableditems  = {}             
items = {}
pos = {}
             
function GALE_OnLoad()
   LoadItemModule = nil
end   
             
function ItemGet(I,s)
     local ret = JINC("Script/JINC/IA/"..I..".lua")   -- IA = Items/Ability (I hope that was obvious) :-P
     -- local ret = f()
     if s then Var.D("$ITEMGET",serialize("ret",ret).."\n\nreturn ret") end
     return ret
end

function ItemFilterReset() filtereditems = {} end

function FilterShownItems(pfilter,char,force)
    local filter = pfilter .. (char or "") 
    if shownitems[filter] and (not force) then return end -- Only filter when we have to (or the game's performance will go down like hell).
    local list = {}
    showitems[filter] = list
    local show
    for key,number in spairs(inventory) do
        items[key] = items[key] or ItemGet(key) 
        show = (itemfilter[pfilter] or function() Sys.Error("Unknown item filter: "..sval(pfilter)) end)(items[key],char)
        show = show and inventory[key]>0
        if show then list[#list+1] = key end
    end
end

function FilterEnabledItems(pfilter,char,force)
    local filter = pfilter .. (char or "") 
    if enableditems[filter] and (not force) then return end -- Only filter when we have to (or the game's performance will go down like hell).
    local list = {}
    enableditems[filter] = list
    local show = false
    for key,number in spairs(inventory) do
        items[key] = items[key] or ItemGet(key) 
        show = (itemfilter[pfilter] or function() Sys.Error("Unknown item filter: "..sval(pfilter)) end)(items[key],char)
        show = show and inventory[key]>0
        list[key] = show
        -- CSay(key .. " >> "..sval(show))
    end
end

function ItemShowList(showfilter,enablefilter,char,psizes)
   local scrollid = "I_"..showfilter.."_"..enablefilter.."_"..char
   local col = {[true] = {[true]={255,180,0},[false]={255,255,255}},
                         [false]={[true]={100,100,100},[false]={70,70,70}}}
   local titm
   pos[scrollid] = pos[scrollid] or 1
   FilterShownItems(showfilter,char)
   FilterEnabledItems(showfilter,char)
   if pos[scrollid]>#showitems[showfilter..(char or "")] then pos[scrollid] = #showitems[filter..(char or "")] end
   if pos[scrollid]<1 then pos[scrollid]=1 end
   titm = showitems[showfilter..(char or "")][pos[scrollid]]
   local sizes = ({['table']=psizes, ['string']=mysplit(psizes,",") })[type(psizes)]
   SetFont('ItemName') 
   local c = col[true][enableditems[titm]==true]
   DarkText(items[titm].Desc,sizes[1]+25,tonumber(sizes[2]),0,0,180,255,0)
   -- CSay(psizes.." -> "..serialize('sizes',sizes))
   Scroller(scrollid,tonumber(sizes[1] or '0'),tonumber(sizes[2] or '0')+30,tonumber(sizes[3] or SW),tonumber(sizes[4] or SH)-30)
   local y,c
   for idx,itm in ipairs(showitems[showfilter..(char or "")]) do
       y = idx*25
       c = col[enableditems[showfilter..(char or "")][itm]==true][pos[scrollid]==idx]
       --CSay(itm..">> Enabled:"..sval(enableditems[itm]).." pos:" .. pos[scrollid].. " idx:"..idx)
       SetFont('ItemName') 
       DarkText(items[itm].Title,25,y,0,0,c[1],c[2],c[3])
       SetFont('ItemAmm')
       DarkText(inventory[itm],sizes[3]-25,y,1,0,c[1],c[2],c[3])
   end
   EndScroller(scrollid)
end

function TreasureChest(tag)
    local chest = Maps.Obj.Obj(tag)
    if chest.Frame==1 then return end -- We don't deal with already open chests (this check is not needed at all, but rather an extra safety precaution).
    local icode = upper(chest.DataGet("Item"))
    local gotit
    MS.LoadNew("BOXTEXT","Script/Subs/BoxText.lua")
    MS.Run("BOXTEXT","LoadData","General/Items;ITEM")
    if prefixed(icode,"CASH:") then
       local wc = mysplit(icode,":")
       local getcash = tonumber(wc[2])
       if skill==1 then getcash = getcash * 2 elseif skill==3 then getcash = getcash * .25 end
       Var.D("$ITEMNAME",getcash.." shilders")
       if CVV("%CASH") >= cashmax then 
          SerialBoxText("ITEM","FULL")
       else
          SerialBoxText("ITEM","GET")
          inc('%CASH',getcash)
          gotit = true
       end   
    else
       if not prefixed(icode,"ITM_") then icode="ITM_"..icode end
       items[icode] = items[icode] or ItemGet(icode)
       local item = items[icode]
       Var.D("$ITEMNAME",item.Title)
       inventory[icode] = inventory[icode] or 0
       if inventory[icode]<itemmax then
          shownitems = {}; showitems=shownitems
          enableditems  = {}
          inventory[icode] = inventory[icode] + 1            
          SerialBoxText("ITEM","GET")
          gotit = true
       else   
          SerialBoxText("ITEM","FULL")
       end
    end
    -- Adept the map      
    if gotit then
       chest.Frame = 1
       Maps.PermaWrite(' Maps.Obj.Obj("'..tag..'").Frame = 1 -- It\'s open!')
    end
end
