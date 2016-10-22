--[[
**********************************************
  
  PRO_DUNGEON_Magic.lua
  (c) Jeroen Broks, 2016, All Rights Reserved.
  
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
 
version: 16.10.22
]]


function DrawPlasma()
   local tp = Maps.CObj
   local A = Actors.Actor('PLAYER')
   tp.X = A.X
   tp.Y = A.Y
   tp.Dominance = 0
   BlopPlasma.Draw()
end
   
function MAP_FLOW()
   local e = Maps.Obj.Obj('Obstacle_Next')
   e.Rotation = e.Rotation + 1
   if e.Rotation>=360 then e.Rotation = e.Rotation - 360 end   
end

scolor = { [true]={255,0,0}, [false]={0,0,255}}

function PuzzlePlate(tag)
   if puzzlesolved then return end
   solved = solved or {Z5=true}
   solved[tag] = not solved[tag]  
   if tag=='Z5' then
      for i=1,4 do solved['Z'..i] = not solved['Z'..i] end
   else
      solved.Z5 = not solved.Z5
   end
   puzzlesolved = true
   for i=1,5 do 
       puzzlesolved = puzzlesolved and solved['Z'..i]
       local c = scolor[solved['Z'..i]==true]
       local z = Maps.Obj.Obj('Z'..i) 
       z.R = c[1]
       z.G = c[2]
       z.B = c[3]
   end
   if puzzlesolved then
      local barrier = Maps.Obj.Obj('Barrier')
      Maps.CamY = barrier.Y-100 -- Make sure this can be seen in all screen formats
      repeat 
         barrier.SetAlpha(barrier.GetAlpha()+5)
         Cls()
         DrawScreen()
         Flip()
      until barrier.GetAlpha()>=1000   
      barrier.SetAlpha(1000)
      barrier.ForcePassible=1
      Maps.ReMap()
   end   
end

function NPC_ManaOrb()
  MapText("ORB")
  LoadMap("PRO_TOWN_FRENDOR")
  GoToLayer('elder','Marrilona')
  MapText("ELDER_MANAORB")
  local choice = RunQuestion('MAP','ELEMENTS')
  MapText('ELDER_OVER')
  MapText('MARRILONA_OVER'..choice)
  CreateSkill('Marrilona',choice+1,1)
  -- Sys.Error("Wait for the rest, folks!")
end

function GALE_OnLoad()
  for i=1,5 do ZA_Enter('Z'..i,PuzzlePlate,'Z'..i) end
end   
