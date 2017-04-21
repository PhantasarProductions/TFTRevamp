--[[
  Field.lua
  Version: 17.04.20
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

-- The Fairy Tale REVAMPED!!


-- @UNDEF RENCDEBUG

-- @IF INGORE
lasthit = "IGNORE" -- Just fooling my outliner, or else it won't show things right!
-- @FI


Image.LoadNew("RENCGAUGE","GFX/Combat/RENC/Gauge.png")
Image.Hot("RENCGAUGE",Image.Width("RENCGAUGE")/2,Image.Height('RENCGAUGE'))
rencgaugecol = {{0,0,255},{0,255,0},{255,180,0},{255,0,0}}
rencstepchange = ({250,150,50})[Sys.Val(Var.C("%SKILL"))]
rencchance = {0,10000,5000,100,1} -- The 1 at the end should never be needed, but it must prevent a crash. If it's called for whatever reason, combat will ALWAYS start if possible.
rencnumtable = nil
rencstep = 1
rencstepleft = recstepchange
rencon = true

RoomNames = {}

RONOFF = { [false] = "Off", [true]="On" }

Scheduled = {}

AUTOHIDE = {}

RandomTreasure = RandomTreasure or {}

function GALE_OnLoad()
  rencgaugex = SW+100
  PartyBarY = SH - 100
  if tonumber(LC('screen.margin.bottom') )~=0 then PartyBarY = SW - 125 end
end  

function SetUpCompassNeedles()
--local prefixes = {"NPC_","PSG_","PRC_"}
local p 
local layers,orilayer = ({ [0]=function() return {'SL:MAP'},nil end, [1]=function () return mysplit(Maps.Layers(),";"),Maps.LayerCodeName end})[Maps.Multi()]()
Compass = {}
-- CSay(type(layers).."/"..type(each))
for layer in each(layers) do
    CSay("Looking in layer "..layer.." for compass needles")
    if Maps.Multi()==1 then Maps.GotoLayer(layer) end
    for obj in KthuraEach('$Compass') do
        Compass [ #Compass + 1 ] =
        {
             x = obj.X,
             y = obj.Y,
             name = obj.DataGet('Name'),
             layer = layer
        }
        CSay( "Added compass spot:" .. obj.DataGet('Name') .. "   ("..obj.x..","..obj.y..")")
        end
    end
Image.LoadNew('NEEDLE','GFX/Algemeen/Needle.png'); Image.HotCenter('NEEDLE')    
if Maps.Multi()==1 then Maps.GotoLayer(orilayer) end    
end

function SetUpRencTable(pnum)
    -- Info
       -- Renc = Random Encounter. 
       -- Unless specifically stated otherwise in some definition files all layers will have 5 encounters.
       -- Leaving the dungeon or using savespots will reset this.
    -- Init
    local num = tonumber(pnum) or 5; if num<=0 then num=5 end 
    local altnum = Sys.Val(Maps.GetData('MaxEnc'))
    if altnum>5 then num=altnum end
    rencnumtable = {}
    if not Maps.GetData('Foes1') then return nil end -- If no enemies are set, then let's ignore this entire shit!
    local nolaystring = Maps.GetData('NoEncZones')
    local nolay = {}
    if nolaystring~="" then nolay = mysplit(nolaystring,",") end
    local layers,orilayer = ({ [0]=function() return {'SL:MAP'},nil end, [1]=function () return mysplit(Maps.Layers(),";"),Maps.LayerCodeName end})[Maps.Multi()]()    
    -- Num Tables
    rencmaxnum = ({[0]=-1,[1]=num})[Maps.Multi()]
    for layer in each(layers) do
        rencnumtable[layer] = num
    end
    for layer in each(nolay) do -- No encounters in these layers
        rencnumtable[Str.Trim(layer)] = nil 
        CSay("There should be no random encounters in layer: "..sval(layer))
    end
    rencstep = 1   
    rencstepleft = recstepchange 
end

function SetUpRandomEncounters()
    monstertable = {}
    for s=1,skill do
        local gs = Maps.GetData('Foes'..s)
        local ga = mysplit(gs,";")
        for m in each(ga) do
            local ma = mysplit(m,",")
            ma[2]=ma[2] or 1 -- If not properly set 1 will be added.
            for ak=1,ma[2] do monstertable[#monstertable+1]=ma[1] end
        end    
    end    
end

function SetUpRoomNames()
    ClearTable(RoomNames)
    if Maps.GetData('NamedZones')=="" then
       CSay('No Zone Names Here') 
       return 
    end
    local maintable = mysplit(Maps.GetData('NamedZones'),";")
    for s in each(maintable) do
        local di = mysplit(s,"=")
        RoomNames[di[1]] = di[2]
        CSay("RoomNames: "..di[1].." = "..di[2])
    end
end


function LoadMap(map)
    -- Reset some stuff prior to loading
    ResetClickables()
    AUTOHIDE = {}
    -- Load the map itself
    CSay("Loading Map!")
    Maps.Load(upper(map))
    CSay("Configuring Data!")
    Maps.LayerCodeName = ""
    local layers,multi = ({ [0]=function() return {'SL:MAP'},nil end, [1]=function () return mysplit(Maps.Layers(),";"),true end})[Maps.Multi()]()    
    --if layers[1]~="SL:MAP" then Maps.GotoLayer(layers[1]) end -- Does this prevent a crash?
    CSay(serialize('LAYERS',layers))
    if multi then Maps.GotoLayer(layers[1]) end
    -- Lastly, load the music  
    MS.Run("MAP","MapMusic") 
    SetUpAutoClickables()
    SetUpCompassNeedles()
    SetUpRencTable()
    SetUpRandomEncounters()
    SetUpRoomNames()
    rencon = true    
end

function GotoLayerAutoHide(label)
    AUTOHIDE[#AUTOHIDE+1]=label
end

function AutoHideAction()
   for label in each(AUTOHIDE) do Maps.HideLabels(label) end
end

function GoToLayer(lay,spot)
    Maps.Obj.Kill('PLAYER')
    for i=1,3 do
        if RPG.PartyTag(i)~="" then Maps.Obj.Kill("PLAYER"..i) end
    end
    Maps.GoToLayer(lay)
    SpawnPlayer(spot)
    AutoHideAction()
end

function ScheduledExecution()
 local ev
 for ev in each(Scheduled) do
     CSay("Scheduled Execution: "..ev.MS.."."..ev.FN)
     MS.Run(ev.MS,ev.FN) 
 end
 Scheduled = {}    
end

function Schedule(scr,func)
  table.insert(Scheduled,{MS=scr,FN=func})
  CSay("Scheduled: "..scr.."."..func)
end

--function CheckClickables()
--end

function Click(fakex,fakey)
local mx,my = MouseCoords()
local ak,ch
mx = fakex or mx
my = fakey or my
local ret
if mousehit(1) or (fakex or fakey) then -- Left Mouse button    
   -- CSay("Checking click ("..mx..","..my..")") -- debug
   if my>PartyBarY and (not (fakex or fakey) )then  -- must come prior to checks in the field
      for ak=0,3 do
          if ClickedChar(ak) then 
             --FGoToMenu(ak)
             MS.LoadNew("MENU","Script/Flow/Menu.lua")      
             MS.Run("MENU","Menu_Init","Field")
             MS.Run('MENU','Menu_SetChar',ak)      
             LAURA.Flow("MENU")              
             end
          end
   --[[ Star Story only       
   elseif IconClicked then -- Must come prior to checks in the field
      IconFunction[IconClicked]()
   ]]          
   elseif CheckClickables(fakex,fakey) then
     -- Nothing happens here, but this will take any other checks out.
      ret = true -- Only needed for the fake clicker.       
   else -- If there's nothing else then perform then walk to
      -- CSay(cplayer.." is going to walk to ("..mx..","..my..")")
      if (not lasthit) and (not (fakex or fakey)) then 
         Actors.WalkTo('PLAYER',mx+Maps.CamX,my+Maps.CamY)       
         WalkArrival = nil
      end   
      -- Actors.MoveTo(cplayer,mx+Maps.CamX,my+Maps.CamY)
      end
   end
--[[ Has no more use in TFTR
if mousehit(2) then
   if my>500 then  -- must come prior to checks in the field
      for ak=0,5 do
          if RightClickedChar(ak) and upper(Maps.CodeName)~="HAWK" then
             ch = RPGChar.PartyTag(ak)
             if ch~="" and ch~="UniWendicka" and ch~="UniCrystal" and ch~="Briggs" then activeplayer = ch end 
             end
          end
      end
   end
      ]]
end

function KeyClickables()
  if (INP.KeyH(KEY_SPACE)==0) and (not joyhit('CONFIRM')) then return end
  local me = Actors.Actor('PLAYER')
  KeyClickArea =  
  {
        North = { me.x-32,me.y-64, me.x+32, me.y    },
        South = { me.x-32,me.y   , me.x-32, me.y+64 },
        East  = { me.x   ,me.y-32, me.x+64, me.y+32 },
        West  = { me.x-64,me.y-32, me.x   , me.y+32 }
  }  
  local area = KeyClickArea[me.Wind]
  for x = area[1],area[3] do for y=area[2],area[4] do
  
      -- local tx,ty = TrueMouseCoords(); CSay(x..","..y.." <KeyCheck    TrueMouse> "..tx..","..ty)
      if CheckClickables(x,y) then return end -- When multiple clickables are in range, only the first one counts.
  end end
end

function AutoPlayerWind()
 local cplayer = "PLAYER"
 for i=0,3 do
    if i~=0 then cplayer = "PLAYER"..i end
    --if cplayer~="PLAYER" then return end
    ATW = ATW or {}
    if RPG.PartyTag(i)~="" then
      local x,y,w = GetCoords(cplayer)
      if ATW[i]~=w then Actors.ChoosePic(cplayer,upper(RPG.PartyTag(i).."."..w)) ATW[i]=w end 
    end
 end  
end


function CompassSpots()
   -- @IF IGNORE
   Compass = {}
   -- @FI
   local player = Actors.Actor('PLAYER')
   local px = player.x
   local py = player.y
   local d,c,li   
   if not Compass then return end
   SetFont('Compass')
   for i,needle in ipairs(Compass) do
       if Maps.Multi()==0 or needle.layer==Maps.LayerCodeName then
          li = (li or 0) + 1
          DarkText(needle.name,SW-100,50+(li*25),1,2)
          d = Distance(px,py,needle.x,needle.y); if d>1000 then d=1000 end
          c = (d/1000) * 255
          color(c,255-c,0)
          local angle1,angle2 = CoordsToAngle(px,py,needle.x,needle.y)
          angle1 = math.floor(angle1) -- BlitzMax is allergic for non-intergers sent by Lua.
          Image.Rotate(angle1)
          Image.Show('NEEDLE',SW-50,50+(li*25))
          Image.Rotate(0)
          -- DarkText(px..","..py..","..needle.x..","..needle.y.."/"..angle1.."/"..angle2,SW,50+(i*25),1,1)
       end
   end
end


function DrawScreen()
   Maps.Draw()  
   AutoPlayerWind()
   CompassSpots()
end

function TurnPlayer(dir,num)
  local ch = RPG.PartyTag(num or 0)
  Actors.ChoosePic("PLAYER"..(num or ""),upper(ch).."."..upper(dir))
  Actors.Actor("PLAYER"..(num or "")).Wind = dir
end

function TurnPlayers(dir)
  TurnPlayer(dir)
  for i=1,3 do
      if RPG.PartyTag(i)~="" then TurnPlayer(dir,i) end
  end    
end

function SpawnPlayer(spot,dir)
    local tag
    local myobj,mytag
    for i=0,3 do
       tag = "PLAYER"..i
       if i==0 then tag="PLAYER" end
       if RPGChar.PartyTag(i)~="" then
          myobj = Maps.Obj.Obj(spot)
          mytag = RPGChar.PartyTag(i)
          Actors.Spawn(spot,"GFX/Actors/Bundled/Player",tag)
          if i==0 then
             Maps.CamX = myobj.x-Center_X           
             Maps.CamY = myobj.y-Center_Y
          end                        
       end
    end
TurnPlayers(dir or 'North')    
Var.D("$LASTSPAWN",spot)
end

function AutoScroll()
   myobj = Actors.Actor('PLAYER')
   Maps.CamX = myobj.x-Center_X           
   Maps.CamY = myobj.y-Center_Y   
end

function ManualMove()
local minx=0
local miny=0
local maxx,maxy = MapSize()
local Actor = Actors.Actor("PLAYER")
-- stop moving on arrow key release
if lasthit=="KEYUP" and (INP.KeyD(KEY_UP   )==0) then Actor.Moving=0 lasthit=nil return end
if lasthit=="KEYDN" and (INP.KeyD(KEY_DOWN )==0) then Actor.Moving=0 lasthit=nil return end
if lasthit=="KEYLF" and (INP.KeyD(KEY_LEFT )==0) then Actor.Moving=0 lasthit=nil return end
if lasthit=="KEYRG" and (INP.KeyD(KEY_RIGHT)==0) then Actor.Moving=0 lasthit=nil return end
-- stop moving on wasd key release
if lasthit=="KEY_W" and (INP.KeyD(KEY_W    )==0) then Actor.Moving=0 lasthit=nil return end
if lasthit=="KEY_S" and (INP.KeyD(KEY_S    )==0) then Actor.Moving=0 lasthit=nil return end
if lasthit=="KEY_A" and (INP.KeyD(KEY_A    )==0) then Actor.Moving=0 lasthit=nil return end
if lasthit=="KEY_D" and (INP.KeyD(KEY_D    )==0) then Actor.Moving=0 lasthit=nil return end
-- stop moving on joypad release
if lasthit=="JOYUP" and (INP.JoyY()~=-1)         then Actor.Moving=0 lasthit=nil return end
if lasthit=="JOYDN" and (INP.JoyY()~= 1)         then Actor.Moving=0 lasthit=nil return end
if lasthit=="JOYLF" and (INP.JoyX()~=-1)         then Actor.Moving=0 lasthit=nil return end
if lasthit=="JOYRG" and (INP.JoyX()~= 1)         then Actor.Moving=0 lasthit=nil return end
if lasthit then return end
-- Ignore any new attempt to move is the character is already moving
if Actor.Moving~=0 or Actor.Walking~=0 then return end
-- Start moving by keyboard input - arrows
if INP.KeyD(KEY_UP   )==1 then Actors.MoveTo("PLAYER",Actor.X,miny) lasthit="KEYUP" end
if INP.KeyD(KEY_DOWN )==1 then Actors.MoveTo("PLAYER",Actor.X,maxy) lasthit="KEYDN" end
if INP.KeyD(KEY_LEFT )==1 then Actors.MoveTo("PLAYER",minx,Actor.Y) lasthit="KEYLF" end
if INP.KeyD(KEY_RIGHT)==1 then Actors.MoveTo("PLAYER",maxx,Actor.Y) lasthit="KEYRG" end
-- Start moving by keyboard input - wasd
if INP.KeyD(KEY_W    )==1 then Actors.MoveTo("PLAYER",Actor.X,miny) lasthit="KEY_W" end
if INP.KeyD(KEY_S    )==1 then Actors.MoveTo("PLAYER",Actor.X,maxy) lasthit="KEY_S" end
if INP.KeyD(KEY_A    )==1 then Actors.MoveTo("PLAYER",minx,Actor.Y) lasthit="KEY_A" end
if INP.KeyD(KEY_D    )==1 then Actors.MoveTo("PLAYER",maxx,Actor.Y) lasthit="KEY_D" end
-- Start moving by joypad input
if INP.JoyY()==-1         then Actors.MoveTo("PLAYER",Actor.X,miny) lasthit="JOYUP" end
if INP.JoyY()== 1         then Actors.MoveTo("PLAYER",Actor.X,maxy) lasthit="JOYDN" end
if INP.JoyX()==-1         then Actors.MoveTo("PLAYER",minx,Actor.Y) lasthit="JOYLF" end
if INP.JoyX()== 1         then Actors.MoveTo("PLAYER",maxx,Actor.Y) lasthit="JOYRG" end
--DarkText(INP.JoyX()..","..INP.JoyY(),0,0,0,0)
end

function ResetChar()
-- if not (CVVN("%LASTSPAWN.X") and CVVN("%LASTSPAN.Y")) then MINI("CANNOT DO THIS! LAST SPAWN WAS NOT COMPLETE!",255,0,0,true) end
if INP.KeyD(KEY_LCONTROL)==1 and INP.KeyD(KEY_LALT)==1 and INP.KeyD(KEY_R)==1 then
  if not CVVN("$LASTSPAWN") then MINI("CANNOT DO THIS! LAST SPAWN WAS NOT COMPLETE!",255,0,0,true) end
  Maps.Obj.Kill("PLAYER")
  SpawnPlayer(CVV('$LASTSPAWN'))
  end
end

function FieldStats()
    local p = Actors.Actor('PLAYER')
    if p.Walking~=0 or p.Moving~=0 then FSTime = nil; return end
    FSTime = FSTime or 150
    if FSTime<=0 then
       local stuff = {}
       local layer
       FieldStatsAlpha =  (FieldStatsAlpha or 0) + 1
       if FieldStatsAlpha>100 then FieldStatsAlpha=100 end
       Image.SetAlphaPC(FieldStatsAlpha)
       if Maps.Multi()==1 then layer = Maps.LayerCodeName end
       stuff[1] = {'FSTIT',Maps.GetData('Title'),'FieldInfo'}
       if layer and left(layer,1)=="#" then stuff[2]={'FSROM',layer} end
       if RoomNames[Maps.LayerCodeName] then stuff[#stuff+1]={'FSRMN',RoomNames[Maps.LayerCodeName],'FieldInfo'} end
       if CVVN("%CASH")     then stuff[#stuff+1] = {'FSCSH',CVV("%CASH")}     end
       if CVVN("%ORBS")     then stuff[#stuff+1] = {'FSORB',CVV("%ORBS")}     end
       if CVVN("%LEVELCAP") then stuff[#stuff+1] = {'FSLVC',CVV("%LEVELCAP")} end
       if CVVN("&ALLOW.ENCOFF['"..Maps.CodeName.."']") then
          if INP.KeyH(KEY_E)==1 then rencon = not rencon end
          stuff[#stuff+1] = {'FSREN',RONOFF[rencon],'FieldInfo'}
       else
          renc = true   
       end
       stuff[#stuff+1] = {'FSTIM',PlayTime()}
       for i,data in ipairs(stuff) do
           white()
           SetFont(data[3] or 'FieldStat')
           Image.LoadNew(data[1],"GFX/Field Icons/"..data[1]..".png")
           Image.Show(data[1],35,i*35)
           DarkText(data[2],75,i*35,0,0,180,255,0)
       end    
       Image.SetAlphaPC(100)
    else
       if INP.KeyH(KEY_E)==1 and CVVN("&ALLOW.ENCOFF['"..Maps.CodeName.."']") then rencon = not rencon
       elseif not CVVN("&ALLOW.ENCOFF['"..Maps.CodeName.."']") then rencon = true end
       FieldStatsAlpha = 0
       FSTime=FSTime-1
       --DarkText(FSTime,0,0,0,0)
    end
end

-- Traveler's Emblems
function TravelersEmblem(tag)
   if not TETXTLOADED then MS.Run("BOXTEXT","LoadData","GENERAL/TRAVELEMBLEM;TRAVEL"); Console.Write("MapText for "..Maps.CodeName.." loaded",0,255,180)  TETXTLOADED=true end
   if not Done("&DONE.TUTORIAL.TRAVELEMBLEM") then SerialBoxText("TRAVEL","TUTORIAL","FLOW_FIELD") end
   Var.D("$TRAVELEMBLEMSHOWSPOT",Maps.GetData('Title'))
   CapIncrease()
   Done("&ALLOW.ENCOFF['"..Maps.CodeName.."']")
   SerialBoxText("TRAVEL","GET","FLOW_FIELD")
   Maps.Obj.Kill(tag,1)
end

-- Clickables
function ResetClickables()
  Clickables = {}
  CSay("Clickables reset")
end

function ListClickables()
local i,k
if #Clickables==0 then Console.Write("No clickables on this map",255,100,0) end
for i,k in ipairs(Clickables) do CSay(serialize("Click #"..i,k)) end
end 

function AddClickable(c)
  Clickables = Clickables or {}
  if tablecontains(Clickables,c) then CSay('Duplicate clickable definiation '..c); return end
  CSay(serialize("AddingClickable",c))
  table.insert(Clickables,c)
  CSay("Added Clickable: "..c)
end

function AddClickableScript(c)
  local f,e = loadstring(c)
  if not f then CSay("ERROR IN: "..c) Sys.Error("LoadString Error: "..e) end  
  AddClickable(f())
  end

function RemoveClickable(c)
local v,i,r
for i,v in ipairs(Clickables) do
    if v==c then r=i end
    end
table.remove(Clickables,r)
end

function TurnOffClicks() 
  WalkArrival    = nil
  WalkArrivalArg = nil
end

function SetUpAutoClickables()
local prefixes = {"NPC_","PSG_","PRC_","CHEST_","PTE_","BLACKORB_","RNDITEM_"}
local p 
local layers,orilayer = ({ [0]=function() return {'SL:MAP'},nil end, [1]=function () return mysplit(Maps.Layers(),";"),Maps.LayerCodeName end})[Maps.Multi()]()
-- CSay(type(layers).."/"..type(each))
local RandomItems = RandomTreasure
RandomItems[Maps.CodeName] = RandomItems[Maps.CodeName] or {}

for layer in each(layers) do
    local got = RandomItems[Maps.CodeName][layer]
    if Maps.Multi()==1 then Maps.GotoLayer(layer) end
    for obj in KthuraEach() do
        if prefixed(p,"RNDITEM_") and (not got) then
           RandomItems[Maps.CodeName][layer] = true
           if rand(1,math.ceil(9/skill))~=1 then Maps.Obj.Kill(p,1) end
        end   
        for p in each(prefixes) do 
            if prefixed(obj.Tag,p) then 
               AddClickable(obj.Tag) 
               CSay(layer..": Autoclickable "..obj.Tag.." added")
               if p=="ENTER_" then
                  MS.Run("MAP","ZA_Enter","ZA_"..obj.Tag..";EnterBuilding;"..right(obj.tag,-6))
               end 
             end
            end
        end
    end
if Maps.Multi()==1 then Maps.GotoLayer(orilayer) end    
end

function RandomItem(tag)
    CSay('Begin: Random Item')
    LoadItemModule()
    local div = ({5,25,625})[skill]
    local qitems = mysplit(Maps.GetData("RandomItems"),";")
    local items = {}
    qitems[1] = qitems[1] or {"Cash:"..tonumber(9/skill)}
    CSay("MakeList: Random Items")
    for i in each(qitems) do 
        local a=mysplit(i,",")
        for i2=1,(a[2] or 1) do items[#items+1]=a[1] end
    end
    CSay("BoxText Init: Random Items")
    MS.LoadNew("BOXTEXT","Script/Subs/BoxText.lua")
    MS.Run("BOXTEXT","LoadData","General/Items;ITEM")
    local item = "ITM_"..upper(items[rand(1,#items)])
    local data
    if prefixed (item,"ITM_CASH:") then
       MasterAllInc('Rubine','RubinePoints')
       CSay("Give Cash: Random Items")
       local si = mysplit(item,":")
       local givecash = Sys.Val(si[2] or 1)
       inc('%CASH',givecash)
       Var.D("$ITEMNAME",givecash.." shilders")
       if givecash==1 then Var.D("$ITEMNAME","1 shilder") end    
    else
       CSay("Can we give an item: Random Items")
       data = ItemGet(item)
       local itemvalue = math.ceil((data.ITM_SellPrice or 1)/div)
       MS.Run('ITEMS','ItemFull')
       if CVV('&ITEMFULL') then 
          MasterAllInc('Rubine','RubinePoints')
          CSay("Full: Random Items")
          inc('%CASH',itemvalue)
          Var.D("$ITEMNAME",itemvalue.." shilders")
          if itemvalue==1 then Var.D("$ITEMNAME","1 shilder") end
       else
          CSay('Give Item: Random Items')
          Var.D("$ITEMNAME",data.Title)    
          ItemGive(item,1)
       end 
    end
    CSay("End it all: Random Items")
    SerialBoxText("ITEM","GET","FLOW_FIELD")
    Maps.Obj.Kill(tag,1)
    CSay("Finished: Random Items")
end

function WalkClick2Enter(ocode)
   local tolay = right(ocode,-6)
   GoToLayer(tolay,"Start")
   CSay("Went to "..tolay)
end   


function CheckClickables(fakex,fakey)
local i,c
local mx,my = fakex,fakey 
if not fakex then mx,my = TrueMouseCoords() end
local ret,ARMSpot,obj,succ
local cplayer = "PLAYER"
if not Clickables then return end
if mousehit(1) or fakex or fakey then
   for i,c in ipairs(Clickables) do
     if type(c)=='table' then obj=c.obj else obj=c end
     --Image.NoFont()
     --CSay("#"..i.." Click: "..obj.." >> "..Maps.CoordsInObject(obj,mx,my)) -- Debug line!
      
       --[[
       ({['string'] = function() 
                      end,
         ['table'] = function()
                     end})[type(cd)]()
         ]]                                
       -- CSay("Clicked in object: "..c.." ("..mx..","..my..") ==> "..Maps.CoordsInObject(c,mx,my))
       if Maps.Obj.Exists(obj) and Maps.CoordsInObject(obj,mx,my)==1 then
          if type(c)=='table' then
            CSay("Request from table")              
            if c.spot then succ = Actors.WalkToSpot(cplayer,c.spot)==1 CSay("Walking To Spot: "..c.spot) end
            if c.coords then succ = Actors.WalkTo(cplayer,c.coods.x,c.coords.y)==1 end
            if succ then
               WalkArrival = c.arrival   ; CSay("Execute: "..WalkArrival)   
               WalkArrivalArg = c.arrivalarg
               ret = true
               end               
          elseif prefixed(c,"NPC_MT_") then
            if Actors.WalkTo(cplayer,Maps.Obj.Obj(c).X,Maps.Obj.Obj(c).Y+32) == 1 then
               WalkArrival = "NPC_MapText"
               WalkArrivalArg = nil
               Var.D("$NPC_MAPTEXT",c)
               ret=true
               end
          elseif prefixed(c,"NPC_") then
            if c=="NPC_MapText" then Sys.Error("Illegal NPC tag!") end
            if Actors.WalkTo(cplayer,Maps.Obj.Obj(c).X,Maps.Obj.Obj(c).Y+32)==1 then 
               WalkArrival = c
               WalkArrivalArg = nil
               ret=true
               end
          elseif prefixed(c,"PSG_") then
            if Actors.WalkTo(cplayer,Maps.Obj.Obj(c).X,Maps.Obj.Obj(c).Y+32)==1 then
               WalkArrival = 'MAPSAVE'
               WalkArrivalArg = nil
               ret = true  
            end    
          elseif prefixed(c,"PRC_") then
            if Actors.WalkTo(cplayer,Maps.Obj.Obj(c).X,Maps.Obj.Obj(c).Y+32)==1 then
               WalkArrival = 'RecoverySpot'
               WalkArrivalArg = nil
               ret = true  
            end    
          elseif prefixed(c,"BLACKORB_") then
            if Actors.WalkTo(cplayer,Maps.Obj.Obj(c).X,Maps.Obj.Obj(c).Y+32)==1 then
               WalkArrival = 'BlackOrb'
               WalkArrivalArg = c
               ret = true  
            end    
          elseif prefixed(c,"PTE_") then
            if Actors.WalkTo(cplayer,Maps.Obj.Obj(c).X,Maps.Obj.Obj(c).Y+32)==1 then
               WalkArrival = TravelersEmblem
               WalkArrivalArg = c
               ret = true  
            end                
          elseif prefixed(c,"CHEST_") then
            if Actors.WalkTo(cplayer,Maps.Obj.Obj(c).X,Maps.Obj.Obj(c).Y+32)==1 then
               WalkArrival = TreasureChest
               WalkArrivalArg = c
               ret = true  
            end           
          elseif prefixed(c,"ENTER_") then
             if Actors.WalkToSpot(cplayer,"entry_"..right(c,#c-6))==1 then
               WalkArrival = nil -- WalkClick2Enter
               WalkArrivalArg = c
               CSay("Let's gonna enter "..c.."   >>> "..type(WalkArrival))
             else
               CSay("WARNING! Spot exit_"..right(c,#c-6).." appears to be out of reach for "..cplayer)  
             end      
          elseif prefixed(c,"RNDITEM_") then
            if Actors.WalkTo(cplayer,Maps.Obj.Obj(c).X,Maps.Obj.Obj(c).Y+32)==1 then
               --local chest = Maps.Obj.Obj(c) 
               --CSay('Clicked chest: '..c.." Frame:"..chest.Frame)
               WalkArrival = RandomItem
               WalkArrivalArg = c
               ret = true
            end   
      else
        if Maps.Obj.Exists("SPOT_"..c)==1 then
           succ = Actors.WalkToSpot(cplayer,"SPOT_"..c) == 1
           CSay("Walking to spot: SPOT_"..c)
        else
           succ = Actors.WalkToSpot(cplayer,c) == 1
           CSay("SPOT not there, so walking to the object itself in stead ("..c..")")
           end      
           if succ then
              WalkArrival = "CLICK_ARRIVAL_"..c
              ret=true
              end
            end
          end
       end
   end    
return ret   
end


-- end clickables 

function WalkArrivalCheck()
local cplayer = "PLAYER"
if WalkArrival and (Actors.Walking(cplayer)==0) then
  -- @SELECT type(WalkArrival)
  -- @CASE "string"
     MS.Run("MAP",WalkArrival,WalkArrivalArg)
     CSay("Arrival>MAP>"..WalkArrival) -- Debug line
  -- @CASE "function"
     WalkArrival(WalkArrivalArg)
  -- @CASE "table"
     MS_Run(WalkArrival[1],WalkArrival[2],WalkArrival[3])
  -- @DEFAULT
     Sys.Error("Unknown walk arrival type ("..type(WalkArrival)..")")
  -- @ENDSELECT
  WalkArrival = nil
  end      
end

function GotoSave()
   Cls()
   Maps.Draw()
   -- Image.GrabScreenShot('SHOT')
   -- LAURA.ImageForSave('Shot.png','SHOT')
   MS.Load("SAVE","Script/Flow/Savegame.lua")
   LAURA.Flow("SAVE")
end

function ZoneAction()
       MS.Run("MAP","ZA_CheckEnter",'PLAYER')
       MS.Run("MAP","ZA_CheckLeave",'PLAYER')
       MS.Run("MAP","ZA_CheckFlow" ,'PLAYER') 
       MS.Run("MAP","MAP_FLOW")   
end

function KillWalkArrival()
  WalkArrival = nil
end

function MenuCheck()   
   -- Keyboard / Joypad
   if INP.KeyH(KEY_TAB)~=0 or joyhit("MENU") then
      MS.LoadNew("MENU","Script/Flow/Menu.lua")
      MS.Run("MENU","Menu_Init","Field")
      LAURA.Flow("MENU")
   end      
   -- Mouse
end



function RandomEncounter()
   local countparty = CountPartyMembers()
   local max = ({{1,2,3,4},{2,3,6,9},{3,6,9,9}})[skill][countparty]
   local tab = ({{1,1,1,2,2,3,1,1,2,3,4},{3,3,3,1,3,3,2,2,3,3,4,4,3,6,3,3,1,1,9},{3,3,3,6,6,9}})[skill]
   local num = tab[rand(1,#tab)]
   local arena = Maps.GetData("Arena"); if not suffixed(arena,".png") then arena = arena..".png" end
   if num>max then num=max end
   ClearCombatData()
   Var.D("$COMBAT.ARENA",arena)
   Var.D("$COMBAT.LOSE","Respawn")
   local aet = Maps.GetData('AltEncounterTune')
   if aet and aet~="" then
      if not suffixed(lower(aet),".ogg") then aet = aet .. ".ogg" end 
      Var.D('$COMBAT.MUSIC',aet)
   end   
   assert(#monstertable>0,"I cannot run a Random Encounter without any monsters set")
   for i=1,num do
       Var.D("$COMBAT.FOE_"..i,monstertable[rand(1,#monstertable)]) 
   end
   Actors.Actor("PLAYER").Walking=false
   Actors.Actor("PLAYER").Moving=false
   WalkArrival=nil
   StartCombat()
end
  
function MustRenc()
    -- If the Renc table was not loaded (mostly because of coming in from a saved game), let's force our way in.
    if not rencnumtable then SetUpRencTable() end
    -- Get layer information
    local layer
    if Maps.Multi()==0 then layer='SL:MAP' else layer=Maps.LayerCodeName end
    local encnum = rencnumtable[layer]
    -- Set x position
    if (not monstertable) or #monstertable<=0 then encnum=nil end
    if encnum and rencgaugex>SW-50  then rencgaugex = rencgaugex - 1 elseif (not encnum) and rencgaugex<SW+150 then rencgaugex=rencgaugex + 1 end
    -- Bar length
    local bar = 100
    if encnum and rencmaxnum then
       bar = math.ceil((encnum/rencmaxnum)*100)
    end 
    local col = rencgaugecol[rencstep]
    black()
    Image.Rect(rencgaugex-5,((SH-1)-200)-100,10,100)
    if rencon then
       for x=rencgaugex-5,rencgaugex+5 do
           local cmod = math.abs(math.sin((Time.MSecs()/200)+(x*10)))
           color(round(col[1]*cmod),round(col[2]*cmod),round(col[3]*cmod))
           Image.Line(x,(SH-1)-200,x,((SH-1)-200)-bar)
           -- CSay("Image.Line("..x..","..tonumber((SH-1)-200)..","..x..","..tonumber(((SH-1)-200)-bar)..")  -- "..cmod.." -- "..round(col[1]*cmod)..","..round(col[2]*cmod)..","..round(col[3]*cmod))
       end 
       white() 
    else color(50,50,50) end
    Image.Show('RENCGAUGE',rencgaugex,SH-200)
    
    -- @IF RENCDEBUG
    Image.NoFont()
    DarkText('rencon = '..sval(rencon),5,20)
    DarkText('encnum = '..sval(encnum),5,40)
    -- @FI
    
    -- When no encounters are possible, let's get out of here.
    if not monstertable then SetUpRandomEncounters() end
    if not rencon then return end
    if not encnum then return end
    if encnum<=0 then return end
    if #monstertable<=0 then return end
    -- player data
    local player = Actors.Actor('PLAYER')
    local walking = player.Walking==1 or player.Moving==1
    -- @IF RENCDEBUG
    DarkText('walking = '..sval(walking),5,60)
    DarkText('rencstep = '..sval(rencstep),5,80)
    DarkText('rencstepchange = '..sval(rencstepchange),5,100)
    DarkText('rencstepleft = '..sval(rencstepleft),5,120)
    -- @FI
    
    -- Change chance for encounter while walking and call the encounter routine when an encounter takes place.
    if walking then
       if rencstep<4 then
          rencstepleft = (rencstepleft or 150) - 1
          if rencstepleft <= 0 then
             rencstepleft = recstepchange
             rencstep = rencstep + 1
          end
       end
       if rencstep>1 and rand(1,rencchance[rencstep])==1 then -- In renc level 1 NEVER any encounters, on any higher level, let's come up with it.
          RandomEncounter()
          rencstep=1
          rencnumtable[layer] = rencnumtable[layer] - 1
          rencstepleft = recstepchange
       end
    end
end  

function cons_monstertable()
   local c
   local d = mysplit(serialize('monstertable',monstertable),"\n")
   for i,l in ipairs(d) do
       c = 155 + (math.sin(i)*100)
       Console.Write(l,c,255-c,0)
   end
end       

FTL = { South = {0,-32},North={0,32},East={-32,0},West={32,0}}
FTL_OldWind = {}

function FollowTheLeader()
   if FTL_Allowed=="OFF" then return end
   local myactors = { [0] = Actors.Actor('PLAYER') }
   if Maps.Obj.Exists("PLAYER1")==1 then myactors[#myactors+1] = Actors.Actor('PLAYER1') end
   if Maps.Obj.Exists("PLAYER2")==1 then myactors[#myactors+1] = Actors.Actor('PLAYER2') end
   if Maps.Obj.Exists("PLAYER3")==1 then myactors[#myactors+1] = Actors.Actor('PLAYER3') end
   for i=1,#myactors do -- 0 is ignored by Lua, while it DOES exist... cool, huh?
       local tara = myactors[i-1]
       local cura = myactors[i]
       if Distance(tara.X,tara.Y,cura.X,cura.Y)>64 and cura.Walking==0 then
          Actors.WalkTo(cura.Tag,FTL[tara.Wind][1]+tara.X,FTL[tara.Wind][2]+tara.Y)
       end
       if FTL_OldWind[cura.Tag]~=cura.Wind then 
          FTL_OldWind[cura.Tag]=cura.Wind
          --Actors.ChoosePic(cura.Tag,upper(RPG.PartyTag(i).."."..upper(cura.Wind)))
       end   
   end
end

function SetFollowTheLeader(value)
   FTL_Allowed=value
end   

function ShiftCheck()
    if joyhit('SELECT') or INP.KeyH(KEY_J)==1 then Shift() end
end

function MAIN_FLOW()  
  Cls()
  DrawScreen()
  MustRenc()
  --ManWalk()    <-- Likely removed permanently
  ScheduledExecution()
  Click()
  KeyClickables()
  ManualMove()
  AutoScroll()
  ZoneAction()
  WalkArrivalCheck()
  MenuCheck()
  --Termination()   <-- This comes later
  --EmergencySave()   <-- Likely removed permanently 
  --ControlFoes()     <-- Likely removed permanently
  --FindTreasures()  <-- This is doubtful but likely removed permanently.
  ShiftCheck()
  FollowTheLeader()
  FieldStats()
  ResetChar()
  ShowParty()
  ShowMouse()
  Flip()
end
