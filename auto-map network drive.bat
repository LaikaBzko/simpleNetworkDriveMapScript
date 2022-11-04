:: setup tool
ECHO OFF
TITLE simple network map utility
:BEGINNING
CLS
ECHO ---------------------------------
ECHO simple DSAAS drive map utility
ECHO by Laika M.
ECHO ---------------------------------
:: check if drive X exists
IF EXIST X:\ (
ECHO Drive X:\ is already connected!
ECHO Shutting down.....
PAUSE
exit /b
)
:: get UID login
ECHO Please enter your staff login:
set /p username=UID (without U): 
:: set drive variable because net command really doesn't like whitespace
set drive="\\anufiles.anu.edu.au\anu\Service Divisions\DSAAS"
:: login with supplied username, get password
net use X: %drive%  /user:UDS\u%username% * /PERSISTENT:NO && ( 
:: handle success
CLS
ECHO.
ECHO ---------------------------------
ECHO Logged in successfully as %username%!
ECHO Goodbye!
ECHO ---------------------------------
PAUSE
exit /b
) || (
:: handle error
ECHO --------------------
ECHO Login failed!
ECHO Likely incorrect username/password - but please read the above error message!
ECHO Trying again....
ECHO --------------------
PAUSE
GOTO BEGINNING
)