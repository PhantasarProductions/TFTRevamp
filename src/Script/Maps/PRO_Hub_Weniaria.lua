--[[
**********************************************
  
  PRO_Hub_Weniaria.lua
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
 
version: 17.01.14
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

function ToHall() GoToLayer('HALL','Start') end
function Leave() GoToLayer('lobby','ComeOut') end

function NPC_Mural()
   if not Done('&DONE.WENIARIA.MURAL') then
      PartyPop('Mural',"North")
      MapText('MURAL')
      RPG.Points('HandoStillor','SK_LVL_2').Inc(9/skill)
      if RPG.PointsExists('Marrilona','SK_LVL_4')==1 then RPG.Points('Marrilona','SK_LVL_4').Inc(math.ceil(9-(skill^2))) end
      if RPG.PointsExists('Jake_Fairy','SK_LVL_4')==1 then RPG.Points('Jake_Fairy','SK_LVL_4').Inc(math.ceil(9-(skill^2))) end
   end
end      

function GALE_OnLoad()
   if CVV("&DONE.SASHA_FUNDA.OPEN.HANDO_STILLOR.PROLOGUE") then 
      Maps.GoToLayer('HALL')
      Maps.Obj.Kill('SashaFunda')
   end   
   ZA_Enter('ToHall',ToHall)
   ZA_Enter('Leave',Leave)
   ZA_Enter('Bye',WorldMap)
end
