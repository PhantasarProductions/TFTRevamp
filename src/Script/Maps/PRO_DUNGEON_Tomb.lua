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
   end          
end

function GALE_OnLoad()
   ZA_Enter('PuzzleField',InitPuzzle)
end