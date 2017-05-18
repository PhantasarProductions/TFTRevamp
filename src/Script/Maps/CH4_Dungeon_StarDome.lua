--[[
**********************************************
  
  CH4_Dungeon_StarDome.lua
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
 
version: 17.05.18
]]


function MAP_FLOW()
   -- Plasma
   local plasma = Maps.Obj.Obj('PLASMA')
   plasma.X = Maps.CamX
   plasma.Y = Maps.CamY
   plasma.W = SW
   plasma.H = SH
   plasma.InsertX = plasma.InsertX + 1
   if plasma.InsertX > 640 then plasma.InsertX = plasma.InsertX - 640 end
   -- Stars
   local stars = Maps.Obj.Obj('STARS')
   stars.X = Maps.CamX
   stars.Y = Maps.CamY
   stars.W = SW
   stars.H = SH
   stars.InsertY = stars.InsertY + 1
   if stars.InsertY > 800 then stars.InsertY = stars.InsertY - 800 end
   -- Turning transporter discs
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
