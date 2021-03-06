--[[
**********************************************
  
  CH2_Dungeon_DragonCastle.lua
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
 
version: 17.01.18
]]

NoDarkness = {'courtyard'}

function MAP_FLOW()
   local dark = Maps.Obj.Obj("Darkness")
   local play = Actors.Actor('PLAYER')
   dark.X = play.X
   dark.Y = play.Y
end

function Courtyard(spot)
   GoToLayer('courtyard','Start'..spot)
end

function LeaveCourtyard(spot)
   GoToLayer('#001','FCY'..spot)
end   

function MakeDarkness()
   local layers = mysplit(Maps.Layers(),";")
   local dark
   local scx = math.ceil((SW/3000)*1000); if scx>1000 then scx=1000 end
   local scy = math.ceil((SH/3000)*1000); if scy>1000 then scy=1000 end
   CSay('Darkness scale: '..scx..","..scy)
   for lay in each(layers) do
       Maps.GoToLayer(lay)
       Maps.CreateObstacle(0,0,'GFX/Effects/Darkness.png',"Darkness",0)
       dark = Maps.Obj.Obj("Darkness")
       if tablecontains(NoDarkness,lay) then dark.Visible=0 end
       dark.Impassible=0
       dark.Dominance=50000
       dark.ScaleX = scx
       dark.ScaleY = scy
   end
   Maps.ReMap()
end

function NPC_SwitchNext()
   local d = "&DONE.DRAGONCASTLE.NEXT["..Maps.LayerCodeName.."]"
   if Done(d) then return end
   Maps.Obj.Obj("NPC_SwitchNext").TextureFile = "GFX/Textures/Switch/Right.png"
   Maps.PermaWrite('Maps.Obj.Obj("NPC_SwitchNext").TextureFile = "GFX/Textures/Switch/Right.png"')
   Maps.Obj.Kill('DoorNext',1)
end   

function Boss()
  if Done('&DONE.DRAGONCASTLE.BOSS') then return end
  ClearCombatData()
  Var.D("$COMBAT.FOE_1","Boss/Mega Ghost")
  Var.D("$COMBAT.POSFOE_1","CENTER")
  Var.D("$COMBAT.MUSIC","Music/AltBoss/Day Of Chaos.ogg")
  Var.D("$COMBAT.ARENA","SpookyDung.png")
  StartBoss("Souls of the angry undead","Mega Ghost")
end
   

function GALE_OnLoad()
   MakeDarkness()
   ZA_Enter('E_Courtyard',Courtyard,'E')
   ZA_Enter('W_Courtyard',Courtyard,'W')
   ZA_Enter('CYUW',LeaveCourtyard,"W")
   ZA_Enter('CYUO',LeaveCourtyard,"E")
   ZA_Enter('EndOfDung',Award,"SECRETDUNGEON_DRAGON")
   ZA_Enter('Boss',Boss)
   ZA_Enter('Leave',WorldMap)
   MapHide('Seya')
   MapHide('Travel')   
end   
