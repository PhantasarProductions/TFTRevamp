--[[
  NGP_Dungeon_Dandleton.lua
  Version: 17.07.22
  Copyright (C) 2017 Jeroen Petrus Broks
  
  ===========================
  This file is part of a project related to the Phantasar Chronicles or another
  series or saga which is property of Jeroen P. Broks.
  This means that it may contain references to a story-line plus characters
  which are property of Jeroen Broks. These references may only be distributed
  along with an unmodified version of the game. 
  
  As soon as you remove or replace ALL references to the storyline or character
  references, or any termology specifically set up for the Phantasar universe,
  or any other univers a story of Jeroen P. Broks is set up for,
  the restrictions of this file are removed and will automatically become
  zLib licensed (see below).
  
  Please note that doing so counts as a modification and must be marked as such
  in accordance to the zLib license.
  ===========================
  zLib license terms:
  This software is provided 'as-is', without any express or implied
  warranty.  In no event will the authors be held liable for any damages
  arising from the use of this software.
  Permission is granted to anyone to use this software for any purpose,
  including commercial applications, and to alter it and redistribute it
  freely, subject to the following restrictions:
  1. The origin of this software must not be misrepresented; you must not
     claim that you wrote the original software. If you use this software
     in a product, an acknowledgment in the product documentation would be
     appreciated but is not required.
  2. Altered source versions must be plainly marked as such, and must not be
     misrepresented as being the original software.
  3. This notice may not be removed or altered from any source distribution.
]]

-- @USE /Script/Use/Specific/NewGame+.lua


flashbacks = { ['#005'] = { priomt = nil, map='NGP_Dungeon_KokoBushes', layer='bush', start='Start'},
               ['#007'] = { priomt = "FL007", map = 'CH3_Dungeon_KokonoraForest', layer='forest', start='Start', schedule="WelcomeNos"},
               ['#010'] = { priomt = "FL010", map = 'CH4_Dungeon_ManaRoad', layer='bos', start='Start', schedule="NosWelcome", party='Nostramantu_Human;Feenalaria_Human2'},
               ['#015'] = { priomt = "FL015", map = 'CH3_Town_Nostraburg', layer='town', start='FeenaVsFrendor',dcall='LovingAsshole',party='Feenalaria', 
                               priofunc=function() 
                                 RPG.ReTag('Feenalaria_Human2','Feenalaria')
                                 assert(RPG.CharExists('Feenalaria')==1,"Retagging failed") 
                                 local ch='Feenalaria' 
                                 RPGStat.SetData(ch,'Face',ch) 
                                end}
             }
             
bosses = {['#007']={priomt='BOSS007',boss='Cyndrinana',intro1="Ghost of Nostramantu's mother",intro2='Cyndrinana'},
          ['#009']={boss='Terinka',intro1="Ghost of Feenalaria's mother",intro2='Terinka'},
          ['#017']={boss='Salumon',intro1="Ghost of Nostramanu's father", intro2='Salumon'}
         }
          
NextMapFirst = {}

function NPC_Necrodia()
    local remark
    repeat
      remark = rand(1,6)
    until remark~=oldnecroremark oldnecroremark=remark
    MapText('SH'..remark)
    Shop('ITEM_NECRODIA')
end


function Memory(tag,pop,popwind)
    if pop then PartyPop(pop,popwind) end
    MapText('MEMORY'..(tag or right(Maps.LayerCodeName,3)))
end

function Flashback()
    if Done('&DONE.NEWGAMEPLUS.DANDLETON.FLASHBACK['..Maps.LayerCodeName..'].EXPERIENCED') then return end    
    local fb = flashbacks[Maps.LayerCodeName]
    ;(fb.priofunc or Nothing)()
    if fb.priomt then MapText(fb.priomt) end
    Cls()
    Loading()
    Party(fb.party or 'Nostramantu_Human;Feenalaria_Human')
    MS.LoadNew('ITEMS','Script/Subs/Items.lua')
    MS.Run('ITEMS','FeenaHumanSync')
    LoadMap(fb.map)
    GoToLayer(fb.layer,fb.start)
    if fb.schedule then Schedule(fb.scheduleinstance or 'MAP',fb.schedule) Loading() end
    if fb.dcall then MS.Run('MAP',fb.dcall) end
end    

