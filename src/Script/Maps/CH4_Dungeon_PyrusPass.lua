--[[
**********************************************
  
  CH4_Dungeon_PyrusPass.lua
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
 
version: 17.05.11
]]

-- @IF IGNORE
local
-- @FI
      nostradone,marrilonadone = "&DONE.CHAPTER4.MTPYRUS.BOSS.NOSTRAMANTU.DEFEATED","&DONE.CHAPTER4.MARRILONA.CURED.WHEAT"

function Leave()
     if not CVV(nostradone) then
        MapText('NOLEAVE')
        Actors.MoveToSpot('PLAYER','Start')
     elseif not CVV(marrilonadone) then
        error("Sorry, the rest has not yet been scripted")   
     else
        WorldMap('Delisto')
     end
end

function NPC_KRUID()
    -- Pre Nostramantu
    Music('Sys/Silence.ogg')
    PartyPop('K','North')
    MapText('WHEAT1')
    for alpha=0,1000,5 do Maps.Obj.Obj('Nostramantu').SetAlpha(alpha) Cls() DrawScreen() Flip() end
    MapText('WHEAT2')

    -- Fight Nostramantu
    ClearCombatData()
    Var.D("$COMBAT.FOE_1","Boss/Nostramantu1")
    Var.D("$COMBAT.POSFOE_1","CENTER")
    Var.D("$COMBAT.MUSIC","Music/Special Boss/PlayTillDeath_(Nostramantu).ogg")
    Var.D("$COMBAT.ARENA","pyruspass.png")
    Schedule('MAP','Post_Nostramantu')
    StartBoss("Fairy Elder","Nostramantu")  
    Maps.Obj.Kill('Nostramantu',1)
end

function Post_Nostramantu()
    Award('BOSS_NOSTRAMANTU')
    MapText('WHEAT3')
    Done(nostradone)
    Maps.Obj.Kill('NPC_KRUID',1)
    Music('Dungeon/Trade-Off.ogg')
end


function MAP_FLOW()
   local MSecs=Time.MSecs()
   if Maps.LayerCodeName=="#002" then
      for i=1,4 do
          local lo = Maps.Obj.Obj('Lava'..i)
          lo.InsertY = lo.InsertY + 1
      end
      return
   elseif Maps.LayerCodeName~="#001" then return end
   local o = Maps.Obj.Obj('Lava')  
   o.x=Maps.CamX
   o.y=Maps.CamY
   o.w=SW
   o.h=SH
   o.InsertX=math.sin(MSecs/8000)*500
   o.InsertY=math.cos(MSecs/8000)*500
end

function GALE_OnLoad()
   ZA_Enter('Leave',Leave)
end   
