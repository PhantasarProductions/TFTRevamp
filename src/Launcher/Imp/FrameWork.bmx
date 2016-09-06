Rem
	The Fairy Tale REVAMPED!
	Framework
	
	
	
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

Import maxgui.drivers
Import brl.eventqueue

Import "globals.bmx"

MKL_Version "The Fairy Tale - REVAMP - FrameWork.bmx","16.09.03"
MKL_Lic     "The Fairy Tale - REVAMP - FrameWork.bmx","GNU General Public License 3"


Type ColorGroup
	Field FR,FG,FB
	Field BR,BG,BB
	
	Function Make:colorgroup(AFR,AFG,AFB,ABR,ABG,ABB)
		Local ret:ColorGroup=New colorgroup
		ret.fr=afr
		ret.fg=afg
		ret.fb=afb
		ret.br=abr
		ret.bg=abg
		ret.bb=abb
		Return ret
	End Function
End Type

Global CGWin:Colorgroup = ColorGroup.Make(0,255,0,0,27,0)
Global CGUIN:Colorgroup = ColorGroup.Make(0,27,0,0,255,0)



Type MyGadget
	Field G:TGadget
	Field CG:Colorgroup
	Field Action(G:TGadget)
	Field Close(G:TGadget)
	Field FSelect(G:TGadget)
	Field Activate(G:TGadget) ' Only used on panels attached to the tabber
	Field Flow() ' Only used on panels attached to the tabber
End Type

Type MapGadgets	Extends TMap
	Method Make:mygadget(tag$,G:TGadget,CG:Colorgroup=Null,Action(G:TGadget)=Null)
		Local MG:MyGadget = New MyGadget
		MG.G      = G
		MG.CG     = CG
		MG.Action = Action
		If Not CG MG.CG = CGWin
		Local mt$=Upper(tag)
		If mt="AUTO"
			Repeat
				mt = Hex(Rand(0,MilliSecs()))
			Until Not MapContains(Self,mt)
		EndIf	
		MapInsert Self,mt,mg		
		SetGadgetColor mg.G,MG.CG.FR,MG.CG.FG,MG.CG.FB,False
		SetGadgetColor mg.G,MG.CG.BR,MG.CG.BG,MG.CG.BB,True
		DebugLog "Added gadget: "+mt
		Return MG
	End Method
	
	Method Cr:mygadget(G:TGadget,CG:colorgroup=Null,Action(G:TGadget)=Null)
		Return Make( "AUTO",G,CG,Action )
	End Method
	
	Method Get:MyGadget(Tag$)
		Return MyGadget(MapValueForKey(Self,Upper(tag)))
	End Method
	
	Method Gadget:TGadget(Tag$)
		Return Get(Tag).G
	End Method
	
	Method Button(Capt$,X,Y,W,H,parent:TGadget,Action(G:TGadget)=Null,flags=0,tag$="AUTO")
		Local MG:MyGadget = New MyGadget
		MG.G      = CreateButton(capt,x,y,w,h,parent,flags)
		MG.CG     = Null
		MG.Action = Action
		?Win32
		MG.CG = CGWin
		?		
		Local mt$ =Upper(tag)
		If mt="AUTO"
			Repeat
				mt = Hex(Rand(0,MilliSecs()))
			Until Not MapContains(Self,mt)
		EndIf	
		MapInsert Self,mt,mg
		DebugLog "Added button: "+mt
		?win32
		SetGadgetColor mg.G,MG.CG.FR,MG.CG.FG,MG.CG.FB,False
		SetGadgetColor mg.G,MG.CG.BR,MG.CG.BG,MG.CG.BB,True
		?
	End Method	
	
End Type

Global Gadgets:MapGadgets = New MapGadgets

Global Panels
Global CurrentPanel:MyGadget
Function GoTab(Num)
	panels = CountGadgetItems(gadgets.gadget("tabber"))
	DebugLog "Let's dig though: "+panels+" panels"
	For Local i=0 Until panels
		gadgets.gadget("Panel"+i).setshow i=num
		DebugLog num+"> Show for Panel #"+i+" is "+Int(i=num)
	Next
	Local G:MyGadget = Gadgets.get("Panel"+num)
	If G.Activate G.Activate(G.G)
	CurrentPanel = G
	If currentpanel.flow 
		DebugLog "Gone to a panel with a flow"
	Else
		DebugLog "Gone to a panel without a flow"
	EndIf
End Function



Function DoTabber(G:TGadget)
	GoTab SelectedGadgetItem(G)
End Function

Function ByeBye(G:TGadget)
	End
End Function

gadgets.make "win",CreateWindow(StripAll(AppFile)+" -- Launcher",0,0,ClientWidth(Desktop())*.85,ClientHeight(Desktop())*.85,Null, Window_center | Window_titlebar | Window_clientcoords | Window_hidden | Window_Status)
gadgets.get("win").close = Byebye
gadgets.make "tabber",CreateTabber(0,0,ClientWidth(gadgets.gadget("win")),ClientHeight(gadgets.gadget("win")),gadgets.Gadget("win")),CGWin,DoTabber

Global PW,PH
Function NewTab:myGadget(Caption$,CG:Colorgroup=Null,Action(G:TGadget)=Null)
	Local T:TGadget = gadgets.gadget("tabber")
	Local i=CountGadgetItems(t)
	Local R:TGadget = CreatePanel(0,0,ClientWidth(t),ClientHeight(T),T)
	PW = ClientWidth(R)
	ph = ClientHeight(R)
	AddGadgetItem t,Caption
	gadgets.make "panel"+i,R,cg,action
	Return gadgets.get("panel"+i)
	panels = i + 1
End Function	

Global ActionList:TList = New TList
Global CloseList:TList = New TList		
Global SelectList:TList = New TList

Function ListOuts() ' This function can make performance during the running better
	For Local G:MyGadget = EachIn MapValues(gadgets)
		If g.action ListAddLast actionlist,G
		If g.close ListAddLast closelist,G
		If g.fselect ListAddLast selectlist,G
	Next
	Print "Action list now has "+CountList(Actionlist)+" entries"
	Print " Close list now has "+CountList(closelist) +" entries"	
	Print "Select list now has "+CountList(selectlist)+" entries"
End Function	
