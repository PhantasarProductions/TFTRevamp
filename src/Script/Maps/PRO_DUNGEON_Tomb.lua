-- Property of Jeroen P. Broks
-- May not be extracted from this game.

DonePuzzle = "&DONE.FEENALARIA.TOMB.PUZZLE.MATCH.SOLVED"

function MapMusic()
   if not Done("&DONE.SANDRA.OPEN.DANDOR.PROLOGUE") then 
      CSay("Skip the music for now. Let John speak first.")
   else
      OriMapMusic()
   end   
end


function CreateDandorSkill()
   CreateSkill('Dandor',1,30/skill)
end

function Sandra()
    Maps.CamX=0
    Maps.CamY=900
    MapText("SANDRA_A")
    for i=900,0,-1 do
        Cls()
        Maps.CamY=i
        DrawScreen()
        Flip()
    end
    MapText("SANDRA_B")
end

function InitPuzzle()
   if CVV(DonePuzzle) or Symbols then return end
   local r
   Touched = {}
   Symbols = {}
   for f in iJCR6Dir(true) do
       if prefixed(f,'GFX/TEXTURES/SHAPES/') and suffixed(f,".PNG") then Symbols[#Symbols+1] = f end
   end
   assert(#Symbols>=16,"Not enough Symbols. 16 at least required.")
   Tiles = {}
   local SymUsed = {}
   for i=1,16 do
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
   for i=1,16 do
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
   for i=1,16 do
       CSay("idx="..sval(idx)..";Touched["..i.."]="..sval(Touched[i]).."; i="..sval(i).."; same.ori="..sval(same.ori).."; solved = "..sval(solved))
       solved = solved and (Touched[i]==(i==same.ori or i==same.tgt))
   end
   if solved then
      SFX("Audio/SFX/General/Solved.ogg")
      for i=1,16 do
          Maps.Obj.Kill('Sym'..i,1)
      end
      for i=1,4 do
          Maps.Obj.Kill("Block"..i,1)
      end
      Done(DonePuzzle)    
   end
end

-- Chain 001 and 007
function To01() GoToLayer('#001','From007') end
function To07() GoToLayer('#007','Einde') end  


function GALE_OnLoad()
   ZA_Enter('PuzzleField',InitPuzzle)
   for i=1,16 do ZA_Enter("Sym"..i,TouchSymbol,i) end
   --ZA_Enter('BackTo01',To01)
   ZA_Enter('To001',To01)
   ZA_Enter('To007',To07)
end