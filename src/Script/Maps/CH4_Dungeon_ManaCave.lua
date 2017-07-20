--[[
**********************************************
  
  CH4_Dungeon_ManaCave.lua
  (c) Jeroen Broks, 2017, All Rights Reserved.
  
  This file contains material that is related 
  to a storyline that is which is strictly
  copyrighted to Jeroen Broks.
  
  This file may only be used in an unmodified
  form with an unmodified version of the 
  software this file belongs to.
  
  You may use this file for your study to see
  how I solved certain things in the creation
  of this project to see if you find valuable
  leads for the creation of your own.
  
  Mostly this file comes along with a project
  that is for most part released under an
  open source license and that means that if
  you use that code with this file removed
  from it, you can use it under that license.
  Please check out the other files to find out
  which license applies.
  This file comes 'as-is' and in no possible
  way the author can be held responsible of
  any form of damages that may occur due to 
  the usage of this file
  
  
 **********************************************
 
version: 17.07.20
]]

-- @USE /Script/Use/Specific/GreatMagicBack.lua


-- @IF IGNORE
local effect
-- @FI


function BlueSeal()
    ClearCombatData()
    Var.D("$COMBAT.FOE_1","Sealed/Gendrabroe")
    Var.D("$COMBAT.POSFOE_1","CENTER")
    Var.D("$COMBAT.MUSIC","Music/Special Boss/Blue Seal.ogg")
    Var.D("$COMBAT.ARENA","ManaCave.png")
    StartBoss("Fair sharing monster","Gendrabroe",0,25,100)      
    Done('&DONE.SEAL.MARRILONA2')
end    


local complete  = "&DONE.MANACAVE.COMPLETE"
local boss1down = "&DONE.MANACAVE.BOSS1"
local welcome   = "&DONE.MANACAVE.WELCOME"
local tune      = {[true]=2,[false]=1}
local bosses    = {['#005']=1,['#019']=2}
local bossfile  = {'Grwol','UberGob'}
local bossann   = {'Grwol',Var.S("<Uuml>bergoblin")}


function Boss()
  local bid = bosses[Maps.LayerCodeName]
  if Done("&DONE.MANACAVE.BOSS"..bid) then return end
  ClearCombatData()
  local i = 1
  local s = ({0,1,3})[skill]
  for ak=1,s do 
      Var.D("$COMBAT.FOE_"..i,"Reg/Nemesis")
      i = i + 1
  end    
  Var.D("$COMBAT.FOE_"..i,"Boss/"..bossfile[bid])
  Var.D('$COMBAT.POSFOE_'..i,"CENTER")
  i=i+1
  for ak=1,s do 
      Var.D("$COMBAT.FOE_"..i,"Reg/Nemesis")      
      i = i + 1
  end    
  Var.D("$COMBAT.MUSIC","Music/Boss/BrutalSong.ogg")
  Var.D("$COMBAT.ARENA","ManaCave.png")
  StartBoss("Guardian of the Mana Cave",bossann[bid])   
  DestroyPushedMusic()
  PushMusic('Mystery/Draft2.ogg')
end

function MapMusic()
     Music("Mystery/Draft"..tune[CVV(boss1down)]..".ogg")
end         
    
    
local function QuickMansion()
    -- error("This route is not open yet")
    GoToLayer('#020','Start')
end        

local function Welcome()
     if RPG.PartyTag(0)=="Nostramantu_Human" then
        Award('ZZNGP_MANACAVE') 
        MapText("WELCOME_NOS")
        Party('Jake_Human;Marrilona;Dandor;HandoStillor')
        LoadMap('NGP_DUNGEON_DANDLETON_PART2')
        GoToLayer('#011','Start')
        MapText('MANACAVE')
        RPG.DefStat('Marrilona','EXP',-2000000000)
     elseif not(Done('&DONE.MANACAVE.ENTERED.FIRSTTIME.JAKE.MARRILONA.DANDOR.HANDOSTILLOR')) then
        MapText("WELCOME")
        Maps.Obj.Kill("Welcome")
        WorldMap_UnLock("CH4MANACAVE")
     end   
end

local function ToBegin()
    --GoToLayer("#000","Start") 
    Done(complete)
    WorldMap('Kokonora')
end    

local function Mansion()
  if not Done("&DONE.MANSION.FIRST.SEEING") then
     local vx,vy,vw,vh = GetViewport()
     local toy = 190
     local m = Maps.Obj.Obj('Mansion')
     local tox = m.x-math.floor(vw/2)
     repeat
        if Maps.CamY>toy then Maps.CamY=Maps.CamY-1 end
        if Maps.CamX>tox then Maps.CamX=Maps.CamX-1 end
        if Maps.CamX<tox then Maps.CamX=Maps.CamX+1 end
        Cls()
        DrawScreen()
        Flip()
     until Maps.CamX==tox and Maps.CamY==toy
     MapText('MANSION')
     for ch in each({'Jake_Human','Marrilona','Dandor','HandoStillor'}) do RPG.IncStat(ch,'EXP',-250000) end   
  end
  LoadMap('CH4_DUNGEON_Z_NOSTRAMANTUMANSION')
  GoToLayer('lobby','Start')
end

function MAP_FLOW()
   local e
   for e in each(effect[Maps.LayerCodeName]) do FlowMoveTex(e) end
   --FlowMoveTex(effect[Maps.LayerCodeName])
   if Maps.Obj.Exists("Obstacle_Next")==1 then 
      e = Maps.Obj.Obj('Obstacle_Next')
      e.Rotation = e.Rotation + 1
      if e.Rotation>=360 then e.Rotation = e.Rotation - 360 end
   end   
   if Maps.Obj.Exists("Obstacle_Quick")==1 then 
      e = Maps.Obj.Obj('Obstacle_Quick')
      e.Rotation = e.Rotation + 10
      if e.Rotation>=360 then e.Rotation = e.Rotation - 360 end
   end       
end


function GALE_OnLoad()
    if not CVV(complete) then
       Maps.GotoLayer('#000')
       Maps.Obj.Kill("Quick")
       Maps.Obj.kill("Obstacle_Quick")
    else
       ZA_Enter("Quick",QuickMansion)
    end
    --ZA_Enter("Welcome",Welcome)
    ZA_Enter("Welcome2",Welcome)
    ZA_Enter("ToBegin",ToBegin)
    ZA_Enter('ShowMansion',Mansion)
    local plasma = {}
    plasma.textures = {'gfx/Textures/Plasma/TiledPlasma.png','gfx/Textures/Plasma/TiledPlasma.png','gfx/Textures/Plasma/TiledPlasma.png','gfx/Textures/Plasma/TiledPlasma.png','gfx/Textures/Plasma/TiledPlasma.png','gfx/Textures/Plasma/TiledPlasma.png'}
    plasma.colors = { {180,0,0}, {0,180,0}, {0,0,180},{180,0,0}, {0,180,0}, {0,0,180}}
    plasma.speed = {{1,0},{0,1},{-1,-1},{-1,0},{0,-1},{1,1}}
    -- @IF Ignore
       local effect
    -- @FI
    if RPG.PartyTag(0)=='Nostramantu_Human' then
       effect = { ['#000'] = SetUpGreatMagicDo(plasma,'#000') }
    else     
       effect = SetupGreatMagic(plasma,21) -- #000 counts too, you know!
    end       
end          
