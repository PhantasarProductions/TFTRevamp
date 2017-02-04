Rem
	The Fairy Tale REVAMPED!
	Main file for the launcher
	
	
	
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
Version: 17.02.04
End Rem
Strict

Framework tricky_units.MKL_Version ' Actually no module calls needed here, but only the main file accepts FrameWork, so here we are ;)

' Icon for Windows
?win32
import "Marrilona_Windows_Icon.o"
?

' Here are the panel imports. The order in which they are placed is VERY important!!!
Import "imp/Welcome.bmx"
Import "imp/NewGame.bmx"
Import "imp/Loadgame.bmx"
Import "imp/Screen.bmx"
Import "Imp/versions.bmx"




' This MUST always be last!!!
Import "imp/run.bmx"

MKL_Version "The Fairy Tale - REVAMP - The Fairy Tale REVAMPED.bmx","17.02.04"
MKL_Lic     "The Fairy Tale - REVAMP - The Fairy Tale REVAMPED.bmx","GNU General Public License 3"

 



run
