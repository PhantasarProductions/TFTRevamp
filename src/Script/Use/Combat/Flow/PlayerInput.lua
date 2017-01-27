--[[
  PlayerInput.lua
  Version: 17.01.26
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
-- @IF IGNORE
fflow = {}
-- @FI

 KEY_LEFT=37; KEY_UP=38; KEY_RIGHT=39; KEY_DOWN=40


fflow.inputicons = { attack = {
                            x = 0, y = 0,
                            allow = function() return true end,
                            key = nil,
                            joyx = 100, -- These values are never given, and will as a result prevent conflicts.
                            joyy = 100,
                            selected = function(ch)
                               nextact = { act = 'AAA_Attack', flow='playerselectsingletarget', group='Foe', mayteach=true }
                               -- If the player is wearing a weapon causing an alternate attack then let's get this onto the road
                               local weaponname = RPG.GetData(ch,"EQP_Weapon")
                               local weapon = ItemGet(weaponname)
                               CSay(sval(weapon.ITM_WeaponAbility))
                               if weapon.ITM_WeaponAbility then nextact.act = weaponname end
                               -- If the player learns a new move, hey let's get the showon the road ;)   
                            end
                        },
                     ability = {
                                 x = 0, y = -50,
                                 allow = function()
                                          -- Actual content comes later when abilities are actually possible.
                                          return true
                                         end,
                                 key = KEY_UP,
                                 joyx = nil,
                                 joyy = -1,
                                 selected = function(ch)
                                      nextact = {flow='selectability'}
                                 end        
                               }   ,
                     spirata = {
                                 x = 0, y = 50,
                                 allow = function()
                                           return CVV("&SPIRATA."..upper(inputchar.tag))
                                         end,
                                 key = KEY_DOWN,
                                 joyx = nil,                                 
                                 joyy = 1,
                                 selected = function(ch)
                                               Sys.Error('There is no way to transform into a Spirata yet. Please come back later.')
                                            end        
                               } ,
                     items = {
                                 x = -50, y = 0,
                                 allow = function()
                                           return true
                                         end,
                                 key = KEY_LEFT,
                                 joyx = -1,
                                 joyy = nil,  
                                 selected = function()
                                               nextact = { flow='selectitem' }
                                            end 
                               },
                     guard = {
                                 x = 50, y = 0,
                                 allow = function()
                                           return true
                                         end,
                                 key = KEY_RIGHT,
                                 joyx = 1,
                                 joyy = nil,        
                                 selected = function(ch)
                                   nextact = { act = 'AAA_Guard', flow='Execution', group='Hero', mayteach=false }
                                 end
                                 }
             }
             
inputicons = fflow.inputicons             

function fflow.setplayerinput(ch)
     SFX('Audio/Combat/Ready.ogg')
     inputchar = {tag =  ch, name=RPG.GetName(ch), face="CL_FACE_"..ch, facewidth=Image.Width("CL_FACE_"..ch)-10, fc=0 }
     flow = 'playerinput'
end

function fflow.playerinput()
     assert ( inputchar, "I don't know which char I must receive input for!" )
     local x = Center_X
     local y = Center_Y-(Center_Y/5)
     local c = inputchar.fc
     local menuy = y + 50
     local menux = x + 50
     local mousex,mousey = GetMouse()
     -- local dy
     -- Heading
     SetFont('CombatName')
     DarkText(inputchar.name,x,y-100,2,2,c,c,c)
     color(c,c,c) if c<255 then c=c+1 inputchar.fc=c end
     Image.Show(inputchar.face,x-inputchar.facewidth,y)
     -- Menu
     local citem = 'attack' -- If nothing is chosen, attack will be the selected option.
     for key,data in pairs(inputicons) do
         Image.LoadNew("COMBAT_ICON_"..key,"GFX/Combat/Menu/"..key..".png")
         -- dy = (dy or 0) + 20; Image.NoFont() DarkText('data.key='..sval(data.key)..' KeyDown('..sval(data.key)..')='..INP.KeyD(data.key).." ("..key..")",0,dy)
         if (INP.KeyD(data.key)==1 or (INP.JoyX()==(data.joyx or INP.JoyX()) and INP.JoyY()==(data.joyy or INP.JoyY()))) and data.allow() then citem=key end 
         if (INP.MouseH(1)==1 and mousex>data.x+menux and mousex<data.x+menux+50 and mousey>data.y+menuy and mousey<data.y+menuy+50) then citem=key end
         if key==citem and (INP.KeyH(KEY_ENTER)==1 or INP.KeyH(KEY_SPACE)==1 or joyhit('CONFIRM') or (INP.MouseH(1)==1 and mousex>data.x+menux and mousex<data.x+menux+50 and mousey>data.y+menuy and mousey<data.y+menuy+50)) then
            nextact = {}
            data.selected(inputchar.tag)
            nextact.executor = {group='Hero', tag=inputchar.tag }
            assert ( nextact.executor.tag, "Tagging the executor tag failed!")
            --nextact.action = inputicons[citem].act -- Will be nil if not set, but that's not that bad, as it can be defined later in case of items or abilities.
            flow = nextact.flow
         end
         white()
         if citem==key then 
            local sinc = 200 + (sin(Time.MSecs()/250)*55)
            color(sinc,sinc,sinc)
         end
         if not data.allow() then color(100,100,100) end
         Image.Show("COMBAT_ICON_"..key,data.x+menux,data.y+menuy)
     end     
     -- Showing the mouse comes last!
     ShowMouse()
end

function RedoTarget(modifier,comodifier)
    local timeout = 1000
    --CSay("RedoTarget("..sval(modifier)..","..sval(comodifier)..")")
    nextact.targetidx = nextact.targetidx + (modifier or 1)
    while (not Fighters[nextact.group][nextact.targetidx]) or (RPG.Points(Fighters[nextact.group][nextact.targetidx].tag,"HP").Have==0 and prefixed(nextact.group=='Foe')) do
        nextact.targetidx = nextact.targetidx + (comodifier or modifier or 1)
        if nextact.targetidx<0 then nextact.targetidx=groupmax end
        if nextact.targetidx>groupmax then nextact.targetidx=0 end 
        timeout = timeout - 1
        assert(timeout>=0,"RedoTarget: Timeout!")
    end    
    return true
end

function fflow.playerselectsingletarget()
     nextact.targetidx = nextact.targetidx or ({Foe=1,Hero=0})[nextact.group]
     nextact.targetinit = nextact.targetinit or RedoTarget(0,1)
     -- Showing the mouse comes last!
     ShowMouse()
     -- User input
     if INP.KeyH(KEY_ESCAPE)==1 or joyhit('CANCEL') or INP.MouseH(2)==1 then flow = nextact.inpcancel or 'playerinput' end
     if INP.KeyH(KEY_DOWN)==1 or joyhit(joy_down) then RedoTarget( 1) end
     if INP.KeyH(KEY_UP)==1   or joyhit(joy_up)   then RedoTarget(-1) end  
     if INP.KeyH(KEY_ENTER)==1 or INP.KeyH(KEY_SPACE)==1 or INP.MouseH(1)==1 or joyhit('CONFIRM') then 
           flow= nextact.aftertarget or 'Execution' 
        end
end

function fflow.PrepareAction(myitem,aftertarget)
nextact.aftertarget = aftertarget;
({
     ['1F'] = function() nextact.group='Foe'  flow='playerselectsingletarget' end,
     ['1A'] = function() nextact.group='Hero' flow='playerselectsingletarget' end,
     ['AF'] = function() nextact.group='Foe'  flow=aftertarget                end,
     ['AA'] = function() nextact.group='Hero' flow=aftertarget                end,
     ['OS'] = function() nextact.group='Hero' flow=aftertarget                end
})[myitem.Target]()
end

function fflow.ItemMin()
    RemoveItem(nextact.act,1)
    flow = 'Execution'
end

function fflow.APMin()
      local ch = inputchar.tag
      local myitem = nextact.act
      local ig = ItemGet(myitem)
      if ch=="Marrilona" and MarrilonaLow() then
         if not Done('&TUTORIAL.AUTOMOVE.MARRILONA') then
            Var.D('$TUT.MAR.PRC',({'15%','7.5%','5%'})[skill]) 
            SerialBoxText('COMBATLEARN','AUTO_MARRILONA','FLOW_COMBAT') 
         end
      else
         RPG.Points(ch,'AP').Dec(ig.ABL_APCost)
      end    
      flow = "Execution"
end

function fflow.selectitem()
   local bx = 100
   local by = 100
   local bw = SW-200
   local bh = SH-300
   Box(bx,by,bw,bh)
   ItemShowList('Combat','Combat',inputchar.tag,{bx,by,bw,bh})
   ShowMouse()
   local myitem = SelectedItem()
   if myitem then nextact.act=myitem fflow.PrepareAction(ItemGet(myitem),'ItemMin') end   
   if getpress.cancel() or mousehit(2) then flow = 'playerinput' end
end

function fflow.selectability()
   --selcd = selcd or 250
   -- if selcd>0 then selcd = selcd - 1 return end
   local bx = 100
   local by = 100
   local bw = SW-200
   local bh = SH-300
   local ch = inputchar.tag
   Box(bx,by,bw,bh)
   ShowSpellList(inputchar.tag,{bx,by,bw,bh})
   ShowMouse()
   local myitem = SelectedAbility()
   if myitem then 
      nextact.act=myitem 
      local ig = ItemGet(myitem)
      fflow.PrepareAction(ig,'APMin')
      -- selcd=nil
   end   
   if getpress.cancel() or mousehit(2) then 
      flow = 'playerinput' 
      -- selcd=nil 
   end
end

-- @IF IGNORE
return fflow
-- @FI
