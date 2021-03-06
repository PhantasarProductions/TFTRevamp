Rem
	The Fairy Tale REVAMPED!
	Load Game Tab
	
	
	
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
Version: 17.10.10
End Rem


Strict

Import "FrameWork.bmx"


Import tricky_units.advFileRequest
Import tricky_Units.ListDir

Private

MKL_Lic     "The Fairy Tale - REVAMP - LoadGame.bmx","GNU General Public License 3"
MKL_Version "The Fairy Tale - REVAMP - LoadGame.bmx","17.10.10"

afr_InpCol 0,27,0,0,155,0
afr_WinCol 0,255,0,0,25,0

Function TrueLoadGame(U$="",S$="")
        If (Not cursg) And (Not (U And S))  Return
	Local LGI:TIni = New TIni
	lgi.D "Resource",Resource+"TFT.jcr"
	lgi.D "Title","The Fairy Tale REVAMPED"
	lgi.D "CodeName","TFTREVAMP"
	?MacOS
	lgi.add "Resource",ExtractDir(ExtractDir(AppFile))+"/Resources/TFT.JCR"
	lgi.D "MacReturn",ExtractDir(ExtractDir(ExtractDir(AppFile)))
	?Not MacOS
	lgi.add "Resource",AppDir+"/TFT.JCR"
	?
	If u And S
		lgi.d "LoadGame",savedir+"/"+U+"/"+S
	Else
		lgi.d "LoadGame",cursg.file
	EndIf		
	lgi.d "StartScript","LoadGame.lua"
	lgi.d "StartUpFunction","LoadGame"
	lgi.d "TITLE","The Fairy Tale REVAMPED"
	Mode2Ini lgi
	SaveIni LAURA2StartFile, lgi
	gadgets.get("win").g.setshow False
	If cursg
		launcherconfig.D "LastSG.User",cursg.user
		launcherconfig.D "LastSG.File",cursg.file
		launcherconfig.D "LastSG.User",cursg.user
		launcherconfig.D "LastSG.File",cursg.file
		SaveLauncherConfig()
	EndIf	
	?MacOS
	Local app$ = ExtractDir(ExtractDir(AppFile))+"/Resources/LAURA2.app"
	If Not FileType(app) Notify "Trouble launching LAURA II~n~n"+App
	system_ "open ~q"+app+"~q"
	End
	?Win32
	system_ "LAURA2.exe"
	?Linux
	system_ "./LAURA2"
	?
	gadgets.get("win").g.setshow True		
End Function

Function LoadGame(G:TGadget)
	TrueLoadGame
End Function
	

Function TrueSynchronize(U$="",S$="")
	If (Not cursg) And (Not (U And S))  Return
	Local lgi:TIni = New TIni
	lgi.D "Resource",Resource+"TFT.jcr"
	lgi.D "Title","The Fairy Tale REVAMPED"
	lgi.D "CodeName","TFTREVAMP"
	?MacOS
	lgi.add "Resource",ExtractDir(ExtractDir(AppFile))+"/Resources/TFT.JCR"
	lgi.D "MacReturn",ExtractDir(ExtractDir(ExtractDir(AppFile)))
	?Not MacOS
	lgi.add "Resource",AppDir+"/TFT.JCR"
	?
	If u And S
		lgi.d "LoadGame",savedir+"/"+U+"/"+S
	Else
		lgi.d "LoadGame",cursg.file
	EndIf		
	lgi.d "StartScript","Synchronize.lua"
	lgi.d "StartUpFunction","Synchronize"
	lgi.d "TITLE","The Fairy Tale REVAMPED"
	Mode2Ini lgi
	lgi.d "screen.fullscreen","false"
	SaveIni LAURA2StartFile, lgi
	?Not MacOS
	gadgets.get("win").g.setshow False
	?
	?MacOS
	Local app$ = ExtractDir(ExtractDir(AppFile))+"/Resources/LAURA2.app"
	If Not FileType(app) Notify "Trouble launching LAURA II~n~n"+App
	system_ "open ~q"+app+"~q"
	?Win32
	system_ "LAURA2.exe"
	?Linux
	system_ "./LAURA2"
	?
	gadgets.get("win").g.setshow True			
