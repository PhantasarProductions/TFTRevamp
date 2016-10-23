--[[
  Items.lua
  Version: 16.10.23
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
heroabl = heroabl or {}
abllist = {}
ablpage = {}

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
   chars = GetCharList()
   for c in each(chars) do
       abllist[c] = JINC('Script/JINC/CharAbilities/'..c..".lua")
       if abllist[c] then
          for k,d in pairs(abllist[c]) do
              if type(d)=="string" then abllist[c][k]=abllist[d][k] CSay("Linked abl list of character "..c.." with "..d) end
              ablpage[c] = ablpage[c] or {}
              ablpage[c][#ablpage[c]+1] = k 
          end
       else
          CSay("WARNING! I cannot yet linkscan empty character: "..c)       
       end       
   end
end   
             
function ItemGet(I,s)
     local ret = JINC("Script/JINC/IA/"..I..".lua")   -- IA = Items/Ability (I hope that was obvious) :-P
     -- local ret = f()
     if s then Var.D("$ITEMGET",serialize("ret",ret).."\n\nreturn ret") end
     return ret
end

function ItemHave(i,d)
   local r = Sys.Val(inventory[i])
   if d then Var.D('%ITEMHAVE',r) end
   return r
end

function ItemGive(i,n)
   inventory[i] = inventory[i] + (tonumber(n) or 1)
   if inventory[i]>itemmax then inventory[i]=itemmax end
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

function SpellList(ch)
    local cch=ch; if prefixed(ch,"Jake_") then cch="Jake" end -- Prevent conflicts in Fairy in human list. If Jake unlocked a spell as a Fairy so did he as a human, it is only that not all spells appear in his list, that's all.
    heroabl[cch] = heroabl[cch] or {}
    return heroabl[cch]
end

function iSpell(ch,page)
    local cnt = 0
    local lst = {}
    for key,a in spairs(abllist[ch][page]) do lst [#lst+1] = {k=key,a=a} end
    return function()
         cnt = cnt + 1
         if cnt>#lst then return nil,nil,nil end
         return cnt,lst[cnt].k,lst[cnt].a
    end
end

function ShowSpellList(ch,psizes)
   -- Set up
   local sizes = ({['table']=psizes, ['string']=mysplit(psizes,",") })[type(psizes)]
   local c
   for i=1,#sizes do sizes[i] = Sys.Val(sizes[i]) end
   if oldsslch~=ch then SSLP=1 SSLPG=1 oldsslch=ch end  
   SetFont('Stats')
   -- Origin
   Image.Origin(sizes[1],sizes[2])
   -- Show
   local ck,ca,sk,sa
   local has = SpellList(ch)
   local cnt
   for i,k,a in iSpell(ch,ablpage[ch][SSLPG]) do
       local y=(i+1)*fonts.Stats[2]
       sa=a; sk=k
       if i==SSLP then        ck=k       ca=a        c = {255,180,0} else c = {255,255,255} end
       if heroabl[k] then
          -- show spell
          local abl = ItemGet(k)
          DarkText(abl.Title,10,y,0,2,c[1],c[2],c[3])
          DarkText(abl.ABL_APCost,sizes[3]-10,1,2,0,180,255)
       else
          DarkText('---',10,y,0,2,c[1],c[2],c[3])
          if i==SSLP then DarkText("Hold H to see unlock info",sizes[3]-25,y,1,2,255,180,0) end
       end
       cnt=i
   end
   -- Help
   if joydown('XTRA') or INP.KeyD(KEY_H)==1 then
      if not has[ck] then
         local b = fonts.SpellUnlockBox[2]
         local sy = (SSLP+1)*fonts.Stats[2]
         local cy = sy
         Image.SetAlphaPC(50) black() Image.Rect(0,sy,sizes[3],b*7) Image.SetAlphaPC(100)
         SetFont('SpellUnlockBox')
         DarkText("To unlock you need:",5,cy,0,0,180,255,0)
         for i=1,5 do
             cy = cy + b
             if ca[i] then 
                if RPG.PointsExists(ch,"SK_LVL_"..i)==1 then
                   DarkText(CharacterMeta[ch]['skill'..i],5,cy,0,0,255,255,255)
                   DarkText(ca[i],sizes[3]-25,cy,1,0,255,180,0)
                else   
                   DarkText('???',5,cy,0,0,255,255,255)
                   DarkText('??',sizes[3]-25,cy,1,0,255,180,0)
                end
             end
         end
      end   
   end 
   -- Restore origin
   Image.Origin()
   -- Keyboard and joypad input
   if getpress.up  () and SSLP>  1 then SSLP = SSLP - 1 end
   if getpress.down() and SSLP<cnt then SSLP = SSLP + 1 end
end

function Teach(ch,ability)
   heroabl[ch][ability] = true
end

function MayTeach(ch)
   for pagenum,pagekey in spairs(ablpage[ch]) do
       CSay('Checking: '..pagekey)
       --for ablkey,ablreq in spairs(pagedata) do
       for ablkey,ablreq,a in iSpell(ch,ablpage[ch][pagenum]) do
           local al = not heroabl[ch][ablkey]
           for i,l in pairs(ablreq) do
               al = al and RPG.PointsExists(ch,"SK_LVL_"..i)==1 and RPG.PointsExists(ch,'SK_LVL_'..i).Have>=l               
           end
           if al then return ablkey end
       end
   end
end

function CombatTeach(ch)
   local tag = ch; if prefixed(tag,"Jake") then tag='Jake' end
   local spell = MayTeach(ch); if not spell then return end
   heroabl[ch][spell] = true
   local spelldata = ItemGet(spell)
   local actstring = 'act = "'..spell..'", aftermsg="'..RPG.GetName(ch)..' learned \''..spelldata.Title..'\', gratis=true'
   if spelldata.Target=="AA" or spelldata.Target=="1A" or spelldata.Target=="OS" then
      for i=0,3 do
          if RPG.PartyTag(i)==ch then actstring = actstring ..", group='Hero', id="..i end
      end
   end
   MS.Run("BOXTEXT","LoadData","COMBAT/LEARN;COMBATLEARN")
   RunBoxText('COMBATLEARN',upper(tag))
   MS.Run('COMBAT','AdeptNextAct',actstring)   
end

function ItemShowList(showfilter,enablefilter,char,psizes)
   local sizes = ({['table']=psizes, ['string']=mysplit(psizes,",") })[type(psizes)]
   local mx,my = GetMouse(); mx=sizes[1]+mx; my=sizes[2]+my
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
   SetFont('ItemName') 
   local c = col[true][enableditems[titm]==true]
   DarkText(items[titm].Desc,sizes[1]+25,tonumber(sizes[2]),0,0,180,255,0)
   -- CSay(psizes.." -> "..serialize('sizes',sizes))
   Scroller(scrollid,tonumber(sizes[1] or '0'),tonumber(sizes[2] or '0')+30,tonumber(sizes[3] or SW),tonumber(sizes[4] or SH)-30)
   local y,c
   for idx,itm in ipairs(showitems[showfilter..(char or "")]) do       
       y = idx*25
       if mx>0 and mx<tonumber(sizes[3]) and my>=y and my<=y-24 and INP.MouseH(1)==1 then
          if y==pos[scrollid] then
             Var.C("$SELECTEDITEM",itm)
          else
             y=post[scrollid]
          end      
       end   
       c = col[enableditems[showfilter..(char or "")][itm]==true][pos[scrollid]==idx]
       --CSay(itm..">> Enabled:"..sval(enableditems[itm]).." pos:" .. pos[scrollid].. " idx:"..idx)
       SetFont('ItemName') 
       DarkText(items[itm].Title,25,y,0,0,c[1],c[2],c[3])
       SetFont('ItemAmm')
       DarkText(inventory[itm],sizes[3]-25,y,1,0,c[1],c[2],c[3])
   end
   EndScroller(scrollid)
   if (INP.KeyH(KEY_DOWN)==1 or joyhit(joydown)) and pos[scrollid]<#showitems[showfilter..(char or "")]  then pos[scrollid] = pos[scrollid] + 1 end 
   if (INP.KeyH(KEY_UP  )==1 or joyhit(joyup  )) and pos[scrollid]>                                   1  then pos[scrollid] = pos[scrollid] - 1 end 
   if (INP.KeyH(KEY_SPACE)==1 or INP.KeyH(KEY_RETURN)==1 or INP.KeyH(KEY_ENTER)==1 or joyhit('CONFIRM')) then 
      Var.D("$SELECTEDITEM",showitems[showfilter..(char or "")][pos[scrollid]])
      CSay("Selected: "..Var.C('$SELECTEDITEM')) 
   end
end

function RemoveItem(item,num)
    local rn = tonumber(num) or 1
    if not inventory[item] then return CSay("WARNING! I could not remove item "..item.." as it was not in the inventory") end
    if inventory[item]<rn then inventory[item]=0 CSay("WARNING! More items were requested to be removed than I had: "..item) else inventory[item] = inventory[item] - rn end
    if inventory[item]<=0 then inventory[item]=nil end
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
