rem -------------------------------------------------------------------------------------------------
rem batch-file to configure proxy settings: windows environment-variable, npm-, git- and bower-config   
rem -------------------------------------------------------------------------------------------------

@echo off 
cls
title set proxy batch - v1.0
@color 4F 

:MENUE
echo;
echo;
echo --------------------------------------------------------
echo ----------------- proxy batch - v1.0 -------------------
echo --------------------------------------------------------
echo;
echo;

@choice /c:12 /m "please select if you like to work behind a company-proxy [1] or without a proxy [2], e.g. in the homeoffice."

if errorlevel 2 goto proxyOFF
if errorlevel 1 goto proxyON
goto end

rem "setx <variable> <wert>" setzt umgebungsvariable als benutzervariable
rem "setx <variable> <wert> -m" setzt umgebungsvariable als systemvariable
rem "setx < variable > "" bzw. "... -m" entfernt werte der variablen
 
:proxyON
echo.
echo you have pressed [1] to set a company-proxy
echo.
@echo please insert valid url-proxy url (e.g. proxy.company.de)
  set /p proxyUrl=
  
@echo please insert proxy-port (e.g. 3128)
  set /p port=
  
echo.
echo your given proxy url: %proxyUrl%
echo your given proxy port: %port%
echo.

rem user-environment variable
echo.
echo set msg proxy settings ...
echo.
echo 1. set globale http-proxy
call setx http_proxy http://%proxyurl%:%port%
call setx https_proxy http://%proxyurl%:%port%
echo. 

rem .npmrc, path c:\users\<name>
echo 2. set npm http-proxy   
echo. 
call npm config set proxy http://%proxyUrl%:%port%
call npm config set https-proxy http://%proxyUrl%:%port%
echo done...
echo. 

rem  .gitconfig, path c:\users\<name>
echo 3. set git http-proxy   
echo. 
call git config --global http.proxy http://%proxyUrl%:%port%
echo done...
echo. 
echo 4. set git. to https    
echo. 
call git config --global url."https://".insteadOf git://
echo done...
echo.

rem  .bowerrc at current project dir
echo 5. create and update msg .bowerrc config
echo.
echo { > .bowerrc
echo  "directory": "app/bower_components", >> .bowerrc
echo  "proxy": "http://%proxyUrl%:%port%", >> .bowerrc
echo  "https-proxy": "http://%proxyUrl%:%port%" >> .bowerrc
echo } >> .bowerrc
echo done... 
 
GOTO end


:proxyOFF
rem user-environment variable
echo.
echo you have pressed [2] to set no proxy
echo.
echo set homeoffice settings (no proxy) ...
echo.
echo 1. delete globale http-proxy   
call setx http_proxy ""
call setx https_proxy ""
echo. 

rem .npmrc, path c:\users\<name>
echo 2. remove npm http-proxy   
echo. 
call npm config delete proxy
call npm config delete https-proxy
echo done...
echo. 

rem  .gitconfig, path c:\users\<name>
echo 3. remove git http-proxy   
echo. 
call git config --global --unset http.proxy
echo done...
echo.
echo 4. remove git http-proxy   
echo.
call git config --global --unset url."https://".insteadOf git://
echo done...
echo.

rem  .bowerrc at current project dir
echo.
echo 5. create and update homeoffice .bowerrc config
echo.
echo { > .bowerrc
echo  "directory": "app/bower_components" >> .bowerrc
echo } >> .bowerrc
echo done... 

goto end


:end
echo.
echo.
echo --------------------------------------------------------
echo --------- all work is done! have fun... :) -------------
echo --------------------------------------------------------
echo.
echo.

@pause
rem pause > nul
exit

