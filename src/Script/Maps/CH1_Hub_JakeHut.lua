--[[
**********************************************
  
  CH1_Hub_JakeHut.lua
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
 
version: 17.07.06
]]

function CalmIndoors()
   if not Done('&DONE.THEYMET') then return end
   Music('Hub/Calm Indoors.ogg')
   Award('SCEN_LOVE')
end

function TheStartToFantasy()
   Music('Hub/StartToFantasyInstrumental.ogg')
end   

function ExitHut()
   GoToLayer('Exterior','Hutspot') -- Fun fact. This means something completely different in Dutch, from what it's supposed to mean in English :P
end

function NPC_Hut()
   GoToLayer("Interior","Start")
end   

function NPC_Rubine()
   Master('Rubine')
end

function NPC_Leo()
   MapText("LEO_"..({[false]="A",[true]="B"})[Done("&DONE.SPOKEN.JAKEHUT.CAMP.LEO")])
end

function NPC_Fanny()
  Inn()
end

function NPC_ShopHoer()
   MapText('SHOPHOER')
   Shop('ITEM_WANDA')
end

function NPC_Eric()
   MapText('ERIC')
   Shop('WEAPON_ERIC')
end   

function NPC_Marinus()
   if not Done('&DONE.NEWGAMEPLUS.CATHEDRAL.UNLOCKED.BY.MARINUS') then
      MapText('MARINUS1')
      WorldMap_Unlock('NGPCATHEDRAL')
   else
      MapText('MARINUS2')
   end
end

function Bye()
   if not Done('&TUTORIAL.WORLDMAP') then MapText('TUTORIAL_WORLDMAP') end
   WorldMap()
end   

function GALE_OnLoad()
   ZA_Enter('MusicInt',CalmIndoors)
   ZA_Enter('MusicOut',TheStartToFantasy)
   ZA_Enter('ExitHut',ExitHut)
   ZA_Enter('Bye',Bye)
   Maps.GoToLayer('Exterior')
   if not(CVV('&MASTER.MIDAS.HAVE') and newgameplus) then Maps.Obj.Kill('NPC_Marinus') end
end



   
