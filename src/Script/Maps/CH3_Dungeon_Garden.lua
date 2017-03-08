--[[
**********************************************
  
  CH3_Dungeon_Garden.lua
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
 
version: 17.03.08
]]

-- @USE /Script/Use/Specific/Walda.lua

function DrawPlasma()
   local tp = Maps.CObj
   local A = Actors.Actor('PLAYER')
   tp.X = A.X
   tp.Y = A.Y
   if tp.Dominance~=0 then
      tp.Dominance = 0
      Maps.Remap()
   end   
   BlopPlasma.DrawCol(25,100,25)
end
   
function MAP_FLOW()   
   local e
   if Maps.Obj.Exists("Obstacle_Next")==1 then 
      e = Maps.Obj.Obj('Obstacle_Next')
      e.Rotation = e.Rotation + 1
      if e.Rotation>=360 then e.Rotation = e.Rotation - 360 end
   end   
   if Maps.Obj.Exists("Obstacle_Prev")==1 then 
      e = Maps.Obj.Obj('Obstacle_Prev')
      e.Rotation = e.Rotation - 1
      if e.Rotation<=0 then e.Rotation = e.Rotation + 360 end
   end   
end

function Boss()
  ClearCombatData()
  Var.D("$COMBAT.FOE_1","Boss/InvisibleDemon")
  Var.D("$COMBAT.POSFOE_1","CENTER")
  Var.D("$COMBAT.MUSIC","Music/Boss/BrutalSong.ogg")
  Var.D("$COMBAT.ARENA","MG.png")
  StartBoss("Eye-Spy","Invisible Demon")    
end


function Bye()
   LoadMap("CH3_Dungeon_Mine")
   GoToLayer('#001','FromSecretDungeon')
end   


function GALE_OnLoad()
   InitWalda('Garden')   
end
