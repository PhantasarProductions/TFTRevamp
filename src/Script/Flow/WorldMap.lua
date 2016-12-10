--[[
  WorldMap.lua
  Version: 16.12.10
  Copyright (C) 2016 Jeroen Petrus Broks
  
  ===========================
  This file is part of a project related to the Phantasar Chronicles or another
  series or saga which is property of Jeroen P. Broks.
  This means that it may contain references to a story-line plus characters
  which are property of Jeroen Broks. These references may only be distributed
  along with an unmodified version of the game. 
  
  As soon as you remove or replace ALL references to the storyline or character
  references, or any termology specifically set up for the Phantasar universe,
  or any other univers a story of Jeroen P. Broks is set up for,
  the restrictions of this file are removed and will automatically become
  zLib licensed (see below).
  
  Please note that doing so counts as a modification and must be marked as such
  in accordance to the zLib license.
  ===========================
  zLib license terms:
  This software is provided 'as-is', without any express or implied
  warranty.  In no event will the authors be held liable for any damages
  arising from the use of this software.
  Permission is granted to anyone to use this software for any purpose,
  including commercial applications, and to alter it and redistribute it
  freely, subject to the following restrictions:
  1. The origin of this software must not be misrepresented; you must not
     claim that you wrote the original software. If you use this software
     in a product, an acknowledgment in the product documentation would be
     appreciated but is not required.
  2. Altered source versions must be plainly marked as such, and must not be
     misrepresented as being the original software.
  3. This notice may not be removed or altered from any source distribution.
]]
wm_unlocked = wm_unlocked or {}

dotcol = { nodung =   {  0,  0,255 },
           noemblem = {255,  0,  0 },
           emblem =   {  0,255,  0 }}
           
backy = 0
backi = Image.Load('GFX/WorldMap/Back.png')
backh = Image.height(backi)
fsiz  = 0
cols  = 2
colx  = 0   
doti  = Image.Load("GFX/World/Dot.png")
     
           
function LoadWorld(worldfolder)
   allwords = allwords or jinc('Script/JINC/Big/WorldMap.lua')
   world = {}
   curworld = worldfolder
   prij=nil
   pcol=nil
   for k,v in pairs(allwords) do
       -- @IF *ANNA
       if k=="ANNA" then
          wm_unlocked.ANNA = CallAnna('A=TFT_Anna_Temple&Request=OpenTemple')
       end
       -- @FI
       if v.Folder==worldfolder and (wm_unlocked[k] or v.UnlockedFromStart) then
          world[v.LocationName] = v
          if v.Dungeon then
             if CVVN("&ALLOW.ENCOFF['"..v.Kthura.."']") then 
                v.Dot = dotcol.emblem
             else
                v.Dot = dotcol.noemblem
             end
          else
             v.Dot = dotcol.nodung
          end
       end
   end
end   

function WorldBackFlow()         
     -- Walking over the path
     backy = backy + 1
     if backy > backh then backy = backy - backh end
     Image.Color(40,80,0)
     Image.Tile(backi,0,backy)
end

function MAIN_FLOW()
     WorldBackFlow()
     -- Header
     SetFont('WorldHeader')
     DarkText(curworld,Center_X,50,2,2,255,180,0)
     -- Locations
     local rij,col = 0,0
     local maxrij = {}
     local scol = {[true]={255,180,0},[false]={255,255,255}}
     local cspot
     SetFont('WorldItem')
     for k,data in spairs(world) do
         local x,y = (col*colx)+5,100+(fsiz*rij)
         local sel = prij==rij and pcol==col
         local c = scol[sel]         
         QScale(dotscale)
         Image.Color(data.Dot[1],data.Dot[2],data.Dot[3])
         Image.Show(doti,x,y)
         QScale()
         DarkText(trim(data.LocationPrefix.." "..data.LocationName),x+fsiz,y,0,0,c[1],c[2],c[3])
         if upper(Maps.CodeName)==upper(data.Kthura) then prij=prij or rij pcol=pcol or col end
         assert(col<cols,"Maximum number of collumns exceeded")
         maxrij[col] = maxrij[col] or 0
         if rij>maxrij[col] then maxrij[col] = rij end
         rij=rij+1
         if rij>=20 then rij=0 col=col+1 end
         if sel then cspot = data end
     end
     prij = prij or 0
     pcol = pcol or 0
     if (INP.KeyH(KEY_DOWN )==1 or joyhit(joydown))  and prij<maxrij[pcol] then  prij = prij + 1 end
     if (INP.KeyH(KEY_UP   )==1 or joyhit(joyup))    and prij>           0 then  prij = prij - 1 end
     if (INP.KeyH(KEY_RIGHT)==1 or joyhit(joyright)) and    maxrij[pcol+1] then  pcol = pcol + 1 end
     if (INP.KeyH(KEY_LEFT )==1 or joyhit(joyleft))  and pcol>           0 then  pcol = pcol - 1 end
     if (INP.KeyH(KEY_ENTER)==1 or INP.KeyH(KEY_RETURN)==1 or INP.KeyH(KEY_SPACE)==1 or joyhit('CONFIRM')) and cspot then
        LoadMap(cspot.Kthura)
        GoToLayer(cspot.Layer,cspot.Start)
        LAURA.Flow('FIELD')
     end
     -- Other shit
     ShowParty()
     ShowMouse()
     Flip()
end

function GALE_OnLoad()   
   fsiz = (SH-250)/25
   colx = (SW/cols)
   fonts.WorldItem[2] = fsiz
   dotscale = math.ceil((fsiz/20)*100)
end   
