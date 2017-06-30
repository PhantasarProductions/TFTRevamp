--[[
**********************************************
  
  Outtakes.lua
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
 
version: 17.06.30
]]

local actors = { Jake              = 'W.K. "Wicky77" Chan',
                 Marrilona         = 'Evelyn "Pachelle" Klein-Hulse',
                 Dandor            = 'Jeroen "Tricky" Broks',
                 ['Hando Stillor'] = 'Jeroen "Tricky" Broks',
                 ['Chief Werrington']
                                   = 'Wouter "wout66" Wershkull',
                 Fandalora         = 'Wouter "wout66" Wershkull',
                 Feenalaria        = 'Marieke "FOM"',
                 ['Sasha Funda']   = 'Marieke "FOM"',
                 ['Gedrio Fulla']  = 'Jeroen "Tricky" Broks',
                 Harry             = 'Jeroen "Tricky" Broks',   
                 Krandar           = 'Jeroen "Tricky" Broks',
                 Nostramantu       = 'Jeroen "Tricky" Broks',
                 Sandra            = 'Angela "Linvala Kemellon" Nagtzaam',
                 Yannee            = 'Evelyn "Pachelle" Klein-Hulse'                                
               }

local data = {}
local pics = {}
--local bya  = {}
local p = 0


local function AllowNewGamePlus()
   local sgd = LAURA.GetSaveDir()
   local slash = "/"
   -- @IF $WINDOWS
   slash = "\\"
   -- @FI
   local file = sgd..slash.."ODETOJOY"
   local bt = io.open(file,"w")
   local lyrics =
[[
Freude, schoener Goetterfunken,
Tochter aus Elysium,
Wir betreten feuertrunken,
Himmlische, dein Heiligtum!
Deine Zauber binden wieder
Was die Mode streng geteilt;
Alle Menschen werden Brueder
Wo dein sanfter Fluegel weilt.

Est Europa nunc unita
Et unita maneat
Una in diversitate
Pacem mundi augeat.
Semper regnant in Europa
Fides et iustitia
Et libertas populorum
In majore patria.
Cives, floreat Europa
Opus magnum vocat vos
Stellae signa sunt in caelo
Aurae, quae iugnant nos
]]
     if not bt then
         Cls()
         Image.NoFont()
         Image.DText("It appears it was not possible to write the New Game+",0,0)
         Image.DText("acces file. This will mean you cannot access the New Game+",0,15)
         Flip()
         Time.Sleep(1500)
         CSay("Could not save: "..file)
         return
     end
     bt:write(lyrics)
     bt:close()
     CSay("Saved: "..file)         
end   

function MAIN_FLOW()
   local r = data[p]
   if p==0 or Audio.Playing('OTC')==0 then 
      p = p + 1
      r = data[p]
      if not r then os.exit() end
      Audio.Load(r.file,'OTA')
      Audio.Play('OTA','OTC')
   end
   Image.Tile('PCS_BACK',math.sin(Time.MSecs()/10000)*500,math.cos(Time.MSecs()/12345)*500)
   Image.Show(r.pic,5,5)
   SetFont('OuttakesChar')
   Color(180,255,0)
   DarkText(r.character,otw/2,100,2,0,180,255,0)
   SetFont('OuttakesAct')
   Color(255,180,0)
   DarkText(r.acteur,otw/2,200,2,0,255,180,0)
   Color(0,180,255)
   SetFont('OuttakesChar')
   DarkText("Outtakes",SW,SH,1,1,0,180,255)
   Flip()
end

function GALE_OnLoad()
    StopMusic()
    AllowNewGamePlus()
    local theend = Image.Load('gfx/logo/the end.png'); Image.HotCenter(theend)
    otx,oty,otw,oth = GetViewPort()
    Cls(); Image.Show(theend,otw/2,oth/2); Flip(); Time.Sleep(2000)
    if JCR6.Exists('ID/ID.Vocal.Full')==0 then os.exit() end
    for f in iJCR6Dir() do
        local uf = upper(f)
        if prefixed(uf,"VOCALS/OUTTAKES/") then
           local su = mysplit(f,"/")
           local acteur = su[3]
           local sample = su[4]
           local aname  = right(acteur,#acteur-4)
           pics[acteur] = pics[acteur] or Image.Load('Gfx/Outtakes/'..aname..".png")
           local record = { pic = pics[acteur], 
                            file = f,
                            ufile = uf,
                            character = aname,
                            acteur = actors[aname]
                            }
           data[#data+1]=record                 
        end
    end
end    