End Function

Function Synchronize(G:TGadget)
	TrueSynchronize
EndFunction	

Function ImportGame(G:TGadget)
	Notify "Import allows you to copy savegame files from your friends to be added to your savegame list.~n~nPlease note, if the imported savegame contains any data to allow it to contact Anna or Game Jolt or any other network, it will be disabled, meaning you can play the game from these files, but you cannot contact any achievements sites with them any more."
	Local cd$ = CurrentDir()
	ChangeDir Dirry("$Home$")
	'Local ifile$ = afr_RequestFile("Please choose your file:","","Fairy Tale Save Game:TFTRSG")
	Local ifile$ = RequestFile("Please choose your file:","Fairy Tale Save Game:TFTRSG")
	ChangeDir cd$
	Local j:TJCRDir = JCR_Dir(ifile)
	If Not j Return Notify("JCR6 did not recognize the file. It's either corrupted or not a valid file to be imported")
	Local b:TBank = JCR_B(j,"SWAP/SAVEMETA/META")
	If Not b Then Return Notify("This file's META header could not be read, meaning this file is very likely not a valid file to be imported")
	Local valid = False
	For Local l$=EachIn Listfile(b)
		valid = valid Or Trim(l)="Game:TFTREVAMP"
	Next
	If Not valid Return Notify("This file appears to be for a different production. Whatever production it is, it's at least not a Fairy Tale REVAMPED saved game file")
	If Not CreateDir(savedir+"/Imported",1) Return Notify("I could not created the imported folder in your saved game system")
	Local i = -1
	Local ofile$
	Repeat
		i:+1
		ofile = savedir+"/Imported/TFTSG_IMPORTED_"+Hex(i)
	Until Not FileType(ofile)
	Local o:TJCRCreate = JCR_Create(ofile)
	If Not o
		?debug
			Notify "I could not create: "+ofile
		?Not debug
			Notify "I could not import the file. Imported file could not be created"
		?
		Return
	EndIf
	Local je:TJCREntry
	For je = EachIn MapValues(j.entries)
		If je.filename.toupper()="LAURA/SYSTEM"
			Local s$=LoadString(JCR_B(j,je.filename))
			s = Replace(s,"User = ","User = Imported~nOldUser = ")
			o.AddString(s,"LAURA/System","zlib")
		ElseIf je.Storage<>"STRONT" And ExtractDir(je.filename.toupper())<>"NET"
			o.addentry JCR_B(j,je.filename),je.filename,"zlib"
			Print "Exported: "+je.filename	
		EndIf
	Next
	o.close "zlib"
	Notify "Import complete. ~nI now need to rescan your savegame system"
	Check
	Notify "Rescanning done"
End Function

Function ExportGame(G:TGadget)
	Notify "Export allows you to copy savegame files to any device so you can sharethem with your friends~n~nPlease note, if the exported savegame contains any data to allow it to contact Anna or Game Jolt or any other network, it will be disabled, meaning you can play the game from these files, but you cannot contact any achievements sites with them any more.~n~n(Don't worry, the original files you have will still be able to)."
	Local cd$ = CurrentDir()
	ChangeDir Dirry("$Home$")
	'Local efile$ = afr_RequestFile("Please name your file:","","Fairy Tale Save Game:TFTRSG",True)
	Local efile$ = RequestFile("Please name your file:","Fairy Tale Save Game:TFTRSG",True)
	ChangeDir cd$
	If Not efile Return
	Local j:TJCRDir = JCR_Dir(cursg.file)
	If Not j Return Notify("Something went wrong with reading the original file")
	Local O:TJCRCreate = JCR_Create(efile)
	Local je:TJCREntry
	For je = EachIn MapValues(j.entries)
		If je.Storage<>"STRONT" And ExtractDir(je.filename.toupper())<>"NET"
			o.addentry JCR_B(j,je.filename),je.filename,"zlib"
			Print "Exported: "+je.filename	
		EndIf
	Next
	o.close "zlib"
	Notify "File exported as: "+efile	
End Function

