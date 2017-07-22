--[[
**********************************************
  
  NGP_HUB_Heroes.lua
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
 
version: 17.07.22
]]

function NPC_Zyviola()
    MapText('ZYVIOLA')
    MS.LoadNew("BESTIARY","Script/Flow/Bestiary.lua")
    MS.Run('BESTIARY',"Update")
    LAURA.Flow('BESTIARY')
end    

function NPC_SymphoNica()
    MapText('SYMPHONICA')
    if not musicavailable then
       MapText('NOMUSIC')
       return
    end
    MS.LoadNew('JUKEBOX','Script/Flow/Jukebox.lua')
    LAURA.Flow('JUKEBOX')
    StopMusic()
end    

function NPC_Wanindra()
    MapText('WANINDRA')
    Shop('NGP_WANINDRA')
end
    
function NPC_Colportarus()
    MapText('COLPORTARUS')
    Shop('NGP_COPORTARUS')
end

function GALE_OnLoad()
   local gh = loadstring(Var.C('$HALLOFHEROES.PEOPLE').."\n return ret")
   local rep = gh()
   local be = {'Zyviola','SymphoNica','Wanindra','Colportarus'}
   local pvnw = {'she','he','she','he'}
   for i,c in ipairs(be) do
       if not rep[c] then
          CSay('Removed '..c..' because '..pvnw[i]..' has not yet been unlocked for the Hall of Heroes')
          Maps.Obj.Kill('NPC_'..c)
       else
          CSay(c.." will stay, as "..pvnw[i].." was found an unlocked by the player")
       end
   end
end          
