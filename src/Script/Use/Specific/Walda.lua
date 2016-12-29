--[[
**********************************************
  
  Walda.lua
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
 
version: 16.12.29
]]


function InitWalda(i)
    if not CVVN("$WALDAFOUND") then Var.D("$WALDAFOUND",'return {}') end
    local ffw = loadstring(CVV('$WALDAFOUND'))
    FoundWalda = ffw() 
    MapHide('Walda')
    ZA_Enter("ShowWalda",Maps.ShowLabel ,"Walda")
    ZA_Enter("HideWalda",Maps.HideLabels,"Walda")
    WaldaIndex = i
end


function NPC_Walda()
    FoundWalda[WaldaIndex] = true
    local found = 0
    for k,v in pairs(FoundWalda) do
        if v then
           CSay("= Found: "..k)
           found = found + 1
        end
    end
    Var.D("$FOUNDWALDA",serialize('local walda',FoundWalda).."\nreturn walda")
    if found>=1 then Award('WALDA1') end
    if found>=4 then Award('WALDA4') end
    MapText('WALDA')
end    
