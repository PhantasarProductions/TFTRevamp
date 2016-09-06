--[[
  Scenario.lua
  
  version: 16.09.06
  Copyright (C) 2016 Jeroen P. Broks
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
function ProcessBLine(Rec,Prefix,DLine)
local Processes = {
    ["ERROR"] = function() Sys.Error("Unknown scenario prefix") end,  -- error
    ["!"] = function(Rec,DLine) Rec.Header = DLine end,               -- header
    ["*"] = function(Rec,DLine) Rec.PicDir = DLine end,               -- Picture directory
    [":"] = function(Rec,DLine) Rec.PicSpc = DLine end,               -- Picture File
    ["%"] = function(Rec,DLine) Rec.AltTxtFont = "Fonts/"..DLine..".ttf"; CSay("Font: "..DLine)  end, -- Alternate font
    ["#"] = function(Rec,DLine) table.insert(Rec.Lines,DLine) end,    -- content
    ["$"] = function(Rec,DLine) Rec.SoundFile = DLine end,            -- sound (if not present the system will try to autodetect it)
    ["-"] = function() end
    }
local P = Processes[Prefix]
if not P then Sys.Error("Unknown scenario prefix - "..Prefix) end
P(Rec,DLine)    
end


function LoadData(file,loadas,merge)
local lang = Var.C("$LANG")
local LineNumber,Line
local crap = JCR6ListFile("Languages/"..lang.."/Scenario/"..file)
local ret = {}
local section = "[rem]"
local L
local Prefix,DLine,WorkRec
btdata = btdata or {}
if merge then ret = btdata[loadas or file] or {} end
CSay("Loading BoxText Data: "..file)
for LineNumber,Line in ipairs(crap) do
    L = Str.Trim(Line)
    if L~="" then
       if left(L,1)=="[" and right(L,1=="]") then
          section = L
       else
          -- The select statement below is provided through the pre-processor built in the GALE system.
          -- @SELECT section
          -- @CASE   "[rem]"
          -- @CASE   "[tags]"
             ret[L] = {}
          -- @CASE   "[scenario]"
             Prefix = left(L,1)
             DLine = right(L,len(L)-1)
             -- CSay("ReadLine: "..L.." >> Prefix: "..Prefix) -- Debug line.
             if (not WorkRec) and Prefix~="@" and Prefix~="-" then Sys.Error("Trying to assign data, while no boxtext record has yet been created","Line,"..LineNumber) end
             if Prefix=="@" then
                WorkRec = { Lines = {} }
                table.insert(ret[DLine],WorkRec)                
             else
                ProcessBLine(WorkRec,Prefix,DLine)   
                end
          -- @DEFAULT
             Sys.Error("Unknown language section: "..section,"Line,"..LineNumber)   
          -- @ENDSELECT          
          end
       end
    end
-- Load Images
local k,i,tag,rec
local picfile,picref
for k,tag in pairs(ret) do for i,rec in pairs(tag) do
     picfile = "GFX/Portret/"..sval(rec.PicDir).."/"..sval(rec.PicSpc)..".png"
     picref = upper(rec.PicDir).."."..upper(rec.PicSpc)
     if Image.Exist(picref)==0 and JCR6.Exists(picfile)==1 then 
        Image.AssignLoad(picref,picfile) 
        portret[picref]=true 
        CSay('Loaded '..picfile..' on '..picref.." (BoxText)") 
     elseif Image.Exist(picref)~=0 then
        portret[picref]=true
        end
     if portret[picref] then rec.PicRef=picref; end 
     end end
-- Auto Tie Sound Files
for k,tag in pairs(ret) do for i,rec in pairs(tag) do
    if JCR6.Exists("VOCALS/"..file.."/"..tag.."_"..i..".ogg")==1 then rec.SoundFile = file.."/"..tag.."_"..i..".ogg" end
end end     
-- closure
btdata[loadas or file] = ret    
-- print(serialize("btdata",btdata)) -- Debug Line, must be on rem in release
return ret
end
