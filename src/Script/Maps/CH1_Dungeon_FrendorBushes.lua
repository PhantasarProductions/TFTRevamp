--[[
**********************************************
  
  CH1_Dungeon_FrendorBushes.lua
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
 
version: 17.07.01
]]


function RemovePreBossObjects()
   local toberemoved = { "Boss_Jake",
                         "Boss_Marrilona",
                         "PRC_Jake",
                         "PRC_Marrilona",
                         "BlockJake",
                         "BlockMarrilona"
                         --[[
                         "SRC_Jake",
                         "SRC_Marrilona"
                         ]]
                       }
   for kill_me in each(toberemoved) do
       Maps.Obj.Kill(kill_me,1)
       CSay("Removed: "..kill_me)
   end                              
end

-- Jake and Marrilona will meet and fall in love. Oh, how romantic :P
function I_Love_You(join)
    Party("Jake_Human;Marrilona")
    LoadMap("CH1_HUB_JAKEHUT")
    GoToLayer("Interior","LoveJake")
    TurnPlayers("East")
    ActorRepos("PLAYER1","LoveMarrilona","West","Marrilona")
    MapText('LOVE_1')
    local stp = Maps.Obj.Obj('Start')
    local harryx,harryy = stp.X,stp.Y
    Maps.CreateObstacle(harryx,harryy,'GFX/Actors/Single/Humans/Harry_BackSide.png','Harry')
    MapText('LOVE_2')
    Maps.Obj.Kill('Harry')
    MapText('LOVE_3')
    MapText('LOVE_JOIN_'..upper(join))
    MS.Run('MAP','CalmIndoors')
    -- Sys.Error("Cannot continue yet")
end

function Boss_Jake()    
    RemovePreBossObjects()
    MapText("BOSS_JAKE")
    Schedule("MAP","PostBoss_Jake")
    ClearCombatData()
    Var.D("$COMBAT.FOE_1","Boss/Dwarf_J") -- Needed to prevent the Axe Smash session Marrilona has to deal with.
    Var.D("$COMBAT.POSFOE_1","CENTER")
    Var.D("$COMBAT.MUSIC","Music/Boss/BrutalSong.ogg")
    Var.D("$COMBAT.ARENA","Forest.png")
    Var.D("$COMBAT.STARTEVENT","MAP,DwarfBossStart_Jake")
    StartBoss("Berserk Fellow","Dwarf")    
end

function DwarfBossStart_Jake()
    MapText('STARTBOSS_JAKE','FLOW_COMBAT')
end


function PostBoss_Jake()
    Maps.Obj.Kill("PLAYER"); SpawnPlayer("PostBossJake") -- Sometimes it's easier THIS way ;P
    local marx,mary = Maps.Obj.Obj('PostBossMarrilona').X,Maps.Obj.Obj('PostBossMarrilona').Y
    Maps.CreateObstacle(marx,mary,"GFX/Combat/Fighters/Hero/Marrilona.Dead.png","Fainted Marrilona",0)
    MapText("POSTBOSS_JAKE")
    I_Love_You('Marrilona')        
end    


function Boss_Marrilona()
    RemovePreBossObjects()
    MapText("BOSS_MARRILONA")
    Schedule("MAP","PostBoss_Marrilona")
    ClearCombatData()
    Var.D("$COMBAT.FOE_1","Boss/Dwarf")
    Var.D("$COMBAT.POSFOE_1","CENTER")
    Var.D("$COMBAT.MUSIC","Music/Boss/BrutalSong.ogg")
    Var.D("$COMBAT.ARENA","Forest.png")
    Var.D("$COMBAT.STARTEVENT","MAP,DwarfBossStart_Marrilona")
    StartBoss("Another","Dwarf")    
end    

function DwarfBossStart_Marrilona()
    RPG.Points('FOE_1','HP').Minimum = 1
    MapText('STARTBOSS_MARRILONA','FLOW_COMBAT')
end

function PostBoss_Marrilona()
    RPG.IncStat('Marrilona','EXP',-15) -- As Marrilona always loses, I didn't want to keep the EXP away from her.
    local marhp = RPG.Points('Marrilona',"HP")
    marhp.Have = 1
    if skill~=3 then marhp.Have = marhp.Maximum end
    LoadMap('CH1_Hub_JakeHut')
    GoToLayer('Black','Yeah')
    MapText('LOVE_0')
    I_Love_You('Jake')
end    

function Leave(char)
   if CVV('&DONE.THEYMET') then
      WorldMap()
   else
      MapText("DONTGO_"..upper(char))
      Actors.WalkToSpot('PLAYER','Start_'..char)
   end      
end

function NPC_Tai()
    if Done('&DONE.NGP.SPOKEN.TAI') then
       MapText('TAI2')
    else
       MapText('TAI1')
       WorldMap_Unlock('NGPQUAYARO')
    end      
end


function GALE_OnLoad()
   if (not Done('&ANNOUNCED.CHAPTER.ONE')) -- or CVV('%CHAPTIME')>0 
        then Chapter('GFX/Chapters/1.png') end
   ZA_Enter("Boss_Jake",Boss_Jake)
   ZA_Enter('Boss_Marrilona',Boss_Marrilona)
   ZA_Enter('ExitSouthWest',Leave,'Jake')
   ZA_Enter('ExitNorthEast',Leave,'Marrilona')
end   
