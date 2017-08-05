--[[
**********************************************
  
  Anna.lua
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
 
version: 17.08.05
]]
 
local mirror = {'Jake','Marrilona','Dandor','HandoStillor'}


function GALE_OnLoad()
   if not Anna then WorldMap() end
   ZA_Enter('Leave',WorldMap)
   AnnaTemple()
end

function StartSealed()
    local stats = {'Power','Endurance','Intelligence','Resistance','Speed','Accuracy','Evasion','HP'}
    for i,c in ipairs(mirror) do
        local oc = c
        if c=='Jake' then oc='Jake_Human' end
        for stat in each(stats) do
            CSay("Copying stat "..stat.." from "..c.." to foe #"..i)
            RPG.DefStat('FOE_'..i,'BASE_'..stat,RPG.Stat(oc,'END_'..stat))
        end     
        local punt = RPG.Points('FOE_'..i,'HP')
        punt.Have = punt.Maximum
    end
    MS.Run('COMBAT','ResetCards')
end

function PostBlueSeal()
  ItemGive('EQP_ACC_PRISMDIAMOND')
  Award('ANNA_BOSS') 
end

function BlueSeal()
    local sw = Screen.Width()
    local sh = Screen.Height()
    local cw = sw/2
    local ch = sh/2
    local px = math.floor(cw/5)
    local py = math.floor((ch-100)/5)
    CSay("Screensize: "..sw.."x"..sh)
    CSay("Center: ("..cw..","..ch..")")
    CSay("Precision "..px.."; "..py)
    ClearCombatData()
    for i,c in ipairs(mirror) do
        Var.D('$COMBAT.FOE_'..i,'Anna/'..c)
        Var.D('$COMBAT.POSFOE_'..i,math.ceil(cw-(px*i))..','..math.ceil(ch+(py*i)))
        CSay("#"..i..". I'll place "..c.." on position ("..i,math.ceil(cw-(px*i))..','..math.ceil(ch+(py*i))..")")
    end    
    Var.D("$COMBAT.MUSIC","Music/Special Boss/Lilith's Rage.ogg")
    Var.D("$COMBAT.ARENA","nostramantu.png")
    Var.D("$COMBAT.STARTEVENT","MAP,StartSealed")
    StartBoss("Mirror Mirror On The Wall","Who's most brutal of them all",0,25,100)
    Schedule('MAP',"PostBlueSeal")      
end    

