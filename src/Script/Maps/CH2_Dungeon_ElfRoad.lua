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
 
version: 17.01.02
]]


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


function GALE_OnLoad()
   ZA_Enter('ExitWest',WorldMap)
   -- If you are in the full version, the barrier and construction worker Mark will vanish.
   if fullveresion then 
      Maps.Obj.Kill('Demo_Barrier')
      Maps.Obj.Kill('NPC_MT_Bouwvakker')
   end   
end   
