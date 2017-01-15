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
 
version: 17.01.15
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

function GALE_OnLoad()
   ZA_Enter('EnterTown',function() local d=CVV('&DONE.SPIRATA.WATER')==true GoToLayer(({ [true]='destroyed', [false]='town'})[d],'Start') end)
   ZA_Enter('Leave',WorldMap)
end     
