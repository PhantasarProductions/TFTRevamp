--[[
**********************************************
  
  CH3_Dungeon_MtPyrus.lua
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
 
version: 17.04.17
]]


-- @USE /Script/Use/Specific/GreatMagicBack.lua
-- @USE /Script/Use/Specific/Walda.lua

function MAP_FLOW()
    --for e in each(effect) do for e1 in each(e) do FlowMoveTex(e1) end end
    for e in each(effect[Maps.LayerCodeName]) do FlowMoveTex(e) end
end
function EnterDungeonAndCloseTheDoorBehindYou()
    local schuif = Maps.Obj.Obj("Schuif")
    local doel   = Maps.Obj.Obj("SchuifEnter")
    Actors.MoveToSpot("PLAYER","Disappear")
    Actors.MoveToSpot("PLAYER1","Disappear")
    Actors.MoveToSpot("PLAYER2","Disappear")
    Actors.MoveToSpot("PLAYER3","Disappear")
    local players = { Actors.Actor("PLAYER"),Actors.Actor("PLAYER1"),Actors.Actor("PLAYER2"),Actors.Actor("PLAYER3")}
    repeat
       Cls()
       schuif.X = schuif.X - 1
       DrawScreen()
       Flip()       
       for a in each(players) do
           if a.Y<32 then a.Visible=0 end
       end
   until schuif.X==doel.X+32
   Time.Sleep(1000)
   Maps.Obj.Kill("NPC_Ramata",1)
   GoToLayer("#002","Start")
end

function NPC_Ramata()
   MapText("Ramata")
end 

function ZAStart()
   PartyPop("S",North)
   MapText("Start")
end      

function GALE_OnLoad()
     effect = SetupGreatMagic()
     local SchuifX = { [true]='Enter', [false]='Next' }
     Maps.GoToLayer("#000")
     Maps.Obj.Obj("Schuif").X=Maps.Obj.Obj("Schuif"..SchuifX[CVV("&DONE.PYRUS.ENTER")]).X + 32
     Maps.Obj.Obj("Schuif").Y=Maps.Obj.Obj("Schuif"..SchuifX[CVV("&DONE.PYRUS.ENTER")]).Y 
     InitWalda('Pyrus')
     Maps.ReMap()
     ZA_Enter('EnterCave',EnterDungeonAndCloseTheDoorBehindYou)
     ZA_Enter('ZAStart',ZAStart)
end     
