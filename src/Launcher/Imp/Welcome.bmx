Rem
	The Fairy Tale REVAMPED!
	Welcome to the game tab
	
	
	
	(c) Jeroen P. Broks, 2016, 2017, All rights reserved
	
		This program is free software: you can redistribute it and/or modify
		it under the terms of the GNU General Public License as published by
		the Free Software Foundation, either version 3 of the License, or
		(at your option) any later version.
		
		This program is distributed in the hope that it will be useful,
		but WITHOUT ANY WARRANTY; without even the implied warranty of
		MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
		GNU General Public License for more details.
		You should have received a copy of the GNU General Public License
		along with this program.  If not, see <http://www.gnu.org/licenses/>.
		
	Exceptions to the standard GNU license are available with Jeroen's written permission given prior 
	to the project the exceptions are needed for.
Version: 17.10.31
End Rem
Strict

Import "FrameWork.bmx"

Private

MKL_Lic     "The Fairy Tale - REVAMP - Welcome.bmx","GNU General Public License 3"
MKL_Version "The Fairy Tale - REVAMP - Welcome.bmx","17.10.31"

Global mypan:mygadget = newtab("Welcome")
Global Panel:TGadget = mypan.G

SetGadgetPixmap CreatePanel(0,0,PW,168,Panel),LoadPixmap(JCR_B(JCR,"GFX/Logo/Phantasar Productions.png")),PANELPIXMAP_CENTER

Gadgets.Cr CreateLabel( "presents",0,175,PW,25,Panel,Label_center )

SetGadgetPixmap CreatePanel(0,245,PW,150,panel),LoadPixmap(JCR_B(JCR,"GFX/Logo/Title.png")),PANELPIXMAP_CENTER

gadgets.cr CreateLabel("A game by: Jeroen P. Broks",0,400,PW,25,panel,Label_center)

gadgets.cr CreateLabel("This game is part of ~qThe Phantasar Chronicles~q, written and copyrighted by Jeroen P. Broks.~nNothing from this game's story line, characters and all other parts of the Phantasar universe may be used for your own purposes without prior written permission from the copyright holder.",0,450,PW,100,panel,label_center)


Global midx = PW/2
Global butx = midx - 100
Function JoinDiscord(G:TGadget) OpenURL("https://discord.gg/RU3V6YU") EndFunction
gadgets.cr CreateButton("Join the discord server",butx,500,200,25,panel),Null,JoinDiscord

Function VisitSite(G:tgadget) OpenURL "https://tricky.gamejolt.io/tft" EndFunction
gadgets.cr CreateButton("Visit website",butx,525,200,25,panel),Null,VisitSite

Function Reportbugs(G:tgadget) OpenURL "https://github.com/PhantasarProductions/TFTRevamp/issues" EndFunction
gadgets.cr CreateButton("Report bugs",butx,550,200,25,panel),Null,reportbugs


Global copyrightdone
Function Activate(G:TGadget)
     If Not copyrightdone 
	gadgets.cr CreateLabel(Chr(169)+" Copyright Jeroen P. Broks 2016-20"+Left(MKL_NewestVersion(),2),0,PH-25,pw,25,panel,label_center)
	copyrightdone=True
     EndIf
End Function
mypan.activate = activate
