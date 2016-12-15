--[[
**********************************************
  
  CH1_HUB_Altar.lua
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
 
version: 16.12.14
]]

-- Link all stats in Jake that should be linked
function CreateJakeFairy()
  local linkprefix = {'BUFF_','EQP_','POWERUP_',"MASTER_"}
  local linkstat   = {'Level','EXP'}
  local linkpoints = {'SK_EXP_1','SK_LVL_1','VIT'}
  -- Link points
  for p in each(linkpoints) do
      RPG.LinkPoints('Jake_Human','Jake_Fairy',p)
  end
  -- Link stats
  for p in each(mysplit(RPGChar.StatFields('Jake_Human'),";")) do
      local link=false
      for ls in each(linkstat)   do if p==ls          then link=true end end
      for lp in each(linkprefix) do if prefixed(p,lp) then link=true end end
      if link then RPG.LinkStat('Jake_Human','Jake_Fairy',p) end
  end      
  -- Link data
  for p in each(mysplit(RPG.DataFields('Jake_Human'),";")) do
      RPG.LinkData('Jake_Human','Jake_Fairy',p)
  end
  -- Jake's name
  RPGStat.SetName('Jake_Fairy','Jake')
  -- Synchronize results
  MS.LN_Run('PARTY','Script/Subs/Party.lua','SyncLevel','Jake_Fairy') 
  local h = RPG.Points('Jake_Fairy','HP')
  h.Have = h.Maximum
  RPG.Points('Jake_Fairy','AP').Have=0
end

function Altar()
    PartyPop('Altar','South')
    MapText('Altar1')
    -- New Game Plus part goes here --
    Party('Jake_Fairy;Marrilona')
    CreateJakeFairy()
    ActorRepos("PLAYER","Altar_Jake","South","Jake_Fairy")
    MapText('Altar2')
    Schedule("MAP","PostBoss")
    ClearCombatData()
    Var.D("$COMBAT.FOE_1","Boss/GhostPriest") -- Needed to prevent the Axe Smash session Marrilona has to deal with.
    Var.D("$COMBAT.POSFOE_1","CENTER")
    Var.D("$COMBAT.MUSIC","Music/Boss/BrutalSong.ogg")
    Var.D("$COMBAT.ARENA","Altar.png")
    StartBoss("Restless Spirit","Ghost Priest")      
end

function PostBoss()  
   Teach('Jake_Human','ABL_HERO_JAKE_SHIFT_FAIRY')
   Teach('Jake_Fairy','ABL_HERO_JAKE_SHIFT_HUMAN')
   Sys.Error('Sorry, the rest is not coded yet')
end

function GALE_OnLoad()
   ZA_Enter('Leave',WorldMap)
   ZA_Enter('Altar',Altar)
end   

