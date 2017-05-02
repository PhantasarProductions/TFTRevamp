--[[
**********************************************
  
  CH4_Dungeon_PyrusPass.lua
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
 
version: 17.05.02
]]

-- @IF IGNORE
local
-- @FI
      nostradone = "&DONE.CHAPTER4.MTPYRUS.BOSS.NOSTRAMANTU.DEFEATED"

function Leave()
     if not CVV(nostradone) then
        MapText('NOLEAVE')
        Actors.MoveToSpot('PLAYER','Start')
     else
        WorldMap('Delisto')
     end
end

function MAP_FLOW()
   local MSecs=Time.MSecs()
   if Maps.LayerCodeName~="#001" then return end
   local o = Maps.Obj.Obj('Lava')  
   o.x=Maps.CamX
   o.y=Maps.CamY
   o.w=SW
   o.h=SH
   o.InsertX=math.sin(MSecs/8000)*500
   o.InsertY=math.cos(MSecs/8000)*500
end

function GALE_OnLoad()
   ZA_Enter('Leave',Leave)
end   
