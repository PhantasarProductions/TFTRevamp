--[[
**********************************************
  
  CH4_Dungeon_SpirataCrypt.lua
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
 
version: 17.06.16
]]

local NoDarkness={}

local backspirata = {

   aqua = { kthura = 'CH2_DUNGEON_SPIRATAWATER',
            layer  = '#005',
            boss   = 'SuperGhostPriest',
            bossh  = {'High priest of the undead','Super Ghost Priest'}},
            
   ignis = {kthura = 'CH2_DUNGEON_SPIRATAFIRE',
            layer  = '#002',
            boss   = 'UltraMonk',
            bossh  = {'Ultra Monk From Hell','Evelyn'}},          

   terra = {kthura = 'CH3_DUNGEON_SPIRATAEARTH',
            layer  = '#004',
            boss   = 'MountainKing',
            bossh  = {'The King of Stone','Mountain King'},
            bossm  = 'Music/Special Boss/Hall of the Mountain King.ogg'},
            
   aer  = { kthura = 'CH2_DUNGEON_SPIRATAWIND',
            layer  = '#002'}   
}


local function Boss()
  local layer = Maps.LayerCodeName
  local back = backspirata[layer]
  local nbe = (skill-1)*3
  local bs  = nbe+1
  ClearCombatData()
  for i=1,nbe do
      Var.D("$COMBAT.FOE_"..i,'REG/ZOMBIE2')
  end
  Var.D("$COMBAT.FOE_"..bs,"Boss/"..back.boss)
  Var.D("$COMBAT.POSFOE_"..bs,"CENTER")
  Var.D("$COMBAT.MUSIC",back.bossm or "Music/AltBoss/Day Of Chaos.ogg")
  Var.D("$COMBAT.ARENA","SpookyDung.png")
  StartBoss(back.bossh[1],back.bossh[2])
  Maps.Obj.Kill('StartBoss',1) 
end

local function MakeDarkness()
   local layers = mysplit(Maps.Layers(),";")
   local dark
   local scx = math.ceil((SW/3000)*1000); if scx>1000 then scx=1000 end
   local scy = math.ceil((SH/3000)*1000); if scy>1000 then scy=1000 end
   CSay('Darkness scale: '..scx..","..scy)
   for lay in each(layers) do
       Maps.GoToLayer(lay)
       Maps.CreateObstacle(0,0,'GFX/Effects/Darkness.png',"Darkness",0)
       dark = Maps.Obj.Obj("Darkness")
       if tablecontains(NoDarkness,lay) then dark.Visible=0 end
       dark.Impassible=0
       dark.Dominance=50000
       dark.ScaleX = scx
       dark.ScaleY = scy
   end
   Maps.ReMap()
end

local tgdd = {}

local function TurnDisk(tag)
    local l = Maps.LayerCodeName ..  "_"
    tgdd[l..tag] = tgdd[l..tag] or rand(0,360)
    tgdd[l..tag] = tgdd[l..tag] + 1
    if tgdd[l..tag]>360 then tgdd[l..tag] = tgdd[l..tag] - 360 end
    Maps.Obj.Obj("Obstacle_"..tag).Rotation = tgdd[l..tag]   
end

local tgd = {'go_terra','go_aqua','go_ignis','go_aer','Delisto'}

function MAP_FLOW()
   local dark = Maps.Obj.Obj("Darkness")
   local play = Actors.Actor('PLAYER')
   dark.X = play.X
   dark.Y = play.Y
   if Maps.LayerCodeName=="together" then
      for l in each(tgd) do TurnDisk(l) end
   else
      TurnDisk('go_together')
   end   
end


local function Back2Spirata()
   local layer = Maps.LayerCodeName
   local back = backspirata[layer]
   assert(back,"No 'back' information for layer '"..layer.."'")
   LoadMap(back.kthura)
   GoToLayer(back.layer,'SPOT_ToCrypt')
end

local function t_go(t)
    local old = Maps.LayerCodeName
    GoToLayer(t,"na_go")
    if t=='together' then
       Done('&CRYPT['..old..']')
       local complete=true
       for e in each({'aer','aqua','ignis','terra'}) do
           if not(CVV('&CRYPT['..e..']')) then
              Maps.Obj.Kill("go_"..e)
              local oe=Maps.Obj.Obj('sym_'..e) oe.R=0 oe.G=0 oe.B=0 
              Maps.Obj.Obj('Obstacle_go_'..e).Visible=0
           else
              complete=false  
           end
       end
    end
    if complete then 
       CSay("AWARD: Achievement!!!")
    end   
end

function GALE_OnLoad()
   MakeDarkness()
   MapHide('Secret')
   ZA_Enter('Spirata',Back2Spirata)
   for l in each({'aer','aqua','ignis','terra','together'}) do ZA_Enter('go_'..l,t_go,l) end
end   
