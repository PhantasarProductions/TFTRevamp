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
                      HalfScreen = {Items={'Status','Items'},Abilities={'Status','Abilities'}},  
                      ItemShowFilters = {'All',"Field",'Equip','Key'},
                      ItemEnable = 'FieldUse',                    
                      PartyBrowse = true
                      }
                      
           }
           
menu = menu or { chn = 0, fp = 1 }        

mx,my = 0,0   


features = {}

fnpc = false
function features.notpresent(x,y,w,h,f)
local c = {[false]=0, [true]=255}
fnpc = not fnpc
DarkText("Feature "..sval(f),x+(w/2),y+10,2,0,255,c[fnpc],0)
DarkText("NOT PRESENT!",x+(w/2),y+h,2,1,255,c[fnpc],0)
end

function features.Status(x,y,w,h)
    local chn = menu.chn
    local ch  = RPGStat.PartyTag(chn)
    local procent = {Accuracy=true,Evasion=true}
    local procentteken = {[false]='',[true]='%'}
    white()
    Image.Show("CL_FACE_"..ch,(x+w)-(25+Image.Width("CL_FACE_"..ch)),y+25)
    SetFont('StatusName')
    DarkText(RPG.GetName(ch),x+25,y+25)
    SetFont('StatusStat')                                                       
    for i,s in ipairs({'Power','Endurance','Intelligence','Resistance','Speed','Accuracy','Evasion'}) do
        DarkText(s,x+25,y+100+(i*fonts.StatusStat[2]),0,0)
        DarkText(RPG.Stat(ch,"END_"..s)..procentteken[procent[s]==true],(x+w)-25,y+100+(i*fonts.StatusStat[2]),1,0,255,180,0)
    end
end


function features.Items(x,y,w,h)
    profile.ci_filter = profile.ci_filter or 1
    ItemShowList(profile.ItemShowFilters[profile.ci_filter],profile.ItemEnable,RPG.PartyTag(menu.chn),{x,y,w,h})
end




function Menu_Init(LoadProfile)
    profile = profiles[LoadProfile] or Sys.Error("Unknown Profile: "..sval(LoadProfile))
    profile.HalfScreen = profile.HalfScreen or {} -- Crash prevention
    profile.FeatureItem = profile.FeatureItem or 1
    MyScreen = nil
end


function Menu_GetScreen()
    local ret
    local tw,tpos
    if Screen.Height()<700 then fonts.StatusStat[2] = 25 end
    ret = {}
    ret.SW = Screen.Width()
    ret.SH = Screen.Height() - 100 -- (100 is the size of the party bar) ;)
    ret.SX = 0
    ret.SY = 0    
    ret.mar = {
                 L = tonumber(LC('screen.margin.left')  )~=0,
                 R = tonumber(LC('screen.margin.right') )~=0,
                 T = tonumber(LC('screen.margin.top')   )~=0,
                 B = tonumber(LC('screen.margin.bottom'))~=0
              }
    if ret.mar.L then ret.SX = 25 ret.SW = ret.SW - 25 end
    if ret.mar.T then ret.SY = 25 ret.SH = ret.SH - 25 end
    if ret.mar.R then             ret.SW = ret.SW - 25 end
    if ret.mar.B then             ret.SH = ret.SH - 25 end
    CSay('Initial Menu Screen size ('..ret.SX..","..ret.SY..')   ==== '..ret.SW.."x"..ret.SH)
    if #profile.Features>1 then
       ret.IB = {}
       ret.IB.X = ret.SX
       ret.IB.Y = ret.SY
       ret.IB.W = ret.SW
       ret.IB.H = 60
       ret.SY = ret.SY + 60
       ret.SH = ret.SH - 60
       tw = ret.SW-60
       tpos = tw / #profile.Features
       profile.FPos = {}
       for i = 1,#profile.Features do 
           profile.FPos[i] = 60+((i-1)*tpos) -- (Center_X - ((i*tpos)/2))+(i*tpos)
           Image.LoadNew('MENU_ICON_'..profile.Features[i],"GFX/Menu Icons/"..profile.Features[i]..".png")
           Image.HotCenter('MENU_ICON_'..profile.Features[i]) 
           end
       end    
    ret.CX = Screen.Width()/2
    ret.CY = Screen.Height()/2
    return ret   
end

function Menu_DrawScreen()
   if menu.fp>#profile.Features then menu.fp=1 end -- Crash prevention!
   local feat = profile.Features[menu.fp]
   -- Configure screen if needed
   MyScreen = MyScreen or Menu_GetScreen()
   -- Top line if applicable
   if #profile.Features>1 then
      Box(MyScreen.IB.X,MyScreen.IB.Y,MyScreen.IB.W,MyScreen.IB.H)
      for i,f in ipairs(profile.Features) do
          white()
          if i==menu.fp then 
             local c = 155 + ((math.sin(Time.MSecs()/125))*100)
             color(c,c,c)
             -- DarkText('Color val: '..c)
          end   
          Image.Show('MENU_ICON_'..f,profile.FPos[i],MyScreen.IB.Y+32)
          if my<60 and mx>profile.FPos[i]-24 and mx<profile.FPos[i]+24 and INP.MouseH(1)~=0 then menu.fp=i end
      end
   end
   -- Split Screen if needed
   if profile.HalfScreen[feat] then
      Box(MyScreen.SX  ,MyScreen.SY,MyScreen.SW/2,MyScreen.SH)
      Box(MyScreen.SW/2,MyScreen.SY,MyScreen.SW/2,MyScreen.SH)
      ;(features[profile.HalfScreen[feat][1]] or features.notpresent)(MyScreen.SX  ,MyScreen.SY,MyScreen.SW/2,MyScreen.SH,profile.HalfScreen[feat][1])
      ;(features[profile.HalfScreen[feat][2]] or features.notpresent)(MyScreen.SW/2,MyScreen.SY,MyScreen.SW/2,MyScreen.SH,profile.HalfScreen[feat][2])
   -- Full Screen if it isn't a split screen
   else
      Box(MyScreen.SX  ,MyScreen.SY,MyScreen.SW,MyScreen.SH)
      ;(features[feat] or features.notpresent)(MyScreen.SX,MyScreen.SY,MyScreen.SW,MyScreen.SH,feat)
   end
   -- Party pointer
   -- Party browsing if applicable
   ShowParty()
   -- Mouse pointer
   ShowMouse()
end

function Menu_Keys()
   if ( INP.KeyH(KEY_RIGHT)==1 or INP.KeyH(KEY_D)==1 or INP.JoyX()==1) then 
      menu.fp = menu.fp + 1 --CSay('R')
      while INP.JoyX()==1 do end 
      end 
   if ( INP.KeyH(KEY_LEFT )==1 or INP.KeyH(KEY_A)==1 or INP.JoyX()==-1) then 
      menu.fp = menu.fp - 1 --CSay('L') 
      while INP.JoyX()==-1 do end
      end
   if menu.fp<=0 then menu.fp = #profile.Features end
   if menu.fp> #profile.Features then menu.fp = 1 end    
end

function MAIN_FLOW()
   mx,my = GetMouse()
   Cls()   
   Menu_DrawScreen() 
   Menu_Keys() 
   -- And show everything
   Flip()   
end