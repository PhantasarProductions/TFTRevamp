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
        ['000000B4'] = { txt = 'TFTCREW', r=0,g=180,b=255, y=mh+180 },
        ['000000C8'] = { txt = 'Varazuvi(TM)', r=0,g=180,b=255, y=mh+200 },
        ['000000DC'] = { txt = 'Widzy', r=0,g=180,b=255, y=mh+220 },
        ['000000F0'] = { txt = 'http://www.freesfx.co.uk', r=0,g=180,b=255, y=mh+240 },
        ['00000118'] = { txt = 'Development documentation', r=255,g=0,b=0, y=mh+280 }, -- Development documentation
        ['00000140'] = { txt = 'Font', r=255,g=0,b=0, y=mh+320 }, -- Font
        ['00000154'] = { txt = 'Benjamin Koehler', r=0,g=180,b=255, y=mh+340 },
        ['00000168'] = { txt = 'Dieter Steffmann', r=0,g=180,b=255, y=mh+360 },
        ['0000017C'] = { txt = 'Ray Larabie', r=0,g=180,b=255, y=mh+380 },
        ['00000190'] = { txt = 'SterioType', r=0,g=180,b=255, y=mh+400 },
        ['000001A4'] = { txt = 'William Boyd', r=0,g=180,b=255, y=mh+420 },
        ['000001CC'] = { txt = 'Game identification data', r=255,g=0,b=0, y=mh+460 }, -- Game identification data
        ['000001F4'] = { txt = 'General Data', r=255,g=0,b=0, y=mh+500 }, -- General Data
        ['00000208'] = { txt = 'Man Of Steel', r=0,g=180,b=255, y=mh+520 },
        ['0000021C'] = { txt = 'Unknown artist from the Public Domain', r=0,g=180,b=255, y=mh+540 },
        ['00000244'] = { txt = 'Graphics', r=255,g=0,b=0, y=mh+580 }, -- Graphics
        ['00000258'] = { txt = 'Aeris', r=0,g=180,b=255, y=mh+600 },
        ['0000026C'] = { txt = 'Angela Nagtzaam', r=0,g=180,b=255, y=mh+620 },
        ['00000280'] = { txt = 'Angela Nagtzaam & Jeroen P. Broks', r=0,g=180,b=255, y=mh+640 },
        ['00000294'] = { txt = 'Ed Kasap', r=0,g=180,b=255, y=mh+660 },
        ['000002A8'] = { txt = 'GDJ', r=0,g=180,b=255, y=mh+680 },
        ['000002BC'] = { txt = 'GR-Sites', r=0,g=180,b=255, y=mh+700 },
        ['000002D0'] = { txt = 'Helm42', r=0,g=180,b=255, y=mh+720 },
        ['000002E4'] = { txt = 'Holly', r=0,g=180,b=255, y=mh+740 },
        ['000002F8'] = { txt = 'J4p4n', r=0,g=180,b=255, y=mh+760 },
        ['0000030C'] = { txt = 'JWH Broeders', r=0,g=180,b=255, y=mh+780 },
        ['00000320'] = { txt = 'Kelly', r=0,g=180,b=255, y=mh+800 },
        ['00000334'] = { txt = 'Kuba', r=0,g=180,b=255, y=mh+820 },
        ['00000348'] = { txt = 'Man Of Steel', r=0,g=180,b=255, y=mh+840 },
        ['0000035C'] = { txt = 'Merlin2525', r=0,g=180,b=255, y=mh+860 },
        ['00000370'] = { txt = 'Michael Frank', r=0,g=180,b=255, y=mh+880 },
        ['00000384'] = { txt = 'Papapishu', r=0,g=180,b=255, y=mh+900 },
        ['00000398'] = { txt = 'Rambo Tribble', r=0,g=180,b=255, y=mh+920 },
        ['000003AC'] = { txt = 'Roana', r=0,g=180,b=255, y=mh+940 },
        ['000003C0'] = { txt = 'Solar Granulation', r=0,g=180,b=255, y=mh+960 },
        ['000003D4'] = { txt = 'Unknown artist from the Public Domain', r=0,g=180,b=255, y=mh+980 },
        ['000003E8'] = { txt = 'Yannee\'s artist', r=0,g=180,b=255, y=mh+1000 },
        ['000003FC'] = { txt = 'anarres', r=0,g=180,b=255, y=mh+1020 },
        ['00000410'] = { txt = 'crisg', r=0,g=180,b=255, y=mh+1040 },
        ['00000424'] = { txt = 'mystica', r=0,g=180,b=255, y=mh+1060 },
        ['00000438'] = { txt = 'yeKcim', r=0,g=180,b=255, y=mh+1080 },
        ['00000460'] = { txt = 'Map Design', r=255,g=0,b=0, y=mh+1120 }, -- Map Design
        ['00000488'] = { txt = 'Music', r=255,g=0,b=0, y=mh+1160 }, -- Music
        ['0000049C'] = { txt = 'Eric Matyas', r=0,g=180,b=255, y=mh+1180 },
        ['000004B0'] = { txt = 'Hung Kee Chan', r=0,g=180,b=255, y=mh+1200 },
        ['000004C4'] = { txt = 'Kevin McLeod', r=0,g=180,b=255, y=mh+1220 },
        ['000004D8'] = { txt = 'Matt McFarland', r=0,g=180,b=255, y=mh+1240 },
        ['000004EC'] = { txt = 'Nihilore', r=0,g=180,b=255, y=mh+1260 },
        ['00000500'] = { txt = 'Spiedkiks', r=0,g=180,b=255, y=mh+1280 },
        ['00000514'] = { txt = 'W.K. Chan & Wouter Wershkull', r=0,g=180,b=255, y=mh+1300 },
        ['00000528'] = { txt = 'Wicky77', r=0,g=180,b=255, y=mh+1320 },
        ['0000053C'] = { txt = 'Wicky77 & Wout66', r=0,g=180,b=255, y=mh+1340 },
        ['00000550'] = { txt = 'Widzy', r=0,g=180,b=255, y=mh+1360 },
        ['00000578'] = { txt = 'Scenario', r=255,g=0,b=0, y=mh+1400 }, -- Scenario
        ['000005A0'] = { txt = 'Script', r=255,g=0,b=0, y=mh+1440 }, -- Script
        ['00000604'] = { txt = 'Voice Actors', r=255,g=0,b=0, y=mh+1540 }, -- Voice Acting
        ['00000618'] = { txt = 'Jake - Wicky77', r=255,g=180,b=0, y=mh+1560 }, -- Voice actor
        ['0000062C'] = { txt = 'Marrilona - Pachelle', r=255,g=180,b=0, y=mh+1580 }, -- Voice actor
        ['00000640'] = { txt = 'Dandor - Tricky', r=255,g=180,b=0, y=mh+1600 }, -- Voice actor
        ['00000654'] = { txt = 'Hando Stillor - Tricky', r=255,g=180,b=0, y=mh+1620 }, -- Voice actor
        ['00000668'] = { txt = 'Master John - Wout66', r=255,g=180,b=0, y=mh+1640 }, -- Voice actor
        ['0000067C'] = { txt = 'Chief Werrington - Wout66', r=255,g=180,b=0, y=mh+1660 }, -- Voice actor
        ['00000690'] = { txt = 'Harry - Tricky', r=255,g=180,b=0, y=mh+1680 }, -- Voice actor
        ['000006A4'] = { txt = 'Fandalora - Wout66', r=255,g=180,b=0, y=mh+1700 }, -- Voice actor
        ['000006B8'] = { txt = 'Fairy Elder - Tricky', r=255,g=180,b=0, y=mh+1720 }, -- Voice actor
        ['000006CC'] = { txt = 'Sandra - Linvala Kemellon', r=255,g=180,b=0, y=mh+1740 }, -- Voice actor
        ['000006E0'] = { txt = 'Feenalaria - FOM', r=255,g=180,b=0, y=mh+1760 }, -- Voice actor
        ['000006F4'] = { txt = 'Sasha Funda - FOM', r=255,g=180,b=0, y=mh+1780 }, -- Voice actor
        ['00000708'] = { txt = 'Hando Stillor\'s father - HuKe24', r=255,g=180,b=0, y=mh+1800 }, -- Voice actor
        ['0000071C'] = { txt = 'Krandar - Tricky', r=255,g=180,b=0, y=mh+1820 }, -- Voice actor
        ['00000730'] = { txt = 'Yannee - Pachelle', r=255,g=180,b=0, y=mh+1840 }, -- Voice actor
        ['0000099C'] = { txt = '(c) Copyright 2016-2017', r=255, g=180,b=0,y=mh+2460},
        ['000009B5'] = { txt = 'Jeroen Petrus Broks', r=255, g=180,b=0,y=mh+2485}
}

return ret
