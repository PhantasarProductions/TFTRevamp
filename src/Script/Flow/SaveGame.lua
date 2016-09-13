--[[
  SaveGame.lua
  Version: 16.09.13
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

PM = PM or 0

Image.LoadNew("SG_SAVING","GFX/Loading/Saving.png"); Image.HotCenter("SG_SAVING")


function Scan()
local num
highest = 0
files = {}
listout = {}
PM = PM or 0
dir = LAURA.GetSaveDir() .. "/" .. LAURA.User()
if Dir.DirExists(dir)>0 then 
  Dir.GetDir(dir)
  local ak,thisfile
  for ak=1,Dir.DirLen() do
    thisfile = Dir.DirEntry(ak)
    table.insert(files,thisfile)
    num = Sys.Val(replace(thisfile,"TFTSG_","$"))
    if num>highest then highest = highest + 1 end
    listout[thisfile] = { file = thisfile }    
    if thisfile==LastFile then P=ak end
    end
  end  
local newfile = 'TFTSG_'..DEC_HEX(highest+1)    
listout[newfile] = { file=newfile, newfile = true, name = "[[ New File ]]", nopic=true }
files[#files+1] = newfile    
Scrolled = false    
P = P or 1
CSay('P = '..sval(P))
end

GALE_OnLoad = Scan

function GetMeta(f)
   local s = LAURA.StringFromSave(f,"SWAP/SAVEMETA/META")
   local sl
   local ret = {}
   for l in each(mysplit(s,"\n")) do
       ls = mysplit(l,":")
       if ls[1]=="Time" then 
          ret.Time = ""
          for i=2,#ls do 
              if #ret.Time>0 then ret.Time = ret.Time .. ":" end
              ret.Time = ret.Time .. ls[i]
          end
       else
          ret[ls[1]] = ls[2]
      end
   end
   return ret       
end

function GetName(f)
   local meta = GetMeta(f)
   return meta.Location .. "   ("..meta.Time..")   "
end   

function Save(f)
  Cls()
  Image.Tile('PCS_BACK')
  Image.Show("SG_SAVING",Center_X,Center_Y)
  Flip()
  SaveMeta()
  LAURA.Save(f)
  MS.Destroy("SAVE")
  LAURA.Flow("FIELD")
end  

function MAIN_FLOW()
  -- Start
  local allowsave
  local mx,my = GetMouse()
  Cls()
  Image.Tile('PCS_BACK')
  -- Background (if we have one)
  local myentry = listout[files[P]]
  if not myentry then
     CSay("files["..sval(P).."] offered an empty list out "..sval(files[P]))
  end     
  if not myentry.nopic then
     if myentry~=lastentry then LAURA.ImageFromSave(LAURA.User().."/"..myentry.file,"SWAP/SAVEMETA/SHOT.png","SaveGame_Shot"); Image.HotCenter("SaveGame_Shot") end
     Image.Color(0,100,0)
     Cls()
     Image.Show("SaveGame_Shot",Center_X,Center_Y)
     white()
     lastentry = myentry
  end
  -- All entries we got
  local c = 127 + (math.sin(Time.MSecs()/250)*100)
  for i,f in ipairs(files) do
      myentry = listout[f]
      myentry.name = myentry.name or GetName(LAURA.User().."/"..f)
      if i==P then
         color(c/2,c,c/2)
         Image.Rect(40,(100+i*25)-PM,SW-80,25)
      end
      if mx>40 and mx<SW-40 and my>(100+i*25)-PM and my<((100+i*25)-PM)+25 and INP.MouseH(1)==1 then
         if i==P then allowsave=true else P=i end
      end
      SetFont('SaveGameLine')
      DarkText(myentry.name,50,100+i*25,0,0,200,255,200)
  end
  while (100+P*25)-PM>SH-100 do PM=PM+2 end
  while (100+P*25)-PM<100    do PM=PM-1 end
  allowsave = allowsave or INP.KeyH(KEY_SPACE)==1 or INP.KeyH(KEY_RETURN)==1 or INP.KeyH(KEY_ENTER)==1 or joyhit('CONFIRM')
  -- Mouse
  ShowMouse()
  -- Flip
  Flip()
  -- Go
  if allowsave then 
    Save(LAURA.User() .. "/" .. files[P])
  elseif INP.KeyH(KEY_ESCAPE)==1 or joyhit('CONFIRM') or INP.MouseH(2)==1 then
    MS.Destroy("SAVE")
    LAURA.Flow("FIELD")
  elseif (INP.KeyH(KEY_UP)==1 or joyhit(joy_up)) and P>1 then 
    P = P - 1  
  elseif (INP.KeyH(KEY_DOWN)==1 or joyhit(joy_down)) and P<#files then 
    P = P + 1
  end
end
