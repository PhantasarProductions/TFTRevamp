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
 
version: 16.12.19
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
           if obj.Tag=="Brug" and (not CVV('&DONE.SUBRIVER.BRUG['..lay..']')) then 
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


BrugHandleTex = { [true]='GFX/Textures/Switch/Left.png', [false]='GFX/Textures/Switch/Right.png' }

function NPC_Brug()
   if not Done('&DONE.SUBRIVER.BRUG['..Maps.LayerCodeName..']') then
      local brug = Maps.Obj.Obj('Brug')
      local handle 
      local cam = Maps.Obj.Obj('BrugCam')
      if Maps.LayerCodeName=="#005" then
         for h = 1,6 do
            handle = Maps.Obj.Obj('NPC_SW'..h)
            handle.TextureFile = BrugHandleTex[upper(BrugHandleTex[true])==handle.TextureFile]
          end  
      else
         handle = Maps.Obj.Obj('NPC_Brug')
         handle.TextureFile = BrugHandleTex[upper(BrugHandleTex[true])==handle.TextureFile]
      end
      Maps.CamX = cam.X - Center_X
      Maps.CamY = cam.Y - Center_Y
      for i=0,1000,2 do
          brug.SetAlpha(i)
          Cls()
          DrawScreen()
          MAP_FLOW()
          ShowParty()
          Flip()
      end
      brug.ForcePassible =1
      Maps.Remap()    
   end 
end

function BackToStart()
    GoToLayer('#001','Start')
end



function StartPuzzle()
   if not CVV('&DONE.SUBRIVER.BRUG['..Maps.LayerCodeName..']') then
      NPC_SW1 = BackToStart
      NPC_SW2 = BackToStart
      NPC_SW3 = BackToStart
      NPC_SW4 = BackToStart
      NPC_SW5 = BackToStart
      NPC_SW6 = BackToStart
      local r = rand(1,6)
      for i=1,6 do
          local obj = Maps.Obj.Obj('NPC_SW'..i)
          obj.TextureFile = BrugHandleTex[i~=r]
      end
      if r==1 then NPC_SW1 = NPC_Brug end    
      if r==2 then NPC_SW2 = NPC_Brug end    
      if r==3 then NPC_SW3 = NPC_Brug end    
      if r==4 then NPC_SW4 = NPC_Brug end    
      if r==5 then NPC_SW5 = NPC_Brug end    
      if r==6 then NPC_SW6 = NPC_Brug end    
   end
end

function Boss_Start()
  ClearCombatData()
  Var.D("$COMBAT.FOE_1","Boss/KillerEscargot")
  Var.D("$COMBAT.POSFOE_1","CENTER")
  Var.D("$COMBAT.MUSIC","Music/Boss/BrutalSong.ogg")
  Var.D("$COMBAT.ARENA","SubRiver.png")
  Schedule('MAP','NPC_Brug')
  StartBoss("Enormous Snail","Killer Escargot")
  Maps.Obj.Kill('Boss_Actor',1)
  Maps.Obj.Kill('Boss_Start',1)  
end

function GALE_OnLoad()
   InitRiverFlow()
   ZA_Enter('Welcome',Welcome)
   ZA_Enter('Bye',Bye)
   ZA_Enter('StartPuzzle',StartPuzzle)
   ZA_Enter('Boss_Start',Boss_Start)
   MapHide('Secret')
end      
