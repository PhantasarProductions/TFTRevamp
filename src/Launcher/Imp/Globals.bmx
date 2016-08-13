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
Version: 16.08.13
End Rem
Strict

Import jcr6.zlibdriver
Import brl.pngloader
Import tricky_units.initfile2
Import tricky_units.Dirry


MKL_Version "The Fairy Tale - REVAMP - Globals.bmx","16.08.13"
MKL_Lic     "The Fairy Tale - REVAMP - Globals.bmx","GNU General Public License 3"

AppTitle = StripAll(AppFile)

?MacOS
Global Resource$ = ExtractDir(ExtractDir(AppFile))+"/Resources/"
?Not MacOS
Const Resource$ = "./"
?
Print "My resouces are located in: "+Resource

Global JCRFIle$ = Resource + "TFT.jcr"
Print "Reading: "+JCRFile
If Not FileType(JCRFile) Notify "ERROR: I cannot access my datafile "+JCRFile End
Global JCR:TJCRDir = JCR_Dir(JCRFile)

'For Local f$=EachIn MapKeys(JCR.Entries) Print f Next ' debug line. Must be disabled in "real" version.

Global LAURA2StartFile$ = Dirry("$AppSupport$/PhantasarProductions/LAURA2/LAURA2run.ini")
LAURA2StartFile = StripDir(LAURA2Startfile) ' Debug line. Must be disabled in finel verion!
