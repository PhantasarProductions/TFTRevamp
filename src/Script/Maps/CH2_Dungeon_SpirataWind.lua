--[[
**********************************************
  
  CH2_Dungeon_SpirataWind.lua
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
 
version: 17.06.15
]]

-- @USE /script/use/specific/plasmafloor.lua
-- @USE /Script/Use/Specific/SpirataCryptEntrance.lua


function GenPuzzle()
   if puzdata then return end
   local l=Maps.LayerCodeName
   local vt="&DONE.SPIRATA.WIND.PUZZLE["..l.."]"
   local c={[true]={180,0,0},[false]={0,180,0}}
   if CVV(vt) then return end
   local v=rand(3,12)
   for i=1,12 do      
         for let in each({"A","B"}) do
             local o=Maps.Obj.Obj(let..i)
             local goed=i==v 
             o.R=c[goed][1] 
             o.G=c[goed][2] 
             o.B=c[goed][3]
         end     
   end
   puzdata = {
     goedeantwoord=v,
     meter=-3,
     balletje=Maps.Obj.Obj('Balletje').Y,
     ondergrens=Maps.Obj.Obj("A1").Y+32,
     tag=vt
   }
   CSay("Correct answer is "..v)
   CSay(serialize("Generated data ",puzdata))
end

function TurnDone()
     if Maps.Obj.Exists("Obstacle_Done")==0 then return end
     local d=Maps.Obj.Obj("Obstacle_Done")
     d.Rotation = d.Rotation + 1
     if d.Rotation>=360 then d.Rotation = d.Rotation - 360 end 
end

function POST_Controls()
  local v = Sys.Val(AltInputResult()) -- Sys.Val GUARANTEES a number, where tonumber can return 'nil', and cannot chance that latter option.
  if v<=0 then
     puzdata.meter=-3
  elseif v>12 then
     puzdata.meter=100 -- Make sure the ball will fly out!
  else
     puzdata.meter=v   
  end  
CSay(serialize("Current Puzzle Data",puzdata))    
end

function NPC_Controls()
    if not puzdata then return end
    if puzdata.meter>12 then return end -- Too high == DEATH!!! sorry!
    Schedule('MAP','POST_Controls')
    AltInput('Desired Wind Force:','','num')
end

function PuzRoom()
   TurnDone()
   if not puzdata then return end
   if CVV(puzdata.tag) then return end
   local balletje = Maps.Obj.Obj("Balletje")
   balletje.R=rand(0,255)
   balletje.G=rand(0,255)
   balletje.B=rand(0,255)
   local y = puzdata.ondergrens
   y = y - ((puzdata.meter-1)*32)
   y = y + (math.sin(Time.MSecs()/2)*4)
   if     balletje.Y<y then balletje.Y = balletje.Y + 2 
   elseif balletje.Y>y then balletje.Y = balletje.Y - 2 end
   if balletje.Y<-10 then 
      for i=1,100 do
          Cls()
          Color(rand(1,255),rand(1,255),rand(1,255))
          Image.Rect(0,0,SW,SH)
          Flip()
      end
      local lay = Maps.LayerCodeName
      GoToLayer("oops","Start")
      MapText("OOPS")
      balletje.Y = puzdata.ondergrens+128
      puzdata=nil
      GoToLayer(lay,"Start")
   end
   if balletje.Y>y-5 and balletje.Y<y+5 and puzdata.meter==puzdata.goedeantwoord then
      subscript = [[
           DDZ = Maps.Obj.Obj("Done")
           DDO = Maps.Obj.Obj("Obstacle_Done")
           DDP = Maps.Obj.Obj("Point_Done")
           DDZ.X = DDP.X-32
           DDZ.Y = DDP.Y-32
           DDO.X = DDP.X
           DDO.Y = DDP.Y
      ]]
      Maps.PermaWrite(subscript)
      subfunction = loadstring(subscript)
      subfunction()
      for ch in EachParty() do RPG.IncStat(ch,"EXP",-math.ceil((900/(skill^2)))) end
      SFX('Audio/sfx/General/Solved.ogg')
      Done(puzdata.tag)       
   end
end

