--[[
**********************************************
  
  NGP_DUNGEON_AQUAANTRUM.lua
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

-- @USE /Script/Use/Specific/NewGame+.lua
-- @USE /Script/Use/Specific/GreatMagicBack.lua
local effect

--local ww,wh=tonumber(SW) or Screen.width(),tonumber(SH) or Screen.height()
local watertex = 'gfx/textures/water/water.png'
local water = { top = { tag='water_top', alpha=0060,tex=watertex, mul=-3.25, dom=9999,debugy=0 },
                lower = {tag='water_low', alpha=0045,tex=watertex , mul=1.05, dom=9000,debugy=20 } 
              }


function Boss()
--Music/AltBoss/Day of Chaos.ogg
  ClearCombatData()
  ;({
     function()
       Var.D("$COMBAT.FOE_1","Boss/OceanMaid")
       Var.D("$COMBAT.POSFOE_1","CENTER")
     end,function()
       for i=1,3 do Var.D('$COMBAT.FOE_'..i,"REG/Siren") end
       Var.D("$COMBAT.FOE_4","Boss/OceanMaid")
       Var.D("$COMBAT.POSFOE_4","CENTER")
     end,function()
       for i=1,9 do Var.D('$COMBAT.FOE_'..i,"REG/SIREN") end
       Var.D("$COMBAT.FOE_10","Boss/OceanMaid")
       Var.D("$COMBAT.POSFOE_10","CENTER")
     end  
  })[skill]()
  Var.D("$COMBAT.MUSIC","Music/Boss/NewGame+.ogg")
  Var.D("$COMBAT.ARENA","Aqua.png")
  NGP_StartBoss("Ultimate queen of temptation","Ocean Maid")    
end

              
              
function InitPuzzle()
   DonePuzzle="&DONE.MINE.PUZZLE.SOLVED["..Maps.LayerCodeName.."]"
   local maxset=16
   --if Maps.LayerCodeName=="#007" then maxset=25 end
   if CVV(DonePuzzle) or Touched then return end
   local r
   Touched = {}
   if not Symbols then
     Symbols = {}
     for f in iJCR6Dir(true) do
       if (prefixed(f,'GFX/TEXTURES/SHAPES/') or prefixed(f,'GFX/TEXTURES/SHAPESMINE/')) and suffixed(f,".PNG") then Symbols[#Symbols+1] = f end
     end
   end  
   assert(#Symbols>=maxset,"Not enough Symbols. "..maxset.." at least required.")
   Tiles = {}
   local SymUsed = {}
   for i=1,maxset do
       local timeout=1000
       repeat
          timeout=timeout-1
          assert(timeout>=0,"Puzzle Generation TimeOut! (Start)")
          r = rand(1,#Symbols)
       until not SymUsed[r]
       SymUsed[r] = i
       Tiles[i] = Symbols[r]
   end
   same = {}
   timeout=1000
   repeat
      timeout=timeout-1
      assert(timeout>=0,"Puzzle Generation TimeOut! (Same)")
      same.ori = rand(1,16)
      same.tgt = rand(1,16)
   until same.ori~=same.tgt
   Tiles[same.ori]=Tiles[same.tgt]
   for i=1,maxset do
       Maps.Obj.Obj("Sym"..i).TextureFile = Tiles[i]
       Maps.Obj.Obj("Sym"..i).R=0
       Maps.Obj.Obj("Sym"..i).G=180
       Maps.Obj.Obj("Sym"..i).B=255       
       Touched[i]=false
   end          
end

function TouchSymbol(idx)
   local c = {[true]={r=255,g=255,b=0},[false]={r=0,g=180,b=255}}
   local tile = Maps.Obj.Obj("Sym"..idx)
   Touched[idx] = not Touched[idx]
   local cc = c[Touched[idx]]
   tile.R = cc.r
   tile.G = cc.g
   tile.B = cc.b
   local solved = true
   for i=1,#Touched do
       CSay("idx="..sval(idx)..";Touched["..i.."]="..sval(Touched[i]).."; i="..sval(i).."; same.ori="..sval(same.ori).."; solved = "..sval(solved))
       solved = solved and (Touched[i]==(i==same.ori or i==same.tgt))
   end
   if solved then
      SFX("Audio/SFX/General/Solved.ogg")
      for i=1,#Touched do
          Maps.Obj.Kill('Sym'..i,1)
      end
      --[[
      for i=1,4 do
          Maps.Obj.Kill("Block"..i,1)
      end
      ]]
      Maps.Obj.Kill("PuzBlock",1)
      Done(DonePuzzle)    
      Touched=nil
      Symbols=nil
      for ch in EachParty() do RPG.IncStat(ch,"EXP",-math.ceil((480/(skill^2)))) end
   end
end
              

function wflow(d)
    local obj
    local ww,wh=tonumber(SW) or Screen.width(),tonumber(SH) or Screen.height()
    if Maps.Obj.Exists(d.tag)==0 then
       obj = Maps.Obj.CreateObject('TiledArea',d.tag)
       obj.Impassible=0
       obj.ForcePassible=0
       obj.TextureFile=d.tex
       obj.Dominance=d.dom
       obj.SetAlpha(d.alpha)
       obj.tag=d.tag
       CSay('Created "'..d.tag.."' on layer '"..Maps.LayerCodeName.."'")
       Maps.Remap()
    else
       obj=Maps.Obj.Obj(d.tag)   
    end
    obj.x=Maps.CamX
    obj.y=Maps.CamY
    obj.w=ww
    obj.h=wh
    obj.InsertX = math.floor(obj.X*d.mul)
    obj.InsertY = math.floor(obj.Y*d.mul)
    -- DarkText("Water: "..obj.tag..":  coord={"..obj.x..","..obj.y.."}; ins={"..obj.insertx..","..obj.inserty.."}; dom="..obj.dominance,5,d.debugy,0,0,0,180,255) -- debug
end

function MAP_FLOW()
    --for e in each(effect) do for e1 in each(e) do FlowMoveTex(e1) end end
    for e in each(effect[Maps.LayerCodeName]) do FlowMoveTex(e) end
    for w,d in pairs(water) do wflow(d) end    
end


function GALE_OnLoad()
    local plasma = {}
    plasma.textures = {
       'gfx/Textures/Plasma/TiledPlasma.png',
       'gfx/Textures/Plasma/TiledPlasma.png',
       "GFX/TEXTURES/SINUS/DARK SINUS/HSINUS.PNG",
       "GFX/TEXTURES/SINUS/LIGHT SINUS/VSINUS.PNG"
    }
    plasma.colors = {
            {0,0,50},
            {0,0,50},
            {0,0,50},
            {0,0,50}
        }
    plasma.speed = {
           {2,-2},
           {-2,2},
           {1,0},
           {0,1}
        }
    effect = SetupGreatMagic(plasma,21)         
    ZA_Enter('SymStart',InitPuzzle); for i=1,16 do ZA_Enter('Sym'..i,TouchSymbol,i) end
end
