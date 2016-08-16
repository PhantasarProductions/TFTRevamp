Rem
	The Fairy Tale REVAMPED!
	Load Game Tab
	
	
	
	(c) Jeroen P. Broks, 2016, All rights reserved
	
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
Version: 16.08.12
End Rem
Strict

Import "FrameWork.bmx"


Import tricky_units.advFileRequest
Import tricky_Units.ListDir

Private

MKL_Lic     "The Fairy Tale - REVAMP - LoadGame.bmx","GNU General Public License 3"
MKL_Version "The Fairy Tale - REVAMP - LoadGame.bmx","16.08.12"

afr_InpCol 0,27,0,0,155,0
afr_WinCol 0,255,0,0,25,0

Function LoadGame(G:TGadget)
End Function

Function Synchronize(G:TGadget)
End Function

Function ImportGame(G:TGadget)
	Notify "Import allows you to copy savegame files from your friends to be added to your savegame list.~n~nPlease note, if the imported savegame contains any data to allow it to contact Anna or Game Jolt or any other network, it will be disabled, meaning you can play the game from these files, but you cannot contact any achievements sites with them any more."
	Local cd$ = CurrentDir()
	ChangeDir Dirry("$Home$")
	Local ifile$ = afr_RequestFile("Please choose your file:")
	ChangeDir cd$
End Function

Function ExportGame(G:TGadget)
End Function

Global mypan:mygadget = newtab("Load Game")
Global panel:TGadget = mypan.g


Global bw = pw/4
Global by = ph-25
' Buttons first (even though they live at the bottom)
gadgets.button "Load"       ,bw * 0,by,bw,25,panel,Loadgame
gadgets.button "Synchronize",bw * 1,by,bw,25,panel,Synchronize
gadgets.button "Import"     ,bw * 2,by,bw,25,panel,ImportGame
gadgets.button "Export"     ,bw * 3,by,bw,25,panel,ExportGame

Global MustHaveFile:TList = New TList
For Local g:TGadget = EachIn panel.kids
	If GadgetText(G)<>"Import" ListAddLast MustHaveFile,G
Next

Function CheckHave(MyBool:Byte)
	For Local g:TGadget = EachIn MustHaveFile
		g.setenabled MyBool
	Next
	Return myBool
End Function
CheckHave False


' Marrilona
Gadgets.make "Marrilona",CreatePanel(pw-bw,0,bw,by,Panel)
SetGadgetPixmap gadgets.gadget("Marrilona"),LoadPixmap ( JCR_B(JCR,"GFX/Big_Char/Marrilona.png") ),PANELPIXMAP_CENTER


' We have no savegame panel

Global WeHaveNoSaveGames:TGadget = CreateLabel("There are no savegames, yet!~nPlease start a new game first and save your game~nbefore using this feature",0,0,pw-bw,by,panel,label_Center)
Global WeDoHaveSaveGames:TGadget = CreatePanel(0,0,PW-BW,BY,Panel)
Global SGPan:TGadget = WeDoHaveSaveGames
gadgets.cr WeHaveNoSaveGames
gadgets.cr WeDoHaveSaveGames
Global ShowPans:TGadget[] = [WeHaveNoSaveGames,WeDoHaveSaveGames]

' Load Game window features


' Check what we got
Function ShowCheck(MyBool)
	For Local i=0 Until Len showpans
		showpans[i].setshow i=MyBool
	Next
	If Not MyBool Return CheckHave(False)
End Function

Function Check()
Local dirs:TList = ListDir(savedir,ListDir_DirOnly)
If Not CountList(dirs) Return ShowCheck(False)
End Function


' Activation of this panel
Function Activate(G:TGadget)
	check
End Function
mypan.activate = activate


