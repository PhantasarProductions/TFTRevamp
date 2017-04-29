--[[
**********************************************
  
  CH4_Town_NostraburgNight.lua
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
 
version: 17.04.29
]]

-- @DEFINE SKIPSCENARIO

function LetsGoto(l)
    GoToLayer(l,"Start")
end

function MarrilonaBossLink()
   for s in each({'Power','Endurance','Intelligence','Resistance','Speed','Accuracy','Evasion'}) do
       RPG.LinkStat('Marrilona','FOE_1','BASE_'..s)
       CSay("Boss Marrilona has stat "..s.." to value: "..RPG.Stat('FOE_1',"BASE_"..s))
   end
   local HP = RPG.Points('FOE_1','HP')
   local HPL = RPG.Stat('Marrilona','BASE_HP') * (skill*5)
   RPG.SetStat("FOE_1","BASE_HP",HPL)
   HP.Maximum = HPL
   HP.Have = HPL
   CSay("Boss Marrilona has "..HPL.." HP")
   local K=RPG.Points('Krandar','HP')
   K.Have=K.Maximum
   MapText('MARRILONA_START','FLOW_COMBAT')  
   MS.LN_Run("ITEMS","Script/Subs/Items.lua","UnlockAllSpells","Krandar")
end

function NPC_Nostramantu()
    local NostraCam = Maps.Obj.Obj('NostraCam')
    local KrandarCam = Maps.Obj.Obj('KrandarCam')
    -- @IF SKIPSCENARIO
    local skip = true
    -- @FI
    if not skip then
     CSay("CAM:")
     CSay('- Nostramantu: '..NostraCam.Y)
     CSay('- Krandar:     '..KrandarCam.Y)
     repeat
        Cls()
        Maps.CamY = Maps.CamY + 1
        DrawScreen()
        Flip()
        CSay('N -- Cam now: '..Maps.CamY)
     until Maps.CamY>=NostraCam.Y
     MapText('NOSTRAMANTU1')
     Maps.Obj.Obj('JAKE').Visible=1
     Maps.Obj.Obj('KRANDAR').Visible=1
     repeat
        Cls()
        Maps.CamY = Maps.CamY - 1
        DrawScreen()
        Flip()
        CSay('K -- Cam now: '..Maps.CamY)
     until Maps.CamY<=KrandarCam.Y
     MapText('NOSTRAMANTU2')
    end 
    ClearCombatData()
    Var.D("$COMBAT.STARTEVENT","MAP,MarrilonaBossLink")
    Var.D("$COMBAT.FOE_1","Boss/Marrilona")
    Var.D("$COMBAT.POSFOE_1","CENTER")
    Var.D("$COMBAT.MUSIC","Music/SpecialBoss/Threat.ogg")
    Var.D("$COMBAT.ARENA","Forest.png")
    Party('Jake_Human;Krandar')
    RPGStat.SetData('Krandar','EQP_Weapon',"ZZZ_KRANDARBLADE")
    RPGStat.SetData('Krandar','EQP_Armor' ,"ZZZ_KRANDARARMOR")
    RPGStat.LinkData("Marrilona","Krandar","EQP_Acc","") 
    for i=1,5 do
        CreateSkill('Krandar',i,9999)
    end        
    StartBoss("Berserk Fairy","Marrilona")      
    Schedule("MAP","PostBoss")
end    

function GALE_OnLoad()
   ZA_Enter("ToCreek",LetsGoto,'creek')
   ZA_Enter('ToTown' ,LetsGoto,'town')
   ZA_Enter('Stop',MapText,"STOP")
   MapHide('ZKRANDAR')
end
