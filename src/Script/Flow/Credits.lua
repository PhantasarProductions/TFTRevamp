Stars = {}
cdata = {}
function MAIN_FLOW()
      Image.Cls()
      --Orion = Orion or Image.Load('GFX/XSpace/Orionnevel.png')
      --Image.Draw(Orion,0,0)
      --[[
      -- Init (if needed)
      GoddessInitiated = GoddessInitiated or init()
      -- Control the adds
      for i=2,#Fighters.Foe do
          local foe = Fighters.Foe[i]
          if foe.goddess then
             if foe.goddess.rad > 260 then foe.goddess.rad = foe.goddess.rad - 1
             else foe.goddess.deg = foe.goddess.deg + foe.goddess.dgr end
             foe.x = 300 - (math.sin(foe.goddess.deg)*foe.goddess.rad)
             foe.y = 300 - (math.cos(foe.goddess.deg)*foe.goddess.rad)
          end
      end 
      ]]
      -- Stars
      --if Stars[1] and Stars[1].rad > 800 then table.remove(Stars,1) end
      --if #Stars<=0 or rand(1,#Stars*10)==1 then -- Lagging less of a problem so MOAR STARS PLEASE!!! 
       --  Stars [ #Stars + 1 ] = { rad = 0, spd = rand(0,20)/15, deg=rand(0,360) }
      --end
      --[[
      for star in each(Stars) do
          star.rad = star.rad + star.spd
          local x,y = 
               (math.sin(star.deg)*star.rad),
               (math.cos(star.deg)*star.rad)
          White()
          Image.Line(x+400,y+250,x+400,y+250)     
      end
      ]]
      --[[
      -- Goddess Defeated?
      if RPGStat.Points('FOE_1','HP').Have<=1 then 
         LAURA.Flow('Field')
         Image.Free(Orion) 
      end
      ]]
      local max = nil
      setfont('BoxText')
      for k,d in spairs(cdata) do          
          if d.img then
             Image.Color(d.r or 255,d.g or 255,d.b or 255)
             d.imgtag = d.imgtag or Image.Load(d.img)
             Image.HotCenter(d.imgtag)
             Image.Show(d.imgtag,400,d.y)
          else
             DarkText(d.txt,cnx,d.y,2,2,d.r or 255, d.g or 255, d.b or 255,2,2)
          end
          d.y = d.y - 1
          max = k      
      end
      if cdata[max].y<=300 then
         Time.Sleep(400)
         for k,d in spairs(cdata) do if d.imgtag then Image.Free(d.imgtag) end end
         Image.Free(Orion)
         MS.Destroy('CREDITS')
         LAURA.Flow('Field')
      end
      Flip()   
end



function GALE_OnLoad()
  cdata = JINC('Script/JINC/Big/Credits.lua')
  Music('Launcher/Launcher.ogg')
  crx,cry,crw,crh = GetViewport()
  cnx = crx/2
end
