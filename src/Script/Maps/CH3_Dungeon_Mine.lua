--[[
**********************************************
  
  CH3_Dungeon_Mine.lua
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
 
version: 17.03.18
]]


function InitPuzzle()
   DonePuzzle="&DONE.MINE.PUZZLE.SOLVED["..Maps.LayerCodeName.."]"
   local maxset=16
   if Maps.LayerCodeName=="#007" then maxset=25 end
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
       Maps.Obj.Obj("Sym"..i).G=0
       Maps.Obj.Obj("Sym"..i).B=255       
       Touched[i]=false
   end          
end

function TouchSymbol(idx)
   local c = {[true]={r=0,g=180,b=255},[false]={r=0,g=0,b=255}}
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
      for ch in EachParty() do RPG.IncStat(ch,"EXP",-math.ceil((240/(skill^2)))) end
   end
end


function PostBoss()
    PartyPop("Feena","North")
    -- MapText("TOMBA")
    Maps.Obj.Kill("TombBlock",1)
    -- MapText("TOMBB")
    LoadMap("PRO_Dungeon_Tomb")
    Maps.GoToLayer("#001")
    Maps.Obj.Kill("PRC_PROLOGUE",1)
    GoToLayer("#000","Start")
    Maps.Obj.Kill("Remove",1)
end

function ToTomb()
    LoadMap("PRO_Dungeon_Tomb")
    GoToLayer("#000","Start")    
end

function Boss()
   Schedule("MAP","PostBoss")
end   



function SecretDungeon()
    LoadMap("CH3_Dungeon_Garden")
    GoToLayer("#000","Start")
end

function GALE_OnLoad()
    MapHide('Secret')
    ZA_Enter("ToSecretDungeon",SecretDungeon)
    ZA_Enter("InitPuzzle",InitPuzzle)
    ZA_Enter("ToTomb",ToTomb)
   for i=1,25 do ZA_Enter("Sym"..i,TouchSymbol,i) end
    
end    
