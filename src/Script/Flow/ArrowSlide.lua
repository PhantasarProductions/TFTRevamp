--[[
  ArrowSlide.lua
  Version: 17.08.02
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


-- @DEFINE ARROWDEBUG


Blocks = nil
Arrows = nil
PLAYER = nil
APLAY  = nil
Field  = nil
Play   = {x=0,y=0}

function DrawScreen() MS.Run("FIELD","DrawScreen") end


function GALE_OnLoad()
  ArrowKeys = {Up=KEY_UP,Down=KEY_DOWN,Right=KEY_RIGHT,Left=KEY_LEFT}
  WASDKeys = {Up=KEY_W,Down=KEY_S,Right=KEY_D,Left=KEY_A}
  Joy = {Up=joy_up,Down=joy_down,Right=joy_right,Left=joy_left}
  AWIND = {Up='North',Down='South',Right='East',Left='West'}
end

function PlayBlock(x,y)
    -- return Maps.Block(x,y)>0
    local crackblock = false
    for b in each(Blocks) do
       crackblock = crackblock or ( b.px==x and b.py==y )
    end              
    return (not Field[y]) or Field[y][x]=="X" or crackblock
end

function BlockBlock(x,y)
   local ok = PlayBlock(x,y)
   --for a in each(Arrows) do
       ok = ok or(Field[y] and ( Field[y][x]=="R" or Field[y][x]=="L" or Field[y][x]=="U" or Field[y][x]=="D") )--and (math.floor(x/32)~=math.floor(a.spotx/32) or math.floor(y/32)~=math.floor(a.spoty/32))
   --end
   for b in each(Blocks) do
       ok = ok or ( b.px==x and b.py==y )
   end    
   return ok
end

function MoveBlocks(px,py)
   --[[
   --local px = math.floor(tx/32)
   --local py = math.floor(ty/32)
   CSay("Gonna Check Arrows for position: ("..px..","..py..") Playpos ("..tx..","..ty..")")
   for a in each(Arrows) do
       CSay("= Arrow on ("..math.floor(a.spotx/32)..","..math.floor(a.spoty/32)..")")
       if math.floor(a.spotx/32)==px and math.floor(a.spoty/32)==py then
          CSay("Arrow hit")
          for b in each(Blocks) do
              local tox,toy=b.tox+(a.GoX*32),b.toy+(a.GoY*32)
              if not BlockBlock(tox,toy) then b.moving,b.tox,b.toy=true,tox,toy end
          end    
       end
   end
   ]]
   if not Field[py] then return end
   if not Field[py][px] then return end
   local f = Field[py][px]
   local movement = ({ U = {y=-1}, D={y=1}, L={x=-1}, R={x=1}})[f]
   if not movement then return end
   movement.y=movement.y or 0
   movement.x=movement.x or 0
   for b in each(Blocks) do
       local newx=b.px+movement.x
       local newy=b.py+movement.y
       if not BlockBlock(newx,newy) then
          b.moving = true
          b.tox = b.tox + (movement.x*32)
          b.toy = b.toy + (movement.y*32)
          b.px = newx
          b.py = newy
       end   
   end
end

function PlayGo(x,y,d)
   local tpx = Play.x+x
   local tpy = Play.y+y
   local tx = (tpx*32)+16 -- APLAY.X+(x*32)
   local ty = (tpy*32)+32 -- APLAY.Y+(y*32)
   local ok = true
   ok = ok and (not PlayBlock(tpx,tpy))
   ok = ok and APLAY.Moving==0 and APLAY.Walking==0 
   for block in each(Blocks) do ok = ok and (not block.moving) end
   ok = ok and (INP.KeyH(ArrowKeys[d])==1 or INP.KeyH(WASDKeys[d])==1 or joyhit(Joy[d]))
   if ok then 
      Play.x=tpx
      Play.y=tpy
      -- Actors.MoveTo(PLAYER,tx,ty,1)
      APLAY.X = tx
      APLAY.Y = ty
      Actors.ChoosePic(PLAYER,Var.C("$CRACKCHAR").."."..upper(AWIND[d]))
      MoveBlocks(tpx,tpy) 
   end
end

function BlockMoveExec()
   local remap = false
   for block in each(Blocks) do
       if block.moving then
          if     block.object.X<block.tox then block.object.X = block.object.X + 1
          elseif block.object.X>block.tox then block.object.X = block.object.X - 1 end 
          if     block.object.Y<block.toy then block.object.Y = block.object.Y + 1
          elseif block.object.Y>block.toy then block.object.Y = block.object.Y - 1 end
          if     block.object.X==block.tox and block.object.Y == block.toy then block.moving=false remap=true end 
       end
   end
   if remap then Maps.Remap() end
end   

function Up()    PlayGo( 0,-1,'Up') end    
function Down()  PlayGo( 0, 1,'Down') end
function Right() PlayGo( 1, 0,'Right') end
function Left()  PlayGo(-1, 0,'Left') end
godirs = {Up,Down,Right,Left}


function InitPuzzle()
    Blocks = {}
    Arrows = {}
    PLAYER = "CRACKPLAYER" -- Var.C("$CRACKPLAYER")
    APLAY = Actors.Actor(PLAYER)
    Field = {}
    Play.x = math.floor(Maps.Obj.Obj("Puz_Start").X/32)
    Play.y = math.floor(Maps.Obj.Obj("Puz_Start").Y/32)-1
    local fdbg = {}
    local maxx,maxy=0,0     
    local dr = {DN={Y=1},UP={Y=-1},RT={X=1},LF={X=-1}}
    for o in KthuraEach() do
        local opx = math.floor(o.X/32)
        local opy = math.floor(o.Y/32)  -- Not the most reliable feature, but it "does" the job :P
        if maxx<opx then maxx=opx end
        if maxy<opy then maxy=opy end
        if suffixed(upper(o.TextureFile),"CRACKED.PNG") then 
           local bx =  math.floor(o.X/32)
           local by =  math.floor(o.Y/32) - 1
           Field[by] = Field[by] or {}               
           Field[by][bx]="B"
           local block = {orix=o.X, oriy=o.y, tox = o.X, toy=o.Y, moving=false, wasmoving=false, object=o, porix=bx, poriy=by, px=bx, py=by}
           Blocks[#Blocks+1]=block           
        end
        for k,v in pairs(dr) do
            if suffixed(upper(o.TextureFile),"AR_"..k..".PNG") then
               --[[
               arrow = {}; Arrows[#Arrows+1]=arrow
               arrow.GoX = v.X or 0
               arrow.GoY = v.Y or 0
               arrow.spotx = o.X
               arrow.spoty = o.Y
               arrow.object = o
               ]]
               local fx = math.floor(o.X/32)
               local fy = math.floor(o.Y/32) - 1
               Field[fy] = Field[fy] or {}               
               Field[fy][fx]=left(k,1)
            end   
        end
    end
    -- @IF ARROWDEBUG
    CSay('Puzsize = '..maxx.."x"..maxy)
    -- @FI
    -- --[[
     for x=0,maxx do for y=0,maxy do 
            Field[y] = Field[y] or {};
            Field[y][x] = Field[y][x] or ({[0]=" ",[1]="X"})[Maps.Block((x*32)+16,(y*32)+16)]
            -- @IF ARROWDEBUG
            fdbg[y] = fdbg[y] or ""
            fdbg[y] = fdbg[y] .. (Field[y][x] or "?")
            -- @FI
    end end     
    -- ]]   
    -- @IF ARROWDEBUG
    CSay(serialize('field',fdbg))
    -- @FI
    CSay(#Blocks.." movable blocks have been found in this puzzle")
    --CSay(#Arrows.." arrow spots have been found in this puzzle") 
    -- CSay(serialize("Arrows",Arrows)) -- Debug line   
    repeat
       Cls(); MS.Run('FIELD','DrawScreen'); Flip()
    until APLAY.Moving==0 and APLAY.Walking==0
end

function Forfeit()
    if getpress.cancel() or mousehit(2) or Maps.ActorInZone(PLAYER,'Forfeit')==1 then
       local s = Maps.Obj.Obj("Start")
       APLAY.X = s.X
       APLAY.Y = s.Y
       for block in each(Blocks) do
           block.tox=block.orix
           block.toy=block.oriy
           block.px =block.porix
           block.py =block.poriy
           block.object.X=block.orix
           block.object.Y=block.oriy
       end
       Maps.Obj.Kill(PLAYER)
       Actors.Actor("PLAYER" ).SetAlpha(1000)
       Actors.Actor("PLAYER1").SetAlpha(1000)
       Actors.Actor("PLAYER2").SetAlpha(1000)
       Actors.Actor("PLAYER3").SetAlpha(1000)
       LAURA.FLOW("FIELD")
       MS.Destroy("CRACKPUZ")
       return true
    end
end

function Goal()
       -- This routine is the reason why version 17.03.29 or later is required, because API commands not available in earlier versions are used.
       if Maps.ActorInZone(PLAYER,"Goal")==0 then return end
       local pobjects = {}
       for po in KthuraLabelEach('Puzzle') do pobjects [ #pobjects + 1 ] = po; po.Impassible = 0 end 
       Maps.ReMap()
       Actors.WalkToSpot("PLAYER" ,PLAYER)
       Actors.WalkToSpot("PLAYER1",PLAYER)
       Actors.WalkToSpot("PLAYER2",PLAYER)
       Actors.WalkToSpot("PLAYER3",PLAYER)
       for alpha=0,1000,25 do
           Actors.Actor("PLAYER" ).SetAlpha(alpha)
           Actors.Actor("PLAYER1").SetAlpha(alpha)
           Actors.Actor("PLAYER2").SetAlpha(alpha)
           Actors.Actor("PLAYER3").SetAlpha(alpha)
           for po in each(pobjects) do po.SetAlpha(1000-alpha) end
           Actors.Actor(PLAYER).SetAlpha(1000-alpha)
           Cls()
           DrawScreen()
           Flip()
       end
       for i=0,3 do
           tag = RPG.PartyTag(i)
           RPG.IncStat(tag,"EXP",(-900)/skill)
       end
       Maps.Obj.Kill(PLAYER)
       Maps.ObjectList.KillByLabel("Puzzle",1)
       Maps.ReMap()
       LAURA.FLOW("FIELD")
       MS.Destroy("CRACKPUZ")   
       return true                   
end

function AutoScroll()
   local camx = APLAY.X-(SW/2)
   local camy = APLAY.Y-(SH/2)
   if Maps.CamX>camx then Maps.CamX=Maps.CamX-1 elseif Maps.CamX<camx then Maps.CamX=Maps.CamX+1 end
   if Maps.CamY>camy then Maps.CamY=Maps.CamY-1 elseif Maps.CamY<camy then Maps.CamY=Maps.CamY+1 end
end


function MAIN_FLOW()
   Cls()
   MS.Run("FIELD","DrawScreen")
   MS.Run("MAP","MAP_FLOW")
   local yeahyeah = Forfeit() or Goal() 
   BlockMoveExec()
   AutoScroll()
   Flip()
   for go in each(godirs) do go() end
end   
