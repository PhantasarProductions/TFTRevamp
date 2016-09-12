--[[
  Field.lua
  Version: 16.09.12
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
    -- Load the map itself
    Maps.Load(map)
    -- Lastly, load the music   
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

function CheckClickables()
end

function Click()
local mx,my = MouseCoords()
local ak,ch
if mousehit(1) then -- Left Mouse button    
   if my>PartyBarY then  -- must come prior to checks in the field
      for ak=0,5 do
          if ClickedChar(ak) then FGoToMenu(ak) end
          end
   --[[ Star Story only       
   elseif IconClicked then -- Must come prior to checks in the field
      IconFunction[IconClicked]()
   ]]          
   elseif CheckClickables() then
     -- Nothing happens here, but this will take any other checks out.       
      else -- If there's nothing else then perform then walk to
      -- CSay(cplayer.." is going to walk to ("..mx..","..my..")")
      if not lasthit then 
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
DarkText(INP.JoyX()..","..INP.JoyY(),0,0,0,0)
end

  

function MAIN_FLOW()
Cls()
DrawScreen()
--ManWalk()
ScheduledExecution()
Click()
ManualMove()
AutoScroll()
--ZoneAction()
--WalkArrivalCheck()
--Termination()
--EmergencySave()
--ControlFoes()
--FindTreasures()
--ResetChar()
ShowParty()
ShowMouse()
Flip()
end
