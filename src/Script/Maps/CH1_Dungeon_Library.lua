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
 
version: 16.12.30
]]


-- @USE /Script/Use/Specific/Walda.lua

puzzle = {}

InitPuzzle = {
                ['#003'] = function() 
                               puzzle = {}
                               total = 0
                               for i=1,6 do
                                   puzzle[i] = {value=rand(1,9),variant=rand(1,4)}
                                   total = total + puzzle[i].value
                               end
                           end,
                
                ['#004'] = function()
                               puzzle = {}
                               repeat
                                   for i=1,3 do
                                       puzzle[i] = {value=rand(1,9),variant=rand(1,4)}
                                       total = total * puzzle[i].value
                                   end
                               until total<=999                                       
                           end,
                           
                ['#005'] = function()
                               puzzle = {}
                               for i=1,4 do                              
                                   puzzle[i] = {value=rand(1,9),variant=rand(1,4)}
                               end
                               total = (puzzle[1].value*1000) + (puzzle[2].value*100) + (puzzle[3].value*10) + puzzle[4].value      
                           end
             }

function ToRoom(room)
     GoToLayer(room,'Start')
     InitPuzzle[room]()
end     

function ExitRoom()
     local l = Maps.LayerCodeName
     local te = "From"..right(l,3)
     GoToLayer("#002",te)
     TurnPlayer('South')
end

function kast(id)
     MapText(puzzle[id].variant.."_"..puzzle[id].value)
end

function NPC_Kast1() kast(1) end
function NPC_Kast2() kast(2) end
function NPC_Kast3() kast(3) end
function NPC_Kast4() kast(4) end
function NPC_Kast5() kast(5) end
function NPC_Kast6() kast(6) end

function NPC_PEDDESTAL()
    MapText('SLOT')
    Schedule('MAP','POST_PEDDESTAL')
    AltInput('Please enter the unlocking code:','','num')
end

function POST_PEDDESTAL()
end

function GALE_OnLoad()
    InitWalda('Library')
    for i=3,5 do
        ZA_Enter('To00'..i,ToRoom,"#00"..i)
    end    
    ZA_Enter('Exit',ExitRoom)
end    
