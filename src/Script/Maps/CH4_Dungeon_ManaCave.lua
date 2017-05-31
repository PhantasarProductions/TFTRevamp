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
 
version: 17.05.31
]]

-- @USE /Script/Use/Specific/GreatMagicBack.lua


-- @IF IGNORE
local effect
-- @FI

local complete  = "&DONE.MANACAVE.COMPLETE"
local boss1down = "&DONE.MANACAVE.BOSS1"
local welcome   = "&DONE.MANACAVE.WELCOME"
local tune = {[true]=2,[false]=1}

function MapMusic()
     Music("Mystery/Draft"..tune[CVV(boss1down)]..".ogg")
end         
    
    
local function QuickMansion()
    error("This route is not open yet")
end        

local function Welcome()
     MapText("WELCOME")
     Maps.Obj.Kill("Welcome",1)
     WorldMap_UnLock("CH4MANACAVE")
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
      e = Maps.Obj.Obj('Obstacle_Next')
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
    ZA_Enter("Welcome",Welcome)
    local plasma = {}
    plasma.textures = {'gfx/Textures/Plasma/TiledPlasma.png','gfx/Textures/Plasma/TiledPlasma.png','gfx/Textures/Plasma/TiledPlasma.png','gfx/Textures/Plasma/TiledPlasma.png','gfx/Textures/Plasma/TiledPlasma.png','gfx/Textures/Plasma/TiledPlasma.png'}
    plasma.colors = { {180,0,0}, {0,180,0}, {0,0,180},{180,0,0}, {0,180,0}, {0,0,180}}
    plasma.speed = {{1,0},{0,1},{-1,-1},{-1,0},{0,-1},{1,1}}
    -- @IF Ignore
       local
    -- @FI
    effect = SetupGreatMagic(plasma)    
end          
