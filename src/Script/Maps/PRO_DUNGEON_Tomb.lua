-- Property of Jeroen P. Broks
-- May not be extracted from this game.

-- @USE /Script/Use/Specific/EndOfPrologue.lua


DonePuzzle = "&DONE.FEENALARIA.TOMB.PUZZLE.MATCH.SOLVED"

function MapMusic()
   if not Done("&DONE.SANDRA.OPEN.DANDOR.PROLOGUE") then 
      CSay("Skip the music for now. Let Sandra speak first.")
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
    MapMusic()
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

-- Operating switch bridges
function NPC_Brug()
    if Done('&DONE.FEENALARIASTOMB.SWITCH.BRIDGE.DANDOR.PROLOGUE') then return end
    Maps.Obj.Obj('NPC_Brug').TextureFile = "GFX/Textures/Switch/Left.png"
    Maps.PermaWrite('Maps.Obj.Obj("NPC_Brug").TextureFile = "GFX/Textures/Switch/Left.png"')
    for i=0,1000 do
        Cls()
        for brug=1,2 do
            Maps.Obj.Obj("BRUG"..brug).SetAlpha(i)
        end
        DrawScreen()
        Flip()
    end        
    for brug=1,2 do
        Maps.Obj.Obj("BRUG"..brug).SetAlpha(1000)
        Maps.Obj.Obj("BRUG"..brug).ForcePassible=1
        Maps.PermaWrite('Maps.Obj.Obj("BRUG'..brug..'").SetAlpha(1000)')
        Maps.PermaWrite('Maps.Obj.Obj("BRUG'..brug..'").ForcePassible=1')
    end
    Maps.Remap()
end

function Boss()
  ClearCombatData()
  Var.D("$COMBAT.FOE_1","Boss/ShadowSweeper")
  Var.D("$COMBAT.POSFOE_1","CENTER")
  Var.D("$COMBAT.MUSIC","Music/Boss/BrutalSong.ogg")
  Var.D("$COMBAT.ARENA","Caves.png")
  StartBoss("Master of Darkness","Shadow Sweeper")   
end

-- Entering and leaving Feena's Grave
function EnterGrave() GoToLayer('GRAVE','Start')    Music('Hub/Angevin.ogg')     end
function ExitGrave()  GoToLayer('#001','FromGrave') Music("Dungeon/D'amour.ogg") end

-- Feena's Tomb itself

function Feena_Prologue()
   local P = Actors.Actor('PLAYER')
   P.Walking = 0
   P.Moving = 0
   Actors.WalkToSpot('PLAYER','Prologue_Dandor')
   MapText('FEENA_PROLOGUE_1')
   Music('Sys/Silence.ogg')
   MapText('FEENA_PROLOGUE_2')
   for i=2,3 do CreateSkill('Dandor',i,1) end
   EndOfPrologue('Dandor')
   -- Sys.Error('Rest not scripted yet, sorry!')
end

function Feena_Revival()
   Sys.Error("Sorry, this event is not yet available")
end   

function Feena_Chain()
    if not Done("&DONE.FEENATOMB.DANDOR.PROLOGUE.ENDING") then Feena_Prologue() return end
    if not Done("&DONE.FEENATOMB.FULLGAME.REVIVAL.FEENA") then Feena_Revival()  return end
end    


function ToMine()
   LoadMap("CH3_Dungeon_Mine")
   GoToLayer("#010","Einde")
end   

function GALE_OnLoad()
   ZA_Enter('PuzzleField',InitPuzzle)
   for i=1,16 do ZA_Enter("Sym"..i,TouchSymbol,i) end
   --ZA_Enter('BackTo01',To01)
   ZA_Enter('To001',To01)
   ZA_Enter('To007',To07)
   ZA_Enter('EnterGrave',EnterGrave)
   ZA_Enter('ExitGrave',ExitGrave)
   ZA_Enter("GrafEvent",Feena_Chain)
   ZA_Enter("ToMine",ToMine)
end