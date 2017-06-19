--[[
**********************************************
  
  HydraJoker.lua
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
 
version: 17.06.19
]]
-- @IF IGNORE
local Jokers = {}
-- @FI


function Jokers.Hydra()
    local i = 0
    local add = 1
    local vx,vy,vw,vh = GetViewport()
    if skill==3 then add=2 end
    for t,f in pairs(fighterbytag) do
       if prefixed(t,'FOE_') and RPG.Points(t,'HP').Have==1 then
          RPG.Points(t,'HP').Have = RPG.Points(t,'HP').Maximum
          for ak=1,add do
            repeat
              i = i + 1
            until RPG.CharExists('FOE_'..i)==0
            CompileFoe('FOE_'..i,f.data,'Sealed/Hydra')
            local nf = fighterbytag['FOE_'..i]
            nf.x=-300
            nf.y=rand(100,vh-100)
            RPG.Points('FOE_'..i,'HP').Minimum=1
          end  
       CreateOrder()   
       end   
    end
    AddCard({group='Joker',joker='Hydra'},rand(5*skill,15*skill))
end

-- @IF IGNORE
return Jokers
-- @FI    
