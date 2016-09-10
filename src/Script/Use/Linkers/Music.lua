--[[
  Music.lua
  
  version: 16.09.10
  Copyright (C) 2015, 2016 Jeroen P. Broks
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

-- if musicavailable==nil then musicavailable=false end
musicavailable = JCR6.Exists("ID/ID.DEMO.MUSIC")==1;

({

   [ false ] = function() Music = function(s) end; PushMusic = function() end; PullMusic = function() end; PlayMusic=function() end; StopMusic=function() end; DestroyPushedMusic = function() Console.Write("No music functionality present",255,0,0) end end,
   [ true ] = function()
   
       Console.Write("Adding music functionality",180,255,0)
   
       function Music(song)
       MS.LoadNew("MUSIC","Script/Subs/Music.lua")
       MS.Run("MUSIC","TrueMusic",song)
       Var.D("$CURRENTSONG",song)
       end
       
       
       StopMusic = StopMusic or function()
       MS.LoadNew("MUSIC","Script/Subs/Music.lua")
       MS.Run("MUSIC","StopMusic")
       end

       function PushMusic()
       local pushidx = CVV("%PUSHEDSONGS") + 1
       MS.LN_Run("MUSIC","Script/Subs/Music.lua","GetCurrentSong","$CURRENTSONG")
       Var.D("%PUSHEDSONGS",pushidx)
       Var.D("$PUSHEDSONGS["..pushidx.."]",CVV("$CURRENTSONG"))
       CSay("Pushed: $PUSHEDSONGS["..pushidx.."]",CVV("$CURRENTSONG"))
       end

       function PullMusic()
       local pushidx = CVV("%PUSHEDSONGS")
       local newpushidx
       if pushidx==0 then
          CSay("WARNING! Pull music request done while no songs were pushed")
       else
          CSay("Pulled: $PUSHEDSONGS["..CVV("%PUSHEDSONGS").."]".."> "..CVV("$PUSHEDSONGS["..CVV("%PUSHEDSONGS").."]"))
          Music(CVV("$PUSHEDSONGS["..CVV("%PUSHEDSONGS").."]"))
          Var.Clear(CVV("$PUSHEDSONGS["..CVV("%PUSHEDSONGS").."]"))
          newpushidx = pushidx - 1
          Var.D("%PUSHEDSONGS",newpushidx)
          end
       end

       -- Just to have an alias :P
       PlayMusic = Music

       function DestroyPushedMusic()
       Var.D("%PUSHEDSONGS",0)
       end
       
       end
       
})[musicavailable]()  

