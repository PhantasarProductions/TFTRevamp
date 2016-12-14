--[[
**********************************************
  
  Credits.lua
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
 
version: 16.12.15
]]
local
ret = {
        ['00000000'] = { img = 'GFX/Intro/StarStory.png', y=300 },
        ['00000370'] = { txt = 'Audio', r=255,g=0,b=0, y=880 }, -- Audio
        ['00000384'] = { txt = 'Alexander', r=0,g=180,b=255, y=900 },
        ['00000398'] = { txt = 'Benboncan', r=0,g=180,b=255, y=920 },
        ['000003AC'] = { txt = 'GR-Sites', r=0,g=180,b=255, y=940 },
        ['000003C0'] = { txt = 'TFTCREW', r=0,g=180,b=255, y=960 },
        ['000003D4'] = { txt = 'Varazuvi(TM)', r=0,g=180,b=255, y=980 },
        ['000003E8'] = { txt = 'Widzy', r=0,g=180,b=255, y=1000 },
        ['00000410'] = { txt = 'Development documentation', r=255,g=0,b=0, y=1040 }, -- Development documentation
        ['00000438'] = { txt = 'Font', r=255,g=0,b=0, y=1080 }, -- Font
        ['0000044C'] = { txt = 'Benjamin Koehler', r=0,g=180,b=255, y=1100 },
        ['00000460'] = { txt = 'Ray Larabie', r=0,g=180,b=255, y=1120 },
        ['00000474'] = { txt = 'SterioType', r=0,g=180,b=255, y=1140 },
        ['0000049C'] = { txt = 'Game identification data', r=255,g=0,b=0, y=1180 }, -- Game identification data
        ['000004C4'] = { txt = 'General Data', r=255,g=0,b=0, y=1220 }, -- General Data
        ['000004D8'] = { txt = 'Man Of Steel', r=0,g=180,b=255, y=1240 },
        ['000004EC'] = { txt = 'Unknown artist from the Public Domain', r=0,g=180,b=255, y=1260 },
        ['00000514'] = { txt = 'Graphics', r=255,g=0,b=0, y=1300 }, -- Graphics
        ['00000528'] = { txt = 'Aeris', r=0,g=180,b=255, y=1320 },
        ['0000053C'] = { txt = 'Angela Nagtzaam', r=0,g=180,b=255, y=1340 },
        ['00000550'] = { txt = 'GR-Sites', r=0,g=180,b=255, y=1360 },
        ['00000564'] = { txt = 'Man Of Steel', r=0,g=180,b=255, y=1380 },
        ['00000578'] = { txt = 'Merlin2525', r=0,g=180,b=255, y=1400 },
        ['0000058C'] = { txt = 'Solar Granulation', r=0,g=180,b=255, y=1420 },
        ['000005A0'] = { txt = 'Unknown artist from the Public Domain', r=0,g=180,b=255, y=1440 },
        ['000005B4'] = { txt = 'Yannee\'s artist', r=0,g=180,b=255, y=1460 },
        ['000005DC'] = { txt = 'Map Design', r=255,g=0,b=0, y=1500 }, -- Map Design
        ['00000604'] = { txt = 'Music', r=255,g=0,b=0, y=1540 }, -- Music
        ['00000618'] = { txt = 'Eric Matyas', r=0,g=180,b=255, y=1560 },
        ['0000062C'] = { txt = 'Kevin McLeod', r=0,g=180,b=255, y=1580 },
        ['00000640'] = { txt = 'Wicky77', r=0,g=180,b=255, y=1600 },
        ['00000654'] = { txt = 'Wicky77 & Wout66', r=0,g=180,b=255, y=1620 },
        ['00000668'] = { txt = 'Widzy', r=0,g=180,b=255, y=1640 },
        ['00000690'] = { txt = 'Scenario', r=255,g=0,b=0, y=1680 }, -- Scenario
        ['000006B8'] = { txt = 'Script', r=255,g=0,b=0, y=1720 }, -- Script
        ['00000910'] = { txt = '(c) Copyright 2016', r=255, g=180,b=0,y=2320},
        ['00000929'] = { txt = 'Jeroen Petrus Broks', r=255, g=180,b=0,y=2345}
}

return ret
