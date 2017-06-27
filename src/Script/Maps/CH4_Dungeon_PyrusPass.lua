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
 
version: 17.06.27
]]

-- @IF IGNORE
local
-- @FI
      nostradone,marrilonadone = "&DONE.CHAPTER4.MTPYRUS.BOSS.NOSTRAMANTU.DEFEATED","&DONE.CHAPTER4.MARRILONA.CURED.WHEAT"
      
function CureMarrilona()
      LoadMap('CH3_Town_Nostraburg')
      Party('Jake_Human')
      GoToLayer('krandar',"M_Jake")
      Maps.Obj.Obj('HandoStillor').SetAlpha(1000)
      PartyPop('M','North')
      MapText('CURE1')
      Cls()
      Flip()
      Music('SYS/Silence.ogg')
      local v={'DSB.ogg','Earth.ogg','Fire.ogg','Frost.ogg','Heal.ogg','Hit.ogg','Thunder.ogg',"Water.ogg","Wind.ogg",'Yell.ogg'}
      for vf in each(v) do
          if JCR6.Exists('Vocals/Combat/Foe/Marrilona/Action/'..vf)==1 then SFX('Vocals/Combat/Foe/Marrilona/Action/'..vf) Time.Sleep(1200) end
      end
      Award('SCEN_SAVEMARRILONA')
      Maps.Obj.Kill('Shroud')
      local marrilona=Maps.Obj.Obj('Marrilona')
      marrilona.TextureFile='GFX/Actors/Bundled/Player/Marrilona.West.png'
      MapText('CURE2')
      marrilona.TextureFile='GFX/Actors/Single/Combi/JakeMarrilonaHug.png'
      Maps.Obj.Obj('PLAYER').Visible=0
      MapText('CURE3')
      local cap = CVV("%LEVELCAP")
      local lv  = RPG.Stat('Marrilona',"Level")
      local plus = 6/skill; if skill==3 then plus=0 end
      if lv+plus<cap then 
         RPG.IncStat('Marrilona','Level',plus)
         MS.LN_Run('PARTY','Script/Subs/Party.lua','SyncLevel','Marrilona')
      end
      WorldMap_UnLock('CH4PYRUSPASS')
      WorldMap_UnLock('CH4MANAROAD')
      Var.Clear('&KRANDAR.GONE')
      Party('Jake_Human;Marrilona;Dandor;HandoStillor')
      LoadMap('CH3_TOWN_NOSTRABURG')
      GoToLayer('town','CH4START')
      PartyPop('K')
      Var.Clear("%HANDICAP.MARRILONA")
      Music('SYS/Silence.ogg')
      MapText('CH4START')  
      Done('&DONE.CH4DISCUSSION') 
end      


function Leave()
     if not CVV(nostradone) then
        MapText('NOLEAVE')
        Actors.MoveToSpot('PLAYER','Start')
        return
     elseif not Done(marrilonadone) then
        CureMarrilona()   
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
