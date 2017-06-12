-- @IF IGNORE
local SpellAni = {}
-- @FI


function SpellAni.DonaldTrump(ag,at,tg,tt)
   -- Load
   local ox,oy,ow,oh = GetViewport()
   local sombrero = Image.Load('gfx/Combat/SpellAni/Trump/Sombrero.png')
   local wall = Image.Load('gfx/Combat/SpellAni/Trump/Wall.png')
   Image.HotCenter(sombrero)
   -- Trump Speaks
   SFX('Audio/Trump/Trump.ogg')
   Time.Sleep(250)
   -- Drop Sombrero
   local rot = 0
   for i=-1000,oh+1000,5 do
       DrawScreen()
       rot = rot + 2
       Image.Rotate(rot)
       Image.Show(sombrero,ow/2,i)
       Flip()
       Image.Rotate(0)
   end    
   -- Raise Wall
   for i=oh,0,-2 do
       DrawScreen()
       Image.ViewPort(0,i,ow,oh-i)
       Image.Tile(wall,0,i)
       Image.ViewPort(ox,oy,ow,oh)
       Flip()
   end
   -- Release memory
   Image.Free(sombrero)
   Image.Free(wall)
end


-- @IF IGNORE
return SpellAni
-- @FI