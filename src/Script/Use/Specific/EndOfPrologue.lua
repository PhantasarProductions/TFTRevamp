--[[
**********************************************
  
  EndOfPrologue.lua
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
 
version: 16.10.13
]]

chars = {'Jake','Marrilona','Dandor','Hando Stillor'}

function EndOfPrologue(char)
     LoadMap('PRO_TheEnd')
     GoToLayer('Nothing','Start')
     MapText(upper(char))
     Maps.CamX = 500-Center_X
     Maps.CamY = 500-Center_Y
     GoToLayer(char,"Start")
     for i=1,250 do
         Cls()
         Maps.Draw()
         Flip()
     end
     local chari
     for i,c in ipairs(chars) do if c==char then chari=i end end
     assert(chari,'Unknown character: '..char)    
     Done("&DONE.PROLOGUE["..chari.."]")
     MAPSAVE()
end

function NextPrologue()
     local alldone = true
     for i=1,#chars do
         alldone = alldone and CVV("&DONE.PROLOGUE["..i.."]")
     end
     if alldone then
        Sys.Error('Chain to the maingame not yet possible')
     else
        MS.LoadNew("PROLOGUESELECTCHAR","Script/Flow/PrologueSelectchar.lua")
        LAURA.Flow('PROLOGUESELECTCHAR')
     end       
end