function Boss()
  if Done('&DONE.NEWGAMEPLUS.DANDLETON.BOSS['..Maps.LayerCodeName..'].DEFEATED') then return end
  local b 
  local bs=bosses[Maps.LayerCodeName]
  assert(bs,"No boss set for layer "..Maps.LayerCodeName)
  if bs.priomt then MapText(bs.priomt) end
  ClearCombatData()
  for i=1,({1,3,6})[skill] do
      b=i+1
      Var.D('$COMBAT.FOE_'..i,'Reg/DandletonCitizen')
  end
  Var.D("$COMBAT.FOE_"..b,"Boss/"..bs.boss)
  Var.D("$COMBAT.POSFOE_"..b,"CENTER")
  Var.D("$COMBAT.MUSIC","Music/"..(bs.music or 'Altboss/Day Of Chaos')..".ogg")
  Var.D("$COMBAT.ARENA","Dandleton.png")
  NGP_StartBoss(bs.intro1,bs.intro2)    
end

function GoMap(l,e)
   local mp = math.ceil(l/10)
   local mf = "NGP_Dungeon_Dandleton_Part"..mp
   if mp==1 then mf="NGP_Dungeon_Dandleton" end
   Cls()
   Loading()
   LoadMap(mf)
   GoToLayer('#'..right('00'..l,3),e or 'Start')
end   
   

function NextMap()
   if not(Done('&DONE.NEWGAMEPLUS.DANDLETON.NEXTMAP.FIRSTTIME['..Maps.LayerCodeName..'].DONE')) then
      if NextMapFirst[Maps.LayerCodeName] then return NextMapFirst[Maps.LayerCodeName]() end
   end 
   local n = Sys.Val(right(Maps.LayerCodeName,3))+1
   GoMap(n,"Start")
end

function PrevMap()
   local n = Sys.Val(right(Maps.LayerCodeName,3))-1
   GoMap(n,"Einde")
end

-- I kill you, Feena!
function FightNostramantu()
    if RPG.Obj.Exists('Nostramantu')==0 then return end
  
    PartyPop('Feena','West')
    MapText('FNOS1')
    local p = {Actors.Actor('PLAYER'),Actors.Actor('PLAYER1'),Actors.Actor('PLAYER2'),Actors.Actor('PLAYER3')}
    for a=0,1000,2 do
        Maps.Obj.Obj('Feenalaria').SetAlpha(a)
        for o in each(p) do o.SetAlpha(1000-a) end
        Cls()
        DrawScreen()
        Flip()
    end
    MapText('FNOS2')
    Party('Feenalaria')
    Schedule('MAP','PostNostramantu')           
    ClearCombatData()
    Var.D("$COMBAT.FOE_1","Boss/NostramantuDandleton")
    Var.D("$COMBAT.POSFOE_1","CENTER")
    Var.D("$COMBAT.MUSIC","Music/Special Boss/PlayTillDeath_(Nostramantu).ogg")
    Var.D("$COMBAT.ARENA","Dandleton.png")
    Var.D("$COMBAT.LOSE","NostramantuKillsFeenalaria")
    Var.D("$COMBAT.STARTEVENT","MAP,InitNostramantu")
    NGP_StartBoss("Feenalaria's husband","Nostramantu",0,25,100)
end

function InitNostramantu()
   RPG.Points('FOE_1','HP').Minimum=RPG.Points('FOE_1','HP').Maximum
end

function PostNostramantu()
    Maps.Obj.Kill('Nostramantu',1)
    Maps.Obj.Kill('Feenalaria',1)
    Party('Jake_Human;Marrilona;Dandor;HandoStillor')
    Actors.Actor('PLAYER').SetAlpha(1000)
    Actors.Actor('PLAYER2').SetAlpha(1000)
    Actors.Actor('PLAYER3').SetAlpha(1000)
    Maps.Obj.Obj('DeadMarrilona').SetAlpha(1000)
    MapText('FNOS3')
    Actors.Actor('PLAYER1').SetAlpha(1000)
    Maps.Obj.Kill('DeadMarrilona',1)
    RPG.Points('Marrilona','HP') .Have=1
    RPG.Points('Marrilona','VIT').Have=0
    RPG.SetStat('Marrilona','EXP',0)
    Award('ZZNGP_Death')
    Music('Dungeon/Dandleton')
end



function GALE_OnLoad()
    ZA_Enter('pMemory',function() if not(Done('&DONE.NEWGAMEPLUS.DANDLETON.MEMORY.P['..Maps.LayerCodeName..'].SCENARIO')) then Memory(nil,'p') end end)
    ZA_Enter('Memory' ,function() if not(Done('&DONE.NEWGAMEPLUS.DANDLETON.MEMORY.N['..Maps.LayerCodeName..'].SCENARIO')) then Memory(nil,nil) end end)
    ZA_Enter('Flashback',Flashback)
    NextMapFirst['#010'] = Flashback
    ZA_Enter('NextMap',NextMap)
    ZA_Enter('PrevMap',PrevMap)
    ZA_Enter('FightNostramantu',FightNostramantu)
end
    
