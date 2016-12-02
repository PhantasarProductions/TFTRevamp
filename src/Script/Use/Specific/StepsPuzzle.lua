--[[
  StepsPuzzle.lua
  Version: 16.12.02
  Copyright (C) 2016 Jeroen Petrus Broks
  
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

-- @IF IGNORE
 StepsPuzzle = {} -- Fool outliner or I'll have a bit of trouble.
-- @FI 

function StepsFail(tag)
  Maps.Obj.Kill(tag)
  Actors.Actor("PLAYER").Visible=0
  SFX("Audio/Dungeon/FallingDown.ogg")
  DrawScreen()
  Flip()
  Time.Sleep(150)
  -- InitStepsPuzzleA(StepsPuzzle.Table)
  Maps.Obj.Kill("PLAYER")
  SpawnPlayer("Start")
end

-- Right tile?
function StepsAction(tag)
  StepsPuzzle.Field[tag].action(tag)
end

function InitStepsPuzzle(table)
    Loading()
    StepsZADone = StepsZADone or {}
    StepsPuzzle = {}
    StepsPuzzle.Table = table
    StepsPuzzle.Field = {}
    for i=1,table.height do StepsPuzzle.Field[i] = {} end -- Set up all the rows
    StepsPuzzle.Correct = table.correct
    StepsPuzzle.Wrong = ""
    for i=65,90 do
        local have=false
        for i2=1,#table.correct do have=have or mid(table.correct,i2,1)==chr(i) end
        if not have then StepsPuzzle.Wrong = StepsPuzzle.Wrong .. chr(i) end
    end
    CSay("Steps puzzle: ")
    local cur = rand(1,table.width-2)
    -- Let's get ready to rumble
    local action = 10
    for y=1,table.height do
        local range = {cur,cur+1}        
        local ry = tonumber(right(y,1))
        if ry==0 or ry==2 or ry==4 or ry==6 or ry==8 then action=rand(1,10); end
        -- @SELECT action
            -- @CASE 1
               local tocur = rand(1,cur)
               range = {tocur,cur+1}
               cur = tocur
            -- @CASE 2
               local tocur = rand(cur,table.width-2)
               range = {cur,tocur+1}
        -- @ENDSELECT
        for x=1,table.width do
            local ox=((x-1)*(table.tilesize or 32))+(table.plusx or 0)
            local oy=((y-1)*(table.tilesize or 32))+(table.plusy or 0)
            local cell = {}
            cell.tag="TILEX"..x.."Y"..y  
            StepsPuzzle.Field[cell.tag]=cell
            cell.x=ox
            cell.y=oy
            if x>=range[1] and x<=range[2] then
               cell.action=Nothing
               cell.letter=mid(StepsPuzzle.Correct,rand(1,#StepsPuzzle.Correct),1)               
            else   
               cell.action=StepsFail
               cell.letter=mid(StepsPuzzle.Wrong  ,rand(1,#StepsPuzzle.Wrong  ),1)
            end
            if not StepsZADone[cell.tag] then ZA_Enter(cell.tag,StepsAction,cell.tag); StepsZADone[cell.tag]=true end
            if Maps.Obj.Exists(cell.tag)==0 then 
               local o = Maps.Obj.CreateObject("TiledArea",cell.tag)
               o.X = cell.x
               o.Y = cell.y
               o.W = table.tilesize
               o.H = table.tilesize
               o.TextureFile = "GFX/Textures/AlphabetTiles/"..table.tileprefix..cell.letter..".png"
               o.Impassible  = 0    
               o.ForcePassible = 1           
            end
        end
    end
    -- CSay(serialize('StepsPuzzle',StepsPuzzle)) -- Debug.
    Maps.Remap()
end InitStepsPuzzleA=InitStepsPuzzle -- Needed to keep my outliner in line (sigh).
