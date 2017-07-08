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
 
version: 17.07.08
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
        ['00000258'] = { txt = 'Jeroen P. Broks', r=0,g=180,b=255, y=mh+600 },
        ['0000026C'] = { txt = 'Man Of Steel', r=0,g=180,b=255, y=mh+620 },
        ['00000280'] = { txt = 'TFTCREW', r=0,g=180,b=255, y=mh+640 },
        ['00000294'] = { txt = 'Unknown artist from the Public Domain', r=0,g=180,b=255, y=mh+660 },
        ['000002BC'] = { txt = 'Graphics', r=255,g=0,b=0, y=mh+700 }, -- Graphics
        ['000002D0'] = { txt = 'Aeris', r=0,g=180,b=255, y=mh+720 },
        ['000002E4'] = { txt = 'Angela Nagtzaam', r=0,g=180,b=255, y=mh+740 },
        ['000002F8'] = { txt = 'Angela Nagtzaam & Jeroen P. Broks', r=0,g=180,b=255, y=mh+760 },
        ['0000030C'] = { txt = 'Ed Kasap', r=0,g=180,b=255, y=mh+780 },
        ['00000320'] = { txt = 'GDJ', r=0,g=180,b=255, y=mh+800 },
        ['00000334'] = { txt = 'GR-Sites', r=0,g=180,b=255, y=mh+820 },
        ['00000348'] = { txt = 'Helm42', r=0,g=180,b=255, y=mh+840 },
        ['0000035C'] = { txt = 'Holly', r=0,g=180,b=255, y=mh+860 },
        ['00000370'] = { txt = 'J4p4n', r=0,g=180,b=255, y=mh+880 },
        ['00000384'] = { txt = 'JWH Broeders', r=0,g=180,b=255, y=mh+900 },
        ['00000398'] = { txt = 'Jeroen P. Broks', r=0,g=180,b=255, y=mh+920 },
        ['000003AC'] = { txt = 'Kelly', r=0,g=180,b=255, y=mh+940 },
        ['000003C0'] = { txt = 'Kuba', r=0,g=180,b=255, y=mh+960 },
        ['000003D4'] = { txt = 'Man Of Steel', r=0,g=180,b=255, y=mh+980 },
        ['000003E8'] = { txt = 'Merlin2525', r=0,g=180,b=255, y=mh+1000 },
        ['000003FC'] = { txt = 'Michael Frank', r=0,g=180,b=255, y=mh+1020 },
        ['00000410'] = { txt = 'Papapishu', r=0,g=180,b=255, y=mh+1040 },
        ['00000424'] = { txt = 'Rambo Tribble', r=0,g=180,b=255, y=mh+1060 },
        ['00000438'] = { txt = 'Roana', r=0,g=180,b=255, y=mh+1080 },
        ['0000044C'] = { txt = 'Solar Granulation', r=0,g=180,b=255, y=mh+1100 },
        ['00000460'] = { txt = 'Unknown artist from the Public Domain', r=0,g=180,b=255, y=mh+1120 },
        ['00000474'] = { txt = 'Yannee\'s artist', r=0,g=180,b=255, y=mh+1140 },
        ['00000488'] = { txt = 'anarres', r=0,g=180,b=255, y=mh+1160 },
        ['0000049C'] = { txt = 'crisg', r=0,g=180,b=255, y=mh+1180 },
        ['000004B0'] = { txt = 'mystica', r=0,g=180,b=255, y=mh+1200 },
        ['000004C4'] = { txt = 'yeKcim', r=0,g=180,b=255, y=mh+1220 },
        ['000004EC'] = { txt = 'Map Design', r=255,g=0,b=0, y=mh+1260 }, -- Map Design
        ['00000500'] = { txt = 'Jeroen P. Broks', r=0,g=180,b=255, y=mh+1280 },
        ['00000528'] = { txt = 'Music', r=255,g=0,b=0, y=mh+1320 }, -- Music
        ['0000053C'] = { txt = '', r=0,g=180,b=255, y=mh+1340 },
        ['00000550'] = { txt = 'Eric Matyas', r=0,g=180,b=255, y=mh+1360 },
        ['00000564'] = { txt = 'Hung Kee Chan', r=0,g=180,b=255, y=mh+1380 },
        ['00000578'] = { txt = 'Jeroen P. Broks', r=0,g=180,b=255, y=mh+1400 },
        ['0000058C'] = { txt = 'Kevin McLeod', r=0,g=180,b=255, y=mh+1420 },
        ['000005A0'] = { txt = 'Matt McFarland', r=0,g=180,b=255, y=mh+1440 },
        ['000005B4'] = { txt = 'Nihilore', r=0,g=180,b=255, y=mh+1460 },
        ['000005C8'] = { txt = 'Spiedkiks', r=0,g=180,b=255, y=mh+1480 },
        ['000005DC'] = { txt = 'W.K. Chan & Wouter Wershkull', r=0,g=180,b=255, y=mh+1500 },
        ['000005F0'] = { txt = 'Wicky77', r=0,g=180,b=255, y=mh+1520 },
        ['00000604'] = { txt = 'Wicky77 & Wout66', r=0,g=180,b=255, y=mh+1540 },
        ['00000618'] = { txt = 'Widzy', r=0,g=180,b=255, y=mh+1560 },
        ['00000640'] = { txt = 'Scenario', r=255,g=0,b=0, y=mh+1600 }, -- Scenario
        ['00000654'] = { txt = 'Jeroen P. Broks', r=0,g=180,b=255, y=mh+1620 },
        ['0000067C'] = { txt = 'Script', r=255,g=0,b=0, y=mh+1660 }, -- Script
        ['00000690'] = { txt = 'Jeroen P. Broks', r=0,g=180,b=255, y=mh+1680 },
        ['000006F4'] = { txt = 'Voice Actors', r=255,g=0,b=0, y=mh+1780 }, -- Voice Acting
        ['00000708'] = { txt = 'Jake - Wicky77', r=255,g=180,b=0, y=mh+1800 }, -- Voice actor
        ['0000071C'] = { txt = 'Marrilona - Pachelle', r=255,g=180,b=0, y=mh+1820 }, -- Voice actor
        ['00000730'] = { txt = 'Dandor - Tricky', r=255,g=180,b=0, y=mh+1840 }, -- Voice actor
        ['00000744'] = { txt = 'Hando Stillor - Tricky', r=255,g=180,b=0, y=mh+1860 }, -- Voice actor
        ['00000758'] = { txt = 'Master John - Wout66', r=255,g=180,b=0, y=mh+1880 }, -- Voice actor
        ['0000076C'] = { txt = 'Chief Werrington - Wout66', r=255,g=180,b=0, y=mh+1900 }, -- Voice actor
        ['00000780'] = { txt = 'Harry - Tricky', r=255,g=180,b=0, y=mh+1920 }, -- Voice actor
        ['00000794'] = { txt = 'Fandalora - Wout66', r=255,g=180,b=0, y=mh+1940 }, -- Voice actor
        ['000007A8'] = { txt = 'Fairy Elder - Tricky', r=255,g=180,b=0, y=mh+1960 }, -- Voice actor
        ['000007BC'] = { txt = 'Sandra - Linvala Kemellon', r=255,g=180,b=0, y=mh+1980 }, -- Voice actor
        ['000007D0'] = { txt = 'Feenalaria - FOM', r=255,g=180,b=0, y=mh+2000 }, -- Voice actor
        ['000007E4'] = { txt = 'Sasha Funda - FOM', r=255,g=180,b=0, y=mh+2020 }, -- Voice actor
        ['000007F8'] = { txt = 'Hando Stillor\'s father - HuKe24', r=255,g=180,b=0, y=mh+2040 }, -- Voice actor
        ['0000080C'] = { txt = 'Krandar - Tricky', r=255,g=180,b=0, y=mh+2060 }, -- Voice actor
        ['00000820'] = { txt = 'Yannee - Pachelle', r=255,g=180,b=0, y=mh+2080 }, -- Voice actor
        ['00000A8C'] = { txt = '(c) Copyright 2016-2017', r=255, g=180,b=0,y=mh+2700},
        ['00000AA5'] = { txt = 'Jeroen Petrus Broks', r=255, g=180,b=0,y=mh+2725}
}

return ret
