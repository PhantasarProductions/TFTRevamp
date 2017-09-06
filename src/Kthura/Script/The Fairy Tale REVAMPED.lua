--[[
**********************************************
  
  The Fairy Tale REVAMPED.lua
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
 
version: 17.09.06
]]
-- @USEDIR LIBS
-- @USEDIR Use/Anyway

-- If you are poking in this script and encounter errors as a result.
-- The error reporting within the Kthura editor will refer to this file as 0_MyProject.lua in the current version!


function NewTag(prefix)
   local ret
   repeat
      ret = (prefix or "")..DEC_HEX(Time.MSecs())
   until not TagExists(ret)
   return ret   
end

function CSpot_SaveSpot_Show()
    SPOT.DrawMe()
end    


function SPOTCLICKED()
local ME = SPOT.ME()
local oz = { [false]=0, [true]=1}
local result = CLICKED.X>ME.X-5 and CLICKED.X<ME.X+5 and CLICKED.Y>ME.Y-5 and CLICKED.Y<ME.Y+5
CLICKED.RET = oz[ result ]
-- CSay(ME.IDNum..">"..ME.Tag.." CLICKED.X = "..CLICKED.X.." CLICKED.Y = "..CLICKED.Y.."; ME.X = "..ME.X.."; ME.Y = "..ME.Y.."; RETURN "..CLICKED.RET.." << "..sval(result)) -- debug
end

CSpot_Compass_Click = SPOTCLICKED
CSpot_RecoverySpot_Click = SPOTCLICKED
CSpot_SaveSpot_Show = SPOTCLICKED

function CSpot_SaveSpot_Place()
    local tag = NewTag('SSG_')
    local ME = SPOT.ME()
    ME.Tag = tag
    ME.R = 255
    ME.G = 0
    ME.B = 0
    local OBS = OBJ.CreateNew("Obstacle")
    OBS.X = ME.X
    OBS.Y = ME.Y 
    ME.Y  = ME.Y + 32
    OBS.TextureFile = 'GFX/MapSpots/Save.png'
    OBS.Tag = "P"..right(tag,#tag-1)
    CSay("Placed savespot: "..tag.." Tied to exitspot: "..right(tag,#tag-1))
end


function CSpot_RecoverySpot_Show()
    SPOT.DrawMe()
end    

function CSpot_TravelEmblem_Place()
    local tag = NewTag('STE_')
    local ME = SPOT.ME()
    ME.Tag = tag
    ME.R = 255
    ME.G = 0
    ME.B = 0
    local OBS = OBJ.CreateNew("Obstacle")
    OBS.X = ME.X
    OBS.Y = ME.Y 
    ME.Y  = ME.Y + 32
    OBS.TextureFile = 'GFX/MapSpots/Travel.png'
    OBS.Tag = "P"..right(tag,#tag-1)
    CSay("Placed savespot: "..tag.." Tied to exitspot: "..right(tag,#tag-1))
end


function CSpot_RecoverySpot_Show()
    SPOT.DrawMe()
end    




function CSpot_RecoverySpot_Place()
    local tag = NewTag('SRC_')
    local ME = SPOT.ME()
    ME.DataSet("ITEM",Item)
    ME.Tag = tag
    ME.R = 180
    ME.G = 255
    ME.B = 0
    local OBS = OBJ.CreateNew("Obstacle")
    OBS.X = ME.X
    OBS.Y = ME.Y 
    ME.Y  = ME.Y + 32
    OBS.TextureFile = 'GFX/MapSpots/Recover.png'
    OBS.Tag = "P"..right(tag,#tag-1)
    CSay("Placed savespot: "..tag.." Tied to exitspot: "..right(tag,#tag-1))
end


function CSpot_Chest_Place(lock)
    local ME = SPOT.ME()
    local Item = INPUT.Ask("Item Code Name (or prefix with CASH: to let the chest contain money)");
    if Item=="" then SPOT.Kill() return end
    ME.Kind = "Obstacle"
    ME.TextureFile = "GFX/Treasure/Chest.png"
    ME.Tag = NewTag("CHEST_")   
    ME.DataSet('Item',Item) 
    if lock=="LOCKME" then
       local required =  INPUT.Ask("Item Code Name for the item required to have to open this chest")
       ME.DataSet("RequiredItem",required)
    elseif lock == "NEWGP" then
       ME.R=0
       ME.DataSet("NewGame+","Only")   
    end   
end

function CSpot_LockedChest_Place()
    CSpot_Chest_Place("LOCKME")
end    

function CSpot_NewGamePlusChest_Place()
    CSpot_Chest_Place("NEWGP")
end

function CSpot_RandomItem_Place()
    local ME = SPOT.ME()
    ME.Kind = "Obstacle"
    ME.TextureFile = "GFX/Treasure/BAG.png"
    ME.Tag = NewTag("RNDITEM_")    
end


function CSpot_Compass_Place()
    local ME = SPOT.ME()
    local Name = INPUT.Ask("Spot Name");
    if Name=="" then SPOT.Kill() return end
    ME.R = 0
    ME.G = 180
    ME.B = 255
    ME.Tag = NewTag("COMPASS")
    ME.DataSet('Name',Name)
end

function CSpot_Compass_Show()
    SPOT.DrawMe()
    if SPOT.ME().DataGet('Name')=="" then SPOT.Kill() CSay("Killed Broken Compass Spot  "..SPOT.ME().Tag) end -- Kill all broken spots    
end    


function CSpot_MExit_Place()
    local tag = INPUT.Ask("Tag?");
    local ME = SPOT.ME()
    if not tag then SPOT.Kill() return end
    ME.Kind = "Obstacle"
    ME.Tag  = "Obstacle_"..tag
    ME.TextureFile = "GFX/Textures/Path Of Magic/ShadedExit.png"
    ME.Dominance=10
    local OBS = OBJ.CreateNew("Zone")
    OBS.X = ME.X-32
    OBS.Y = ME.Y-32
    OBS.W = 64
    OBS.H = 64
    OBS.Tag = tag
    OBS.Impassible = 0
    OBS.Dominance = 5
end    

function CSpot_BlackOrb_Place()
    local ME = SPOT.ME()
    ME.Kind = "Obstacle"
    ME.TextureFile = "GFX/Field Icons/FSORB.png"
    ME.Tag = NewTag("BLACKORB_")
end


function CSpot_BlueSeal_Place()
    local ME = SPOT.ME()
    ME.Kind = "Obstacle"
    ME.TextureFile = "GFX/Textures/Seal/Seal.png"
    ME.FrameSpeed=0
    ME.Dominance=18
    ME.Tag = "NPC_BlueSeal"
end
