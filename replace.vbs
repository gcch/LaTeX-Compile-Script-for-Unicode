' replace.vbs (for UTF-8)
' Copyright (c) 2016 tag

Option Explicit

' arguments
Dim objArgs : Set objArgs = WScript.Arguments
If objArgs.Count <> 2 Then
	WScript.Echo "error: wrong number of arguments" & vbCrLf & "usage: script.vbs <input> <output>"
	WScript.Quit
End If
Dim strInputFile : strInputFile = objArgs(0)
Dim strOutputFile : strOutputFile = objArgs(1)
Set objArgs = Nothing

' Input (UTF-8)
Dim objInputStream : Set objInputStream = CreateObject("ADODB.Stream")
With objInputStream
	.Charset = "UTF-8"	' Char Code
	.Type = 2		' StreamTypeEnum: adTypeText
	.Mode = 3		' ConnectModeEnum: adModeReadWrite
	.Open			' Open stream
	If CreateObject("Scripting.FileSystemObject").FileExists(strInputFile) Then
		.LoadFromFile strInputFile	' Load
		.Position = 0
	Else
		WScript.Echo "error: file not found"
		WScript.Quit(1)
	End If
End With

' Replace
objInputStream.Position = 0
Dim strOutput : strOutput = ReplaceWithPatterns(objInputStream.ReadText)
objInputStream.Close
Set objInputStream = Nothing

' Output
With CreateObject("ADODB.Stream")
	.Charset = "UTF-8"	' Char Code
	.Type = 2		' StreamTypeEnum: adTypeText
	.Mode = 3		' ConnectModeEnum: adModeReadWrite
	.Open			' Open stream
	.Position = 0
	.WriteText strOutput
	.SaveToFile strOutputFile, 2	' Overwrite
	.Close
End With

' normal end
WScript.Quit(0)

' ================================================== '

' function: replace with patterns
Function ReplaceWithPatterns(strInput)
	Dim strReplacePattern
	Dim strReplacePatternArray : strReplacePatternArray = Array( _
		Array("、", "，"), _
		Array("。", "．") _
	)
	For Each strReplacePattern In strReplacePatternArray
		strInput = Replace(strInput, strReplacePattern(0), strReplacePattern(1))
	Next
	ReplaceWithPatterns = strInput
End Function
