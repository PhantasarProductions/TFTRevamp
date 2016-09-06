Rem
	New Game Tab
	
	
	
	
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
Version: 16.09.03
End Rem
Strict

Import tricky_units.anna

Import "FrameWork.bmx"

Private

MKL_Lic     "The Fairy Tale - REVAMP - NewGame.bmx","GNU General Public License 3"
MKL_Version "The Fairy Tale - REVAMP - NewGame.bmx","16.09.03"


Function Anna:StringMap(q$)
	Return Anna_Request(Q) ' If you are compiling a modified version, remove this line or put it on REM, as ANNA may ONLY be used on unmodified versions of the game. If you only enhanced the launcher and only allowed the launcher to create a new account or to check if an account exists (as that is all the launcher may do), I will allow you to keep it.
End Function

Function toph$(A$)
	Local ret$
	For Local i=0 Until Len(A)
		ret :+ "%"+Right(Hex(a[i]),2)
	Next
	Return ret	
End Function



Global mypan:mygadget = newtab("New Game")
Global panel:TGadget = mypan.g
Global YourName:TGadget


If PW>=750 Then
   SetGadgetPixmap CreatePanel(750,0,PW-750,PH,Panel),LoadPixmap(JCR_B(jcr,"GFX/Big_Char/Jake.png")),PANELPIXMAP_CENTER
EndIf


gadgets.make "PanNewGame",CreatePanel(0,0,750,60,panel,panel_Sunken)
gadgets.cr CreateLabel ( "Game Type:",0,0,300,25,gadgets.gadget("PanNewgame") )

Global StartGame:TIni = New TIni

Function PressNewGame(G:TGadget)
	startgame.D("StartScript","NewGame.lua")
	startGame.D("StartFunction","NewGame")
End Function	

Function PressNewGamePlus(G:TGadget)
	startgame.D("StartScript","NewGamePlus.Lua")
	startgame.D("StartFunction","NewGamePlus")
End Function	

SetButtonState gadgets.cr( CreateButton("New Game",300,0,300,25,gadgets.Gadget("PanNewGame"),button_radio),Null,PressNewGame ).g,1
Global NewGamePlusButton:TGadget = CreateButton("New Game+",300,25,300,25,gadgets.Gadget("PanNewGame"),button_radio)


Function SkillEasy(G:TGadget)
	startGame.D("Skill",1)
End Function
Function SkillNormal(G:TGadget)
	startGame.D("Skill",2)
End Function
Function SkillHard(G:TGadget)
	startGame.D("Skill",3)
End Function


Global SkillPanel:TGadget = CreatePanel(0,65,750,85,panel,panel_sunken)
gadgets.cr SkillPanel
gadgets.cr CreateLabel("How tough are you?",0,0,300,25,skillpanel)
gadgets.cr CreateButton("Mommy!!! I'm scared! Don't hurt me! Pleeeease!",300,0,300,25,skillpanel,button_radio),Null,skilleasy
gadgets.Make "SkillDefault",CreateButton("Let them come! I can handle it!",300,25,300,25,skillpanel,Button_radio),Null,skillnormal; SetButtonState gadgets.gadget("SkillDefault"),1; skillNormal Null
gadgets.cr CreateButton("I am the reaper! None shall live when I'm around!",300,50,300,25,skillpanel,button_radio),Null,skillhard

Function whatsthis(G:TGadget)
	OpenURL "http://utbbs.tbbs.nl/Game.php?A=Read&C=Doc&Doc=Netwerk"
End Function

Global AnnaPanel:TGadget = CreatePanel(0,160,750,60,Panel,panel_sunken) gadgets.cr AnnaPanel
gadgets.cr CreateLabel("Anna ID: (optional)",0,0,300,25,AnnaPanel)
gadgets.cr CreateLabel("Anna Secu Code:",0,25,300,25,AnnaPanel)
Global AnnaID:TGadget = CreateTextField(300,0,150,25,AnnaPanel)
Global AnnaCreate:TGadget = CreateButton("Create Account",450,0,150,25,AnnaPanel)
Global AnnaSecu:TGadget = CreateTextField(300,25,250,25,AnnaPanel)
gadgets.button "What's this?",600,0,100,25,annapanel,Whatsthis
Global AnnaCreateAction:mygadget = New mygadget
Annacreateaction.g = AnnaCreate

Function F_AnnaID(G:TGadget)
	startgame.d "AnnaID",Trim(TextFieldText(G))
	AnnaSecu.setenabled startgame.c("AnnaID")<>""
