--[[
  arrowslide.lua
  Version: 17.03.28
  Copyright (C) 2017 Jeroen Petrus Broks
  
  ===========================
  This file is part of a project related to the Phantasar Chronicles or another
  series or saga which is property of Jeroen P. Broks.
  This means that it may contain references to a story-line plus characters
  which are property of Jeroen Broks. These references may only be distributed
  along with an unmodified version of the game. 
  
  As soon as you remove or replace ALL references to the storyline or character
  references, or any termology specifically set up for the Phantasar universe,
  or any other univers a story of Jeroen P. Broks is set up for,
  the restrictions of this file are removed and will automatically become
  zLib licensed (see below).
  
  Please note that doing so counts as a modification and must be marked as such
  in accordance to the zLib license.
  ===========================
  zLib license terms:
  This software is provided 'as-is', without any express or implied
  warranty.  In no event will the authors be held liable for any damages
  arising from the use of this software.
  Permission is granted to anyone to use this software for any purpose,
  including commercial applications, and to alter it and redistribute it
  freely, subject to the following restrictions:
  1. The origin of this software must not be misrepresented; you must not
     claim that you wrote the original software. If you use this software
     in a product, an acknowledgment in the product documentation would be
     appreciated but is not required.
  2. Altered source versions must be plainly marked as such, and must not be
     misrepresented as being the original software.
  3. This notice may not be removed or altered from any source distribution.
]]


arrowdir = {}

function arrowslide_enter()
     local wind = arrowdir[Maps.LayerCodeName] or "North"
     PartyPop("Puz",arrowdir[Maps.LayerCodeName] or "North")
     arrow_playernum = rand(0,3)
     arrow_player = "PLAYER"..arrow_playernum
     if arrow_playernum==0 then arrow_player="PLAYER" end
     --Var.D('$CRACKPLAYER',arrow_player)
     MS.Load("CRACKPUZ","Script/Flow/ArrowSlide.lua")
     -- Actors.WalkToSpot(arrow_player,"Puz_Start")
     -- TurnPlayers(arrowdir[Maps.LayerCodeName] or "North")
     LAURA.Flow("CRACKPUZ");
     (arrowslide_startfunction or Nothing)()
     --[[
     local PL = Actors.Actor(arrow_player)
     local ST = Maps.Obj.Obj("Puz_Start")
     Actors.StopWalking(arrow_player)
     Actors.StopMoving(arrow_player)
     PL.X = ST.X
     PL.Y = ST.Y
     ]]
     --[[
     Maps.Obj.Kill('PLAYER')
     for i=1,3 do
        if RPG.PartyTag(i)~="" then Maps.Obj.Kill("PLAYER"..i) end
     end
     SpawnPlayer('Puz_Start',wind)
     ]]
     Actors.Spawn('Puz_Start','GFX/Actors/Bundled/Player','CRACKPLAYER')
     Actors.ChoosePic("CRACKPLAYER",upper(RPG.PartyTag(arrow_playernum).."."..wind))
     Var.D("$CRACKCHAR",upper(RPG.PartyTag(arrow_playernum)))
     for i=1000,0,-25 do 
         Actors.Actor("PLAYER" ).SetAlpha(i)
         Actors.Actor("PLAYER1").SetAlpha(i)
         Actors.Actor("PLAYER2").SetAlpha(i)
         Actors.Actor("PLAYER3").SetAlpha(i)
         Cls()
         DrawScreen()
         -- Image.SetAlphaPC(100)
         Flip()
     end    
     --[[
     ActorRepos("PLAYER","Puz_Jake",wind,RPG.PartyTag(0))
     ActorRepos("PLAYER1","Puz_Marrilona",wind,RPG.PartyTag(1))
     ActorRepos("PLAYER2","Puz_Dandor",wind,RPG.PartyTag(2))
     ActorRepos("PLAYER3","Puz_HandoStillor",wind,RPG.PartyTag(3))
     ActorRepos(arrow_player,"Puz_Start",wind,RPG.PartyTag(arrow_playernum))
     ]]
     MS.Run("CRACKPUZ","InitPuzzle")
end     


function arrowslide_onload(startfunction)
    ZA_Enter("Enter",arrowslide_enter)
    arrowslide_startfunction = startfunction
end    
