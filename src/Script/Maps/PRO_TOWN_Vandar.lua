--[[
**********************************************
  
  PRO_TOWN_Vandar.lua
  (c) Jeroen Broks, 2016, 2017, All Rights Reserved.
  
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
 
version: 17.05.12
]]


function MapMusic()
   if not Done("&DONE.VANDAR.OPENING_JOHN") then 
      CSay("Skip the music for now. Let John speak first.")
   else
      OriMapMusic()
   end   
end

function NPC_MasterJohn()
  MapText("N_John_Pro")
end  

function John_Exam()
   MapText("John")
   MapMusic()
end   

function NPC_Chief()
   if not Done("&DONE.JAKE.CHIEF.PROLOGUESPOKEN") then
      VocalMusicStop()
      MapText('CHIEF1')
      Actors.Spawn('Entrance','GFX/Actors/Single/Humans/Harry_Backside.png','IHARRY',1)
      MapText('CHIEF2')
      MapMusic()      
      Maps.Obj.Kill('IHARRY')
      Maps.GotoLayer('town')
      Maps.Obj.Kill('NPC_MT_HarryOutside',1)
      Maps.GotoLayer('chief')
      -- Sys.Error("The rest of the content comes later.")
   elseif not CVVN("&DONE.JAKE.LITTLEJENNY.RESCUED") then
     MapText('CHIEF_NOJENNY')
   end
end      

function Bye()
   if not CVV("&DONE.JAKE.CHIEF.PROLOGUESPOKEN") then 
      MapText("NOLEAVECHIEF")
   elseif not CVVN("&DONE.CH4DISCUSSION") then
      MapText("NOLEAVEJENNY")   
   else
      WorldMap()   
   end   
end


function WalkLevel(dom,opbrug)
  -- Player Correction
  Actors.Actor('PLAYER').Dominance=dom
  for i=1,3 do
      if RPG.PartyTag(i)~='' then
           Actors.Actor('PLAYER'..i).Dominance=30
           Actors.Actor('PLAYER'..i).X = Actors.Actor('PLAYER').X
           Actors.Actor('PLAYER'..i).Y = Actors.Actor('PLAYER').Y
      end
  end
  -- What is blocked or not
  Maps.Obj.Obj('OP_BRUG').ForcePassible = opbrug
  Maps.Obj.Obj('HEK_OP').Impassible = opbrug
  Maps.Obj.Obj('HEK_NEER').Impassible = opbrug
  Maps.Remap()       
end

function Up()
   WalkLevel(30,1)
end

function Down()
   WalkLevel(20,0)
end

function Dragon()
   if not CVV("&DONE.JAKE.CHIEF.PROLOGUESPOKEN") then
      MapText('NODRAGON')
      return
   end    
   LoadMap('PRO_Dungeon_DragonCave')
   GoToLayer('#000',"Start")
   -- SpawnPlayer('Start')
end

function HouseEnter(layer)
   GoToLayer(layer,'Entrance')
end

function HouseExit()
   GoToLayer('town','Exit_'..Maps.LayerCodeName)
end      

function NPC_InnKeeper()
    if not CVV('&DONE.BLACKDRAGON') then
       MapText("INN_NOTTODAY")
       return
    end
    Inn()
end    

function NPC_Fred()
    -- --[[  (easy way to turn this off in order to test this).
    if not CVV('&DONE.BLACKDRAGON') then
       MapText("FRED_NOSELL")
       return
    end
   --]]
   MapText('FRED')
   Shop('CLONE_FRED')
end   


function NPC_George()
    -- --[[  (easy way to turn this off in order to test this).
    if not CVV('&DONE.BLACKDRAGON') then
       MapText("GEORGE_NOSELL")
       return
    end
   --]]
   MapText('GEORGE')
   Shop('CLONE_GEORGE')
end   

KickTown = {
       JUSTLEAVE = function() MapText('JUSTLEAVE') WorldMap() end,
       ANGRYCHIEF = function()
                         local xchars = {'ChiefWerrington','Harry'}
                         local xcd = {}
                         local x,s
                         for xc in each(xchars) do
                             xcd[xc] = Maps.Obj.CreateObject('Obstacle','ch_'..xc)
                             x = xcd[xc]
                             s = Maps.Obj.Obj('Spot_'..xc)
                             x.X = s.X
                             x.Y = s.Y
                             x.Dominance=40
                             x.Visible=1
                             x.TextureFile="GFX/Actors/Single/Humans/"..xc..".png"
                             CSay('Created actor for: '..xc)                             
                         end
                         Maps.Remap()
                         Music('Sys/Silence.ogg')
                         PartyPop('Kick')
                         MapText('ANGRYCHIEF')
                         ItemGive('ZZKEY_FIRE')
                         Var.D('$VANDAR.STATUS','JUSTLEAVE')
                         Var.D("$WMCHAT","ANGRYCHIEF")
                         WorldMap_Unlock('CH2FIRESPIRATA')
                         WorldMap()
                    end
}


function GALE_OnLoad()
   ZA_Enter("Bye",Bye)
   ZA_Enter('UP1',Up)
   ZA_Enter('UP2',Up)
   ZA_Enter('DOWN',Down)
   ZA_Enter("Enter_Cave",Dragon)   
   if not CVVN("&DONE.CH4DISCUSSION") then 
      local oldlay = Maps.LayerCodeName
      Maps.GotoLayer('town')
      Maps.Obj.Kill("NPC_MT_Jenny")
      -- if oldlay and oldlay~="" then Maps.GotoLayer(oldlay) end
      CSay("Jenny not yet in town!")
   else
      Done("&ALLOW.ENCOFF['PRO_DUNGEON_DRAGONCAVE']")
      CSay('Janny is in town! '..Var.C("&DONE.JAKE.LITTLEJENNY.RESCUED").."/"..Var.C('&DONE.CH4DISCUSSION')) 
   end -- Don't show Jenny until she's saved from the Dragon Cave. She won't be accessible until the final part of the game.
   -- Clickable for entering houses
   AddClickable('HOUSECHIEF')
   -- Zones for entering houses
   ZA_Enter("Enter_Chief",HouseEnter,'chief')
   ZA_Enter("Enter_Inn",HouseEnter,'inn')
   ZA_Enter('Enter_Items',HouseEnter,'items')
   ZA_Enter('Enter_Weapons',HouseEnter,'weapons')
   -- Exits
   ZA_Enter('Exit',HouseExit)
   -- Scenario Entrance
   ZA_Enter('KickTown',KickTown[CVV('$VANDAR.STATUS')] or Nothing)
end   
