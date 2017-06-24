--[[
**********************************************
  
  Fool's Gold.lua
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
 
version: 17.06.25
]]
-- @IF IGNORE
local SpellScript = {}
-- @FI



function SpellScript.FoolGold(t,e,p)
    local cash=CVV('%CASH')
    if (not cash) or cash<=0 then return false end
    local vanish = math.floor(cash * (.1*skill))
    if vanish==0 then return false end
    charmsg(e,vanish.." shilders appeared to be illusions and have disappeared",180,255,0)
    return true
end


-- @IF IGNORE
return SpellScript
-- @FI
