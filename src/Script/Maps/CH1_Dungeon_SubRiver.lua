--[[
**********************************************
  
  CH1_Dungeon_SubRiver.lua
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
 
version: 16.12.17
]]

RiverWidth = nil
RiverHeight = nil
RiverTiles = {}

function Bye()
   LoadMap('CH1_DUngeon_HolyPath')
   GoToLayer('Bos','FromSecret')
end   

function Welcome()
   if not(Done('&DONE.WELCOME.CH1.SUBRIVER')) then MapText('Welcome') end
end

function InitRiverFlow()
   local layers = mysplit(Maps.Layers(),";")
   cleartable(RiverTiles)
   for lay in each(layers) do
       CSay('- Scanning layer '..lay) 
       Maps.GotoLayer(lay)
       for obj in KthuraEach('TiledArea') do
           if suffixed(obj.TextureFile,"WATER.PNG") then 
              RiverTiles[#RiverTiles+1] = obj
              obj.SetAlpha(456) -- Make sure all alpha values are equal. This was quite hard to guarantee inside the editor.
              CSay("  = Added object #"..obj.IDNum) 
              RiverHeight = RiverHeight or obj.TexHeight()
              RiverWidth  = RiverWidth  or obj.TexWidth ()
           end
           if obj.Tag=="Brug" and (not CVV('&DONE.SUBRIVER.BRUG['..lay.."']")) then 
              obj.SetAlpha(0)
              obj.ForcePassible=0
              CSay("  = Hid unaccessed bridge: #"..obj.IDNum)
           end   
       end
   end
   Maps.Remap()     
end

function MAP_FLOW()
   for obj in each (RiverTiles) do
       obj.InsertX = obj.InsertX - 2
       if obj.InsertX<-RiverWidth then obj.InsertX = obj.InsertX+RiverWidth end
   end
end

function GALE_OnLoad()
   InitRiverFlow()
   ZA_Enter('Welcome',Welcome)
   ZA_Enter('Bye',Bye)
end      
