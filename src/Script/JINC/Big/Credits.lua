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
 
version: 17.06.29
]]
Image.GetViewport()
local mx,my,mw,mh = Image.GVP_X, Image.GVP_Y, Image.GVP_W, Image.GVP_H


local
ret = {
        ['00000000'] = { img = 'GFX/Logo/Title.png', y=mh/2 },
        ['00000050'] = { txt = 'Audio', r=255,g=0,b=0, y=mh+80 }, -- Audio
        ['00000064'] = { txt = 'Donald Trump', r=0,g=180,b=255, y=mh+100 },
        ['00000078'] = { txt = 'TFTCREW', r=0,g=180,b=255, y=mh+120 },
        ['0000008C'] = { txt = 'Widzy', r=0,g=180,b=255, y=mh+140 },
        ['000000B4'] = { txt = 'Font', r=255,g=0,b=0, y=mh+180 }, -- Font
        ['000000C8'] = { txt = 'Dieter Steffmann', r=0,g=180,b=255, y=mh+200 },
        ['000000F0'] = { txt = 'Game identification data', r=255,g=0,b=0, y=mh+240 }, -- Game identification data
        ['00000118'] = { txt = 'General Data', r=255,g=0,b=0, y=mh+280 }, -- General Data
        ['0000012C'] = { txt = 'Unknown artist from the Public Domain', r=0,g=180,b=255, y=mh+300 },
        ['00000154'] = { txt = 'Graphics', r=255,g=0,b=0, y=mh+340 }, -- Graphics
        ['00000168'] = { txt = 'Aeris', r=0,g=180,b=255, y=mh+360 },
        ['0000017C'] = { txt = 'Angela Nagtzaam', r=0,g=180,b=255, y=mh+380 },
        ['00000190'] = { txt = 'Angela Nagtzaam & Jeroen P. Broks', r=0,g=180,b=255, y=mh+400 },
        ['000001A4'] = { txt = 'GDJ', r=0,g=180,b=255, y=mh+420 },
        ['000001B8'] = { txt = 'Helm42', r=0,g=180,b=255, y=mh+440 },
        ['000001CC'] = { txt = 'Holly', r=0,g=180,b=255, y=mh+460 },
        ['000001E0'] = { txt = 'J4p4n', r=0,g=180,b=255, y=mh+480 },
        ['000001F4'] = { txt = 'JWH Broeders', r=0,g=180,b=255, y=mh+500 },
        ['00000208'] = { txt = 'Kelly', r=0,g=180,b=255, y=mh+520 },
        ['0000021C'] = { txt = 'Kuba', r=0,g=180,b=255, y=mh+540 },
        ['00000230'] = { txt = 'Man Of Steel', r=0,g=180,b=255, y=mh+560 },
        ['00000244'] = { txt = 'Michael Frank', r=0,g=180,b=255, y=mh+580 },
        ['00000258'] = { txt = 'Papapishu', r=0,g=180,b=255, y=mh+600 },
        ['0000026C'] = { txt = 'Rambo Tribble', r=0,g=180,b=255, y=mh+620 },
        ['00000280'] = { txt = 'Roana', r=0,g=180,b=255, y=mh+640 },
        ['00000294'] = { txt = 'Unknown artist from the Public Domain', r=0,g=180,b=255, y=mh+660 },
        ['000002A8'] = { txt = 'anarres', r=0,g=180,b=255, y=mh+680 },
        ['000002BC'] = { txt = 'crisg', r=0,g=180,b=255, y=mh+700 },
        ['000002D0'] = { txt = 'mystica', r=0,g=180,b=255, y=mh+720 },
        ['000002E4'] = { txt = 'yeKcim', r=0,g=180,b=255, y=mh+740 },
        ['0000030C'] = { txt = 'Map Design', r=255,g=0,b=0, y=mh+780 }, -- Map Design
        ['00000334'] = { txt = 'Music', r=255,g=0,b=0, y=mh+820 }, -- Music
        ['00000348'] = { txt = 'Eric Matyas', r=0,g=180,b=255, y=mh+840 },
        ['0000035C'] = { txt = 'Hung Kee Chan', r=0,g=180,b=255, y=mh+860 },
        ['00000370'] = { txt = 'Kevin McLeod', r=0,g=180,b=255, y=mh+880 },
        ['00000384'] = { txt = 'Matt McFarland', r=0,g=180,b=255, y=mh+900 },
        ['00000398'] = { txt = 'Nihilore', r=0,g=180,b=255, y=mh+920 },
        ['000003AC'] = { txt = 'Spiedkiks', r=0,g=180,b=255, y=mh+940 },
        ['000003C0'] = { txt = 'W.K. Chan & Wouter Wershkull', r=0,g=180,b=255, y=mh+960 },
        ['000003D4'] = { txt = 'Wicky77', r=0,g=180,b=255, y=mh+980 },
        ['000003E8'] = { txt = 'Wicky77 & Wout66', r=0,g=180,b=255, y=mh+1000 },
        ['000003FC'] = { txt = 'Widzy', r=0,g=180,b=255, y=mh+1020 },
        ['00000460'] = { txt = 'Voice Actors', r=255,g=0,b=0, y=mh+1120 }, -- Voice Acting
        ['00000474'] = { txt = 'Jake - Wicky77', r=255,g=180,b=0, y=mh+1140 }, -- Voice actor
        ['00000488'] = { txt = 'Marrilona - Pachelle', r=255,g=180,b=0, y=mh+1160 }, -- Voice actor
        ['0000049C'] = { txt = 'Dandor - Tricky', r=255,g=180,b=0, y=mh+1180 }, -- Voice actor
        ['000004B0'] = { txt = 'Hando Stillor - Tricky', r=255,g=180,b=0, y=mh+1200 }, -- Voice actor
        ['000004C4'] = { txt = 'Master John - Wout66', r=255,g=180,b=0, y=mh+1220 }, -- Voice actor
        ['000004D8'] = { txt = 'Chief Werrington - Wout66', r=255,g=180,b=0, y=mh+1240 }, -- Voice actor
        ['000004EC'] = { txt = 'Harry - Tricky', r=255,g=180,b=0, y=mh+1260 }, -- Voice actor
        ['00000500'] = { txt = 'Fandalora - Wout66', r=255,g=180,b=0, y=mh+1280 }, -- Voice actor
        ['00000514'] = { txt = 'Fairy Elder - Tricky', r=255,g=180,b=0, y=mh+1300 }, -- Voice actor
        ['00000528'] = { txt = 'Sandra - Linvala Kemellon', r=255,g=180,b=0, y=mh+1320 }, -- Voice actor
        ['0000053C'] = { txt = 'Feenalaria - FOM', r=255,g=180,b=0, y=mh+1340 }, -- Voice actor
        ['00000550'] = { txt = 'Sasha Funda - FOM', r=255,g=180,b=0, y=mh+1360 }, -- Voice actor
        ['00000564'] = { txt = 'Hando Stillor\'s father - HuKe24', r=255,g=180,b=0, y=mh+1380 }, -- Voice actor
        ['00000578'] = { txt = 'Krandar - Tricky', r=255,g=180,b=0, y=mh+1400 }, -- Voice actor
        ['0000058C'] = { txt = 'Yannee - Pachelle', r=255,g=180,b=0, y=mh+1420 }, -- Voice actor
        ['000007F8'] = { txt = '(c) Copyright 2016', r=255, g=180,b=0,y=mh+2040},
        ['00000811'] = { txt = 'Jeroen Petrus Broks', r=255, g=180,b=0,y=mh+2065}
}

return ret
