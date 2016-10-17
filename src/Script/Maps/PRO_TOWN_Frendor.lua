--[[
**********************************************
  
  PRO_TOWN_Frendor.lua
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
 
version: 16.10.16
]]
-- General
function MapMusic()
   if not Done("&DONE.VANDAR.OPENING_Fandalora") then 
      CSay("Skip the music for now. Let Fandalora speak first.")
   else
      OriMapMusic()
   end   
end

-- Inside Fandalora's house

function NPC_Fandalora()
  if not CVV("&DONE.PATHOFMAGIC") then
     MapText("FANDALORA_PROLOGUE")
     return
  end
end

function NPC_YanneeInside()
  if not Done("&DONE.YANNEE.PROLOGUE.SPOKEN") then MapText("YANNEE_PROLOGUE1") else MapText("YANNEE_PROLOGUE2") end
end



function HappyBirthday()
   MapText('JARIG')
   MapMusic()
end   
