--[[
**********************************************
  
  PRO_TOWN_Vandar.lua
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
 
version: 16.09.14
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

function Bye()
   if not CVV("&DONE.JAKE.CHIEF.PROLOGUESPOKEN") then 
      MapText("NOLEAVECHIEF")
   elseif CVV("&DONE.JAKE.LITTLEJENNY.RESCUED") then
      MapText("NOLEAVEJENNY")   
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
end

function GALE_OnLoad()
   ZA_Enter("Bye",Bye)
   ZA_Enter('UP1',Up)
   ZA_Enter('UP2',Up)
   ZA_Enter('DOWN',Down)
   ZA_Enter("Enter_Cave",Dragon)
end   
