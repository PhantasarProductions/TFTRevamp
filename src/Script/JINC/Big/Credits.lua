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
 
version: 17.06.21
]]
local
ret = {
        ['00000000'] = { img = 'GFX/Intro/StarStory.png', y=300 },
        ['00000370'] = { txt = 'Audio', r=255,g=0,b=0, y=880 }, -- Audio
        ['00000384'] = { txt = 'Alexander', r=0,g=180,b=255, y=900 },
        ['00000398'] = { txt = 'Benboncan', r=0,g=180,b=255, y=920 },
        ['000003AC'] = { txt = 'Donald Trump', r=0,g=180,b=255, y=940 },
        ['000003C0'] = { txt = 'GR-Sites', r=0,g=180,b=255, y=960 },
        ['000003D4'] = { txt = 'TFTCREW', r=0,g=180,b=255, y=980 },
        ['000003E8'] = { txt = 'Varazuvi(TM)', r=0,g=180,b=255, y=1000 },
        ['000003FC'] = { txt = 'Widzy', r=0,g=180,b=255, y=1020 },
        ['00000410'] = { txt = 'http://www.freesfx.co.uk', r=0,g=180,b=255, y=1040 },
        ['00000438'] = { txt = 'Development documentation', r=255,g=0,b=0, y=1080 }, -- Development documentation
        ['00000460'] = { txt = 'Font', r=255,g=0,b=0, y=1120 }, -- Font
        ['00000474'] = { txt = 'Benjamin Koehler', r=0,g=180,b=255, y=1140 },
        ['00000488'] = { txt = 'Dieter Steffmann', r=0,g=180,b=255, y=1160 },
        ['0000049C'] = { txt = 'Ray Larabie', r=0,g=180,b=255, y=1180 },
        ['000004B0'] = { txt = 'SterioType', r=0,g=180,b=255, y=1200 },
        ['000004C4'] = { txt = 'William Boyd', r=0,g=180,b=255, y=1220 },
        ['000004EC'] = { txt = 'Game identification data', r=255,g=0,b=0, y=1260 }, -- Game identification data
        ['00000514'] = { txt = 'General Data', r=255,g=0,b=0, y=1300 }, -- General Data
        ['00000528'] = { txt = 'Man Of Steel', r=0,g=180,b=255, y=1320 },
        ['0000053C'] = { txt = 'Unknown artist from the Public Domain', r=0,g=180,b=255, y=1340 },
        ['00000564'] = { txt = 'Graphics', r=255,g=0,b=0, y=1380 }, -- Graphics
        ['00000578'] = { txt = 'Aeris', r=0,g=180,b=255, y=1400 },
        ['0000058C'] = { txt = 'Angela Nagtzaam', r=0,g=180,b=255, y=1420 },
        ['000005A0'] = { txt = 'Angela Nagtzaam & Jeroen P. Broks', r=0,g=180,b=255, y=1440 },
        ['000005B4'] = { txt = 'GDJ', r=0,g=180,b=255, y=1460 },
        ['000005C8'] = { txt = 'GR-Sites', r=0,g=180,b=255, y=1480 },
        ['000005DC'] = { txt = 'Helm42', r=0,g=180,b=255, y=1500 },
        ['000005F0'] = { txt = 'Holly', r=0,g=180,b=255, y=1520 },
        ['00000604'] = { txt = 'J4p4n', r=0,g=180,b=255, y=1540 },
        ['00000618'] = { txt = 'JWH Broeders', r=0,g=180,b=255, y=1560 },
        ['0000062C'] = { txt = 'Kelly', r=0,g=180,b=255, y=1580 },
        ['00000640'] = { txt = 'Man Of Steel', r=0,g=180,b=255, y=1600 },
        ['00000654'] = { txt = 'Merlin2525', r=0,g=180,b=255, y=1620 },
        ['00000668'] = { txt = 'Michael Frank', r=0,g=180,b=255, y=1640 },
        ['0000067C'] = { txt = 'Papapishu', r=0,g=180,b=255, y=1660 },
        ['00000690'] = { txt = 'Rambo Tribble', r=0,g=180,b=255, y=1680 },
        ['000006A4'] = { txt = 'Roana', r=0,g=180,b=255, y=1700 },
        ['000006B8'] = { txt = 'Solar Granulation', r=0,g=180,b=255, y=1720 },
        ['000006CC'] = { txt = 'Unknown artist from the Public Domain', r=0,g=180,b=255, y=1740 },
        ['000006E0'] = { txt = 'Yannee\'s artist', r=0,g=180,b=255, y=1760 },
        ['000006F4'] = { txt = 'anarres', r=0,g=180,b=255, y=1780 },
        ['00000708'] = { txt = 'crisg', r=0,g=180,b=255, y=1800 },
        ['00000730'] = { txt = 'Map Design', r=255,g=0,b=0, y=1840 }, -- Map Design
        ['00000758'] = { txt = 'Music', r=255,g=0,b=0, y=1880 }, -- Music
        ['0000076C'] = { txt = 'Eric Matyas', r=0,g=180,b=255, y=1900 },
        ['00000780'] = { txt = 'Hung Kee Chan', r=0,g=180,b=255, y=1920 },
        ['00000794'] = { txt = 'Kevin McLeod', r=0,g=180,b=255, y=1940 },
        ['000007A8'] = { txt = 'Matt McFarland', r=0,g=180,b=255, y=1960 },
        ['000007BC'] = { txt = 'Nihilore', r=0,g=180,b=255, y=1980 },
        ['000007D0'] = { txt = 'Spiedkiks', r=0,g=180,b=255, y=2000 },
        ['000007E4'] = { txt = 'W.K. Chan & Wouter Wershkull', r=0,g=180,b=255, y=2020 },
        ['000007F8'] = { txt = 'Wicky77', r=0,g=180,b=255, y=2040 },
        ['0000080C'] = { txt = 'Wicky77 & Wout66', r=0,g=180,b=255, y=2060 },
        ['00000820'] = { txt = 'Widzy', r=0,g=180,b=255, y=2080 },
        ['00000848'] = { txt = 'Scenario', r=255,g=0,b=0, y=2120 }, -- Scenario
        ['00000870'] = { txt = 'Script', r=255,g=0,b=0, y=2160 }, -- Script
        ['00000AC8'] = { txt = '(c) Copyright 2016', r=255, g=180,b=0,y=2760},
        ['00000AE1'] = { txt = 'Jeroen Petrus Broks', r=255, g=180,b=0,y=2785}
}

return ret
