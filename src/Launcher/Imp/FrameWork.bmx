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
Version: 16.08.13
End Rem
Strict

Import maxgui.drivers
Import brl.eventqueue

Import "globals.bmx"

MKL_Version "The Fairy Tale - REVAMP - FrameWork.bmx","16.08.13"
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


Type MyGadget
	Field G:TGadget
	Field CG:Colorgroup
	Field Action(G:TGadget)
	Field Close(G:TGadget)
End Type

Type MapGadgets	Extends TMap
	Method Make(tag$,G:TGadget,CG:Colorgroup=Null,Action(G:TGadget)=Null)
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
	End Method
	
	Method Cr(G:TGadget,CG:colorgroup=Null,Action(G:TGadget))
		Make "AUTO",G,CG,Action
	End Method
	
	Method Get:MyGadget(Tag$)
		Return MyGadget(MapValueForKey(Self,Upper(tag)))
	End Method
	
	Method Gadget:TGadget(Tag$)
		Return Get(Tag).G
	End Method
End Type

Global Gadgets:MapGadgets = New MapGadgets



Function DoTabber(G:TGadget)
End Function

Function ByeBye(G:TGadget)
	End
End Function

gadgets.make "win",CreateWindow(StripAll(AppFile)+" -- Launcher",0,0,ClientWidth(Desktop())*.85,ClientHeight(Desktop())*.85,Null, Window_center | Window_titlebar | Window_clientcoords | Window_hidden )
gadgets.get("win").close = Byebye
gadgets.make "tabber",CreateTabber(0,0,ClientWidth(gadgets.gadget("win")),ClientHeight(gadgets.gadget("win")),gadgets.Gadget("win")),CGWin,DoTabber

Global PW,PH
Global Panels
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
	

	
