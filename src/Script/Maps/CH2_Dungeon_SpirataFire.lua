--[[
**********************************************
  
  CH2_Dungeon_SpirataFire.lua
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
 
version: 17.02.07
]]

-- @USE /script/use/specific/plasmafloor.lua

function genpuzzle()
  local counton  
  repeat
     counton=0
     local tf = {[0]=false,[1]=true}
     local tt = {[0]='gfx/textures/objects/kaars uit.png',[1]='gfx/textures/objects/kaars.png'}
     puzzletag = "&DONE.SOLVED.SPIRATA.FIRE["..Maps.LayerCodeName.."]"
     local solved = CVV(puzzletag)
     puzzle = {}
     skaars = {}
     for i=1,9 do
         local r=rand(0,1)
         local v=Maps.Obj.Obj('Voorbeeld'..i)
         local p=Maps.Obj.Obj('NPC_K'..i)
         if tf[r] then counton=counton+1 end
         puzzle[i] = tf[r]
         skaars[i] = false
         v.TextureFile=tt[r]
         if solved then p.TextureFile=tt[r] else p.TextureFile=tt[0] end
     end
  until counton>01   
end

function Kaars(i)
    local solved = CVV(puzzletag) if solved then return end
    local tt = {[false]='gfx/textures/objects/kaars uit.png',[true]='gfx/textures/objects/kaars.png'}
    skaars[i] = not skaars[i]
    local p=Maps.Obj.Obj('NPC_K'..i)
    p.TextureFile=tt[skaars[i]]
    local goed = true
    for j=1,9 do 
        goed=goed and skaars[j]==puzzle[j]
    end    
    if goed then
       Done(puzzletag)
       Maps.Obj.Kill('DoorPuzzle',1)
       for ch in EachParty() do RPG.IncStat(ch,"EXP",-math.ceil((90/(skill^2)))) end
       SFX('Audio/sfx/General/Solved.ogg')
    end
end

function NPC_K1() Kaars(1) end
function NPC_K2() Kaars(2) end
function NPC_K3() Kaars(3) end
function NPC_K4() Kaars(4) end
function NPC_K5() Kaars(5) end
function NPC_K6() Kaars(6) end
function NPC_K7() Kaars(7) end
function NPC_K8() Kaars(8) end
function NPC_K9() Kaars(9) end

function MAP_FLOW()
   FlowBlops()
   local lay = Maps.LayerCodeName;
   -- (SubFlow[lay] or Nothing)()
end

function GALE_OnLoad()
   InitBlops()
   ZA_Enter('Bye',WorldMap)
   ZA_Enter('genpuzzle',genpuzzle)
 end
