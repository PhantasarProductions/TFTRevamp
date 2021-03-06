--[[
**********************************************
  
  CH4_Dungeon_ManaRoad.lua
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
 
version: 17.07.20
]]

-- @USE /Script/Use/Specific/NewGame+.lua


function PetitRoi()
  if Done("&DONE.BOSS.PETITROI") then return end
  ClearCombatData()
  local i = 1
  local s = ({0,1,3})[skill]
  for ak=1,s do 
      Var.D("$COMBAT.FOE_"..i,"Reg/Imp2")
      i = i + 1
  end    
  Var.D("$COMBAT.FOE_"..i,"Boss/PetitRoi"); i=i+1
  for ak=1,s do 
      Var.D("$COMBAT.FOE_"..i,"Reg/Imp2")
      i = i + 1
  end    
  Var.D("$COMBAT.MUSIC","Music/Boss/BrutalSong.ogg")
  Var.D("$COMBAT.ARENA","Forest.png")
  StartBoss("King of the Imps","Petit Roi")   
end

function NosBoss()
  if Done("&DONE.BOSS.GRIFFIN.NOSTRAMANTU.FEENALARIA.NEWGAMEPLUS") then return end
  ClearCombatData()
  Var.D("$COMBAT.FOE_1","Boss/Griffin")
  Var.D('$COMBAT.POSFOE_1','CENTER')
  Var.D("$COMBAT.MUSIC","Music/Boss/NewGame+.ogg")
  Var.D("$COMBAT.ARENA","Forest.png")
  NGP_StartBoss("Guardian of the Mana Cave","Mana Griffin")   
end


function NaarDeManaCave()
   LoadMap("CH4_DUNGEON_MANACAVE")
   GoToLayer("#000","Start")
end   

function ManaBoss()    
    ({ Jake_Human = PetitRoi, Jake_Fairy=PetitRoi, Nostramantu_Human = NosBoss})[RPG.PartyTag(0)]()
end

function NosWelcome()
   PartyPop('n','South')
   MapText('NOSWELCOME')
   RPG.Points('Feenalaria_Human2','HP' ).Have=123456789
   RPG.Points('Feenalaria_Human2','AP' ).Have=123456789
   RPG.Points('Feenalaria_Human2','VIT').Have=123456789
   RPG.Points('Nostramantu_Human','HP' ).Have=123456789
   RPG.Points('Nostramantu_Human','AP' ).Have=123456789
   RPG.Points('Nostramantu_Human','VIT').Have=123456789
end



function GALE_OnLoad()
  ZA_Enter('ManaBoss',ManaBoss)
  ZA_Enter('NaarDeManaGrot',NaarDeManaCave)
  if RPG.PartyTag(0)=='Nostramantu_Human' then 
     local nb = Maps.Obj.Obj('BlockNos')
     nb.Impassible=1
     nb.ForcePassible=0
     Maps.ReMap()
  else
     Maps.Obj.Kill('PRC_NosOnly')   
  end
end  
