--[[
  Idle.lua
  Version: 16.10.01
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
-- @IF IGNORE
fflow = {}
-- @FI

function AddCard(data,aspot)
    local card = { data=data }
    local ch   = data.tag    
    local spot = aspot or ( 25 + (order.tagorder[ch] * 2)+ (math.floor(rand(1,order.tagorder[ch])/2)) )
    while cards[spot] and cards[spot].data do spot=spot+1 end -- If the spot is taken, move to the next one.
    cards[spot] = card
end

function RemoveFirstCard()
    local max = 0
    for i,_ in pairs(cards) do if i>max then max=i end end
    for i=1,max do cards[i] = cards[i] or {} end
    table.remove(cards,1)
end

function fflow.idle()
    -- Are there any fighters who do not have a card yet?
    local k
    for group,grouparray in pairs(Fighters) do
        for idx,data in pairs(grouparray) do
            k = nil
            for _,crd in pairs(Cards) do -- Looking for the card
                k = k or (crd.data and crd.data.group==group and crd.data.tag==data.tag and (not crd.data.ability)) 
            end 
            if not k then AddCard({group=group,tag=data.tag, letter=data.letter}) end
        end
    end
    -- Make the cards flow
    local card = Cards[1]
    if card.y>40 then return end -- Card must be on top before we do anything at all!
    if not card.data then
       SFX('Audio/Combat/CardSlide.ogg')
       -- table.remove(Cards,1)
       RemoveFirstCard()
       return
    end
    if card.data.group == 'Foe' then if  (not TurnSkip(card.data.tag,true)) then flow = 'foeinput' else RemoveFirstCard() end 
    elseif card.data.group == 'Hero' then if (not TurnSkip(card.data.tag,true)) then fflow.setplayerinput(card.data.tag) else RemoveFirstCard() end end
end


-- @IF IGNORE
return fflow
-- @FI