--[[
**********************************************
  
  CH1_Dungeon_Library.lua
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
 
version: 16.12.29
]]


-- @USE /Script/Use/Specific/Walda.lua

function ToRoom(room)
     GoToLayer(room,'Start')
end     

function ExitRoom()
     local l = Maps.LayerCodeName
     local te = "From"..right(l,3)
     GoToLayer("#002",te)
     TurnPlayer('South')
end

function GALE_OnLoad()
    InitWalda('Library')
    for i=3,5 do
        ZA_Enter('To00'..i,ToRoom,"#00"..i)
    end    
    ZA_Enter('Exit',ExitRoom)
end    
