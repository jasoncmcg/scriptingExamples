' JCM July, 2010
' ---------------
' Purpose: Check for .Net 2.0 and SchoolKitKeepOnTop
'			Install if need and run, or just run it


''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' Set global variables for objects and paths

	Set objFSO = CreateObject("Scripting.FileSystemObject")
	Set WshShell = Wscript.CreateObject("Wscript.Shell")
	set ie = createobject("internetexplorer.application")
	
	SchoolKitcheck = "C:\Program Files\SchoolKiT\SchoolKiTKeepOnTop.exe"
	SchoolKitexe = """" & SchoolKitcheck & """"
	techSteps = "http://www.techsteps.com/public/login/?f=s"
	
	schoolKitPath = "P:\TechSteps\SchoolKiT_KeepOnTop_v130.msi /quiet /passive /norestart"
	schoolKitRun = "P:\TechSteps\runasspc  /program:" & schoolKitPath & " /domain:" & chr(34) & "localhost" & chr(34) & " /user:" & chr(34) & "username-removed" & chr(34) & " /password:" & chr(34) & "password-removed" & chr(34) & " /wstyle:minimize"

	
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

' Main process to install if needed, or simply run
if NOT objFSO.FileExists(SchoolKitcheck) Then

	chk_framework
	run_install
	run_program
	
else

	run_program

End if



''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'Subs

'____________________
' Check for the .NET framework requirement
sub chk_framework

	If objFSO.FolderExists("c:\windows\Microsoft.NET\Framework\v2.0.50727") Then
	'dotNet is found, continue
	Else
	    msgbox("This computer does not have .Net 2 installed.  Please put in a ticket.")
	    open_site
	    wscript.quit
	End If

end sub

'____________________
' Run program installation
sub run_install

	WshShell.Run(schoolKitPath),1,True

end sub

'____________________
' Launch the program and required site
sub run_program

	run_schoolkit
	open_site

end sub

'____________________
' Run the program keep-on-top required by functionality of the site
sub run_schoolkit

	Dim AllProcess
	Dim Process
	Dim strFoundProcess
	
	strFoundProcess = False
	Set AllProcess = getobject("winmgmts:") 
	
	For Each Process In AllProcess.InstancesOf("Win32_process")
		If (Instr (Ucase(Process.Name),"SCHOOLKITKEEPONTOP.EXE") = 1) Then 
			strFoundProcess = True
		Exit for
	End If
	Next

	If strFoundProcess = False Then
		WshShell.Run(SchoolKitexe),1,True
	End If

	Set AllProcess = nothing

end sub

'____________________
' Open the website
sub open_site

	ie.visible = True
	ie.navigate techSteps

end sub




