--[[
**********************************************
  
  CH3_Town_Nostraburg.lua
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
 
version: 17.03.25
]]
RAMATA = "&DONE.NOSTRABURG.RAMATA.WELCOME.TEXT"


function NPC_Calanus()
    MapText("CALANUS_"..Maps.Obj.Exists("NPC_BlueSeal"))
end

function NPC_Feenalaria()
    local req = 6
    local feena = Maps.Obj.Obj('NPC_Feenalaria')
    if feena.Visible==0 then return end
    local master = "&MASTER.FEENA"
    if not CVV(master) then
       MapText("FEENA_PREMASTER")
       local ml = MasterList()
       CSay("You have "..#ml.." out of "..req)
       if #ml<req then MapText("FEENA_NOTREADY") return end
       Done(master)
    end
    Master("Feenalaria")   
end

function NPC_Nathalia()
    MapText("NATHALIA")
    Shop('WEAPON_NATHALIA')
end

function NPC_Yllabonja()
    MapText("YLLABONJA")
    Shop('WAND_YLLABONJA')
end

function NPC_Katinta()
    MapText("KATINTA")
    Shop("ITEM_KATINTA")
end

function NPC_Hotelmus()
    Inn()
end        



function Enter_Building(l)
   GoToLayer(l,"Start")
end   


function GALE_OnLoad()
  Maps.GotoLayer("town") 
  if not CVV(RAMATA) then    
    local function RemataWelcome()
      MapText("RAMATA_GUARD")
      Maps.Obj.Kill("Guard_Remata",1)
      Done(RAMATA)
    end
  ZA_Enter("Guard_Ramata",RemataWelcome)  
  CSay("REMATA Set up")
  end  
  if CVV("&KRANDAR.GONE")then
     
     Maps.Obj.Kill("NPC_Krandar")
  else
     Maps.Obj.Obj("Enter_krandar").Tag="krandarhouseunavailablenow"
     Maps.ReMap()   
  end   
  if not CVV("&DONE.BOSS.NOSTRAMANTU1") then Maps.Obj.Obj("NPC_Feenalaria").Visible=0 end
  ZA_Enter("Exit",function() GoToLayer("town","exit_"..lower(Maps.LayerCodeName)) end) 
  for obj in KthuraEach() do
      if prefixed(obj.Tag,"ENTER_") then
         ZA_Enter("ZA_"..obj.Tag,Enter_Building,right(obj.Tag,-6))
         AddClickable(obj.Tag)
      end
  end
end


