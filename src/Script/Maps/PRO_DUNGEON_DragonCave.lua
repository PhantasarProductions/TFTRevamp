--[[
**********************************************
  
  PRO_DUNGEON_DragonCave.lua
  (c) Jeroen Broks, 2016, 2017, All Rights Reserved.
  
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
 
version: 17.01.06
]]

-- @USE /Script/Use/Specific/EndOfPrologue.lua

function BackToTown()
   LoadMap('PRO_TOWN_VANDAR')
   GoToLayer('town','FromCave')
end

function NPC_Guard()
   MapText('GUARD1')
   local y = -Maps.CamY
   for i=y,SH do
       Maps.CamY=-i
       Cls()
       DrawScreen()
       Flip()
   end
   Actors.Actor('PLAYER').Visible=0
   Actors.Actor('PLAYER').Y=SW*100   
   Maps.Remap()
   MapText('GUARD2')
   for i=SH,0,-1 do
       Cls()
       Maps.CamY=-i
       DrawScreen()
       Flip()
   end
   MapText('GUARD3')
   Maps.Obj.Kill('NPC_Guard',1)
   Maps.Obj.Kill('Guard_Block',1)
   GoToLayer('#001','Start')
   MapText('GUARD4')
end      

function SetUpPuzzle()
   if PuzzleData then return end   
   PuzzleData = {}; Puzzle = PuzzleData
   PuzzleData.Today = (Sys.Val(left(Time.Date(),2))); CSay("Today is "..PuzzleData.Today)
   PuzzleData.Slots = {}; local slots = PuzzleData.Slots -- I love reference based stuff. You too?
   for i= 1 , 3 do
       repeat slots[i]=rand(1,31) until slots[i]~=PuzzleData.Today 
   end
   Puzzle.DontTouch = rand(1,3)
   slots[Puzzle.DontTouch] = Puzzle.Today
end

function NTSign(num) 
  Var.D("%NOTTODAYTAG",PuzzleData.Slots[num])
  MapText('NOTTODAYTAG')
end

function NPC_S1() NTSign(1) end
function NPC_S2() NTSign(2) end
function NPC_S3() NTSign(3) end

puzzledone = "&DONE.PROLOGUE.DRAGONCAVE.NOTTODAY"

function NTSwitch(num)
    if CVV(puzzledone) then return MapText('STUCK') end
    switched = switched or {false,false,false}
    switched[num] = not switched[num]
    local obj = Maps.Obj.Obj('NPC_SW'..num)
    obj.TextureFile = "GFX/Textures/Switch/"..({[true]='Right',[false]='Left'})[switched[num]]..".png"
    local goed = true
    for i=1,3 do       
        goed = goed and switched[i]==(PuzzleData.DontTouch~=i)
        CSay("i = "..i.."; goed = "..sval(goed).."; switched["..i.."] = "..sval(switched[i]).."; condition = "..sval(PuzzleData.Today~=i))
    end    
    if goed then
       Done(puzzledone)
       Maps.CamY=0
       local deuren = { {Maps.Obj.Obj('Puz_deur_links'),-1},{Maps.Obj.Obj('Puz_deur_rechts'),1}}
       for i=0,40 do
           for deur in each(deuren) do deur[1].X=deur[1].X+deur[2] end
           Cls()
           DrawScreen()
           Flip()
       end
       Maps.Obj.Kill('Puz_deur_links' ,1)
       Maps.Obj.Kill('Puz_deur_rechts',1)
       Maps.Remap()
    end
end

function NPC_SW1() NTSwitch(1) end
function NPC_SW2() NTSwitch(2) end
function NPC_SW3() NTSwitch(3) end


function NPC_Jenny()
  MapText("JENNY_PREBOSS")
  Schedule("MAP","PostBoss_Jenny")
  ClearCombatData()
  Var.D("$COMBAT.FOE_1","Boss/GobKing")
  Var.D("$COMBAT.POSFOE_1","CENTER")
  Var.D("$COMBAT.MUSIC","Music/Boss/BrutalSong.ogg")
  Var.D("$COMBAT.ARENA","Caves.png")
  StartBoss("Leader of the Goblins","Goblin King")
end

function PostBoss_Jenny()
  TurnPlayer('North')
  MapText('JENNY_POSTBOSS')
  Maps.Obj.Kill("NPC_Jenny",1)
  LoadMap('PRO_Town_Vandar')
  GoToLayer('chief','PostBoss'); TurnPlayer('North')
  MapText('POST_BOSS')
  EndOfPrologue('Jake')
  -- Sys.Error('The rest is not yet scripted')
end  

function Jenny_BackZone()
  ({
      [0] = function() GoToLayer('#008',"Start") end,
      [1] = function() 
              Actors.StopMoving('PLAYER')
              Actors.StopWalking('PLAYER')
              Actors.MoveToSpot("PLAYER","Einde")
              TurnPlayer("North")
              NPC_Jenny()
            end  
   })[Maps.Obj.Exists('NPC_Jenny')]()
end

   
function GALE_OnLoad()
   MapHide('Secret')
   ZA_Enter('StartPuzzle',SetUpPuzzle)
   --ZA_Enter('REMAP',Maps.Remap)
   ZA_Enter('Jenny_BackZone',Jenny_BackZone)
   ZA_Enter('BackToTown',BackToTown)
end    
