--[[
  Menu.lua
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

profiles = {
                 Field = {
                      Features = {'Status','Items','Abilities','Master','Achievements','Config','Quit'},
                      HalfScreen = {Status={'Stats','Status'},Items={'Stats','Items'},Abilities={'Stats','Abilities'}},  
                      ItemShowFilters = {'All',"Field",'Equip','Key'},
                      BlockOut = {'Config'},
                      ItemEnable = 'FieldUse',                    
                      PartyBrowse = true,
                      EscReturn = 'FIELD'
                      },
                 Shop = {
                          Features = {"Buy","Sell"},   
                          EscReturn = "FIELD"
                        },                           
                 ShopTrade = {}     
           }
           
-- General Menu features
function Menu_Init(LoadProfile)
    profile = profiles[LoadProfile] or Sys.Error("Unknown Profile: "..sval(LoadProfile))
    profile.HalfScreen = profile.HalfScreen or {} -- Crash prevention
    profile.FeatureItem = profile.FeatureItem or 1
    menu.loadedprofile = LoadProfile
    MyScreen = nil
end
           

for k,v in pairs(profiles.Shop) do profiles.ShopTrade[k]=profiles.Shop[k] end
profiles.ShopTrade.Features = {"Buy","Sell","Trade"}
           
menu = menu or { chn = 0, fp = 1 }        

mx,my = 0,0   


features = {}

function eqIcon(tag,x,y)
   Image.LoadNew('ico'..tag,"GFX/Equipment/"..tag..".png")
   Image.Show('ico'..tag,x,y)
end   

function eqName(ch,eqtag,x,y)
   local itcode = RPG.GetData(ch,'EQP_'..eqtag); if itcode=="" then DarkText("---",x,y,0,0,255,0,0) return end
   local item = ItemGet(itcode) 
   SetFont('Equip') 
   DarkText(item.Title,x,y,0,0,255,255,255)
end

-- Menu features
fnpc = false
function features.notpresent(x,y,w,h,f)
  local c = {[false]=0, [true]=255}
  fnpc = not fnpc
  DarkText("Feature "..sval(f),x+(w/2),y+10,2,0,255,c[fnpc],0)
  DarkText("NOT PRESENT!",x+(w/2),y+h,2,1,255,c[fnpc],0)
end

function features.Stats(x,y,w,h,f)
    local chn = menu.chn
    local ch  = RPGStat.PartyTag(chn)
    local procent = {Accuracy=true,Evasion=true}
    local procentteken = {[false]='',[true]='%'}
    white()
    Image.Show("CL_FACE_"..ch,(x+w)-(25+Image.Width("CL_FACE_"..ch)),y+25)
    SetFont('StatusName')
    DarkText(RPG.GetName(ch),x+25,y+25)
    SetFont('StatusStat')
    local HP = RPG.Points(ch,"HP")
    local AP = RPG.Points(ch,"AP")
    DarkText("HP "..HP.Have.." of "..HP.Maximum,x+25,y+75,0,0,180,255,0)                                                       
    DarkText("AP "..AP.Have.." of "..AP.Maximum,x+25,y+95,0,0,0,180,255)                                                       
    for i,s in ipairs({'Power','Endurance','Intelligence','Resistance','Speed','Accuracy','Evasion'}) do
        DarkText(s,x+25,y+100+(i*fonts.StatusStat[2]),0,0)
        DarkText(RPG.Stat(ch,"END_"..s)..procentteken[procent[s]==true],(x+w)-25,y+100+(i*fonts.StatusStat[2]),1,0,255,180,0)
    end
    color(255,180,0)
    eqIcon('Acc'   ,x+10,(y+h)-25)
    eqIcon('Armor' ,x+10,(y+h)-50)
    eqIcon('WP_'..ch,x+10,(y+h)-75)
    eqName(ch,'Acc'   ,x+40,(y+h)-25)
    eqName(ch,'Armor' ,x+40,(y+h)-50)
    eqName(ch,'Weapon',x+40,(y+h)-75)
    if f~="Status" then return end
end


function features.Master(x,y,w,h,f)
      MS.LN_Run("MASTER","Script/Flow/Master.lua","MasterOverview","{x="..x..",y="..y..",h="..h..",w="..w.."}")
end

features.ConfigFunctions = {}

function features.ConfigFunctions.ToTest(b)
    features.ConfigFlow='joytest'
    BlockTabSwitch=true
end


features.ConfigItems = {
                  { name='Confirm Button', b='CONFIRM'},
                  { name='Cancel Button', b='CANCEL'},
                  { name='Menu Button', b='MENU'},
                  { name='Menu Char Left',b='L1'},
                  { name='Menu Char Right',b='R1'},
                  { name='Ability Page Left',b='L2'},
                  { name='Ability Page Right',b='R2'},
                  
                  { name='Test Joypard',f=features.ConfigFunctions.ToTest}
                  
              }



function features.ConfigFunctions.JoyButton(b)
end


function features.ConfigButton(x,y,num,pushed)   
   assert(num>=0 and num<=15,"Button not there!")
   local tp = ({ [true]='Push',[false]='Unpush'})[pushed==true]
   local b=num+1
   Image.LoadNew('BUTTON_'..tp..b,'GFX/JoyPad/'..tp..right("0"..b,2)..".png")
   Image.Show('BUTTON_'..tp..b,x,y)
end   

features.ConfigFlowFunctions = {

     butselect=function(x,y,w,h,f)
                  local dx=x+10
                  local dy=y+10
                  features.ConfigP = features.ConfigP or 1
                  SetFont('JoyConfig')
                  for i,item in ipairs(features.ConfigItems) do
                      local iy = dy+(i*20)
                      local c
                      if features.ConfigP==i then c = {255,180,0} else c={255,255,255} end 
                      DarkText(item.name,dx,iy,0,0,c[1],c[2],c[3])
                      tabcol(c)
                      if item.b then features.ConfigButton(dx+200,iy,CVV('%JOY.'..item.b)) end
                      if features.ConfigP==i then
                         if item.b then                             
                            for bi=0,15 do if INP.JoyH(bi)==1 then Var.D('%JOY.'..item.b,bi) end end
                         elseif INP.KeyH(KEY_RETURN)==1 or INP.KeyH(KEY_ENTER)==1 or INP.KeyH(KEY_SPACE)==1 or joyhit('CONFIRM') or mousehit(1) then
                            (item.f or Nothing)()
                         end    
                      end
                  end
                  if (INP.KeyH(KEY_UP  )==1 or joyhit(joy_up  )) and features.ConfigP>1                     then features.ConfigP = features.ConfigP - 1 end
                  if (INP.KeyH(KEY_DOWN)==1 or joyhit(joy_down)) and features.ConfigP<#features.ConfigItems then features.ConfigP = features.ConfigP + 1 end                  
               end,
     joytest=function(x,y,w,h,f)
                 White()
                 for i=0 , 15 do
                     features.ConfigButton(x+(w/2),y+8+(i*20),i,INP.JoyD(i)==1)
                     local steer = "Base"
                     if round(INP.JoyX())== 1 then steer='Right' end
                     if round(INP.JoyX())==-1 then steer='Left' end
                     if round(INP.JoyY())== 1 then steer='Down' end
                     if round(INP.JoyY())==-1 then steer='Up' end
                     Image.LoadNew("JOYSTEER."..steer,"GFX/Joypad/Steering_"..steer..".png")
                     Image.Show("JOYSTEER."..steer,x+5,y+5)
                 end
                 SetFont('JoyConfig')
                 DarkText('Press esc or right mouse button to go back to the config menu',x+(w/2),y+h,2,1)    
                 if mousehit(2) or INP.KeyH(KEY_ESCAPE)==1 then
                    BlockTabSwitch = false
                    features.ConfigFlow = 'butselect'
                 end   
             end          

}





function features.Config(x,y,w,h,f)
  features.ConfigFlow = features.ConfigFlow or 'butselect'
  features.ConfigFlowFunctions[features.ConfigFlow](x,y,w,h,f)  
end

-- @IF ALLOW_QUITSAVE
function SaveNQuit() 
  Cls()
  Image.LoadNew("SG_SAVING","GFX/Loading/Saving.png"); Image.HotCenter("SG_SAVING")
  Cls()
  Image.Tile('PCS_BACK')
  Image.Show("SG_SAVING",Center_X,Center_Y)
  Flip()
  LAURA.Flow("FIELD")
  SaveMeta()
  LAURA.Save('System/Quit',1)
  Sys.Bye()   
end
-- @FI

-- @IF ALLOW_QUITSAVE
allowquitsave = false
qsaveroomdata = {}
-- @FI

function initquit()
 local quit
 quit = { Y = {t = 'Press Y to quit', f = Sys.Bye, k=KEY_Y, c={255,0,0}}}
 -- @IF ALLOW_QUITSAVE
 if qsaveroomdata.map ~= Maps.CodeName or qsaveroomdata.layer ~= Maps.LayerCodeName then
    if Maps.GetData('NoSaveZones')~="" then
       qsaveroomdata.nosavezones = mysplit(Maps.GetData('NoSaveZones'))
    else
       qsaveroomdata.nosavezones = {}   
    end  
 end
 --CSay(serialize('initquit',qsaveroomdata))    
 if not tablecontains(qsaveroomdata.nosavezones,Maps.LayerCodeName) then   
    quit.Y.t = "Press Y to quit without saving"
    quit.S = { t = "Press S to save and quit", f = SaveNQuit, k=KEY_S, c={0,255,0}}
 end   
 -- @FI
 quitcount = 0
 for k,v in pairs(quit) do quitcount = quitcount + 1 end
 qsaveroomdata.map = Maps.CodeName
 qsaveroomdata.layer = Maps.LayerCodeName
 return quit
end    

function features.Quit(x,y,w,h)
  if qsaveroomdata.map ~= Maps.CodeName or qsaveroomdata.layer ~= Maps.LayerCodeName then quit=nil end
  quit = quit or initquit()
  local cx = x + (w/2)
  local cy = y + (h/2)
  local wy = cy - ((quitcount*fonts.Quit[2]))
  for k,v in spairs(quit) do
      DarkText(v.t,cx,wy,2,2,v.c[1],v.c[2],v.c[3])
      if INP.KeyH(v.k)==1 then v.f() end
      wy = wy + fonts.Quit[2]
  end
end

function features.Status(x,y,pw,h)
    local chn = menu.chn
    local ch  = RPGStat.PartyTag(chn)
    local py  = fonts.StatusStat[2]
    local wy  = 0
    local w   = pw - 5
    local showlevel,showexp
    Image.Origin(x+5,y+5)
    SetFont('StatusStat')                                                       
    DarkText(CharacterMeta[ch].race.." "..CharacterMeta[ch].sex,0,0,0,0,255,255,255)
    DarkText("Experience",0,py,0,0,255,255,255)
    DarkText("Level",0,py*2,0,0,255,255,255)
    if RPG.Stat(ch,'Level')<=CVV("%LEVELCAP") then showlevel = RPG.Stat(ch,'Level')   else showlevel = "---" end
    if RPG.Stat(ch,'Level')< CVV("%LEVELCAP") then showexp   = RPG.SafeStat(ch,'EXP') else showexp   = "---" end
    DarkText(showlevel,w,py*2,1,0,255,180,000)
    DarkText(showexp  ,w,py  ,1,0,255,180,000)
    local master = "None"
    local masterc = {255,0,0}
    if RPG.DataExists(ch,"Master")~=0 and RPG.GetData(ch,"Master")~="" then 
       master = RPG.GetData(ch,"Master")
       masterc = {255,255,255}
    end   
    DarkText("Master",0,py*3,0,0,masterc[1],masterc[2],masterc[3])
    DarkText(master,w,py*3,1,0,masterc[1],(masterc[2]/masterc[2])*180,0)
    wy = py*4
    for i=1,5 do
        wy = wy + py        
        if RPG.PointsExists(ch,'SK_LVL_'..i)==1 then
           local e = RPG.Points(ch,'SK_EXP_'..i)
           local Have = e.Have
           local Maximum = e.Maximum
           local deling = Have / Maximum
           local barw = math.floor((SW/1200) * 250)
           local progress = math.ceil(deling*barw)
           --DarkText(Have.." => "..Maximum.." D:"..deling.." ??? "..progress.."("..barw..")",0,i*20) -- Debug line
           color(100,100,100)
           Image.Rect(w-barw,wy+(py-5),barw,5)
           color(255,180,0)
           Image.Rect(w-barw,wy+(py-5),progress,5)
           DarkText(CharacterMeta[ch]['skill'..i],0,wy,0,0,255,255,255)
           DarkText(RPG.Points(ch,'SK_LVL_'..i).Have,w,wy,1,0,255,180,0)
           RPG.Points(ch,'SK_LVL_'..i).Minimum=1
        elseif CharacterMeta[ch]['skill'..i] then
           DarkText('???',0,wy,0,0,255,0,0)   
        end
    end
    Image.Origin(0,0)    
end

function eqChange(slot,itag,item)
    local chn = menu.chn
    local ch  = RPGStat.PartyTag(chn)
    local ecode = RPG.GetData(ch,"EQP_"..slot)
    local eitem
    CSay('Equipment change request on: '..ch)
    if ecode~="" and ItemHave(ecode)<itemmax then
       ItemGive(ecode)
    end
    RPG.SetData(ch,"EQP_"..slot,itag)
    RemoveItem(itag) 
    MS.LN_Run('CHAR',"Script/Char/Char.lua",'EStat',ch)  
end

function features.Items(x,y,w,h)
    profile.ci_filter = profile.ci_filter or 1
    ItemShowList(profile.ItemShowFilters[profile.ci_filter],profile.ItemEnable,RPG.PartyTag(menu.chn),{x,y,w,h})
    local myitem = SelectedItem(); if not myitem then return end    
    local item   = ItemGet(myitem)
    local chn = menu.chn
    local ch  = RPGStat.PartyTag(chn)
    CSay("Player tries to use "..myitem.." ("..item.ITM_Type..") on "..ch)
    ;(({
          Weapon = function(ch,myitem,item)
                     -- CSay('Iemand thuis?')
                     -- CSay(ch.."\n "..serialize('item',item).." \n "..myitem)
                     if prefixed(ch,item.ITM_EQP_For) or ch==item.ITM_EQP_For then eqChange("Weapon",myitem,item) end
                   end,
          Armor = function(ch,myitem,item)
                     if prefixed(ch,item.ITM_EQP_For) or ch==item.ITM_EQP_For then eqChange("Armor",myitem,item) end
                   end,
          Accesoiry = function(ch,myitem,item)
                        local pch = ch
                        if prefixed(ch,"Jake") then pch="Jake" end
                        if item['ITM_ACC_'..pch] then eqChange('Acc',myitem,item) end
                      end,
          Consumable = function(ch,myitem,item)
                          if not item.ITM_Field then return end
                          local effect
                          local hp = RPG.Points(ch,'HP')
                          if hp.Have<hp.Maximum then
                             local heal = ItemHeal(ch,item); effect = effect or heal>0
                          end   
                          if effect then
                             RemoveItem(myitem,1)
                          end                             
                       end                               
    })[item.ITM_Type] or Nothing)(ch,myitem,item)
end

function features.Abilities(x,y,w,h)
    ShowSpellList(RPGStat.PartyTag(menu.chn),{x,y,w,h})
end

function features.Achievements(x,y,w,h)
    MS.Run('ACH','AchList','tag="MenuScreen", x='..x..", y="..y..", w="..w..", h="..h)
end

-- Store / Merchant Features
function Shop_Load(tag)
   Cls()
   Loading()
   Shop = jinc('Script/JINC/Shops/'..tag..".lua")
   assert(Shop,"Something went wrong loading the shop: "..tag)
   Shop.itemdata = {}
   Shop.P = 1
   ItemFilterReset()
end

function Shop_Error(error)
   Shop.Error = {}
   Shop.Error.Msg = error
   Shop.Error.Time = 175
end

function features.Buy(x,y,w,h)
   -- Start
   local tmx,tmy = MouseCoords()
   local mx,my   = tmx-x,tmy-y
   local siz     = (h-40)/22
   local moved
   if mx~= Shop.OldMX or my~= Shop.OldMY then moved = true Shop.OldMX=mx Shop.OldMY=my end 
   fonts.ShopItem[2] = siz
   fonts.ShopNumber[2] = siz
   Image.Origin(x,y)
   -- Do
   SetFont('MasterHeader')
   DarkText(Shop.Title,15,15,0,0,255,180,0)   
   SetFont("FieldStat")
   DarkText(CVV('%CASH').." shilders",w-15,15,1,0,0,180,255)
   for i= 1 , 20 do
       if Shop['Slot'..i] and Shop['Slot'..i]~="" and (not prefixed(Shop['Slot'..i],"AAA")) then
          local iy = 40 + (i*siz)
          Shop.itemdata[i] = Shop.itemdata[i] or ItemGet(Shop['Slot'..i])
          local item = Shop.itemdata[i]
          if item.ITM_Type=='Weapon' or item.ITM_Type=='Armor' and menu.loadedprofile=="Shop" then Menu_Init('ShopTrade') end
          SetFont('ShopItem')
          local mix=30
          if i==Shop.P then 
             mix=20
             DarkText(item.Desc,w/2,40,2,0,180,255,0) 
          end
          DarkText(item.Title,mix,iy,0,0,255,255,255)
          SetFont('ShopNumber')
          DarkText((item.ITM_ShopPrice or "ERROR").." shilders",w-50,iy,1,0,255,180,0)
          DarkText(ItemHave(Shop['Slot'..i]),w/2,iy,1,0,0,180,255)
          if moved and my>iy and my<iy+siz then Shop.P = i end
       end   
   end
   if INP.KeyH(KEY_DOWN)==1 or joyhit(joy_down) then 
      repeat 
         Shop.P = Shop.P + 1
         if Shop.P>20 then Shop.P=1 end
      until Shop['Slot'..Shop.P] and Shop['Slot'..Shop.P]~=""
   end   
   if INP.KeyH(KEY_UP)==1 or joyhit(joy_up) then 
      repeat 
         Shop.P = Shop.P - 1
         if Shop.P<1 then Shop.P=20 end
      until Shop['Slot'..Shop.P] and Shop['Slot'..Shop.P]~=""
   end
   if (mousehit(1) or INP.KeyH(KEY_ENTER)==1 or INP.KeyH(KEY_SPACE)==1 or INP.KEYH(KEY_RETURN)==1 or joyhit('CONFIRM')) and tmy>y then
      local item = Shop.itemdata[Shop.P]
      if CVV('%CASH')<item.ITM_ShopPrice then Shop_Error("Not enough money")
      elseif ItemHave(Shop['Slot'..Shop.P])>=itemmax then Shop_Error("Max number of that item reached")
      else
         SFX('Audio/Shopping/ChaChing.ogg')
         dec('%CASH',item.ITM_ShopPrice)
         ItemGive(Shop['Slot'..Shop.P],1)
      end
   end 
   if mousehit(2) or joyhit('CANCEL') or INP.KeyH(KEY_ESCAPE)==1 then LAURA.Flow('FIELD') end
   -- error
   if Shop.Error then
      SetFont ( 'MasterHeader' )
      DarkText( Shop.Error.Msg , w/2, h/2, 2, 2 , 255, 0, 0)
      Shop.Error.Time = Shop.Error.Time - 1
      if Shop.Error.Time <= 0 then Shop.Error = nil end
   end   
   -- End
   Image.Origin(0,0)
end

function features.Sell(x,y,w,h)
    ItemShowList('Sellable','Sellable','Marrilona',{x,y,w,h})
    DarkText(CVV('%CASH').." shilders",x+(w-15),y+15,1,0,0,180,255)
    local myitem = SelectedItem()
    if myitem then
       local mydata = ItemGet(myitem)    
       SFX('Audio/Shopping/ChaChing.ogg')
       inc('%CASH',mydata.ITM_SellPrice)
       RemoveItem(myitem,1)
       ItemFilterReset()
    end
end

function features.Trade(x,y,w,h)
   local tmx,tmy = MouseCoords()
   local mx,my   = tmx-x,tmy-y
   local siz     = (h-40)/22
   local moved
   totalwidth  = SW
   totalheight = SH
   origin = {0,0}
   if tonumber(LC('screen.margin.left')  )~=0 then origin[1] = 25; totalwidth=totalwidth -25 end
   if tonumber(LC('screen.margin.top')   )~=0 then origin[2] = 25; totalwidth=totalheight-25 end
   if tonumber(LC('screen.margin.right') )~=0 then                 totalwidth=totalwidth -25 end
   if tonumber(LC('screen.margin.bottom'))~=0 then                 totalwidth=totalheight-25 end
   charentrywidth = totalwidth / 4
   Image.Origin(x,y)
   SetFont('MasterHeader')
   DarkText(Shop.Title,15,15,0,0,255,180,0)   
   SetFont("FieldStat")
   DarkText(CVV('%CASH').." shilders",w-15,15,1,0,0,180,255)
   local allow = {}
   for i= 1 , 20 do
       if Shop['Slot'..i] and Shop['Slot'..i]~="" and (not prefixed(Shop['Slot'..i],"AAA"))then
          local iy = 40 + (i*siz)
          Shop.itemdata[i] = Shop.itemdata[i] or ItemGet(Shop['Slot'..i])
          local item = Shop.itemdata[i]
          allow[i] = (item.ITM_Type=='Weapon' or item.ITM_Type=='Armor') -- and menu.loadedprofile=="Shop" 
          SetFont('ShopItem')
          local mix=30
          if i==Shop.P then 
             mix=20
             DarkText(item.Desc,w/2,40,2,0,180,255,0) 
          end
          if allow[i] then 
            DarkText(item.Title,mix,iy,0,0,255,255,255)
            SetFont('ShopNumber')
            --DarkText(item.ITM_ShopPrice.." shilders",w-50,iy,1,0,255,180,0)
            --DarkText(ItemHave(Shop['Slot'..i]),w/2,iy,1,0,0,180,255)
            local pch = item.ITM_EQP_For; if pch=="Jake" then pch="Jake_Human" end -- Jake Human always exists, and Jake_Fairy will be linked so they always carry the same ;)
            local haveitem = RPG.GetData(pch,"EQP_"..item.ITM_Type)  -- CSay(pch.." has "..haveitem.. " on "..item.ITM_Type)
            local have = ItemGet(haveitem)
            local price = item.ITM_ShopPrice - (have.ITM_SellPrice or 0)
            if allow[i] then allow[i] = price end
            if (not have.ITM_Sellable) or (not InParty(pch)) or ((have.ITM_SellPrice or 0)<=0)then
               -- DarkText('Sellable: '..sval(have.ITM_Sellable).." InParty("..sval(pch).."): "..sval(InParty(pch)),w-50,iy,1,0,255,0,0) -- Debug line. MUST be REMMED in actual version
               DarkText('CANNOT TRADE!',w-50,iy,1,0,255,0,0) -- Actual line, may not be REMMED in actual version
               allow[i] = false
            elseif haveitem == Shop['Slot'..i] then
               DarkText('< Equipped >',w-50,iy,1,0,0,180,255)
               allow[i] = nil   
            elseif price<0 then 
               DarkText("You'll get "..math.abs(price).." shilders",w-50,iy,1,0,255,180,0)
            else   
               DarkText(price.." shilders",w-50,iy,1,0,255,180,0)
            end      
         else   
            DarkText(item.Title,mix,iy,0,0,55,55,55)
          end  
          if moved and my>iy and my<iy+siz then Shop.P = i end
       end   
   end
   if INP.KeyH(KEY_DOWN)==1 or joyhit(joy_down) then 
      repeat 
         Shop.P = Shop.P + 1
         if Shop.P>20 then Shop.P=1 end
      until Shop['Slot'..Shop.P] and Shop['Slot'..Shop.P]~=""
   end   
   if INP.KeyH(KEY_UP)==1 or joyhit(joy_up) then 
      repeat 
         Shop.P = Shop.P - 1
         if Shop.P<1 then Shop.P=20 end
      until Shop['Slot'..Shop.P] and Shop['Slot'..Shop.P]~=""
   end
   if (mousehit(1) or INP.KeyH(KEY_ENTER)==1 or INP.KeyH(KEY_SPACE)==1 or INP.KEYH(KEY_RETURN)==1 or joyhit('CONFIRM')) and allow[Shop.P] and tmy>y then
      local item = Shop.itemdata[Shop.P]
      local price = allow[Shop.P]
      if CVV('%CASH')<price then Shop_Error("Not enough money")
      else
         SFX('Audio/Shopping/ChaChing.ogg')
         dec('%CASH',price)
         -- ItemGive(Shop['Slot'..Shop.P],1)
         local tch = item.ITM_EQP_For
         if tch =="Jake" then tch = "Jake_Human" end
         RPG.SetData(tch,"EQP_"..item.ITM_Type,Shop['Slot'..Shop.P])
      end
   end 
   if mousehit(2) then LAURA.Flow('FIELD') end
   if (joydown('XTRA') or INP.KeyD(KEY_H)==1) and allow[Shop.P] then
      Image.Origin(0,0)
      local stats = {'Power','Endurance','Intelligence','Resistance','Speed','Accuracy','Evasion','Critical','Counter','HP','AP'}
      local changes = {}
      local itembuy  = ItemGet(Shop['Slot'..Shop.P])
      local pch = itembuy.ITM_EQP_For; if pch=="Jake" then pch="Jake_Human" end
      local itemhave = ItemGet(RPG.GetData(pch,"EQP_"..itembuy.ITM_Type))
      local dp = {}
      local upcol = {[true]={0,255,0},[false]={255,0,0}}
      local plus = {[true]="+", [false]=""}
      local iy = 40 + (Shop.P*siz)
      for st in each(stats) do
          changes[st] = (itembuy['EQP_STAT_'..st] or 0) - (itemhave['EQP_STAT_'..st] or 0)
          if changes[st]~=0 then 
             dp[#dp+1] = { st=st, diff=plus[changes[st]>0]..changes[st], col = upcol[changes[st]>0] }             
          end   
      end
      if #dp==0 then dp[1] = {st = "No changes", diff="", col={255,180,0}} end
      local imgtag = itembuy.ITM_EQP_For
      Box(30,iy+y,w-60,20+(#dp*20))
      white()
      Image.LoadNew("CL_FACE_"..imgtag,"GFX/Boxtext/Portret/"..imgtag.."/General.png")
      Image.Show("CL_FACE_"..imgtag,20,(iy+20+(#dp*20)+y)-Image.Height("CL_FACE_"..imgtag))
      SetFont('TradeCompare')
      for i,data in ipairs(dp) do
          DarkText(left(data.st.."               ",15).." "..right("     "..data.diff,5),150,y+(i*20)+iy+(-10),0,0,data.col[1],data.col[2],data.col[3])
      end      
      Image.Origin(x,y)
   end
   -- error
   if Shop.Error then
      SetFont ( 'MasterHeader' )
      DarkText( Shop.Error.Msg , w/2, h/2, 2, 2 , 255, 0, 0)
      Shop.Error.Time = Shop.Error.Time - 1
      if Shop.Error.Time <= 0 then Shop.Error = nil end
   end   
   -- End
   Image.Origin(0,0)
    
end



function Menu_GetScreen()
    local ret
    local tw,tpos
    if Screen.Height()<700 then fonts.StatusStat[2] = 25 end
    ret = {}
    ret.SW = Screen.Width()
    ret.SH = Screen.Height() - 100 -- (100 is the size of the party bar) ;)
    ret.SX = 0
    ret.SY = 0    
    ret.mar = {
                 L = tonumber(LC('screen.margin.left')  )~=0,
                 R = tonumber(LC('screen.margin.right') )~=0,
                 T = tonumber(LC('screen.margin.top')   )~=0,
                 B = tonumber(LC('screen.margin.bottom'))~=0
              }
    if ret.mar.L then ret.SX = 25 ret.SW = ret.SW - 25 end
    if ret.mar.T then ret.SY = 25 ret.SH = ret.SH - 25 end
    if ret.mar.R then             ret.SW = ret.SW - 25 end
    if ret.mar.B then             ret.SH = ret.SH - 25 end
    -- CSay('Initial Menu Screen size ('..ret.SX..","..ret.SY..')   ==== '..ret.SW.."x"..ret.SH)
    if #profile.Features>1 then
       ret.IB = {}
       ret.IB.X = ret.SX
       ret.IB.Y = ret.SY
       ret.IB.W = ret.SW
       ret.IB.H = 60
       ret.SY = ret.SY + 60
       ret.SH = ret.SH - 60
       tw = ret.SW-60
       tpos = tw / #profile.Features
       profile.FPos = {}
       for i = 1,#profile.Features do 
           profile.FPos[i] = 60+((i-1)*tpos) -- (Center_X - ((i*tpos)/2))+(i*tpos)
           Image.LoadNew('MENU_ICON_'..profile.Features[i],"GFX/Menu Icons/"..profile.Features[i]..".png")
           Image.HotCenter('MENU_ICON_'..profile.Features[i]) 
           end
       end    
    ret.CX = Screen.Width()/2
    ret.CY = Screen.Height()/2
    return ret   
end

function Menu_DrawScreen()
   if menu.fp>#profile.Features then menu.fp=1 end -- Crash prevention!
   local feat = profile.Features[menu.fp]
   -- Configure screen if needed
   MyScreen = MyScreen or Menu_GetScreen()
   -- Top line if applicable
   if #profile.Features>1 then
      Box(MyScreen.IB.X,MyScreen.IB.Y,MyScreen.IB.W,MyScreen.IB.H)
      for i,f in ipairs(profile.Features) do
          white()
          if i==menu.fp then 
             local c = 155 + ((math.sin(Time.MSecs()/125))*100)
             color(c,c,c)
             -- DarkText('Color val: '..c)
          end   
          Image.Show('MENU_ICON_'..f,profile.FPos[i],MyScreen.IB.Y+32)
          if my<60 and mx>profile.FPos[i]-24 and mx<profile.FPos[i]+24 and INP.MouseH(1)~=0 then menu.fp=i end
      end
   end
   -- Split Screen if needed
   if profile.HalfScreen[feat] then
      Box(MyScreen.SX  ,MyScreen.SY,MyScreen.SW/2,MyScreen.SH)
      Box(MyScreen.SW/2,MyScreen.SY,MyScreen.SW/2,MyScreen.SH)
      ;(features[profile.HalfScreen[feat][1]] or features.notpresent)(MyScreen.SX  ,MyScreen.SY,MyScreen.SW/2,MyScreen.SH,profile.HalfScreen[feat][1])
      ;(features[profile.HalfScreen[feat][2]] or features.notpresent)(MyScreen.SW/2,MyScreen.SY,MyScreen.SW/2,MyScreen.SH,profile.HalfScreen[feat][2])
   -- Full Screen if it isn't a split screen
   else
      Box(MyScreen.SX  ,MyScreen.SY,MyScreen.SW,MyScreen.SH)
      ;(features[feat] or features.notpresent)(MyScreen.SX,MyScreen.SY,MyScreen.SW,MyScreen.SH,feat)
   end
   -- Party pointer
   -- Party browsing if applicable
   ShowParty()
   -- Mouse pointer
   ShowMouse()
end

function Menu_Keys()
   if not BlockTabSwitch then
      if ( INP.KeyH(KEY_RIGHT)==1 or INP.KeyH(KEY_D)==1 or INP.JoyX()==1) then 
         menu.fp = menu.fp + 1 --CSay('R')
         while INP.JoyX()==1 do end 
      end 
   if ( INP.KeyH(KEY_LEFT )==1 or INP.KeyH(KEY_A)==1 or INP.JoyX()==-1) then 
         menu.fp = menu.fp - 1 --CSay('L') 
         while INP.JoyX()==-1 do end
      end
   end   
   if menu.fp<=0 then menu.fp = #profile.Features end
   if menu.fp> #profile.Features then menu.fp = 1 end    
   if ( INP.KeyH(KEY_ESCAPE)==1 or joyhit('CANCEL')) and profile.EscReturn then
      if not(profile.BlockOut and tablecontains(profile.BlockOut,profile.Features[menu.fp])) then
         LAURA.Flow(profile.EscReturn)
      end   
   end   
   -- char select
   for i=0,3 do
       if RPG.PartyTag(i)~="" then
          if INP.KeyH(i+49)==1 then menu.chn = i end
          local clickme = ClickedChar(i) and mousehit(1)
          if clickme and menu.chn == i then LAURA.Flow(profile.EscReturn) elseif clickme then menu.chn = i end
       end 
   end
end

function Menu_SetChar(ch)
  menu.chn = Sys.Val(ch)
end

function Menu_JoyCharBrowse(ch)
    if joyhit('L1') and menu.chn>0 then Menu_SetChar(menu.chn-1) 
    elseif joyhit('R1') and menu.chn<3 and RPG.PartyTag(menu.chn+1)~="" then Menu_SetChar(menu.chn+1) end
end    

function MAIN_FLOW()
   mx,my = GetMouse()
   Cls()   
   Menu_DrawScreen() 
   Menu_Keys() 
   Menu_JoyCharBrowse()
   -- And show everything
   Flip()   
end
