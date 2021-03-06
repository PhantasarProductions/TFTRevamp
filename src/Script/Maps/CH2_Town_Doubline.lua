--[[
**********************************************
  
  CH2_Town_Doubline.lua
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
 
version: 17.03.04
]]


function NPC_Molly() Inn() end

function NPC_Bellatrix()
    MapText("BELLATRIX")
    Shop("ITEM_BELLATRIX")
end

function NPC_Gilduroy()
    MapText("GILDUROY")
    Shop("WEAPON_GILDUROY")
end

function NPC_Ludo()
   local ludo = "&DONE.LUDO.CHARTERED"
   if CVV(ludo) then
      --MapText("LUDO_SAIL");
      ({function() LoadMap("CH3_Dungeon_KokonoraForest") GoToLayer("fisherman","ludo") end,Nothing})[RunQuestion("MAP","LUDO_SAIL")]()
      return
   end
   MapText("LUDO_CHARTER")
   if CVV("%CASH")<5000 then return end -- Nope, you can't do this if you don't have the cash at all.
   ({   function() 
          dec("%CASH",5000)
          Award("CHAPTER2")
          MapText("LUDO_CHARTERED")
          LoadMap("CH3_Dungeon_KokonoraForest") 
          Chapter('GFX/Chapters/3.png')
          GoToLayer("fisherman","ludo") 
          Done(ludo)
        end,
        function() 
            MapText("LUDO_REFUSE") 
        end,
        })[RunQuestion("MAP","LUDO_PAY")]()        
end      



function GALE_OnLoad()
  ZA_Enter("Bye",WorldMap)
end   
