@ECHO OFF

SETLOCAL ENABLEDELAYEDEXPANSION
SETLOCAL ENABLEEXTENSIONS
SET me=%~n0
SET parent=%~dp0

SET synca=%~f1
SET syncb=%~f2


FOR /R "%synca%" %%I IN (*) DO (
	SET i=%%I
	SET other=%syncb%!i:%synca%=!
	REM ECHO !other!
	IF EXIST !other! (
		IF %%~tI GTR !~tother! ( 
			ECHO F | XCOPY /Y %%I !other!
		)
	) ELSE (
		ECHO F | XCOPY /Y %%I !other!
	)
)

ECHO Break

FOR /R "%syncb%" %%I IN (*) DO (
	SET i=%%I
	SET other=%synca%!i:%syncb%=!
	REM ECHO !other!
	IF EXIST !other! (
		IF %%~tI GTR !~tother! ( 
			ECHO F | XCOPY /Y %%I !other!
		)
	) ELSE (
		ECHO F | XCOPY /Y %%I !other!
	)
)

PAUSE
