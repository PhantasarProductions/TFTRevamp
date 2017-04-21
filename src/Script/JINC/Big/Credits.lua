--[[
**********************************************
  
  Credits.lua
  (c) Jeroen Broks, 2016, 2017, All Rights Reserved.
  
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
 
version: 17.04.21
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
        ['000003FC'] = { txt = 'http://www.freesfx.co.uk', r=0,g=180,b=255, y=1020 },
        ['00000424'] = { txt = 'Development documentation', r=255,g=0,b=0, y=1060 }, -- Development documentation
        ['0000044C'] = { txt = 'Font', r=255,g=0,b=0, y=1100 }, -- Font
        ['00000460'] = { txt = 'Benjamin Koehler', r=0,g=180,b=255, y=1120 },
        ['00000474'] = { txt = 'Dieter Steffmann', r=0,g=180,b=255, y=1140 },
        ['00000488'] = { txt = 'Ray Larabie', r=0,g=180,b=255, y=1160 },
        ['0000049C'] = { txt = 'SterioType', r=0,g=180,b=255, y=1180 },
        ['000004B0'] = { txt = 'William Boyd', r=0,g=180,b=255, y=1200 },
        ['000004D8'] = { txt = 'Game identification data', r=255,g=0,b=0, y=1240 }, -- Game identification data
        ['00000500'] = { txt = 'General Data', r=255,g=0,b=0, y=1280 }, -- General Data
        ['00000514'] = { txt = 'Man Of Steel', r=0,g=180,b=255, y=1300 },
        ['00000528'] = { txt = 'Unknown artist from the Public Domain', r=0,g=180,b=255, y=1320 },
        ['00000550'] = { txt = 'Graphics', r=255,g=0,b=0, y=1360 }, -- Graphics
        ['00000564'] = { txt = 'Aeris', r=0,g=180,b=255, y=1380 },
        ['00000578'] = { txt = 'Angela Nagtzaam', r=0,g=180,b=255, y=1400 },
        ['0000058C'] = { txt = 'GR-Sites', r=0,g=180,b=255, y=1420 },
        ['000005A0'] = { txt = 'Holly', r=0,g=180,b=255, y=1440 },
        ['000005B4'] = { txt = 'J4p4n', r=0,g=180,b=255, y=1460 },
        ['000005C8'] = { txt = 'Kelly', r=0,g=180,b=255, y=1480 },
        ['000005DC'] = { txt = 'Man Of Steel', r=0,g=180,b=255, y=1500 },
        ['000005F0'] = { txt = 'Merlin2525', r=0,g=180,b=255, y=1520 },
        ['00000604'] = { txt = 'Michael Frank', r=0,g=180,b=255, y=1540 },
        ['00000618'] = { txt = 'Papapishu', r=0,g=180,b=255, y=1560 },
        ['0000062C'] = { txt = 'Rambo Tribble', r=0,g=180,b=255, y=1580 },
        ['00000640'] = { txt = 'Solar Granulation', r=0,g=180,b=255, y=1600 },
        ['00000654'] = { txt = 'Unknown artist from the Public Domain', r=0,g=180,b=255, y=1620 },
        ['00000668'] = { txt = 'Yannee\'s artist', r=0,g=180,b=255, y=1640 },
        ['00000690'] = { txt = 'Map Design', r=255,g=0,b=0, y=1680 }, -- Map Design
        ['000006B8'] = { txt = 'Music', r=255,g=0,b=0, y=1720 }, -- Music
        ['000006CC'] = { txt = 'Eric Matyas', r=0,g=180,b=255, y=1740 },
        ['000006E0'] = { txt = 'Hung Kee Chan', r=0,g=180,b=255, y=1760 },
        ['000006F4'] = { txt = 'Kevin McLeod', r=0,g=180,b=255, y=1780 },
        ['00000708'] = { txt = 'Matt McFarland', r=0,g=180,b=255, y=1800 },
        ['0000071C'] = { txt = 'W.K. Chan & Wouter Wershkull', r=0,g=180,b=255, y=1820 },
        ['00000730'] = { txt = 'Wicky77', r=0,g=180,b=255, y=1840 },
        ['00000744'] = { txt = 'Wicky77 & Wout66', r=0,g=180,b=255, y=1860 },
        ['00000758'] = { txt = 'Widzy', r=0,g=180,b=255, y=1880 },
        ['00000780'] = { txt = 'Scenario', r=255,g=0,b=0, y=1920 }, -- Scenario
        ['000007A8'] = { txt = 'Script', r=255,g=0,b=0, y=1960 }, -- Script
        ['00000A00'] = { txt = '(c) Copyright 2016', r=255, g=180,b=0,y=2560},
        ['00000A19'] = { txt = 'Jeroen Petrus Broks', r=255, g=180,b=0,y=2585}
}

return ret
