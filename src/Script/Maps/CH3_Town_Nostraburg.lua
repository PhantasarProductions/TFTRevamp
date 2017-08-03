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
 
version: 17.07.21
]]

-- @USE /Script/Use/Specific/NewGame+.lua
RAMATA = "&DONE.NOSTRABURG.RAMATA.WELCOME.TEXT"

function MeesterKrandar()
   local master="&MASTER.KRANDAR"
   if not CVV(master) then
      MapText("KRANDAR_PREMASTER")
      if not CVVN("&KRANDARWILLTEACH") then
         MapText("KRANDAR_NOTREADY")
         return
      end
      Done(master)
   end
   Master("Krandar")   
end

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

function NPC_Krandar()
  if not Done("&DONE.KRANDAR.FIRSTTIME") then
   MapText("KRANDAR_FIRST")
   WorldMap_Unlock("CH3SPIRATAEARTH")
   Var.D("$WMCHAT","KRANDAR")
   return
  end 
  if CVV("&SPIRATA.DANDOR") and (not CVV("&DONE.KRANDAR.SUMMONING")) then
     Done("&DONE.KRANDAR.SUMMONING")
     MapText("KRANDAR_SUMMONING_A")
     Cls()
     Flip()
     Time.Sleep(2500)
     MapText("KRANDAR_SUMMONING_B")
     LoadMap("CH3_Story_Dragon_Forest")
     GoToLayer("summon","Start")
     Actors.Actor("PLAYER").Visible=0
     MapText("SUMMONING")
     LoadMap("CH3_Town_Nostraburg")
     GoToLayer("town","K_Jake")
     PartyPop("K","North")
     MapText("KRANDAR_SUMMONING_C")
     WorldMap_Unlock("CH3PYRUS")
     Var.D("$WMCHAT","PREDRAGON")
     -- Sys.Error("That's all folks!")
     return
  end     
  MeesterKrandar()
end        



function Enter_Building(l)
   GoToLayer(l,"Start")
end   

function MapMusic()
   if RPG.PartyTag(0)=='Nostramantu_Human' then
      Music('Hub/There is Romance')
   elseif RPG.PartyTag(0)=='Feenalaria' then
      Music('Scenario/We Got Trouble.ogg')   
   elseif not CVV("&KRANDAR.GONE") then 
      OriMapMusic()
   else
      Music('Dreshka/Water Prelude.ogg')
   end
end         

function KanWelJanken()
   ActorRepos("PLAYER1","Stillor_Depri","South","HandoStillor")
   MapText("DEPRI_Jake")
   Maps.Obj.Kill('KanWelJanken',1)
   --error('*sob*')
end

function KeinDurgang()
    MapText('KEINDURGANG')
    Actors.WalkToSpot("PLAYER","Terug")
end    

function JakeIsACoward()
    if Done('&DONE.NOSTRABURG.MARRILONA.DEADORDRAGON.SPOKEN.KRANDAR.COWARD') then return end 
    PartyPop('M','North')
    MapText('JAKE_IS_A_COWARD')    
    Var.Clear("$SYS.RESPAWN")
end

function MAP_FLOW()
    if Maps.LayerCodeName=="krandar" then
       OMarrilona = OMarrilona or Maps.Obj.Obj('Marrilona')
       OMarrilona.Y = 270 + math.sin(Time.MSecs()/250)*5 
    end
end

function BlueSeal()
    ClearCombatData()
    Var.D("$COMBAT.FOE_1","Sealed/Kabi")
    Var.D("$COMBAT.POSFOE_1","CENTER")
    Var.D("$COMBAT.MUSIC","Music/Special Boss/Blue Seal.ogg")
    Var.D("$COMBAT.ARENA","Forest.png")
    StartBoss("World Destroyer","Kabi",0,25,100)      
    Done('&DONE.SEAL.MARRILONA1')
end    

function NPC_Sinasina()
    MapText('SINASINA')
    WorldMap_Unlock('NGPDANDLETON') 
end    

