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
        ['0000058C'] = { txt = 'Angela Nagtzaam & Jeroen P. Broks', r=0,g=180,b=255, y=1420 },
        ['000005A0'] = { txt = 'GDJ', r=0,g=180,b=255, y=1440 },
        ['000005B4'] = { txt = 'GR-Sites', r=0,g=180,b=255, y=1460 },
        ['000005C8'] = { txt = 'Helm42', r=0,g=180,b=255, y=1480 },
        ['000005DC'] = { txt = 'Holly', r=0,g=180,b=255, y=1500 },
        ['000005F0'] = { txt = 'J4p4n', r=0,g=180,b=255, y=1520 },
        ['00000604'] = { txt = 'JWH Broeders', r=0,g=180,b=255, y=1540 },
        ['00000618'] = { txt = 'Kelly', r=0,g=180,b=255, y=1560 },
        ['0000062C'] = { txt = 'Man Of Steel', r=0,g=180,b=255, y=1580 },
        ['00000640'] = { txt = 'Merlin2525', r=0,g=180,b=255, y=1600 },
        ['00000654'] = { txt = 'Michael Frank', r=0,g=180,b=255, y=1620 },
        ['00000668'] = { txt = 'Papapishu', r=0,g=180,b=255, y=1640 },
        ['0000067C'] = { txt = 'Rambo Tribble', r=0,g=180,b=255, y=1660 },
        ['00000690'] = { txt = 'Roana', r=0,g=180,b=255, y=1680 },
        ['000006A4'] = { txt = 'Solar Granulation', r=0,g=180,b=255, y=1700 },
        ['000006B8'] = { txt = 'Unknown artist from the Public Domain', r=0,g=180,b=255, y=1720 },
        ['000006CC'] = { txt = 'Yannee\'s artist', r=0,g=180,b=255, y=1740 },
        ['000006E0'] = { txt = 'anarres', r=0,g=180,b=255, y=1760 },
        ['00000708'] = { txt = 'Map Design', r=255,g=0,b=0, y=1800 }, -- Map Design
        ['00000730'] = { txt = 'Music', r=255,g=0,b=0, y=1840 }, -- Music
        ['00000744'] = { txt = 'Eric Matyas', r=0,g=180,b=255, y=1860 },
        ['00000758'] = { txt = 'Hung Kee Chan', r=0,g=180,b=255, y=1880 },
        ['0000076C'] = { txt = 'Kevin McLeod', r=0,g=180,b=255, y=1900 },
        ['00000780'] = { txt = 'Matt McFarland', r=0,g=180,b=255, y=1920 },
        ['00000794'] = { txt = 'Nihilore', r=0,g=180,b=255, y=1940 },
        ['000007A8'] = { txt = 'Spiedkiks', r=0,g=180,b=255, y=1960 },
        ['000007BC'] = { txt = 'W.K. Chan & Wouter Wershkull', r=0,g=180,b=255, y=1980 },
        ['000007D0'] = { txt = 'Wicky77', r=0,g=180,b=255, y=2000 },
        ['000007E4'] = { txt = 'Wicky77 & Wout66', r=0,g=180,b=255, y=2020 },
        ['000007F8'] = { txt = 'Widzy', r=0,g=180,b=255, y=2040 },
        ['00000820'] = { txt = 'Scenario', r=255,g=0,b=0, y=2080 }, -- Scenario
        ['00000848'] = { txt = 'Script', r=255,g=0,b=0, y=2120 }, -- Script
        ['00000AA0'] = { txt = '(c) Copyright 2016', r=255, g=180,b=0,y=2720},
        ['00000AB9'] = { txt = 'Jeroen Petrus Broks', r=255, g=180,b=0,y=2745}
}

return ret
