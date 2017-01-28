--[[
**********************************************
  
  Spirata_StatusChange.lua
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
 
version: 17.01.28
]]
-- @IF IGNORE
local StatusChanges = {}
-- @FI



StatusChanges.Spirata = {
    
    AltMove = function(me)
                 Sys.Crash("Spirata attack comes later") 
              end,

    DrawReplace = true,                                          
    
    
    DrawFighter = function(ch)
                         local mychar = fighterbytag[ch]
                         mychar.StatusChanges = { Spirata = StatusChanges.Spirata }
                         mychar.statuschanges = mychar.StatusChanges -- Rule out all other status changes.
                         if mychar.group=='Foe' then
                            Sys.Error("Yeah, right a Foe as Spirata. Your mother was a hamster and your father smelt of elderberries!")
                         else
                           local itag = "SPIRATA "..ch                           
                           Image.LoadNew(itag,"GFX/Combat/Fighters/Hero/"..ch..".Spirata.png"); Image.Hot(itag,Image.Width(itag)/2,Image.height(itag))
                           Image.Show(itag,mychar.x,mychar.y)                            
                         end 
                       end   
    
}


-- @IF IGNORE
return StatusChanges