function ToBoss()
    puzdata=nil
    CSay("To the boss (providing it's still there :P")
    GoToLayer('#002','BossSpot')
    local opengate = true
    for l in each({'#004','#006'}) do opengate = opengate and CVV("&DONE.SPIRATA.WIND.PUZZLE["..l.."]") end
    if opengate then
      subscript = [[
           DDZ = Maps.Obj.Obj("Done")
           DDO = Maps.Obj.Obj("Obstacle_Done")
           DDP = Maps.Obj.Obj("Point_Done")
           DDZ.X = DDP.X-32
           DDZ.Y = DDP.Y-32
           DDO.X = DDP.X
           DDO.Y = DDP.Y
      ]]
      Maps.PermaWrite(subscript)
      subfunction = loadstring(subscript)
      subfunction()
      Maps.Remap()
    end        
end


-- Meet the Spirata
function Spirata()
    if Done('&DONE.SPIRATA.WIND') then return end
    Shift('Human')
    PartyPop('S','North')
    MapText('SPIRATA')
    Done('&SPIRATA.HANDOSTILLOR')
    if skill~=3 then
       RPG.SetStat('HandoStillor','EXP',0)
       for i=skill,5 do
           if RPG.PointsExists('HandoStillor','SK_LVL_'..i)==1 then RPG.Points('HandoStillor','SK_LVL_'..i).Inc(2/skill) end
       end
    end
    local spirscript = [[ -- Spirata Wall changes
      local spirata = Maps.Obj.Obj('SpirataWall')
      spirata.AltBlend=0
      spirata.TextureFile='GFX/Textures/Marble/Wall - N.png'
      spirata.G=100
      -- All done
    ]]
    Maps.PermaWrite(spirscript)
    local spirscriptcompiled = loadstring(spirscript)
    local ok,error = pcall(spirscriptcompiled)
    if not ok then Sys.Error(error,'Note,This is from an attempt to remove the Spirata wall.') end
    MapText('SPIRATAPOST')
    Var.D('$WMCHAT','WINDSPIRATADONE')
    WorldMap_Unlock('CH2DOUBLINEBAY')
    WorldMap()
end


function ToSpirata()
   Maps.Obj.Kill("Done",1)
   Maps.Obj.Kill("Obstacle_Done",1)
   Music("Hub/Angevin.ogg")
   GoToLayer("#001","SpirataStart")
   Maps.Obj.Kill("WaaiLinks",1)
   Maps.Obj.Kill('WindLeft',1)
   Maps.Remap()
   Spirata()
end

function TDone()
CSay('Teleporter "Done" activated');
({
   ['#004']=ToBoss,
   ['#006']=ToBoss,
   ['#002']=ToSpirata
})[Maps.LayerCodeName]()
end


function Boss()
  Maps.Obj.Kill("Hek",1)
  ClearCombatData()
  Schedule('MAP','ManaOrb')
  Var.D("$COMBAT.FOE_1","Boss/Aer")
  Var.D("$COMBAT.POSFOE_1","CENTER")
  Var.D("$COMBAT.MUSIC","Music/SpecialBoss/Summon the Rawk.ogg")
  Var.D("$COMBAT.ARENA","spiratawind.png")
  StartBoss("Protector of the Wind Spirata","Aer")    
end


SubFlow = { ['#004']=PuzRoom, ['#006']=PuzRoom, ['#002']=TurnDone}

function MAP_FLOW()
   --FlowBlops()
   FlowMoveTex(hsin)
   FlowMoveTex(vsin)
   FlowMoveTex(wind)
   local lay = Maps.LayerCodeName;
   (SubFlow[lay] or Nothing)()
end

function Next2() GoToLayer('#005','Start') end
function Prev2() GoToLayer('#002','Einde2') end


function GALE_OnLoad()
   --InitBlops()
   hsin = InitMoveTex({X=-1,Y=0,suffix='HSINUS.PNG'})
   vsin = InitMoveTex({X= 0,Y=1,suffix='VSINUS.PNG'})
   wind = InitMoveTex({X=-4,Y=0,tag='WindLeft'})
   --[[
   ZA_Enter('SpirataRoom',Music,'Hub/Angevin.ogg')
   ZA_Enter('Kerk'       ,Music,"Dungeon/Chanson d'eglise.ogg")
   ZA_Enter('Spirata',Spirata)
   ]]
   ZA_Enter('GenPuzzle',GenPuzzle)
   ZA_Enter("Done",TDone)
   ZA_Enter('Next2',Next2)
   ZA_Enter('Prev2',Prev2)   
   ZA_Enter("Bye",WorldMap)
   MapHide('Secret')
   InitSpirEntry('aer')
end
