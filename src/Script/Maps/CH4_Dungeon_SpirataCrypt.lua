--[[
**********************************************
  
  CH4_Dungeon_SpirataCrypt.lua
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
 
version: 17.06.05
]]

local NoDarkness={}

local backspirata = {

   aqua = { kthura = 'CH2_DUNGEON_SPIRATAWATER',
            layer  = '#005'}


}

local function MakeDarkness()
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

function MAP_FLOW()
   local dark = Maps.Obj.Obj("Darkness")
   local play = Actors.Actor('PLAYER')
   dark.X = play.X
   dark.Y = play.Y
end


local function Back2Spirata()
   local layer = Maps.LayerCodeName
   local back = backspriata[layer]
   assert(back,"No 'back' information for layer '"..layer.."'")
   
end

function GALE_OnLoad()
   MakeDarkness()
   MapHide('Secret')
   ZA_Enter('Spirata',Back2Spirata)
end   
