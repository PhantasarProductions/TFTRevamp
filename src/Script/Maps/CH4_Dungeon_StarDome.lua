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
 
version: 17.05.22
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


function HetGatIn(gat)
      assert(puzzle,"No puzzle set up")
      if gat==puzzle.gat then return end
      local p = Actors.Actor('PLAYER')
      p.Dominance=2
      for i=1000,0,-1 do
          p.ScaleX=i
          p.ScaleY=i
          p.Rotation=p.Rotation+1
          p.Y = p.Y - 1
          Cls()
          MAP_FLOW()
          DrawScreen()
          Flip()
      end
      puzzle=nil
      GoToLayer('#007','Start')
      Maps.ReMap()
end

function Boss()
  ClearCombatData()
  Var.D("$COMBAT.FOE_1","Boss/SuperAlien")
  Var.D("$COMBAT.POSFOE_1","CENTER")
  Var.D("$COMBAT.MUSIC","Music/Special Boss/Freak Boutique.ogg")
  Var.D("$COMBAT.ARENA","StarDome.png")
  StartBoss("Alien Lord","Rjafhkfhafjklhgjd")   
end

function NPC_Key()
    ItemGive('ZZ_CRYPTKEY')
    MapText('KEY')
    Done('&CRYPTKEY')
    Maps.Obj.Kill('NPC_Key')
end


function InitPuzzle()
   if puzzle then return end
   local starchars = {'Wendicka','Crystal','Yirl','Foxy','Xenobi','Rolf'}
   local chosen = rand(1,#starchars)
   puzzle = { gat = rand(1,6) }
   puzzle.gatpic = starchars[chosen]
   puzzle.chosen = chosen
   puzzle.chosenpic = starchars[chosen]
   local getset = { [puzzle.gat]=puzzle.chosenpic }; puzzle.getset=getset
   CSay(serialize('PRIOR.Puzzle',puzzle))
   for i=1,6 do -- Chars
       local r
       local timeout = i*200
       if i~=puzzle.chosen  then
         repeat
          r=rand(1,6) -- hole
          timeout = timeout - 1
          assert(timeout>0,"Puzzle generation time-out ("..i..") "..serialize('puzzle',puzzle))
          CSay(i..".  "..'r = '..r.."  timeout: "..timeout)
         until (not getset[r]) -- and (r~=chosen)
       getset[r]=starchars[i]
       end  
   end
   CSay(serialize('puzzle',puzzle))
   for i=1,6 do
       CSay("Setting up cylinder: "..i)
       local c = Maps.Obj.Obj('Cyl'..i)
       c.TextureFile = 'GFX/Actors/Single/Cameos/CYL_'..puzzle.getset[i]..".png"
   end
   Maps.Obj.Obj('KeyPerson').TextureFile = 'GFX/Actors/Single/Cameos/SS_'..puzzle.chosenpic..".png"
end

function GALE_OnLoad()
    for i=1,6 do ZA_Enter('Gat'..i,HetGatIn,i) end
    ZA_Enter('InitPuz',InitPuzzle)
    
end
