--[[
**********************************************
  
  NGP_DUNGEON_CATHEDRAL.lua
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
 
version: 17.07.08
]]

-- @USE /Script/Use/Specific/NewGame+.lua


-- Data
local switched={}

-- Let's switch
local function DO_SWITCH(s) 
   switched[s] = true
   Maps.Obj.Obj('NPC_SWITCH'..s).Texturefile = 'GFX/Textures/Switch/Left.png'
   if switched[1] and switched[2] then
      if not Done('&DONE.NEWGAMEPLUS.CATHEDRAL.DOOR.OPEN.BY.SWITCH') then 
         local w = Screen.Width()
         local h = Screen.Height()
         local cx = Maps.CamX
         local cy = Maps.CamY
         local bar = Maps.Obj.Obj('Barrier')
         local tx = bar.x-(w/2)
         local ty = bar.y-(h/2)
         Maps.CamX = tx
         Maps.CamY = ty
         Cls() DrawScreen(); Flip(); Time.Sleep(500)
         Maps.Obj.Kill('Barrier',1)
         Cls() DrawScreen(); Flip(); Time.Sleep(500)
      end
   end
end
   
function NPC_SWITCH1() DO_SWITCH(1) end
function NPC_SWITCH2() DO_SWITCH(2) end

function Boss()
--Music/AltBoss/Day of Chaos.ogg
  ClearCombatData()
  ;({
     function()
       Var.D("$COMBAT.FOE_1","Boss/Ghost Woman")
       Var.D("$COMBAT.POSFOE_1","CENTER")
     end,function()
       for i=1,3 do Var.D('$COMBAT.FOE_'..i,"REG/GHOSTGIRL") end
       Var.D("$COMBAT.FOE_4","Boss/Ghost Woman")
       Var.D("$COMBAT.POSFOE_4","CENTER")
     end,function()
       for i=1,9 do Var.D('$COMBAT.FOE_'..i,"REG/GHOSTGIRL") end
       Var.D("$COMBAT.FOE_10","Boss/Ghost Woman")
       Var.D("$COMBAT.POSFOE_10","CENTER")
     end  
  })[skill]()
  Var.D("$COMBAT.MUSIC","Music/AltBoss/Day of Chaos.ogg")
  Var.D("$COMBAT.ARENA","Cathedral.png")
  NGP_StartBoss("Screaming undead","Ghost Woman")    
end

function NPC_SymphoNica()
   ToHallHeroes('SymphNica','CATEDRAL')
end   
