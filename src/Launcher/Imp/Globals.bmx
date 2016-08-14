Rem
	The Fairy Tale REVAMPED
	Global definitions and declarations for the Launcher
	
	
	
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
Version: 16.08.14
End Rem
Strict

Import jcr6.zlibdriver
Import brl.pngloader
Import tricky_units.initfile2
Import tricky_units.Dirry
Import tricky_units.Listfile


MKL_Version "The Fairy Tale - REVAMP - Globals.bmx","16.08.14"
MKL_Lic     "The Fairy Tale - REVAMP - Globals.bmx","GNU General Public License 3"

AppTitle = StripAll(AppFile)

?MacOS
Global Resource$ = ExtractDir(ExtractDir(AppFile))+"/Resources/"
?Not MacOS
Const Resource$ = "./"
?
Print "My resouces are located in: "+Resource


' How to call LAURA from each platform
?MacOS
Global LAURA2$ = Resource+"LAURA2.app"
Global LAURA2Pure$ = LAURA2 + "/Contents/MacOS/LAURA2"
?Win32
Const LAURA2$ = "LAURA2.exe"
Const LAURA2Pure$ = LAURA2
?Linux
Const LAURA2$ = "LAURA2"
Const LAURA2Pure$ = LAURA2
?



Global JCRFIle$ = Resource + "TFT.jcr"
Print "Reading: "+JCRFile
If Not FileType(JCRFile) Notify "ERROR: I cannot access my datafile "+JCRFile End
Global JCR:TJCRDir = JCR_Dir(JCRFile)

'For Local f$=EachIn MapKeys(JCR.Entries) Print f Next ' debug line. Must be disabled in "real" version.

Global LAURA2StartFile$ = Dirry("$AppSupport$/PhantasarProductions/LAURA2/LAURA2run.ini")
LAURA2StartFile = StripDir(LAURA2Startfile) ' Debug line. Must be disabled in finel verion!

Global ID:StringMap
Function GetID:StringMap()
	id = New StringMap
	Local c$[]
	For Local  l$ = EachIn Listfile ( JCR_B( JCR,"ID/Identify" ))
		If Trim(l) 
			c=Trim(l).split("=")
			If (Len c)<>2 
				Notify "Meta definitions are not correct! You may have a corrupted version of the game" End
			EndIf
			MapInsert id,c[0],c[1]
			DebugLog c[0]+" = ~q"+c[1]+"~q"
		EndIf
	Next		
End Function GetID

Global savedir$ = Dirry("$AppSupport$/Phantasar Productions/LAURA2/")+ID.value("ID")+"/Saved Games"
If Not CreateDir(savedir,1) Notify "ERROR! I could not create the savegame folder!~n~n"+savedir End
