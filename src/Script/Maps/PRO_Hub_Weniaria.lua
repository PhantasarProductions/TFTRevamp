--[[
**********************************************
  
  PRO_Hub_Weniaria.lua
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
 
version: 16.11.19
]]
function InitHandoSkill()
   CreateSkill('HandoStillor',1,6/skill)
   CreateSkill('HandoStillor',2,12/skill)
end

function MapMusic()
   if not Done("&DONE.SASHA_FUNDA.OPEN.HANDO_STILLOR.PROLOGUE") then 
      CSay("Skip the music for now. Let Sasha Funda speak first.")
   else
      OriMapMusic()
   end   
end
   
function SashaFunda()
   local oriy = Maps.CamY
   local outy = Maps.Obj.Obj('OffScreenMark').Y
   Maps.CamY = outy
   MapText('SASHA_A')
   for i=outy,oriy,-1 do
       Maps.CamY=i
       Cls()
       DrawScreen()
       Flip()
   end
   MapText("SASHA_B")
   LoadMap("PRO_Dungeon_Crypt")
   GoToLayer("#000","Start")
   -- Sys.Error("Not scripted yet")
end