Global mypan:mygadget = newtab("Load Game")
Global panel:TGadget = mypan.g


Global bw = pw/4
Global bh = ph/4
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
If Month()=12 Then
	SetGadgetPixmap gadgets.gadget("Marrilona"),LoadPixmap ( JCR_B(JCR,"GFX/Big_Char/Marrilona_Christmas.png") ),PANELPIXMAP_CENTER
ElseIf Month()=6 And Day()=19
	SetGadgetPixmap gadgets.gadget("Marrilona"),LoadPixmap ( JCR_B(JCR,"GFX/Big_Char/Marrilona_JeroenJarig.png") ),PANELPIXMAP_CENTER
ElseIf Month()=10 And Day()>23 
	SetGadgetPixmap gadgets.gadget("Marrilona"),LoadPixmap ( JCR_B(JCR,"GFX/Big_Char/Marrilona_Halloween.png") ),PANELPIXMAP_CENTER	
ElseIf Month()=1 And Day()<=6 	
	SetGadgetPixmap gadgets.gadget("Marrilona"),LoadPixmap ( JCR_B(JCR,"GFX/Big_Char/Marrilona_NewYear.png") ),PANELPIXMAP_CENTER
ElseIf Month()=4 And ((DayOfTheWeek()="Sat" And Day()=26) Or (DayOfTheWeek()<>"Sun" And Day()=27))
	SetGadgetPixmap gadgets.gadget("Marrilona"),LoadPixmap ( JCR_B(JCR,"GFX/Big_Char/Marrilona_King.png") ),PANELPIXMAP_CENTER
ElseIf Month()=2 And Day()<=18 And Day()>=10 	
	SetGadgetPixmap gadgets.gadget("Marrilona"),LoadPixmap ( JCR_B(JCR,"GFX/Big_Char/Marrilona_Valentine.png") ),PANELPIXMAP_CENTER
ElseIf (Month()=11 And Day()=11) Or (Month()=2 And Day()>18) Or (Month()=3 And Day()<10)
	SetGadgetPixmap gadgets.gadget("Marrilona"),LoadPixmap ( JCR_B(JCR,"GFX/Big_Char/Marrilona_Clown.png") ),PANELPIXMAP_CENTER
ElseIf Month()=4 Or (Month()=3 And Day()>20)
	SetGadgetPixmap gadgets.gadget("Marrilona"),LoadPixmap ( JCR_B(JCR,"GFX/Big_Char/Marrilona_Easter.png") ),PANELPIXMAP_CENTER
Else	
	SetGadgetPixmap gadgets.gadget("Marrilona"),LoadPixmap ( JCR_B(JCR,"GFX/Big_Char/Marrilona.png") ),PANELPIXMAP_CENTER
EndIf

' We have no savegame panel

Global WeHaveNoSaveGames:TGadget = CreateLabel("There are no savegames, yet!~nPlease start a new game first and save your game~nbefore using this feature",0,0,pw-bw,by,panel,label_Center)
Global WeDoHaveSaveGames:TGadget = CreatePanel(0,0,PW-BW,BY,Panel)
Global oph = ph
by = ClientHeight(WeDoHaveSaveGames); ph = by; bh=ph/4
Global SGPan:TGadget = WeDoHaveSaveGames
gadgets.cr WeHaveNoSaveGames
gadgets.cr WeDoHaveSaveGames
Global ShowPans:TGadget[] = [WeHaveNoSaveGames,WeDoHaveSaveGames]

' Load Game window features

Global ScreenShot:TGadget = CreatePanel(bw,ph-bh,bw,bh,WeDoHaveSaveGames)
SetGadgetColor ScreenShot,0,0,0

Global chpan:TGadget[4]
Global portret:TGadget[4]
Global Level:TGadget[4]
Global chx[] = [0,bw/2,0,bw/2]
Global chy[] = [ph-bh,ph-bh,ph-(bh/2),ph-(bh/2)]
Global needgame:TList = New TList
ListAddLast needgame,screenshot