End Function
Function F_AnnaSecu(G:TGadget)
	startgame.d "AnnaSecu",TextFieldText(G)
End Function
Function F_AnnaCreate(G:TGadget)	
	If Proceed("The launcher will now try to contact Anna to create your account. If succesful a browser window will open where you can enter the last data Anna needs to verify your account. Anna can directly contact Game Jolt, meaning that if you enter your Game Jolt data into Anna you don't have to do it in this game any more, but this feature is entirely optional.~n~n~nDo you wish to create an Anna account?")<>1 Return
	Local Secu$ = Left(MD5("TFT"+Rand(0,MilliSecs())),6)
	Local result:StringMap = Anna("&HC=Game&A=BPC_Create&Secu="+Secu+"&name="+Toph(TextFieldText(Yourname)))
	If result.value("REJECT")
		Notify "Anna has rejected your account creation.~n~nThe reason stated is:~n"+result.value("REJECT")
	ElseIf result.value("ID") And result.value("STATUS")="SUCCESS"
		Notify "Anna has accepted your sign up.~nI will now open a browser window for you, so you can verify your account.~nThis is very important as Anna will delete all unverified accounts after 24 hours."
		SetGadgetText Annaid,result.value("ID")
		SetGadgetText annasecu,secu
		OpenURL "http://utbbs.tbbs.nl/Game.php?HC=Game&A=BPC_Verify&id="+result.value("ID")+"&secu="+secu
	Else
		Notify "Unfortunately the creation of the Anna account failed. Possibly something wrong with the site or your internet connection."	
		'Notify result.dump() ' debugline, must be put on 'rem' in release
		EndIf
End Function


gadgets.cr AnnaID    , CGUIN, F_AnnaID
gadgets.cr AnnaSecu  , CGUIN, F_AnnaSecu
AnnaCreateAction.Action = F_AnnaCreate
MapInsert gadgets,"AnnaCreateAction",Annacreateaction

Global GameJoltPanel:TGadget = CreatePanel(0,230,750,60,panel,panel_sunken) gadgets.cr GameJoltPanel
gadgets.cr CreateLabel("Game Jolt User Name: (optional)",0,0,300,25,gamejoltpanel)
gadgets.cr CreateLabel("Game Jolt Token:",0,25,300,25,gamejoltpanel)
Global GameJoltUser:TGadget = CreateTextField(300,0,300,25,gamejoltpanel)
Global gamejolttoken:TGadget = CreateTextField(300,25,300,25,gamejoltpanel)
Function F_GJUser(G:TGadget)
	startgame.d "GameJoltUser",Trim(TextFieldText(G))
	GameJoltToken.setenabled startgame.c("GameJoltUser")<>""
End Function
Function F_GJToken(G:TGadget)
	startgame.d "GameJoltToken",TextFieldText(G)
End Function



gadgets.cr gamejoltuser,  CGUIN,F_GJUser
gadgets.cr gamejolttoken, CGUIN,F_GJToken
gadgets.button "What's this?",600,0,100,25,gamejoltpanel,Whatsthis

Function AccessNet(P:TGadget)
	Local allownet = JCR_Exists(JCR,"AUTHENTICATE/GAMEJOLT")
	allownet = allownet And JCR_Exists(JCR,"AUTHENTICATE/CHECK")
	Local A$[] = ["DENIED!","ALLOWED!"]
	Print "Network access is "+A[allownet]
	If Not allownet
		For Local G:TGadget = EachIn P.kids 
			If GadgetClass(G)<>Gadget_Label Then 
				G.setenabled False
				Print "= Disabled a gadget due to lack of network access"
			EndIf			
		Next
	EndIf	
End Function


Function SelectLanguage(G:TGadget)
	Local i=SelectedGadgetItem(g:TGadget)
	If i=-1 SelectGadgetItem G,0 i=0
	startgame.d "Language",GadgetItemText(G,i)
End Function

gadgets.make "langp",CreatePanel(0,300,750,30,panel,panel_sunken)
gadgets.cr CreateLabel("Scenario language:",0,0,300,25,gadgets.gadget("langp"))
gadgets.make "lang",CreateComboBox(300,0,300,25,gadgets.gadget("langp")),cguin,selectlanguage

