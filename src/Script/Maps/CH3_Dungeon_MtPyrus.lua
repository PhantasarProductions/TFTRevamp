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
 
version: 17.07.19
]]


-- @USE /Script/Use/Specific/GreatMagicBack.lua
-- @USE /Script/Use/Specific/Walda.lua
-- @USE /Script/Use/Specific/PicSlide.lua

function BlueSeal()
    ClearCombatData()
    Var.D("$COMBAT.FOE_1","Sealed/MountainEmperor")
    Var.D("$COMBAT.POSFOE_1","CENTER")
    Var.D("$COMBAT.MUSIC","Music/Special Boss/Hall Of The Mountain King.ogg")
    Var.D("$COMBAT.ARENA","pyrus.png")
    StartBoss("Ultimate crusher","Mountain Emperor",0,25,100)      
    Done('&DONE.SEAL.DANDOR2')
end


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
   Done("&DONE.PYRUS.ENTER")
end

function NPC_Ramata()
   MapText("Ramata")
end 

function ZAStart()
   if Done("&DONE.PYRUS.WELCOME") then return end
   PartyPop("S",North)
   MapText("Start")
end      

function The4MonksFromHell()
  ClearCombatData()
  --Var.D("$COMBAT.FOE_1","Boss/Beholder")
  --Var.D("$COMBAT.POSFOE_1","CENTER")
  local h = (SH/2)-180
  local w = (SW/2)
  for i=1,4 do
    local x = w/i
    local y = (SH/2)+(h/(5-i))
    Var.D("$COMBAT.FOE_"..i,"Boss/MONK"..i)
    Var.D("$COMBAT.POSFOE_"..i,x..","..y)
    Maps.Obj.Kill('MONK'..i,1)
  end  
  Var.D("$COMBAT.MUSIC","SpecialBoss/Volatile Reaction.ogg")
  Var.D("$COMBAT.ARENA","pyrus.png")
  StartBoss("Helena, Eduard, Lucy and Leonnard","The 4 Monks From Hell")   
  Maps.Obj.Kill("4MonksFromHell",1)
end

function StartBlackDragon()
    RPG.Points('FOE_1','HP').Minimum = 1
    MapText('BLACK_DRAGON','FLOW_COMBAT')
    AddJoker('Dragon')
end

function Crater()
  ClearCombatData()
  Var.D("$COMBAT.STARTEVENT","MAP,StartBlackDragon")
  Var.D("$COMBAT.FOE_1","Boss/Black Dragon")
  Var.D("$COMBAT.POSFOE_1","DRAGON")
  Var.D("$COMBAT.MUSIC","SpecialBoss/Threat.ogg")
  Var.D("$COMBAT.ARENA","pyrus.png")
  StartBoss("Mindless destroyer of everything","The Black Dragon")   
  --Maps.Obj.Kill("4MonksFromHell",1)
end


function GALE_OnLoad()
     effect = SetupGreatMagic(nil,14)
     local SchuifX = { [true]='Enter', [false]='Next' }
     Maps.GoToLayer("#000")
     Maps.Obj.Obj("Schuif").X=Maps.Obj.Obj("Schuif"..SchuifX[CVV("&DONE.PYRUS.ENTER")]).X + 32
     Maps.Obj.Obj("Schuif").Y=Maps.Obj.Obj("Schuif"..SchuifX[CVV("&DONE.PYRUS.ENTER")]).Y 
     InitWalda('Pyrus')
     Maps.ReMap()
     ZA_Enter('EnterCave',EnterDungeonAndCloseTheDoorBehindYou)
     ZA_Enter('ZAStart',ZAStart)
     slide.Init()
     ZA_Enter('Puzzle',slide.Start,'GFX/TEXTURES/MTPYRUSPUZZLE/VOLCANOSLIDE.PNG')
     ZA_Enter('Puzzle10',slide.Start,'GFX/TEXTURES/MTPYRUSPUZZLE/FEMALE DEVIL MONK FROM HELL.PNG')
     slide.Changes['#004'] = skill
     slide.Changes['#010'] = skill ^ 2
     ZA_Enter('4MonksFromHell',The4MonksFromHell)
     ZA_Enter("Crater",Crater)
end     
