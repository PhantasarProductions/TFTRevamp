--[[
**********************************************
  
  CH2_Dungeon_ElfRoad.lua
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
 
version: 17.01.09
]]

-- @USE /Script/Use/Specific/Walda.lua




function NPC_Freya()
   if not CVV('&MASTER.FREYA') then 
      MapText('FREYA_NOMASTER')
      if RunQuestion('MAP','FREYA_QUESTION')==2 then MapText('FREYA_NOWAY') return end
      LoadItemModule() -- Make sure it's loaded.
      MS.Run('ITEMS','RemoveAllItemQuery','ITM_POTION,ITM_SALVE;&MASTER.FREYA')
      if not CVV('&MASTER.FREYA') then MapText('FREYA_NOFOOLINGME') return end
   end
   Master('Freya')   
end

function HandoStillor()
   if Done('&DONE.ELFROAD.JOIN.HANDOSTILLOR') then return end
   local elf = Maps.Obj.Obj('HandoStillor')
   Maps.CamX = (-SW)+(elf.X-30)
   Shift('Human')
   PartyPop('Stil1',"East")
   MapText('STILLOR_1')
   PartyPop('Stil2','East')
   Music('Sys/Silence.ogg')
   for i=1,70 do
       Maps.CamX = Maps.CamX + 1
       Cls()
       DrawScreen()
       Flip()
   end    
   MapText('STILLOR_2')
   Party('Jake_Human;Marrilona;HandoStillor')
   Maps.Obj.Kill('HandoStillor',1)
   Chapter('GFX/Chapters/2.png')
   GoToLayer('#002','Stil2_Jake')
   Var.D('$WMCHAT','STILLORJOIN')
   MapMusic()
end

function FullRemove()
   -- If you are in the full version, the barrier and construction worker David will vanish.
   if fullversion then 
      Maps.Obj.Kill('Demo_Barrier')
      Maps.Obj.Kill('NPC_MT_Bouwvakker')
      Maps.Remap()
   else
      CSay('This is the demo, so we\'ll let them be')
   end   
end

function ExitNorth()
   WorldMap_UnLock('CH2ISKARDERIU')
   WorldMap()
end

function GALE_OnLoad()
   ZA_Enter('ExitWest',WorldMap)
   ZA_Enter('HandoStillorEvent',HandoStillor)
   ZA_Enter('FullRemove',FullRemove)
   ZA_Enter('North',ExitNorth)
   MapHide('Secret')
   Award('CHAPTER1')
   InitWalda('ElfRoad')
end   
