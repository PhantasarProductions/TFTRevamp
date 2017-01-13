--[[
**********************************************
  
  CH2_Town_Iskarderiu.lua
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
 
version: 17.01.13
]]

function Welcome()
    Award('SCEN_CH2_ELVES')
    WorldMap_Unlock('CH2WENIARIA')
    if Done('&DONE.ISKARDERIU.WELCOME') then return end
    PartyPop('W','North')
    MapText('Welcome')
end    

function Master_Midas()
   Master('Midas')
end   

function NPC_Midas()
   if CVV('&MASTER.MIDAS.HAVE') then return Master_Midas() end
   MapText('MIDAS_FIRST'); Done('&DONE.RUBINE.MENTIONED.BY.MIDAS')
   if RunQuestion('MAP','MIDAS_CONFIRM')==2 then MapText('MIDAS_REJECT') return end
   if CVV('%CASH')<250 then return MapText('MIDAS_NOTENOUGH') end
   Var.Clear('%CASH')
   Done('&MASTER.MIDAS.HAVE')
   Master_Midas() 
end

function NPC_Weapons    ()
    MapText('MYRA')
    Shop('WEAPON_MYRAREMEMBO')
end    

function NPC_Emor()
    MapText('EMOR')
    Shop('ITEM_ISKARDERIU')
end    

function NPC_Inn()
    Inn()
end

function NPC_Keizer()
    if Done('&DONE.ISKARDERIU.KEIZER') then
       MapText('EMPEROR2')
    else
       PartyPop('K','North')
       MapText("EMPEROR1")
       WorldMap_Unlock('CH2DRESHKA')
    end
end


function Enter(z)
    GoToLayer(z,"Start")
end    




function GoExit()
    local l = Maps.LayerCodeName
    if l=="town" then return WorldMap() end
    GoToLayer('town','from'..l)
end

function GALE_OnLoad()   
   ZA_Enter('Exit',GoExit)
   ZA_Enter('Welcome',Welcome)
   Maps.GotoLayer('town')
   for obj in KthuraEach('Zone') do
       if prefixed(obj.tag,"Enter_") then ZA_Enter(obj.tag,Enter,lower(right(obj.tag,#obj.tag-6))) end
   end
end   
