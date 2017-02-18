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
 
version: 17.02.17
]]

-- @USE /script/use/specific/plasmafloor.lua

function GenPuzzle()
   local l=Maps.LayerCodeName
   local v="&DONE.SPIRATA.WIND.PUZZLE["..l.."]"
   local c={[true]={180,0,0},[false]={0,180,0}}
   if CVV(v) then return end
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
     ondergrens=Maps.Obj.Obj("A1").Y+32
   }
   CSay("Correct answer is "..v)
   CSay(serialize("Generated data ",puzdata))
end

function TurnDone()
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
    Schedule('MAP','POST_Controls')
    AltInput('Desired Wind Force:','','num')
end

function PuzRoom()
   if not puzdata then return end
   local balletje = Maps.Obj.Obj("Balletje")
   TurnDone()
   balletje.R=rand(0,255)
   balletje.G=rand(0,255)
   balletje.B=rand(0,255)
   local y = puzdata.ondergrens
   y = y - ((puzdata.meter-1)*32)
   y = y + (math.sin(Time.MSecs()/2)*4)
   if     balletje.Y<y then balletje.Y = balletje.Y + 2 
   elseif balletje.Y>y then balletje.Y = balletje.Y - 2 end
end


SubFlow = { ['#004']=PuzRoom}

function MAP_FLOW()
   --FlowBlops()
   FlowMoveTex(hsin)
   FlowMoveTex(vsin)
   FlowMoveTex(wind)
   local lay = Maps.LayerCodeName;
   (SubFlow[lay] or Nothing)()
end

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
   MapHide('Secret')
end
