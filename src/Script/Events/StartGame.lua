--[[
**********************************************
  
  StartGame.lua
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
 
version: 16.09.12
]]



function GALE_OnLoad()
  sterretjes = Image.Load("GFX/Algemeen/Sterretjes.png")
  aarde = Image.Load("GFX/Algemeen/Earth.png")
  bos = Image.Load('GFX/Algemeen/Bushes.png')
  Image.HotCenter(aarde)
  year = tonumber(Str.Right(Time.Date(),4))
  spd = 0.00001
  local tempstory = LoadData("General/Introduction",'STILLOR')
  stillorstory = tempstory.STILLOR; assert ( stillorstory, "Stillor Story not loaded properly ")
  allowvoice = vocals and true -- Use vocals in this matter?
  if vocals then CSay("Vocals are available") else CSay("Vocals are NOT available",255,0,0) end
  if allowvoice then CSay("allowvoice = "..sval(allowvoice)) end
  -- for t in each(mysplit(serialize("Story",stillorstory),"\n")) do CSay(t) end
end

function DebugDump(var,x)
  Image.NoFont()
  local array = mysplit(serialize("data",var),"\n")
  for i,v in ipairs(array) do
      DarkText(v,(x or 5),i*20)
  end
end    

function NextStage()
  Image.Free(sterretjes)
  Image.Free(aarde)
  Image.Free(bos)
  MS.Load("PROLOGUESELECTCHAR","Script/Flow/PrologueSelectchar.lua")
  LAURA.Flow('PROLOGUESELECTCHAR')
  MS.Destroy("STARTGAME")
end

function MAIN_FLOW()
  white()
  -- Earth in space  
  Image.Tile(sterretjes)
  waarde = (waarde or 200) - .02
  if waarde>0 then
    if waarde<100 then Image.SetAlphaPC(waarde) end
    Image.ScalePC(waarde,waarde)
    Image.Show(aarde,Center_X,Center_Y)
  end    
  Image.SetAlphaPC(100)
  Image.ScalePC(100,100)
  -- DarkText(waarde,0,0)
  -- Time back
  backtime = backtime or (-year) + math.floor(spd)
  -- Image.NoFont() DarkText('year = '..year..'; backtime = '..backtime..'; spd = '..spd,0,0,0,0,255,180,0)
  Image.Font("Fonts/master_of_break.ttf",50)
  local showbacktime = backtime.." B.C."
  if backtime<0 then showbacktime = tonumber(-backtime) end
  if backtime<1000000000 then DarkText(showbacktime,Screen.Width()-30,30,1,0,255,255,255); backtime=backtime+math.floor(spd) end
  spd = spd + (spd/200)
  if spd>1000000 then spd = 100001 end  
  -- Bushes
  bushalpha = (bushalpha or -5000) + 1
  if bushalpha > 0 then
     Image.SetAlphaPC(bushalpha)
     Image.Show(bos)
  end   
  -- Hando Stillor's story
  Image.Font("Fonts/master_of_break.ttf",45)
  stillor = stillor or {}
  stillor.fragment = stillor.fragment or 0
  stillor.timer    = stillor.timer or 500
  stillor.text     = stillor.text or {}
  stillor.height   = stillor.height or 0
  stillor.starty   = stillor.starty or 0
  if (stillor.vocal) and (Audio.Playing("STILLORINTROCHANNEL")~=0) then
      -- just do nothing at all ;)
  elseif stillor.timer>0 and (not stillor.vocal) then
      stillor.timer = stillor.timer - 1
  else
      stillor.fragment = stillor.fragment + 1
      if stillor.fragment>#stillorstory then return NextStage() end
      stillor.timer = 0
      stillor.text  = stillorstory[stillor.fragment].Lines
      stillor.textheight = Image.TextHeight('t')
      stillor.height = 0
      for t in each(stillor.text) do 
          stillor.timer = stillor.timer + (25*#t)
          stillor.height = stillor.height + stillor.textheight
          stillor.starty = Center_Y - (stillor.height/2)
          end
      stillor.soundfile = stillorstory[stillor.fragment].SoundFile
      if stillor.soundfile and allowvoice then
         Audio.Load(stillor.soundfile,"STILLORINTRO")
         Audio.Play("STILLORINTRO","STILLORINTROCHANNEL")
         stillor.vocal = true
         CSay("Play voice file  "..stillor.soundfile)
      else
         stillor.vocal = false   
         CSay("No voice for #"..stillor.fragment,255,0,0)
      end    
  end 
  for i,t in ipairs(stillor.text) do
      DarkText(Var.S(t),Center_X,stillor.starty+(i*stillor.textheight),2,2,180,255,0)
  end  
  if INP.KeyH(KEY_ESCAPE)==1 or INP.MouseH(1)==1 then 
     if Audio.Playing("STILLORINTROCHANNEL")~=0 then Audio.Stop("STILLORINTROCHANNEL") end
     return NextStage()
  end
  --DebugDump(stillor)
  -- DebugDump(stillorstory,500)
  -- Flip
  Flip()
end
