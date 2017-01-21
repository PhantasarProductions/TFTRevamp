--[[
**********************************************
  
  CH2_Dungeon_SpirataWater.lua
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
 
version: 17.01.21
]]
-- @USE /script/use/specific/plasmafloor.lua


subniveau = {}

function GeneratePuzzle(num)
    local tag = '%WATER.NIVEAU['..Maps.LayerCodeName..']'
    if CVVN(tag) then
       ClearTable(subniveau)
       for i=1,num do subniveau[i]=CVV(tag) end
    end
    niveau = rand(1,4)
    local total = niveau*4
    Var.D("%WATER.NIVEAU.TOTAL",total)
    ClearTable(subniveau)
    for i=1,num do
        subniveau[i] = rand(1,4)        
    end
    CSay(serialize('niveau',niveau)..serialize('subniveau',subniveau))
end

function AdeptTube(num)
    local niv = subniveau[num]*250
    local o = Maps.Obj.Obj('Vloeistof'..num)
    if     o.ScaleY<niv then o.ScaleY = o.ScaleY+1
    elseif o.ScaleY>niv then o.ScaleY = o.ScaleY-1 end
end

function AdeptTubes()
    for i=1,#subniveau do AdeptTube(i) end
end

SubFlow = {['#002']=AdeptTubes,['#008']=AdeptTubes}  

function NPC_Uitkomst()
   MapText('UITKOMST')
end

function PTube(n)
    local tag = '%WATER.NIVEAU['..Maps.LayerCodeName..']'
    local v = Sys.Val(AltInputResult())
    if v<1 and v>4 then return end
    subniveau[n] = v
    local goed = true
    for i=1,#subniveau do
        goed = goed and subniveau[i]==niveau
    end
    if goed then
       Var.D(tag,niveau)
       Maps.Obj.Kill('DoorNext',1)
       SFX('Audio/sfx/General/Solved.ogg')
       for ch in EachParty() do
           RPG.IncStat(ch,'EXP',-(300-(skill*100)))
       end     
    end    
end

function PT_1() PTube(1) end     
function PT_2() PTube(2) end     
function PT_3() PTube(3) end     
function PT_4() PTube(4) end     
function PT_5() PTube(5) end     
function PT_6() PTube(6) end     
function PT_7() PTube(7) end     
function PT_8() PTube(8) end     

function Tube(n)
    local tag = '%WATER.NIVEAU['..Maps.LayerCodeName..']'
    if CVVN(tag) then return end
    Schedule('Map','PT_'..n)
    AltInput('Tube #'..n.." -- current level:"..sval(subniveau[n])..":",'','num')
end
    
function NPC_1() Tube(1) end    
function NPC_2() Tube(2) end    
function NPC_3() Tube(3) end    
function NPC_4() Tube(4) end    
function NPC_5() Tube(5) end    
function NPC_6() Tube(6) end    
function NPC_7() Tube(7) end    
function NPC_8() Tube(8) end    

function Boss()
  ClearCombatData()
  Schedule('MAP','ManaOrb')
  Var.D("$COMBAT.FOE_1","Boss/Aqua")
  Var.D("$COMBAT.POSFOE_1","CENTER")
  Var.D("$COMBAT.MUSIC","Music/SpecialBoss/Summon the Rawk.ogg")
  Var.D("$COMBAT.ARENA","spiratawater.png")
  StartBoss("Protector of the Water Spirata","Aqua")    
end


function MAP_FLOW()
   FlowBlops()
   local lay = Maps.LayerCodeName;
   (SubFlow[lay] or Nothing)()
end

function GALE_OnLoad()
   InitBlops()
   ZA_Enter('GenPuz2',GeneratePuzzle,4)
   ZA_Enter('GenPuz8',GeneratePuzzle,8)
end
