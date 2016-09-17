--[[
  Menu.lua
  Version: 16.09.17
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

profiles = {
                 Field = {
                      Features = {'Items','Abilities','Achievements', 'Config','Quit'},
                      HalfScreen = {Items=true,Abilities=true},
                      PartyBrowse = true
                      }
                      
           }
           
menu = menu or { chn = 1, fp = 1 }           


function Menu_Init(LoadProfile)
    profile = profiles[LoadProfile] or Sys.Error("Unknown Profile: "..sval(LoadProfile))
    profile.HalfScreen = profile.HalfScreen or {} -- Crash prevention
    profile.FeatureItem = profile.FeatureItem or 1
    MyScreen = nil
end


function Menu_GetScreen()
    local ret
    ret = {}
    ret.SW = Screen.Width()
    ret.SH = Screen.Height() - 100 -- (100 is the size of the party bar) ;)
    ret.SX = 0
    ret.SY = 0    
    ret.mar = {
                 L = tonumber(LC('screen.margin.left')  )~=0,
                 R = tonumber(LC('screen.margin.right') )~=0,
                 T = tonumber(LC('screen.margin.up')    )~=0,
                 B = tonumber(LC('screen.margin.bottom') )~=0
              }
    if ret.mar.L then ret.SX = 25 ret.SW = ret.SW - 25 end
    if ret.mar.T then ret.SY = 25 ret.SH = ret.SH - 25 end
    if ret.mar.R then             ret.SW = ret.SW - 25 end
    if ret.mar.B then             ret.SH = ret.SH - 25 end
    if #profile.Features>1 then
       ret.IB = {}
       ret.IB.X = ret.SX
       ret.IB.Y = ret.SY
       ret.SY = ret.SY + 60
       end    
    ret.CX = Screen.Width()/2
    ret.CY = Screen.Height()/2
    return ret   
end

function Menu_DrawScreen()
   -- Configure screen if needed
   MyScreen = MyScreen or Menu_GetScreen()
   -- Top line if applicable
   if #profile.Features>1 then
      Box(MyScreen.SX,0,MyScreen.SW,60)
   end
   -- Split Screen if needed
   -- Full Screen if it isn't a split screen
   -- Party pointer
   -- Party browsing if applicable
   ShowParty()
   -- Mouse pointer
   ShowMouse()
end

function MAIN_FLOW()
   Cls()   
   Menu_DrawScreen()  
   -- And show everything
   Flip()   
end
