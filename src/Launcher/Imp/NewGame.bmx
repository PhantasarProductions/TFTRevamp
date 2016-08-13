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
Version: 16.08.12
End Rem
Strict

Import "FrameWork.bmx"

Private

MKL_Lic     "The Fairy Tale - REVAMP - NewGame.bmx","GNU General Public License 3"
MKL_Version "The Fairy Tale - REVAMP - NewGame.bmx","16.08.12"

Global mypan:mygadget = newtab("New Game")
Global panel:TGadget = mypan.g



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

gadgets.cr CreateButton("New Game",300,0,300,25,gadgets.Gadget("PanNewGame"),button_radio),Null,PressNewGame
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

Global AnnaPanel:TGadget = CreatePanel(0,160,750,60,Panel,panel_sunken) gadgets.cr AnnaPanel
gadgets.cr CreateLabel("Anna ID: (optional)",0,0,300,25,AnnaPanel)
gadgets.cr CreateLabel("Anna Secu Code:",0,25,300,25,AnnaPanel)
Global AnnaID:TGadget = CreateTextField(300,0,150,25,AnnaPanel)
Global AnnaCreate:TGadget = CreateButton("Create Account",500,0,150,25,AnnaPanel)
Global AnnaSecu:TGadget = CreateTextField(300,25,250,25,AnnaPanel)
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

Function StartTheGame(G:TGadget)
	Notify "Start game not yet present"
	startgame.D "Resource",Resource+"TFT.jcr"
	startgame.D "Title","The Fairy Tale REVAMPED"
	?MacOS
	startgame.D "MacReturn",ExtractDir(ExtractDir(ExtractDir(AppFile)))
	?
	SaveIni LAURA2StartFile, startgame
End Function

Global Start:TGadget = CreateButton("Start the game",0,PH-25,750,25,Panel)
Global mstart:mygadget = New mygadget
mstart.Action = StartTheGame
mstart.g = start
MapInsert gadgets,"StartTheGame",mstart

Function MyFlow()
	Local allow=True
	Local checkvars$[] = [ "StartScript", "StartFunction", "Language", "Skill" ]
	For Local v$=EachIn checkvars
		allow = allow And Trim(startgame.c(v))<>""
	Next
	If startgame.c("GameJoltUser") And (Not startgame.c("GameJoltToken")) allow=False
	If startgame.c("AnnaID")       And (Not startgame.c("AnnaSecu"     )) allow=False
	start.setenabled allow
End Function


Function ActivateMe(G:TGadget)
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
End Function
MyPan.Activate = ActivateMe
mypan.flow = myflow
