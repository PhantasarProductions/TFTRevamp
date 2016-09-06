Rem
	The Fairy Tale REVAMPED!
	General flow manager
	
	
	
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
Import "Framework.bmx"

MKL_Version "The Fairy Tale - REVAMP - Run.bmx","16.09.03"
MKL_Lic     "The Fairy Tale - REVAMP - Run.bmx","GNU General Public License 3"

Function Run()
	Local EID,ESource:TGadget,myg:mygadget
	Listouts
	GoTab(0)
	ShowGadget gadgets.gadget("win")
	Repeat
		If currentpanel.flow Then currentpanel.flow() Else DebugLog "This panel has no flow"
		WaitEvent
		eid = EventID()
		esource = TGadget(EventSource())
		Select eid
			Case event_windowclose
				For myg = EachIn closelist
					If myg.g=esource myg.close myg.g
				Next
			Case event_gadgetaction
				For myg = EachIn actionlist
					If myg.g=esource myg.action myg.g
				Next
			Case event_gadgetselect
				For myg = EachIn selectlist
					If myg.g=esource myg.fselect myg.g
				Next
		End Select		
	Forever
End Function