For Local i=0 Until 4
	chpan[Int(i)] = CreatePanel(chx[i],chy[i],bw/2,bh/2,WeDoHaveSaveGames,Panel_Sunken) 'CreatePanel(Int(i-Floor(i/2))*(bw/2),(bh)+Floor(i/2),bw/2,bh/2,WeDoHaveSaveGames)
	portret[Int(i)] = CreatePanel(0,0,ClientWidth(chpan[Int(i)])/2,ClientHeight(chpan[Int(i)]),chpan[Int(i)])
	SetGadgetColor portret[Int(i)],0,0,0
	level[Int(i)] = CreateLabel(" --",ClientWidth(chpan[Int(i)])/2,ClientHeight(chpan[Int(i)])-25,ClientHeight(chpan[Int(i)])/2,25,chpan[Int(i)])
	?debug
	SetGadgetText level[i],"id"+i
	?
	gadgets.cr level[Int(i)]
	ListAddLast needgame,chpan[i]
Next

Global TreeView:TGadget = CreateTreeView(0,0,pw/2,bh*3,WeDoHaveSaveGames)
Global Root:TGadget = TreeViewRoot(treeview)
gadgets.make "LGTREE",treeview,CGUIN ',LoadGame


' Check what we got
Function ShowCheck(MyBool)
	For Local i=0 Until Len showpans
		showpans[i].setshow i=MyBool
	Next
	If Not MyBool Return CheckHave(False)
End Function



Type tsg
	Field file$ 
	Field portret:TPixmap[4]
	Field level[4]
	Field Time$
	Field Location$
	Field shot:TPixmap
	Field User$
End Type
Global mapsg:TMap = New TMap	
Global cursg:tsg

Function NoGame()
	DebugLog "No Game Selected"
	For Local G:TGadget = EachIn needgame
		HideGadget g
	Next
End Function

Function ShowGame()
	If Not cursg Return DebugLog("No game for ShowGame()")
	For Local i=0 Until 4
		SetGadgetPixmap portret[i],cursg.portret[i],PANELPIXMAP_FIT2
		If cursg.level[i] SetGadgetText level[i],"Lv "+cursg.level[i] Else SetGadgetText level[i],""
	Next
	SetGadgetPixmap screenshot,cursg.shot,PANELPIXMAP_FIT2
	For Local G:TGadget = EachIn needgame
		ShowGadget g
	Next
End Function	
	

Function FindSaveFromTree(G:TGadget)
	If Not G Return
	Local tab:TGadget = gadgets.get("Tabber").G
	Local IT$=GadgetItemText(tab,SelectedGadgetItem(tab))
	If IT<>"Load Game" Return
	DebugLog "Find game from tree request  ... "+GadgetClass(G)
	If GadgetClass(G)<>16 Return DebugLog("Wrong kind of gadget type to work with")
	If Not G 
		cursg=Null 
		DebugLog "No gadget given to findgame from tree"
		Return NoGame()
	EndIf	
	cursg = Tsg(MapValueForKey(mapsg,G))
	If Not cursg Return NoGame()
	ShowGame	
End Function
gadgets.get("LGTREE").Extra = FindSaveFromTree

Function FS(G:TGadget) End Function; gadgets.get("LGTREE").fselect = fs

