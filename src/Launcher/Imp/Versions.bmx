Rem
	The Fairy Tale REVAMPED!
	Version overview tab
	
	
	
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
Version: 16.08.18
End Rem
Strict

Import "FrameWork.bmx"

Private

MKL_Lic     "The Fairy Tale - REVAMP - Versions.bmx","GNU General Public License 3"
MKL_Version "The Fairy Tale - REVAMP - Versions.bmx","16.08.18"

Global mypan:mygadget = newtab("Version Info")
Global Panel:TGadget = mypan.g

Global bw = pw/4
Global by = ph-25


' Hando Stillor
Gadgets.make "Hando Stillor",CreatePanel(pw-bw,0,bw,by,Panel)
SetGadgetPixmap gadgets.gadget("Hando Stillor"),LoadPixmap ( JCR_B(JCR,"GFX/Big_Char/Hando Stillor.png") ),PANELPIXMAP_CENTER



gadgets.cr CreateLabel(    "Game Version:",0,  0,300,25,panel,Label_right)
gadgets.cr CreateLabel("LAURA II Version:",0, 25,300,25,Panel,Label_right)
gadgets.cr CreateLabel("Launcher Version:",0, 50,300,25,Panel,Label_right)

gadgets.make "GameVersion" , CreateLabel(ID.value("Version") ,305,  0,300,25,Panel,Label_Left)
gadgets.Make "LAURAVersion", CreateLabel("LAURA II not found",305, 25,300,25,Panel,Label_Left)
gadgets.make "MyVersion"   , CreateLabel("Retrieving"        ,305, 50,300,25,Panel,Label_left)


?MacOS
Global Laura$ = Resource+"LAURA2.app/Contents/MacOS/LAURA2"
?Linux
Const Laura$ = "./LAURA2"
?Win32
Const LAURA$ = "LAURA.EXE"
?

Function GetAppVersions(G:TGadget)
	SetGadgetText gadgets.gadget("MyVersion"),MKL_NewestVersion()
	If FileType(Laura)
		Local BT:TStream = WriteFile(Dirry("$AppSupport$/$LinuxDot$Phantasar Productions/LAURA2/LAURA2run.ini"))	
		WriteLine BT,"Var:VersionOnly=Yes"
		WriteLine Bt,"Var:CodeName=TFTREVAMP"
		CloseFile BT
		SaveString Laura,Dirry("$AppSupport$/$LinuxDot$Phantasar Productions/LAURA2/ReqFromTFTLauncher.txt")
		system_ "~q"+Laura+"~q"
		Local vdumpfile$ = Dirry("$AppSupport$/$LinuxDot$Phantasar Productions/LAURA2/VersionDump.txt")
		If Not FileType(vdumpfile)
			Notify "Failed to launch "+laura
			Return
		EndIf
		Local lauraversiondump$ = LoadString(vdumpfile)
		Local lauraversion$ = "???"
		Local vd$[] = lauraversiondump.split("~n")
		Local ss$[]
		For Local s$=EachIn vd
			ss=s.split(":")
			'Print s+" >>> "+ss[0]
			If Trim(ss[0])="Version" And Len(ss)>=2
				lauraversion = Trim(ss[1])
			EndIf			
		Next
		SetGadgetText gadgets.gadget("LAURAVersion"),lauraversion				
	EndIf	
End Function




mypan.activate = getappversions
