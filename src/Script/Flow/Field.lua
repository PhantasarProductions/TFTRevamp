--[[
  Field.lua
  Version: 16.09.14
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

-- The Fairy Tale REVAMPED!!

-- @IF INGORE
lasthit = "IGNORE" -- Just fooling my outliner, or else it won't show things right!
-- @FI


Scheduled = {}

function GALE_OnLoad()
  PartyBarY = SH - 100
  if tonumber(LC('screen.margin.right') )~=0 then PartyBarY = SW - 125 end
end  

function LoadMap(map)
    -- Reset some stuff prior to loading
    ResetClickables()
    -- Load the map itself
    Maps.Load(map)
    local layers,orilayer = ({ [0]=function() return {'SL:MAP'},nil end, [1]=function () return mysplit(Maps.Layers(),";"),Maps.LayerCodeName end})[Maps.Multi()]()
    if layers[1]~="SL:Map" then Maps.GotoLayer(layers[1]) end -- Does this prevent a crash?
    -- Lastly, load the music  
    MS.Run("MAP","MapMusic") 
    SetUpAutoClickables()
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
      for ak=0,5 do
          if ClickedChar(ak) then FGoToMenu(ak) end
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
    if RPG.PartyTag(i)~="" then
      local x,y,w = GetCoords(cplayer)
      Actors.ChoosePic(cplayer,upper(RPG.PartyTag(i).."."..w))
    end
 end  
end


function DrawScreen()
   Maps.Draw()  
   AutoPlayerWind()
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
-- stop moving on key release
if lasthit=="KEYUP" and (INP.KeyD(KEY_UP   )==0) then Actor.Moving=0 lasthit=nil return end
if lasthit=="KEYDN" and (INP.KeyD(KEY_DOWN )==0) then Actor.Moving=0 lasthit=nil return end
if lasthit=="KEYLF" and (INP.KeyD(KEY_LEFT )==0) then Actor.Moving=0 lasthit=nil return end
if lasthit=="KEYRG" and (INP.KeyD(KEY_RIGHT)==0) then Actor.Moving=0 lasthit=nil return end
-- stop moving on joypad release
if lasthit=="JOYUP" and (INP.JoyY()~=-1)         then Actor.Moving=0 lasthit=nil return end
if lasthit=="JOYDN" and (INP.JoyY()~= 1)         then Actor.Moving=0 lasthit=nil return end
if lasthit=="JOYLF" and (INP.JoyX()~=-1)         then Actor.Moving=0 lasthit=nil return end
if lasthit=="JOYRG" and (INP.JoyX()~= 1)         then Actor.Moving=0 lasthit=nil return end
if lasthit then return end
-- Ignore any new attempt to move is the character is already moving
if Actor.Moving~=0 or Actor.Walking~=0 then return end
-- Start moving by keyboard input
if INP.KeyD(KEY_UP   )==1 then Actors.MoveTo("PLAYER",Actor.X,miny) lasthit="KEYUP" end
if INP.KeyD(KEY_DOWN )==1 then Actors.MoveTo("PLAYER",Actor.X,maxy) lasthit="KEYDN" end
if INP.KeyD(KEY_LEFT )==1 then Actors.MoveTo("PLAYER",minx,Actor.Y) lasthit="KEYLF" end
if INP.KeyD(KEY_RIGHT)==1 then Actors.MoveTo("PLAYER",maxx,Actor.Y) lasthit="KEYRG" end
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
    FSTime = FSTime or 250
    if FSTime<=0 then
       local stuff = {}
       local layer
       if Maps.Multi()==1 then layer = Maps.LayerCodeName end
       stuff[1] = {'FSTIT',Maps.GetData('Title'),'FieldInfo'}
       if layer and left(layer,1)=="#" then stuff[2]={'FSROM',layer} end
       if CVVN("%CASH") then stuff[#stuff+1] = {'FSCSH',CVV("%CASH")} end
       if CVVN("%ORBS") then stuff[#stuff+1] = {'FSORB',CVV("%ORBS")} end
       stuff[#stuff+1] = {'FSTIM',PlayTime()}
       for i,data in ipairs(stuff) do
           white()
           SetFont(data[3] or 'FieldStat')
           Image.LoadNew(data[1],"GFX/Field Icons/"..data[1]..".png")
           Image.Show(data[1],35,i*35)
           DarkText(data[2],75,i*35,0,0,180,255,0)
       end
    else
       FSTime=FSTime-1
       --DarkText(FSTime,0,0,0,0)
    end
end

-- Clickables
function ResetClickables()
Clickables = {}
end

function ListClickables()
local i,k
if #Clickables==0 then Console.Write("No clickables on this map",255,100,0) end
for i,k in ipairs(Clickables) do CSay(serialize("Click #"..i,k)) end
end 

function AddClickable(c)
if tablecontains(Clickables,c) then CSay('Duplicate clickable definiation '..c); return end
CSay(serialize("AddingClickable",c))
table.insert(Clickables,c)
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
local prefixes = {"NPC_","PSG_","PRC_"}
local p 
local layers,orilayer = ({ [0]=function() return {'SL:MAP'},nil end, [1]=function () return mysplit(Maps.Layers(),";"),Maps.LayerCodeName end})[Maps.Multi()]()
-- CSay(type(layers).."/"..type(each))
for layer in each(layers) do
    if Maps.Multi()==1 then Maps.GotoLayer(layer) end
    for obj in KthuraEach() do
        for p in each(prefixes) do 
            if prefixed(obj.Tag,p) then AddClickable(obj.Tag) CSay(layer..": Autoclickable "..obj.Tag.." added") end
            end
        end
    end
if Maps.Multi()==1 then Maps.GotoLayer(orilayer) end    
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
          elseif prefixed(c,"PSG") then
            if Actors.WalkTo(cplayer,Maps.Obj.Obj(c).X,Maps.Obj.Obj(c).Y+32)==1 then
               WalkArrival = 'MAPSAVE'
               WalkArrivalArg = nil
               ret = true   
            end      
      else
        if Maps.Obj.Exists("SPOT_"..c)==1 then
           succ = Actors.WalkToSpot(cplayer,"SPOT_"..c) == 1
           CSay("Walking to spot: SPOT_"..c)
        else
           succ = Actors.WalkToSpot(cplayer,c) == 1
           CSay("SPOT not there, so walking to the object itself in stead")
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
     WalkArrival()
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
end

function KillWalkArrival()
  WalkArrival = nil
end


  

function MAIN_FLOW()
  Cls()
  DrawScreen()
  --ManWalk()
  ScheduledExecution()
  Click()
  KeyClickables()
  ManualMove()
  AutoScroll()
  ZoneAction()
  WalkArrivalCheck()
  --Termination()
  --EmergencySave()
  --ControlFoes()
  --FindTreasures()
  FieldStats()
  ResetChar()
  ShowParty()
  ShowMouse()
  Flip()
end