Function listsg:TGadget(dir$,node:TGadget,u$)
	Local J:TJCRDir
	Local ff$
	Local sg:tsg
	Local lr$[]
	Local Disp$
	Local allow = True
	Local Ret:TGadget,tn:TGadget
	For Local f$=EachIn ListDir(dir)
		allow = True
		ff = dir+"/"+f
		?Win32
		ff = Replace(ff,"/","\")
		?
		DebugLog "Scanning: "+ff
		J = JCR_Dir(ff)
		sg = New tsg
		sg.User = u
		If J
			sg.file = ff
			If Not(JCR_Exists(J,"SWAP/SAVEMETA/META") And JCR_Exists(J,"SWAP/SAVEMETA/SHOT.png"))
				allow=False
			Else
				For Local L$=EachIn Listfile(JCR_B(j,"SWAP/SAVEMETA/META"))
					lr = l.split(":")
					If Len(lr)>=2
						Select Trim(lr[0])
							Case "Game"
								If lr[1]<>"TFTREVAMP" DebugLog "Invalid savegame found." 
							Case "Location"	sg.location=lr[1]
							Case "Time"	
								sg.Time=""
								For Local li = 1 Until (Len lr)
									If sg.Time sg.Time:+":"
									sg.Time:+lr[li]
								Next
							Case "CH0PIC","CH1PIC","CH2PIC","CH3PIC"
								sg.portret[lr[0][2]-48] = LoadPixmap(JCR_B(JCR,"GFX/Boxtext/Portret/"+lr[1]+"/General.png"))
							Case "CH0LVL","CH1LVL","CH2LVL","CH3LVL"
								sg.level[lr[0][2]-48] = lr[1].toint()
							Default
								DebugLog "Unknown command >> "+l
						End Select
					EndIf
				Next
				sg.shot = LoadPixmap(JCR_B(J,"SWAP/SAVEMETA/SHOT.png"))
			EndIf
		Else
			allow=False	
		EndIf
		If allow
			disp = sg.location+" ("+sg.Time+")   "
			?Not debug
			If Not Prefixed(f,"TFTSG_")
			?
				disp = "["+f+"]   "+disp
			?Not debug
			EndIf
			?
			DebugLog "Adding: "+disp+" >> "+sg.file
			tn = AddTreeViewNode(disp,node)
			MapInsert mapsg,tn,sg
			If sg.file = launcherconfig.c("LastSG.File") ret=tn; DebugLog "Selected node for: "+sg.file
		EndIf
	Next
	Return ret
End Function		

Function Check()
	ClearMap mapsg
	ClearTreeView treeview
	NoGame
	Print "Checking: "+Savedir
	Local dirs:TList = ListDir(savedir,ListDir_DirOnly)
	Local d$,tg:TGadget
	Local su:TGadget,sf:TGadget
	If Not CountList(dirs) Return ShowCheck(False)	
	If CountList(dirs)=1 	
		sf = ListSg(savedir+"/"+String(dirs.valueatindex(0)),root,String(dirs.valueatindex(0)))
	Else
		For d=EachIn(dirs)
			If Upper(d)<>"SYSTEM"
				DebugLog "Scanning user: "+d
				tg = AddTreeViewNode(d,root)
				If d=launcherconfig.c("LastSG.User") su = tg
				If Not sf sf = listsg(savedir+"/"+d,tg,d) Else listsg(savedir+"/"+d,tg,d) 
			Else
				DebugLog "Ignored: "+D
			EndIf
		Next			
	EndIf
	If su ExpandTreeViewNode su; DebugLog "User expanded"
	If sf 
		SelectTreeViewNode sf; 
		DebugLog "File selected"; 
		cursg=tsg(MapValueForKey(mapsg,sf)); 
		'If Not cursg Notify "cursg is empty, but shouldn't be..."
		showgame; 
	Else 
		nogame
	EndIf	
	ShowCheck True
End Function

Function QG_Check()
	Local qg$ = savedir+"/System/Quit"
	If FileType(qg)
		Select Proceed("The quit game has been found! Do you want to load it?~n(If you click 'Cancel' this game will be deleted)")
			Case 1
				trueloadgame "System","Quit"
			Case -1
				If DeleteFile(qg)
					Notify "This quit game has been deleted"
				Else
					Notify "Warning! Deleting the quit game failed."
				EndIf
		End Select
	Else
		Print qg+" not found, so let's not even talk about it ;)"	
	EndIf	
End Function


' Activation of this panel
Function Activate(G:TGadget)
        QG_Check
	check
	DebugLog "Activate:cursg has value > "+Int(cursg<>Null)
End Function
mypan.activate = activate

Function Flow()
	DebugLog "Flow:cursg has value > "+Int(cursg<>Null)
	For Local g:TGadget = EachIn musthavefile
		g.setenabled cursg<>Null
	Next
End Function

Function doubleclicktree(G:TGadget)
	' If cursg loadgame G
End Function

mypan.flow = flow
' mypan.flowaction = doubleclicktree ' this cannot be correct...


' Restore ph for the other imported stuff
ph = oph