function LovingAsshole()
    MapText('FRENDOR_PREBOSS')
    ClearCombatData()
    Var.D("$COMBAT.FOE_1","Boss/Frendor")
    Var.D("$COMBAT.POSFOE_1","CENTER")
    Var.D("$COMBAT.MUSIC","Music/Special Boss/Rush.ogg")
    Var.D("$COMBAT.ARENA","Forest.png")
    NGP_StartBoss("Loving and caring assho... I mean brother","Frendor",0,25,100)      
    if     skill==1 then RPG.Points('Feenalaria','AP').Have=123456789
    elseif skill==2 then RPG.Points('Feenalaria','AP').Have=RPG.Points('Marrilona','AP').Have
    elseif skill==3 then RPG.Points('Feenalaria','AP').Have=0 end
    RPG.Points('Feenalaria','VIT').Have=1000
    RPG.Points('Feenalaria','HP').Have=RPG.Points('Feenalaria','HP').Maximum
    Schedule('MAP','AssholeDown')
end

function AssholeDown()
    Party('Jake_Human;Marrilona;Dandor;HandoStillor')
    LoadMap('NGP_Dungeon_Dandleton_Part2')
    GoToLayer('#015','Einde')
    MapText('FRENDOR_POSTBOSS')
    RPG.DefStat('Marrilona','EXP',RPG.Stat('Marrilona','EXP')*-2)
    Award("ZZNGP_ASSHOLE")
end    
    
function GALE_OnLoad()
  Maps.GotoLayer("town") 
  if not CVV(RAMATA) then    
    local function RemataWelcome()
      MapText("RAMATA_GUARD")
      Maps.Obj.Kill("Guard_Ramata",1)
      Done(RAMATA)
    end
  ZA_Enter("Guard_Ramata",RemataWelcome)  
  CSay("REMATA Set up")
  end  
  if CVV("&KRANDAR.GONE")then     
     Maps.Obj.Kill("NPC_Krandar")
     ZA_Enter('KanWelJanken',KanWelJanken)
     ZA_Enter('KeinDurgang',KeinDurgang)
     ZA_Enter('JakeIsACoward',JakeIsACoward)
     ZA_Enter('AndWeAreOff',function() MapText('GOTOPYRUS') Party('Jake_Human;Krandar;Dandor;HandoStillor') LoadMap("CH4_DUNGEON_PYRUSPASS") GoToLayer('#000','Start') end)
     
  else
     --Maps.Obj.Obj("Enter_krandar").Tag="krandarhouseunavailablenow"
     Maps.Obj.Kill("ZA_ENTER_krandar")
     Maps.ReMap()   
  end   
  if not CVV("&DONE.CHAPTER4.MTPYRUS.BOSS.NOSTRAMANTU.DEFEATED") then 
     Maps.Obj.Obj("NPC_Feenalaria").Visible=0
     Maps.Obj.Kill('NPC_Sinasina')
  elseif not newgameplus then
     Maps.Obj.Kill('NPC_Sinasina')      
  end
  ZA_Enter("Exit",function() GoToLayer("town","exit_"..lower(Maps.LayerCodeName)) end) 
  for obj in KthuraEach() do
      if RPG.PartyTag(0)=='Nostramantu_Human' then
         local remove={}
         if (obj.Kind~="TiledArea" and obj.Kind~="Exit" and obj.Kind~="Zone" and (not suffixed(obj.TextureFile,"SPAR.PNG")) and (not suffixed(obj.TextureFile,"STRUIK.PNG")))  then
            -- CSay("Removing #"..obj.IDNum.." "..obj.Kind.." "..obj.TextureFile)
            remove[#remove+1]=obj
         end
         for o in each(remove) do o.Remove() end
         Maps.Remap()   
      elseif RPG.PartyTag(0)=='Feenalaria' then
         if obj.Kind=="Obstacle" and prefixed(obj.TextureFile,"GFX/ACTORS/SINGLE/BLACK") then obj.Remove() end 
      elseif prefixed(obj.Tag,"ENTER_") then
         ZA_Enter("ZA_"..obj.Tag,Enter_Building,right(obj.Tag,-6))
         AddClickable(obj.Tag)        
      end
  end
  if RPG.PartyTag(0)~='Feenalaria' then Maps.Obj.Kill('Frendor') end
end


