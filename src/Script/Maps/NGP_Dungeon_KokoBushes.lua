--[[
**********************************************
  
  NGP_Dungeon_KokoBushes.lua
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
 
version: 17.07.18
]]

-- @USE /Script/Use/Specific/NewGame+.lua

function NossyEnd()
  if RPG.PartyTag(0)=="Nostramantu_Human" then
   Done('&DONE.NEWGAMEPLUS.DANDLETON.FLASHBACK[#005].EXPERIENCED')
   MapText('TIMETOGOBACK')
   Party('Jake_Human;Marrilona;Dandor;HandoStillor')
   LoadMap('NGP_Dungeon_Dandleton')
   GoToLayer('#005','Start')
   MapText('BACK1')
   RPG.IncStat('Marrilona','EXP',-150000)
   Award('ZZNGP_BACKFUTURE')
  else
   WorldMap('Kokonora')
  end 
end

function Welcome()
   if Done('&DONE.NGP.DANDLETON.FLASHBACK1.WELCOME') then return end
   PartyPop('pp','North')
   MapText('Welcome')
   WorldMap_Unlock('NGPKOKO')
   Award("ZZNGP_LINKPAST")
end

function GALE_OnLoad()
   if RPG.PartyTag(0)=="Nostramantu_Human" then
     ZA_Enter('Welcome',Welcome)
     Maps.Obj.Obj('NosBlock').Impassible=1
     Maps.Remap()
   end
   ZA_Enter('TheEnd',NossyEnd)
end     
   
