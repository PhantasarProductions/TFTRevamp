wm_unlocked = wm_unlocked or {}

dotcol = { nodung =   {  0,  0,255 },
           noemblem = {255,  0,  0 },
           emblem =   {  0,255,  0 }}
           
           
           
function LoadWorld(worldfolder)
   allwords = allwords or jinc('Script/JINC/Big/WorldMap.lua')
   world = {}
   for k,v in pairs(allwords) do
       if v.Folder==worldfolder then
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