--[[
  Kthura.lua
  
  version: 16.09.28
  Copyright (C) 2016 Jeroen P. Broks
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
function GetCoords(tag)
   local r = Actors.Actor(tag)
   return r.x,r.y,r.wind
end   


function MapSize()
   --CSay("Mapsize = "..Maps.Kthura().BlockMapGridW..","..Maps.Kthura().BlockMapGridH)
   local gw,gh = Maps.Kthura().BlockMapGridW,Maps.Kthura().BlockMapGridH
   local mw,mh = Maps.Kthura().blockmapboundW , Maps.Kthura().blockmapboundH
   return mw*gw,gh*mh
end
