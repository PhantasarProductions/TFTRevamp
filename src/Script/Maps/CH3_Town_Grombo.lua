--[[
**********************************************
  
  CH3_Town_Grombo.lua
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
 
version: 17.07.12
]]
function NPC_INNKEEPER()
  Inn()
end

function NPC_Sandra()
  MapText("SANDRA_" ..
            ({
               [false] = "A",
               [true] = "B"
            })[Done('&DONE.GROMBO.SPOKEN.SANDRA')]
         )
end

function QuendorGive()
   Var.D("$WMCHAT","QUENDOR")
   ItemGive("ZZKEY_GAIA")
   WorldMap_Unlock("CH3NOSTRABURG")
end   

function NPC_Quendor()
       local ldone = Done("&DONE.GROMBO.SPOKEN.QUENDOR")==true
       MapText("QUENDOR_"..upper(sval(ldone)));
       ({ [true] = Nothing, [false]=QuendorGive })[ldone]()       
end

function NPC_Cherry()
    local d={[true]=2, [false]=1}
    local dn = Done('&DONE.NEWGAMEPLUS.CHERRY.GROMBO.WORLDMAP.UNLOCKED.AQUA.ANTRUM')==true
    if not dn then WorldMap_Unlock('NGPAQUAANTRUM') end
    MapText('CHERRY'..d[dn])
end    

function GALE_OnLoad()
    ZA_Enter('ToQuendor',function() GoToLayer('quendor',"Start") end)
    ZA_Enter("ToTown",function() GoToLayer('town',"Einde") end)
    if not(newgameplus and CVV('&DONE.GROMBO.SPOKEN.QUENDOR')) then
       Maps.GoToLayer('town')
       Maps.Obj.Kill('NPC_Cherry')
       CSay('Cherry is not here!')
    else
       CSay('She is here. Cherry should be there for you!')  
    end   
end
