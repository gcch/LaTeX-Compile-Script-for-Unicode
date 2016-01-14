@ECHO OFF

:: TeX Compile Script for Windows
:: Copyright (c) 2013-2015 tag.

:: move to the directory including this script
CD "%~dp0"

:: replace
FOR /R %%I IN (*.tex) DO (
	CScript replace.vbs "%%I" "%%I" > NUL
)

:: get filename of this script
SET "FNAME=%~n0"

:: TeX environment
SET TEX2DVI=uplatex
SET DVI2PDF=dvipdfmx
SET CCODE=utf-8
SET FMAP=font_ms.map

:: delete temp files
::RM "%FNAME%.aux" "%FNAME%.dvi" "%FNAME%.out" "%FNAME%.log" "%FNAME%.toc" "%FNAME%.lof" "%FNAME%.lot"

:: TeX -> DVI
%TEX2DVI% -kanji=%CCODE% "%FNAME%.tex"
%TEX2DVI% -kanji=%CCODE% "%FNAME%.tex"
%TEX2DVI% -kanji=%CCODE% "%FNAME%.tex"

:: Adobe Reader
TASKKILL /IM AcroRD32.exe /F /T
:: Adobe Acrobat
TASKKILL /IM Acrobat.exe /F /T

:: DVI -> PDF
::%DVI2PDF% "%FNAME%.dvi"
%DVI2PDF% -f "%FMAP%" "%FNAME%.dvi"

:: pause if error occured
IF NOT "%ERRORLEVEL%" == "0" (
	PAUSE > NUL
	EXIT /B
)

:: delete temp files
RM "%FNAME%.aux" "%FNAME%.dvi" "%FNAME%.out" "%FNAME%.log" "%FNAME%.toc" "%FNAME%.lof" "%FNAME%.lot"

exit