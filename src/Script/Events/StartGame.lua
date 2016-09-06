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
 
version: 16.09.06
]]
function GALE_OnLoad()
  sterretjes = Image.Load("GFX/Algemeen/Sterretjes.png")
  aarde = Image.Load("GFX/Algemeen/Earth.png")
  bos = Image.Load('GFX/Algemeen/Bushes.png')
  Image.HotCenter(aarde)
  year = tonumber(Str.Right(Time.Date(),4))
  spd = 0.00001
  
end


function MAIN_FLOW()
  -- Earth in space  
  Image.Tile(sterretjes)
  waarde = (waarde or 200) - .01
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
  spd = spd + (spd/100)
  if spd>1000000 then spd = 100001 end  
  -- Bushes
  bushalpha = (bushalpha or -10000) + 1
  if bushalpha > 0 then
     Image.SetAlphaPC(bushalpha)
     Image.Show(bos)
  end   
  -- Flip
  Flip()
end
