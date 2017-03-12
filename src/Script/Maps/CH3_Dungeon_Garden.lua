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
 
version: 17.03.11
]]

-- @USE /Script/Use/Specific/Walda.lua

tree19 = {}

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
   if Maps.LayerCodeName=="#019" then
      for i=#tree19,2,-1 do
          local o=tree19[i]
          local p=tree19[i-1]
          o.R = p.R
          o.G = p.G
          o.B = p.B
          o.SetAlpha(p.GetAlpha())
      end
      local f=tree19[1]
      f.R=rand(0,255)
      f.G=rand(0,255)
      f.B=rand(0,255)
      if f.GetAlpha()<1000 then f.SetAlpha(f.GetAlpha()+1) end
   end 
end

function Boss()
  ClearCombatData()
  Var.D("$COMBAT.FOE_1",({["#006"]="Boss/InvisibleDemon",['#018']='Boss/SuperHidingHag'})[Maps.LayerCodeName])
  Var.D("$COMBAT.POSFOE_1","CENTER")
  Var.D("$COMBAT.MUSIC","Music/Boss/BrutalSong.ogg")
  Var.D("$COMBAT.ARENA","MG.png")
  StartBoss("Eye-Spy",({["#006"]='Invisible Demon', ['#018']='Super Hiding Hag'})[Maps.LayerCodeName])    
end


function Bye()
   LoadMap("CH3_Dungeon_Mine")
   GoToLayer('#001','FromSecretDungeon')
end   

function Back()
    GoToLayer("#000","Einde")
end

function NPC_ManaOrb()
     ManaOrb()
     Award("SECRETDUNGEON_MAGICGARDEN")
     Maps.Obj.Kill("NPC_ManaOrb",1)
end


function GALE_OnLoad()
   InitWalda('Garden')   
   Maps.GoToLayer("#019")
   for obj in KthuraEach('Obstacle') do
       if obj.Tag=="" then 
          tree19[#tree19+1] = obj
          obj.R=0
          obj.G=0
          obj.B=0
          obj.SetAlpha(0)
       end
       CSay(#tree19.." trees of tree effect")
   end
   ZA_Enter("Back",Back)    
   ZA_Enter("Bye",Bye)      
end
