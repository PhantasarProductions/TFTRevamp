-- Property of Jeroen P. Broks
-- May not be extracted from this game.

function MapMusic()
   if not Done("&DONE.SANDRA.OPEN.DANDOR.PROLOGUE") then 
      CSay("Skip the music for now. Let John speak first.")
   else
      OriMapMusic()
   end   
end


function CreateDandorSkill()
   CreateSkill('Dandor',1,30/skill)
end

function Sandra()
    Maps.CamX=0
    Maps.CamY=900
    MapText("SANDRA_A")
    for i=900,0,-1 do
        Cls()
        Maps.CamY=i
        DrawScreen()
        Flip()
    end
    MapText("SANDRA_B")
end