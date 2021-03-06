--[[
  WorldMap.lua
  Version: 17.07.01
  Copyright (C) 2016, 2017 Jeroen Petrus Broks
  
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
wm_beenthere = wm_beenthere or {}

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

oldmx = INP.MouseX()
oldmy = INP.MouseY()
     
           
function LoadWorld(worldfolder)
   allwords = allwords or jinc('Script/JINC/Big/WorldMap.lua')
   world = {}
   curworld = worldfolder
   prij=nil
   pcol=nil
   for k,v in pairs(allwords) do
        wm_unlocked.ANNA = nil -- If Anna is not loaded, then don't add it. This will also make the temple disappear if authentication failed later.
       -- @IF *ANNA
       if k=="ANNA" then
          wm_unlocked.ANNA = CallAnna('A=TFT_Anna_Temple&Request=OpenTemple')
       end
       -- @FI
       if v.Folder==worldfolder and (wm_unlocked[k] or v.UnlockedFromStart) then
          world[v.LocationName] = v
          v.key = k
          v.lKthura = v.Kthura
          v.Kthura = upper(v.lKthura)
          --[[
          if CVVN("&ALLOW.ENCOFF['"..v.lKthura.."']")~=nil then -- A fix destroys old data. This should recover this as much as possible.
             Var.D("&ALLOW.ENCOFF['"..v.Kthura.."']",Var.C("&ALLOW.ENCOFF['"..v.lKthura.."']"))
             Var.Clear("&ALLOW.ENCOFF['"..v.lKthura.."']")
          end 
          ]]  
          wm_beenthere[k] = wm_beenthere[k] or v.UnlockedFromStart
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

function WorldMapChat(pch)
   local ch = pch
   if prefixed(ch,"Jake_") then ch="Jake" end
   SerialBoxText("WMCHAT",CVV('$WMCHAT').."."..ch,"FLOW_WORLDMAP")
end


function MAIN_FLOW()
     local mx,my = MouseCoords()
     local moved = mx~=oldmx or my~=oldmy
     if moved then oldmx=mx oldmy=my end
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
         if moved and mx>x and mx<(((col+1)*colx)+5) and my>y and my<y+(fsiz) then pcol=col prij=rij end  
         QScale(dotscale)
         Image.Color(data.Dot[1],data.Dot[2],data.Dot[3])
         Image.Show(doti,x,y)
         QScale()
         local locshow = trim(data.LocationPrefix.." "..data.LocationName)
         DarkText(locshow,x+fsiz,y,0,0,c[1],c[2],c[3])
         if not wm_beenthere[data.key] then DarkText("<< NEW >>",x+fsiz+(fsiz/2)+Image.TextWidth(locshow),y,0,0,0,255,180) end
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
     if (INP.KeyH(KEY_ENTER)==1 or INP.KeyH(KEY_RETURN)==1 or INP.KeyH(KEY_SPACE)==1 or joyhit('CONFIRM') or (mousehit(1) and my<SH-100)) and cspot then
        LoadMap(cspot.Kthura)
        GoToLayer(cspot.Layer,cspot.Start)
        LAURA.Flow('FIELD')
        wm_beenthere[cspot.key] = true
     end
     -- Other shit
     ShowParty()
     ShowMouse()
     Flip()
     -- World Map Chat
     for i,ch in iParty() do
         if (mousehit(1) and ClickedChar(i)) or (INP.KeyH(i+49)==1) then WorldMapChat(ch) end
     end    

end

function R_WorldMap_Unlock(tag)
    wm_unlocked[tag] = true
    CSay(tag.." unlocked")
end

function R_WorldMap_Lock(tag)
    wm_unlocked[tag] = false
end


function GALE_OnLoad()   
   fsiz = (SH-250)/25
   colx = (SW/cols)
   fonts.WorldItem[2] = fsiz
   dotscale = math.ceil((fsiz/20)*100)
   if not CVVN('$WMCHAT') then Var.D('$WMCHAT','JUSTMET') end
end   
