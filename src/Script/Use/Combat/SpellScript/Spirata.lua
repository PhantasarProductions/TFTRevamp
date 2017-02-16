--[[
**********************************************
  
  Spirata.lua
  (c) Jeroen Broks, 2017, All Rights Reserved.
  
  This file contains material that is related 
  to a storyline that is which is strictly
  copyrighted to Jeroen Broks.
  
  This file may only be used in an unmodified
  form with an unmodified version of the 
  software this file belongs to.
  
  You may use this file for your study to see
  how I solved certain things in the creation
  of this project to see if you find valuable
  leads for the creation of your own.
  
  Mostly this file comes along with a project
  that is for most part released under an
  open source license and that means that if
  you use that code with this file removed
  from it, you can use it under that license.
  Please check out the other files to find out
  which license applies.
  This file comes 'as-is' and in no possible
  way the author can be held responsible of
  any form of damages that may occur due to 
  the usage of this file
  
  
 **********************************************
 
version: 17.02.10
]]
-- @IF IGNORE
local SpellScript = {}
-- @FI

function SpellScript.SpirataTransform(tartag,extag,param)
    -- init
    local ch = extag; if prefixed(ch,"Jake") then ch="Jake" end
    local dt = fighterbytag[extag]
    local text = Image.Load('GFX/Combat/Spirata/Text.'..ch..".png"); Image.HotCenter(text)
    local cbackbase = ({ Jake = {155,  0,0}, Marrilona = {0,0,200}, Dandor = {200,200,0}, HandoStillor={0,200,0}})[ch]
    local cbacksin  = ({ Jake = {100,  0,0}, Marrilona = {0,0, 55}, Dandor = { 55,  0,0}, HandoStillor={0, 55,0}})[ch]
    local ctext     = ({ Jake = {  0,180,0}, Marrilona = {0,180,0}, Dandor = {  0,  0,0}, HandoStillor={180,0,0}})[ch]
    local alpha     = 0
    local countdown = 1000
    local ap        = RPG.Points(extag,"AP")
    local screen    = Image.GrabScreen()
    local apbreuk   = ap.Have/ap.Maximum
    RPG.DefStat(extag,"END_SpirataRate",apbreuk*(RPG.Stat(extag,'Level')*(9/skill)))
    CSay('Spirata rate is now: '..RPG.Stat(extag,"END_SpirataRate"))
    -- let's do it!
    repeat
        Cls()
        Image.SetBlend(AlphaBlend)
        Image.Show(screen,0,0)
        Image.SetAlphaPC(alpha)
        for ly=0,SH do
            local s = math.sin((Time.MSecs()/50)+(ly/3))
            Image.Color(cbackbase[1]+(cbacksin[1]*s),cbackbase[2]+(cbacksin[2]*s),cbackbase[3]+(cbacksin[3]*s))
            Image.Line(0,ly,SW,ly)
        end    
        Image.SetAlphaPC(100)
        if alpha<=100 then alpha=alpha+1
        elseif countdown==1000 and vocals then SFX('Vocals/Spirata/'..ch..".ogg") ; countdown=999
        else 
           Image.SetBlend(LightBlend)
           Image.Color(ctext[1],ctext[2],ctext[3])
           Image.Show(text,Center_X,Center_Y)
           Image.SetBlend(AlphaBlend)
           countdown=countdown-1
        end
        if ap.Have>0 then ap.Inc(-1) end
        Image.SetBlend(AlphaBlend)
        Image.SetAlphaPC(100)
        white()  
        ShowParty() 
        Flip()
    until countdown<=0 and ap.Have<=0 
    -- closure
    Image.Free(text) -- Let it go, and the garbage collector will dispose of it accordingly.
    Image.Free(screen)
    GiveStatus(extag,"Spirata")
    return true
end
-- SpellAni.SpirataTransform = SpellScript.SpirataTransform

function SpellScript.SpirataRestore(tartag,extag,param)
   local dt = fighterbytag[extag]
   ClearTable(dt.StatusChanges)
end   

-- @IF IGNORE
return SpellScript
-- @FI    
