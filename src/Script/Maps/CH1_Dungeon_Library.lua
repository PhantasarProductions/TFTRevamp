--[[
**********************************************
  
  CH1_Dungeon_Library.lua
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
 
version: 17.01.01
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
                               total = 1
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
    if CVV('&DONE.LIBRARY.PUZZLE['..right(Maps.LayerCodeName,3)..']') then return end
    MapText('SLOT')
    Schedule('MAP','POST_PEDDESTAL')
    AltInput('Please enter the unlocking code:','','num')    
end

function OpenCorridor(d,p)
   local l = Maps.LayerCodeName
   Maps.GotoLayer('#002')
   Maps.Obj.Kill(d,p)
   Maps.GotoLayer(l)
   MapText('SLOTYES')
end

PEDNEXT = { ['#003']={f = OpenCorridor, p='Door4'},
            ['#004']={f = OpenCorridor, p='Door5'},
            ['#005']={f = Maps.Obj.Kill, p='Door6'}
          }

function POST_PEDDESTAL()
   local v = AltInputResult()
   local iv = Sys.Val(v)
   local pNext = PEDNEXT[Maps.LayerCodeName]
   if iv==total then
      pNext.f(pNext.p,1)
      Done('&DONE.LIBRARY.PUZZLE['..right(Maps.LayerCodeName,3)..']')
   else
      MapText('SLOTNO')
   end
end

function NPC_EndTable()
  if Done("&DONE.LIBRARY.ENDBOOK") then return end
  PartyPop('Boek','North')
  MapText('BOOK_PRE_BOSS')
  Schedule("MAP","PostBoss")
  ClearCombatData()
  Var.D("$COMBAT.FOE_1","Boss/Librarian")
  Var.D("$COMBAT.POSFOE_1","CENTER")
  Var.D("$COMBAT.MUSIC","Music/Boss/BrutalSong.ogg")
  Var.D("$COMBAT.ARENA","Library.png")
  StartBoss("Guardian of the forbidden knowledge","Librarian")
end   

function PostBoss()
   MapText('BOOK_POST_BOSS')
   ManaOrb() -- 3
   WorldMap_Unlock('CH1FRENDOR')
   Var.D("$WMCHAT",'LIBDONE')
   WorldMap()
end

function GALE_OnLoad()
    InitWalda('Library')
    for i=3,5 do
        ZA_Enter('To00'..i,ToRoom,"#00"..i)
    end    
    ZA_Enter('Exit',ExitRoom)
    MapHide('Secret')
end    
