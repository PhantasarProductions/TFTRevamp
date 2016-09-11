--[[
**********************************************
  
  NarratedEvents.lua
  (c) Jeroen Broks, 2016, All Rights Reserved.
  
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
 
version: 16.09.10
]]

function GoNext()
    Sys.Error("GoNext not properly defined")
end    

function font()
   Image.Font("Fonts/master_of_break.ttf",50)
end

function calc(d)
  font()
  --CSay(serialize("Niets aan de hand",d))
  d.height=0
  d.lines = d.data[d.id].Lines
  --CSay(serialize("Nog steeds niets aan de hand",d.data[d.id]))
  --CSay(serialize("CHECK 2: Niets aan de hand",d))
  if not d.lines then CSay("Warning. Lines is nil") end
  for l in each(d.lines) do d.height = d.height + Image.TextHeight(l) end
  d.y = Center_Y - ((Image.TextHeight("0")*#d.lines)/2)
  if d.data[d.id].SoundFile then
         Audio.Load(d.data[d.id].SoundFile,"PROLOGUE")
         --Audio.Play("PROLOGUE","PROLOGUECHANNEL")
  end   
end

function Load(file)
  CSay("Let's load all the stuff we need for: "..file)
  local tempstory = LoadData("General/PROLOGUES",'PROLOGUES')
  story = {
    data = tempstory[upper(file)],
    id = 1,
    line = 1,
    char = 0,
    lines = {},
    height = 0,
    y = 0,
    timer = 25,
    nexttime = 1500}
  calc(story)  
  if suffixed(upper(file),".END") then 
     GoNext = JINC("Script/JINC/PrologueChains/End.lua")
  else
     GoNext = JINC("Script/JINC/PrologueChains/"..file..".lua")
  end      
end


function GALE_OnLoad()
end

function VoiceOver()
  if not story.data[story.id].SoundFile then return true end
  return Audio.Playing("PROLOGUECHANNEL")==0
end  

function MAIN_FLOW()
  GoNext() -- Skip intro. Only meant for debugging
  -- Clear screen
  Cls()
  -- Show Message
  for i,line in ipairs(story.lines) do
     if i<story.line then 
        DarkText(line,Center_X,story.y+(i*Image.TextHeight("0")),2,2)
     elseif i==story.line then
        DarkText(left(line,story.char),Center_X,story.y+(i*Image.TextHeight("0")),2,2)
     end      
  end
  -- Wait until time or end of vocal and go to the next event as soon as we're done.
  if story.line<=#story.lines then
     story.timer=story.timer-25
     if story.timer<=0 then
        story.timer=25
        story.char = story.char + 1
        if story.char>#story.lines[story.line] then 
           story.line = story.line + 1
           story.char = 0
           --calc(story)
        end
     end
  else
    story.nexttime = story.nexttime - 1
    if story.nexttime<0     and VoiceOver() then
       story.id = story.id + 1
       story.char = 1
       story.line = 1
       story.nexttime = 1500
       if story.id>#story.data then return GoNext() end
       calc(story)  
    end
  end     
  -- Flip
  Flip()
end
