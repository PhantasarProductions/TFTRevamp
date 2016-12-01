--[[
**********************************************
  
  PRO_Dungeon_Crypt.lua
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
 
version: 16.11.30
]]

bossvar = "&DONE.PROLOGUE.HANDOSTILLOR.CRYPT.BOSS"

-- @USE /Script/Use/Specific/EndOfPrologue.lua

function AllDark()
    local p = Actors.Actor("PLAYER")
    p.R = 255; p.G=255; p.G=255
    if CVV(bossvar) or Lit then return end
    DarkAllObj = {}
    DarkAreaObj = {}
    DarkCandles = {}    
    for obj in KthuraEach() do
        if obj.Tag~="PLAYER" and obj.Tag~="Start" then
           DarkAllObj [ #DarkAllObj ] = obj
           DarkAreaObj [ obj.Labels ] = DarkAreaObj[ obj.Labels ] or {}
           DarkCandles [ obj.Labels ] = DarkCandles[ obj.Labels ] or {}        
           local DAO = DarkAreaObj[ obj.Labels ]
           DAO[ #DAO + 1 ] = obj
           if suffixed(obj.TextureFile,"KAARS UIT.PNG") then 
              local DCL = DarkCandles [ obj.Labels ]
              DCL[ #DCL+1 ] = obj
           end
           obj.R = 0
           obj.G = 0
           obj.B = 2
        end   
    end 
    DarkDone = true
    Lit = {}
end

function LightUp(a)
   if not DarkDone then AllDark() end
   if Lit[a] then return end; Lit[a]=true 
   local b = a + 1   
   local c = b + 1
   local d = a - 1
   local thiszone = DarkAreaObj[ "BLZ" .. a]
   local nextzone = DarkAreaObj[ "BLZ" .. b]
   local farzone  = DarkAreaObj[ "BLZ" .. c]
   local prevzone = DarkAreaObj[ "BLZ" .. d]; --CSay("d = "..d.." nil?("..sval(prevzone==nil)..")")
   local workout = {
                      { zone = prevzone, R=255, G=195, B = 0 },
                      { zone = thiszone, R=255, G=180, B = 0 },
                      { zone = nextzone, R=100, G=60,  B = 1 },
                      { zone =  farzone, R= 50, G=10,  B = 2 }
                   }
   -- light up zone                   
   for wz in each(workout) do
       for obj in each(wz.zone or {}) do  
           obj.R = wz.R
           obj.G = wz.G
           obj.B = wz.B           
       end
   end
   -- lite the candles
   for obj in each(DarkCandles["BLZ"..a] or {}) do
       obj.TextureFile = "GFX/Textures/Objects/Kaars.png"
       obj.FrameSpeed=rand(1,10)
       obj.G=200
   end                   
end

function Boss()
  ClearCombatData()
  Var.D("$COMBAT.FOE_1","Boss/SuperZombie")
  Var.D("$COMBAT.POSFOE_1","CENTER")
  Var.D("$COMBAT.MUSIC","Music/Boss/BrutalSong.ogg")
  Var.D("$COMBAT.ARENA","GreyDung.png")
  StartBoss("Undead Leader","Super Zombie")   
end


function StartPuzzle()
  InitStepsPuzzle({width=30,height=16,plusx=64,plusy=160,tilesize=32,tileprefix="YurgonTile_",correct="WENIARIA"})
end  

function GALE_OnLoad()
   Award("SCEN_PROLOGUE_CRYPT")
   MapHide('Secret')
   ZA_Enter("AllDark",AllDark)
   for i=1,10 do ZA_Enter("ABZ"..i,LightUp,i) end
   ZA_Enter("StartPuzzle",StartPuzzle)
end   
