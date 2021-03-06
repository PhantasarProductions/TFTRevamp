--[[
  Field.Lua
  Version: 17.03.25
  Copyright (C) 2016, 2017 Jeroen Petrus Broks
  
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

-- MS.LoadNew("FIELD","Script/Flow/Field.lua")

LoadMap = LoadMap or function(map)
  MS.Run('FIELD','LoadMap',map)
end

Schedule = Schedule or function(ms,fn)
  MS.Run("FIELD","Schedule",ms..";"..fn)
end  

GetActive = GetActive or function()
end

TurnPlayer = TurnPlayer or function(wind,num)
   local p = wind
   if num then p = p ..";"..num end
   MS.Run('FIELD','TurnPlayer',p)
end

TurnPlayers = TurnPlayers or function(wind)
   MS.Run('FIELD','TurnPlayers',wind)
end

KillWalkArrival = KillWalkArrival or function()
   MS.Run('FIELD','KillWalkArrival')
end   
   
GoToLayer = GoToLayer or function(lay,spot)
   MS.Run("FIELD","GoToLayer",lay..";"..spot)
end   

AddClickable = AddClickable or function(obj)
  MS.LoadNew("FIELD","Script/Flow/Field.lua")
  MS.Run("FIELD","AddClickable",obj)
end  



GotoLayerAutoHide = GotoLayerAutoHide or function(label)
  MS.LoadNew("FIELD","Script/Flow/Field.lua")
  MS.Run("FIELD","GotoLayerAutoHide",label)  
end

SpawnPlayer = SpawnPlayer or function(spot,dir)
  MS.LoadNew("FIELD","Script/Flow/Field.lua")
  MS.Run("FIELD","SpawnPlayer",spot..";"..(dir or "North"))  
end  

function ActorRepos(Actor,spot,dir,ch)
   local spotobj = Maps.Obj.Obj(spot)
   local act = Actors.Actor(Actor)
   act.X,act.Y = spotobj.X,spotobj.Y
   if dir then act.Wind = dir end
   if ch then Actors.ChoosePic(Actor,upper(ch).."."..upper(act.Wind)) end
end   
