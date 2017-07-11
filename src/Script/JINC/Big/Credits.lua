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
 
version: 17.07.11
]]
Image.GetViewport()
local mx,my,mw,mh = Image.GVP_X, Image.GVP_Y, Image.GVP_W, Image.GVP_H


local
ret = {
        ['00000000'] = { img = 'GFX/Logo/Title.png', y=mh/2 },
        ['00000050'] = { txt = 'Audio', r=255,g=0,b=0, y=mh+80 }, -- Audio
        ['00000064'] = { txt = 'Alexander', r=0,g=180,b=255, y=mh+100 },
        ['00000078'] = { txt = 'Benboncan', r=0,g=180,b=255, y=mh+120 },
        ['0000008C'] = { txt = 'Donald Trump', r=0,g=180,b=255, y=mh+140 },
        ['000000A0'] = { txt = 'GR-Sites', r=0,g=180,b=255, y=mh+160 },
        ['000000B4'] = { txt = 'Jeroen P. Broks', r=0,g=180,b=255, y=mh+180 },
        ['000000C8'] = { txt = 'TFTCREW', r=0,g=180,b=255, y=mh+200 },
        ['000000DC'] = { txt = 'Varazuvi(TM)', r=0,g=180,b=255, y=mh+220 },
        ['000000F0'] = { txt = 'Widzy', r=0,g=180,b=255, y=mh+240 },
        ['00000104'] = { txt = 'http://www.freesfx.co.uk', r=0,g=180,b=255, y=mh+260 },
        ['0000012C'] = { txt = 'Development documentation', r=255,g=0,b=0, y=mh+300 }, -- Development documentation
        ['00000140'] = { txt = 'Jeroen P. Broks', r=0,g=180,b=255, y=mh+320 },
        ['00000168'] = { txt = 'Font', r=255,g=0,b=0, y=mh+360 }, -- Font
        ['0000017C'] = { txt = 'Benjamin Koehler', r=0,g=180,b=255, y=mh+380 },
        ['00000190'] = { txt = 'Dieter Steffmann', r=0,g=180,b=255, y=mh+400 },
        ['000001A4'] = { txt = 'Jeroen P. Broks', r=0,g=180,b=255, y=mh+420 },
        ['000001B8'] = { txt = 'Ray Larabie', r=0,g=180,b=255, y=mh+440 },
        ['000001CC'] = { txt = 'SterioType', r=0,g=180,b=255, y=mh+460 },
        ['000001E0'] = { txt = 'William Boyd', r=0,g=180,b=255, y=mh+480 },
        ['00000208'] = { txt = 'Game identification data', r=255,g=0,b=0, y=mh+520 }, -- Game identification data
        ['0000021C'] = { txt = 'Jeroen P. Broks', r=0,g=180,b=255, y=mh+540 },
        ['00000244'] = { txt = 'General Data', r=255,g=0,b=0, y=mh+580 }, -- General Data
        ['00000258'] = { txt = '', r=0,g=180,b=255, y=mh+600 },
        ['0000026C'] = { txt = 'Jeroen P. Broks', r=0,g=180,b=255, y=mh+620 },
        ['00000280'] = { txt = 'Man Of Steel', r=0,g=180,b=255, y=mh+640 },
        ['00000294'] = { txt = 'TFTCREW', r=0,g=180,b=255, y=mh+660 },
        ['000002A8'] = { txt = 'Unknown artist from the Public Domain', r=0,g=180,b=255, y=mh+680 },
        ['000002D0'] = { txt = 'Graphics', r=255,g=0,b=0, y=mh+720 }, -- Graphics
        ['000002E4'] = { txt = 'Aeris', r=0,g=180,b=255, y=mh+740 },
        ['000002F8'] = { txt = 'Angela Nagtzaam', r=0,g=180,b=255, y=mh+760 },
        ['0000030C'] = { txt = 'Angela Nagtzaam & Jeroen P. Broks', r=0,g=180,b=255, y=mh+780 },
        ['00000320'] = { txt = 'Ed Kasap', r=0,g=180,b=255, y=mh+800 },
        ['00000334'] = { txt = 'GDJ', r=0,g=180,b=255, y=mh+820 },
        ['00000348'] = { txt = 'GR-Sites', r=0,g=180,b=255, y=mh+840 },
        ['0000035C'] = { txt = 'Helm42', r=0,g=180,b=255, y=mh+860 },
        ['00000370'] = { txt = 'Holly', r=0,g=180,b=255, y=mh+880 },
        ['00000384'] = { txt = 'J4p4n', r=0,g=180,b=255, y=mh+900 },
        ['00000398'] = { txt = 'JWH Broeders', r=0,g=180,b=255, y=mh+920 },
        ['000003AC'] = { txt = 'Jeroen P. Broks', r=0,g=180,b=255, y=mh+940 },
        ['000003C0'] = { txt = 'Kelly', r=0,g=180,b=255, y=mh+960 },
        ['000003D4'] = { txt = 'Kuba', r=0,g=180,b=255, y=mh+980 },
        ['000003E8'] = { txt = 'Man Of Steel', r=0,g=180,b=255, y=mh+1000 },
        ['000003FC'] = { txt = 'Merlin2525', r=0,g=180,b=255, y=mh+1020 },
        ['00000410'] = { txt = 'Michael Frank', r=0,g=180,b=255, y=mh+1040 },
        ['00000424'] = { txt = 'Papapishu', r=0,g=180,b=255, y=mh+1060 },
        ['00000438'] = { txt = 'Rambo Tribble', r=0,g=180,b=255, y=mh+1080 },
        ['0000044C'] = { txt = 'Roana', r=0,g=180,b=255, y=mh+1100 },
        ['00000460'] = { txt = 'Solar Granulation', r=0,g=180,b=255, y=mh+1120 },
        ['00000474'] = { txt = 'Unknown artist from the Public Domain', r=0,g=180,b=255, y=mh+1140 },
        ['00000488'] = { txt = 'Yannee\'s artist', r=0,g=180,b=255, y=mh+1160 },
        ['0000049C'] = { txt = 'anarres', r=0,g=180,b=255, y=mh+1180 },
        ['000004B0'] = { txt = 'crisg', r=0,g=180,b=255, y=mh+1200 },
        ['000004C4'] = { txt = 'frankes', r=0,g=180,b=255, y=mh+1220 },
        ['000004D8'] = { txt = 'ginkgo', r=0,g=180,b=255, y=mh+1240 },
        ['000004EC'] = { txt = 'mystica', r=0,g=180,b=255, y=mh+1260 },
        ['00000500'] = { txt = 'snoopingasusual', r=0,g=180,b=255, y=mh+1280 },
        ['00000514'] = { txt = 'yeKcim', r=0,g=180,b=255, y=mh+1300 },
        ['0000053C'] = { txt = 'Map Design', r=255,g=0,b=0, y=mh+1340 }, -- Map Design
        ['00000550'] = { txt = 'Jeroen P. Broks', r=0,g=180,b=255, y=mh+1360 },
        ['00000578'] = { txt = 'Music', r=255,g=0,b=0, y=mh+1400 }, -- Music
        ['0000058C'] = { txt = '', r=0,g=180,b=255, y=mh+1420 },
        ['000005A0'] = { txt = 'Eric Matyas', r=0,g=180,b=255, y=mh+1440 },
        ['000005B4'] = { txt = 'Hung Kee Chan', r=0,g=180,b=255, y=mh+1460 },
        ['000005C8'] = { txt = 'Jeroen P. Broks', r=0,g=180,b=255, y=mh+1480 },
        ['000005DC'] = { txt = 'Kevin McLeod', r=0,g=180,b=255, y=mh+1500 },
        ['000005F0'] = { txt = 'Matt McFarland', r=0,g=180,b=255, y=mh+1520 },
        ['00000604'] = { txt = 'Nihilore', r=0,g=180,b=255, y=mh+1540 },
        ['00000618'] = { txt = 'Spiedkiks', r=0,g=180,b=255, y=mh+1560 },
        ['0000062C'] = { txt = 'W.K. Chan & Wouter Wershkull', r=0,g=180,b=255, y=mh+1580 },
        ['00000640'] = { txt = 'Wicky77', r=0,g=180,b=255, y=mh+1600 },
        ['00000654'] = { txt = 'Wicky77 & Wout66', r=0,g=180,b=255, y=mh+1620 },
        ['00000668'] = { txt = 'Widzy', r=0,g=180,b=255, y=mh+1640 },
        ['00000690'] = { txt = 'Scenario', r=255,g=0,b=0, y=mh+1680 }, -- Scenario
        ['000006A4'] = { txt = 'Jeroen P. Broks', r=0,g=180,b=255, y=mh+1700 },
        ['000006CC'] = { txt = 'Script', r=255,g=0,b=0, y=mh+1740 }, -- Script
        ['000006E0'] = { txt = '', r=0,g=180,b=255, y=mh+1760 },
        ['000006F4'] = { txt = 'Jeroen P. Broks', r=0,g=180,b=255, y=mh+1780 },
        ['00000758'] = { txt = 'Voice Actors', r=255,g=0,b=0, y=mh+1880 }, -- Voice Acting
        ['0000076C'] = { txt = 'Jake - Wicky77', r=255,g=180,b=0, y=mh+1900 }, -- Voice actor
        ['00000780'] = { txt = 'Marrilona - Pachelle', r=255,g=180,b=0, y=mh+1920 }, -- Voice actor
        ['00000794'] = { txt = 'Dandor - Tricky', r=255,g=180,b=0, y=mh+1940 }, -- Voice actor
        ['000007A8'] = { txt = 'Hando Stillor - Tricky', r=255,g=180,b=0, y=mh+1960 }, -- Voice actor
        ['000007BC'] = { txt = 'Master John - Wout66', r=255,g=180,b=0, y=mh+1980 }, -- Voice actor
        ['000007D0'] = { txt = 'Chief Werrington - Wout66', r=255,g=180,b=0, y=mh+2000 }, -- Voice actor
        ['000007E4'] = { txt = 'Harry - Tricky', r=255,g=180,b=0, y=mh+2020 }, -- Voice actor
        ['000007F8'] = { txt = 'Fandalora - Wout66', r=255,g=180,b=0, y=mh+2040 }, -- Voice actor
        ['0000080C'] = { txt = 'Fairy Elder - Tricky', r=255,g=180,b=0, y=mh+2060 }, -- Voice actor
        ['00000820'] = { txt = 'Sandra - Linvala Kemellon', r=255,g=180,b=0, y=mh+2080 }, -- Voice actor
        ['00000834'] = { txt = 'Feenalaria - FOM', r=255,g=180,b=0, y=mh+2100 }, -- Voice actor
        ['00000848'] = { txt = 'Sasha Funda - FOM', r=255,g=180,b=0, y=mh+2120 }, -- Voice actor
        ['0000085C'] = { txt = 'Hando Stillor\'s father - HuKe24', r=255,g=180,b=0, y=mh+2140 }, -- Voice actor
        ['00000870'] = { txt = 'Krandar - Tricky', r=255,g=180,b=0, y=mh+2160 }, -- Voice actor
        ['00000884'] = { txt = 'Yannee - Pachelle', r=255,g=180,b=0, y=mh+2180 }, -- Voice actor
        ['00000AF0'] = { txt = '(c) Copyright 2016-2017', r=255, g=180,b=0,y=mh+2800},
        ['00000B09'] = { txt = 'Jeroen Petrus Broks', r=255, g=180,b=0,y=mh+2825}
}

return ret