Function getlangs()
	Local L:TList = New TList
	Local c=-1
	Local english=0
	Local f$[]
	For Local E:TJCREntry = EachIn MapValues(jcr.entries)
		f = e.filename.split("/")
		DebugLog e.filename+" >> "+f[0]+" ("+Upper(f[0])+")  >>> "+f[1]+"   Lang<"+Int(Upper(f[0])="LANGUAGES")+">  Inlist<"+ListContains(L,f[1])+">"
		If Upper(f[0])="LANGUAGES" And (Not ListContains(L,f[1])) 
			ListAddLast l,f[1]
			c:+1
			If f[1]="English" english=c
		EndIf	
	Next
	SortList l
	If Not CountList(l) Notify "ERROR!~nNo language file present in jcr resource files" End
	For Local lang$=EachIn l
		AddGadgetItem gadgets.gadget("lang"),lang
	Next
	SelectGadgetItem gadgets.gadget("lang"),english
	selectlanguage gadgets.gadget("lang")	
End Function getlangs

Function You(G:TGadget)
	startgame.D "User",Trim(GadgetText(G))
End Function
	

gadgets.make "you",CreatePanel(0,340,750,30,panel,panel_sunken)
gadgets.cr         CreateLabel("What is your name?",0,0,300,25,gadgets.gadget("you"))
YourName     =     CreateTextField(300,0,300,25,gadgets.gadget("you"))
SetGadgetText YourName,StripDir(Dirry("$Home$"))
gadgets.make "YouAre", yourname,CGUIN,You; You YourName
Global IllegalName:TGadget = CreateLabel("!ILLEGAL NAME!",630,0,300,25,gadgets.gadget("you"))
SetGadgetColor IllegalName,255,0,0,True
SetGadgetColor illegalname,255,255,0,False

Function StartTheGame(G:TGadget)
	'Notify "Start game not yet present"
	startgame.D "Resource",Resource+"TFT.jcr"
	startgame.D "Title","The Fairy Tale REVAMPED"
	startgame.D "CodeName","TFTREVAMP"
	?MacOS
	startgame.add "Resource",ExtractDir(ExtractDir(AppFile))+"/Resources/TFT.JCR"
	startgame.D "MacReturn",ExtractDir(ExtractDir(ExtractDir(AppFile)))
	?Not MacOS
	startgame.add "Resource",AppDir+"/TFT.JCR"
	?
	Mode2Ini startgame
	SaveIni LAURA2StartFile, startgame
	gadgets.get("win").g.setshow False
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

Global Start:TGadget = CreateButton("Start the game",0,PH-25,750,25,Panel)
Global mstart:mygadget = New mygadget
mstart.Action = StartTheGame
mstart.g = start
MapInsert gadgets,"StartTheGame",mstart

Function MyFlow()
	DebugLog "New Game Flow"
	Local allow=True
	Local checkvars$[] = [ "StartScript", "StartFunction", "Language", "Skill", "User" ]
	For Local v$=EachIn checkvars
		allow = allow And Trim(startgame.c(v))<>""
		DebugLog "Checked "+v+" > "+allow
	Next
	If startgame.c("GameJoltUser") And (Not startgame.c("GameJoltToken")) allow=False; DebugLog "GJ user without token"
	If startgame.c("AnnaID")       And (Not startgame.c("AnnaSecu"     )) allow=False; DebugLog "Anna ID without secu"
	Local AllowedUserNameChars$ = "qwertyuiopasdfghjklzxcvbnm1234567890 -_=+QWERTYUIOPASDFGHJKLZXCVBNM"
	Local allowname=True
	Local User$ = startgame.c("User")
	For Local i=0 Until Len(User)
		allowname = allowname And allowedusernamechars.find(Chr(user[i]))>=0
	Next
	Local ForbiddenNames$[] = ["SYSTEM","DEBUG"]
	If Not allowname DebugLog "Forbiden name"
	For Local FN$ = EachIn ForbiddenNames
		allowname = allowname And Upper(user)<>FN
	Next
	Allow = allow And allowname
	illegalname.setshow Not allowname
	start.setenabled allow
	DebugLog "Allow = "+allow
End Function


Function ActivateMe(G:TGadget)
	pressnewgame Null
	NewGamePlusButton.SetEnabled False ' The actual code for this comes later.	
	Local gotanna = True ' the actual code comes later
	Local gotgamejolt = True
	Local tg:TGadget
	For tg=EachIn AnnaPanel.kids
		tg.setenabled gotanna
	Next
	For tg=EachIn GameJoltPanel.kids
		tg.setenabled gotgamejolt
	Next
	'DisableGadget AnnaSecu
	'DisableGadget GameJoltToken	
	F_AnnaID AnnaID
	F_GJUser gamejoltuser
	Accessnet AnnaPanel
	Accessnet GameJoltPanel
End Function
MyPan.Activate = ActivateMe
mypan.flow = myflow
