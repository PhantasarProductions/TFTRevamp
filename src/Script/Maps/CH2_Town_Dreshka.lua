--[[
**********************************************
  
  CH2_Town_Dreshka.lua
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
 
version: 17.05.23
]]

function NPC_Rosetta()
         if not Done('&DONE.DRESHKA.ROSETTA') then
            MapText('ROSETTA1')
            Maps.PermaWrite('Maps.Obj.Kill(\'NPC_Rosetta\')')
         else
            MapText('ROSETTA2')
         end   
end

function NPC_Monique()
        MapText("MONIQUE")
        Shop("WAND_MONIQUE")
end

function NPC_Dreshka()
   if Done('&DONE.DRESHKA.DRESHKA') then
       MapText('DRESHKA_AFTER')
   else
       PartyPop('DR','North')
       MapText('DRESHKA')
       ItemGive('ZZKEY_KEYWATER')
       WorldMap_Unlock('CH2WATERSPIRATA')
       Var.D('$WMCHAT','WATER')
       -- New Game+
   end       
end

        

function MapMusic()
         local d=CVV('&DONE.SPIRATA.WATER')==true
         Music(({[true]='Dreshka/Water Prelude.ogg', [false]='Town/Happy.ogg'})[d])        
end

function HarryStart()
    RPG.LinkStat('Jake_Human','FOE_1','BASE_Power')
    RPG.LinkStat('Jake_Fairy','FOE_1','BASE_Endurance')
    RPG.LinkStat('Marrilona','FOE_1','BASE_Intelligence')
    RPG.LinkStat('Marrilona','FOE_1','BASE_Resistance')
    RPG.LinkStat('HandoStillor','FOE_1','BASE_Speed')
    CSay('All Links Established')
end

function PostHarry()
    MapText('HARRY3')
    harry.Visible=0
    Maps.Obj.Kill('Harry')
    MapText('HARRY4')
    Var.D('$WMCHAT','TOVANDAR')
    WorldMap_Unlock('CH2VANDARROAD')
    WorldMap()
    --Sys.Error('Rest not scripted yet')
end

function SeeDamage()
   if Done('&DONE.DRESHKA.HARRY') then return end
   PartyPop('A',"North")
   Music('Sys/Silence.ogg')
   MapText('HARRY1')
   PartyPop('B','South')
   local start = Maps.Obj.Obj('Start')
   harry = Maps.Obj.CreateObject('Obstacle','Harry',0)
   harry.X = start.X
   harry.Y = start.Y
   harry.TextureFile = "GFX/Actors/Single/Humans/Harry_BackSide.png"
   MapText('HARRY2')
   Schedule("MAP","PostHarry")
   ClearCombatData()
   Var.D("$COMBAT.FOE_1","Boss/Harry2")
   Var.D("$COMBAT.POSFOE_1","CENTER")
   Var.D("$COMBAT.MUSIC","Music/Special Boss/AnnoyingBoy.ogg")
   Var.D("$COMBAT.ARENA","Forest.png")
   Var.D("$COMBAT.STARTEVENT","MAP,HarryStart")
   StartBoss("He's Back",'Harry McDummy')    
   
   -- Sys.Error("Boss fight not there yet!")
end   

function BlueSeal()
    ClearCombatData()
    Var.D("$COMBAT.FOE_1","Sealed/MinoKing")
    Var.D("$COMBAT.POSFOE_1","CENTER")
    Var.D("$COMBAT.MUSIC","Music/Special Boss/Blue Seal.ogg")
    Var.D("$COMBAT.ARENA","Forest.png")
    StartBoss("Demon ruler","Minotaur King",0,25,100)      
    Done('&DONE.SEAL.JAKE1')
end    


function NPC_StarDome()
   MapText('STARDOME')
   WorldMap_Unlock('CH4STARDOME')
end   


function GALE_OnLoad()
   Maps.GoToLayer('destroyed'); if not CVV('&DONE.CH4DISCUSSION') then Maps.Obj.Kill('NPC_StarDome') end
   ZA_Enter('EnterTown',function() local d=CVV('&DONE.SPIRATA.WATER')==true GoToLayer(({ [true]='destroyed', [false]='town'})[d],'Start') end)
   ZA_Enter('SeeDamage',SeeDamage)
   ZA_Enter('Leave',WorldMap)
end     
