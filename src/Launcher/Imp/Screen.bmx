Rem
	The Fairy Tale REVAMPED - LAUNCHER
	Screen modes
	
	
	
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

Import "FrameWork.bmx"
Import brl.Graphics
Import brl.glmax2d

Private

MKL_Lic     "The Fairy Tale - REVAMP - Screen.bmx","GNU General Public License 3"
MKL_Version "The Fairy Tale - REVAMP - Screen.bmx","16.09.03"



Global mypan:mygadget = newtab("Screen")
Global panel:TGadget = mypan.g

Global bw = pw/4
Global by = ph-25

Const minw = 800
Const minh = 600
Const maxw = 1600
Const maxh = 1200


' Dandor
Gadgets.make "Dandor",CreatePanel(pw-bw,0,bw,by,Panel)
SetGadgetPixmap gadgets.gadget("Dandor"),LoadPixmap ( JCR_B(JCR,"GFX/Big_Char/Dandor.png") ),PANELPIXMAP_CENTER



modes:TMap = New TMap
For Local mode:TGraphicsMode=EachIn GraphicsModes()
	Print mode.width+","+mode.height+","+mode.depth+","+mode.hertz
	If mode.width>=minw And mode.width<=maxw And mode.height>=minh And mode.width<=maxh Then
		MapInsert modes,Right("   "+mode.width,4)+" x "+Right("   "+mode.height,4)+"    "+Mode.depth+" bit",mode
		Print "Adding"
	EndIf
Next
	

Global FullScreen:TGadget = CreateButton("Full Screen",bw+5, 0,bw,25,panel,button_radio) SetButtonState fullscreen,launcherconfig.c("screen.fullscreen")="true"
Windowed:TGadget   = CreateButton("Windowed"   ,bw+5,25,bw,25,panel,button_radio) SetButtonState windowed,  Not ButtonState(fullscreen)

Custom:TGadget = CreateButton("Custom",bw+5, 50,bw,25,panel,button_checkbox) SetButtonState Custom,launcherconfig.c("screen.custom")="true"

CustomMode:TGraphicsmode = New TGraphicsMode
CustomMode.width  = launcherconfig.c("SCREEN.CUSTOM.W").toint()
CustomMode.height = launcherconfig.c("SCREEN.CUSTOM.H").toint()
If Not custommode.width  custommode.width =minw
If Not custommode.height custommode.height=minh



Global CustomW:TGadget = CreateTextField(bw+5,75,100,25,panel)
gadgets.cr CreateLabel("x",bw+105,75,20,25,panel,label_center),CGUIN
Global CustomH:TGadget = CreateTextField(bw+125,75,100,25,panel)
gadgets.cr CreateLabel("Width must be within "+minw+" and "+maxw,bw+5,100,bw,25,panel)
gadgets.cr CreateLabel("Height must be within "+minh+" and "+maxh,bw+5,125,bw,25,panel) 
gadgets.cr CustomW,CGUIN,SetCustom
gadgets.cr CustomH,CGUIN,SetCustom
SetGadgetText customw,custommode.width
SetGadgetText customh,custommode.height

Function FullOrWindowed(G:TGadget)
	Local t$[] = ["false","true"]
	launcherconfig.d "screen.fullscreen",t[ButtonState(fullscreen)]
	savelauncherconfig
	custom.setenabled ButtonState(Windowed)
	If Not ButtonState(Windowed)
		SetButtonState Custom,False
		setcustom custom
	EndIf
	ToStatus
End Function	

Function SetCustom(G:TGadget)
	Local t$[] = ["false","true"]
	launcherconfig.d "screen.custom",t[ButtonState(custom)]
	launcherconfig.d "screen.custom.w",GadgetText(CustomW)
	launcherconfig.d "screen.custom.h",GadgetText(CustomH)
	custommode.width  = GadgetText(CustomW).toint()
	custommode.height = GadgetText(CustomH).toint()
	modesgadget.setenabled Not ButtonState(custom)
	customw.setenabled ButtonState(custom)
	customh.setenabled ButtonState(custom)
	savelauncherconfig
	ToStatus
End Function

gadgets.make "Windowed",Fullscreen,CGWIN,FullOrWindowed
gadgets.cr Windowed  ,CGWIN,FullOrWindowed
gadgets.cr Custom    ,CGWin,SetCustom

Function ChangeMode(G:TGadget)
	Local i = SelectedGadgetItem(G)
	If Not CountGadgetItems(G)
		Notify "WARNING! No valid screen modes detected. You will only be able to run the game in ~qWindowed~q mode."
		DisableGadget G
		DisableGadget fullscreen
		SetButtonState fullscreen,0
		SetButtonState windowed,1
		Return
	EndIf
	If i<0 
		SelectGadgetItem G,0
		i=0
	EndIf
	launcherconfig.d "screen.selectline",GadgetItemText(G,I)	
	savelauncherconfig
	ToStatus
End Function

ModesGadget:TGadget = CreateListBox(0,0,bw,by,panel) 
For Local m$=EachIn MapKeys(modes) AddGadgetItem Modesgadget,m Next
For Local i=0 Until CountGadgetItems(modesgadget)
	DebugLog "SELECTLINE="+launcherconfig.c("SCREEN.SELECTLINE")+"; GadgetItemText("+i+")="+GadgetItemText(modesgadget,i)
	If Trim(GadgetItemText(modesgadget,i))=Trim(launcherconfig.c("SCREEN.SELECTLINE")) SelectGadgetItem modesgadget,i
Next
ChangeMode ModesGadget
SetCustom Custom
SetGadgetFont modesgadget, LookupGuiFont:TGuiFont( GUIFONT_MONOSPACED )


Function ToStatus()
	Local m:tgraphicsmode = GetMode()
	Local s$ = "Game will run in a "+m.width+"x"+m.height
	If m.depth And ButtonState(fullscreen) s:+" "+m.depth+"bit fullscreen " Else s:+" windowed"
	s:+" mode"
	If m.width<minw Or m.width>maxw Or m.height<minh Or m.height>maxh s="Illegal screenmode set. Please look at the screen page to set it right!"
	SetStatusText gadgets.get("win").g , s
End Function


gadgets.make "Modes", Modesgadget,CGUIN,changemode
gadgets.get("Modes").FSelect = ChangeMode

Function Margin(G:TGadget)
	Local w = 25
	Local s = ButtonState(G)
	Local v = s*w
	launcherconfig.d("screen.margin."+GadgetText(G),v)
	savelauncherconfig
End Function

gadgets.cr CreateLabel("Below you can set the off boundary margin. ~n~nThis will prevent any vital userinterface stuff to appear outside the boundaries of your screen, which is an issue when playing in full screen mode on a TV screen in stead of a computer monitor.",bw+5,200,bw,100,panel)
gadgets.button "Top"   ,bw+5           ,300, bw-5   ,25,Panel,Margin,Button_Push | Button_checkbox,"Top"
gadgets.button "Bottom",bw+5           ,350, bw-5   ,25,Panel,Margin,Button_Push | Button_checkbox,"Bottom"
gadgets.button "Left",  bw+5           ,325,(bw-5)/2,25,Panel,Margin,Button_Push | Button_checkbox,"Left"
gadgets.button "Right", bw+5+((bw-5)/2),325,(bw-5)/2,25,Panel,Margin,Button_Push | Button_checkbox,"Right"
Global Margins$[] = ["Top","Bottom","Left","Right"]
For Local mymargin$=EachIn Margins 
	SetButtonState gadgets.gadget(mymargin),launcherconfig.c("screen.margin."+mymargin).toint()<>0
Next

Public

