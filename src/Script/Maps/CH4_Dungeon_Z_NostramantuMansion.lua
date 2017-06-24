--[[
**********************************************
  
  CH4_Dungeon_Z_NostramantuMansion.lua
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
 
version: 17.06.24
]]

--[[

   Notes
   EndDoor -- Door to open to go to Nostramantu (barrier)
   Confrontation -- Zone leading to Nostramantu (point of no-return

]]


local function InitRandomDoors()
   local r
   entries = {}
   exits   = {}
   doors = {entries=entries,exits=exits}
   for i = 1, 9 do
       timeout=10000
       repeat
           r=rand(1,9)
           timeout=timeout-1
           assert(timeout>0,"Timeout on mansion room entry #"..i)
       until not entries[r] entries[r]=i   
       timeout=10000
       repeat
           r=rand(1,9)
           timeout=timeout-1
           assert(timeout>0,"Timeout on mansion room exit #"..i)
       until not exits[r] exits[r]=i   
   end 
   CSay("doors initialized")
   CSay(serialize('doors',doors))
end

local function GT(d) GoToLayer('corridor','Start'..d) end
local function LV(d) GoToLayer('lobby','Ex'..d) end

function GALE_OnLoad()
  InitRandomDoors()
  ZA_Enter('ManaCave',function() LoadMap('CH4_DUNGEON_MANACAVE') GoToLayer('#020','Einde') end)
  ZA_Enter('Rechts',GT,'Rechts')
  ZA_Enter('Links',GT,'Links')
  ZA_Enter('ToLinks',LV,'Links')
  ZA_Enter('ToLobbyRechts',LV,'Rechts')
end  
