@echo off
:: Author: wanghan
:: Created Time : 2020Äê08ÔÂ29ÈÕ 00:57:35
:: File Name: install.cmd
:: Description: install and reinstall dst_vimconfig

:: ================================================================
:: Setting environment
:: ================================================================


if not exist "%HOME%" @set HOME=%HOMEDRIVE%%HOMEPATH%
if not exist "%HOME%" @set HOME=%USERPROFILE%

set REPO_NAME=dst_vimconfig
set REPO_PATH=%HOME%\.%REPO_NAME%
set REPO_URL=https://github.com/daoshuti/dst_vimconfig.git

:: ================================================================
:: Check whether git is installed
:: ================================================================

where git
if not %errorlevel% == 0 (
	echo ERROR: Unable find git.exe in your PATH
	goto err
)

:: ================================================================
:: Check whether vim or neovim is installed
:: ================================================================

echo Find vim.exe in your PATH ...

set has_vim=True
set has_nvim=True

where vim
if not %errorlevel% == 0 (
	set has_vim=False
	echo ERROR: Unable find vim.exe in your PATH
	echo Find nvim.exe in your PATH ...
)

where nvim
if not %errorlevel% == 0 (
	set has_nvim=False
	echo ERROR: Unable find nvim.exe in your PATH
	if %has_vim% == False goto err
)

:: ================================================================
:: Check old vim settings
:: ================================================================

echo Check your old vim settings ...

if exist "%HOME%\.vimrc" del /p /f /s "%HOME%\.vimrc" || goto err

if %has_vim% == True (
	if exist "%HOME%\_vimrc" del /p /f /s "%HOME%\_vimrc" || goto err
	if exist "%HOME%\.vim" call :delete_vim_folder
)

if %has_nvim% == True (
	if exist "%HOME%\AppData\Local\nvim\init.vim" del /p /f /s "%HOME%\AppData\Local\nvim\init.vim" || goto err
	if exist "%HOME%\AppData\Local\nvim\.vim" call:delete_nvim_folder
)

:: ================================================================
:: Clone or update repo
:: ================================================================

echo Load %REPO_PATH% ...
if not exist %REPO_PATH% (
	echo clone %REPO_PATH% ...
	git clone %REPO_URL% %APP_PATH% || goto err
) else (
	cd /d %REPO_PATH%
	echo update %REPO_PATH% ...
	git pull origin master || goto err
)

:: ================================================================
:: Installing vim-plug ...
:: ================================================================

if not exist "%HOME%\.vim\autoload\plug.vim" (
	if not exist "%HOME%\.vim" mkdir "%HOME%\.vim"
	if not exist "%HOME%\.vim\autoload" mkdir "%HOME%\.vim\autoload"
	echo Download vim-plug to "%HOME%\.vim\autoload\plug.vim"
	::powershell (New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim',$ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath('~\.vim\autoload\plug.vim'))
	sh -c "curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
	if not exist "%HOME%\.vim\autoload\plug.vim" goto err
) else (
	echo %HOME%\.vim\autoload\plug.vim is ready
)

:: ================================================================
:: Create links ...
:: ================================================================

echo Create links ...

mklink "%HOME%\.vimrc" "%REPO_PATH%\vimrc" || goto err

if %has_vim% == True (
	mklink "%HOME%\_vimrc" "%REPO_PATH%\vimrc" || goto err

)
if %has_nvim% == True (
	mklink "%HOME%\AppData\Local\nvim\init.vim" "%REPO_PATH%\vimrc" || goto err
	mklink /J "%HOME%\AppData\Local\nvim\.vim" "%HOME%\.vim" || goto err
)

:: ================================================================
:: Installing vim plugins ...
:: ================================================================

echo Installing vim plugins ...
if %has_vim% == True (
	call vim +PlugInstall! +PlugClean +qall || goto err
) else (
	call nvim +PlugInstall! +PlugClean +qall || goto err
)

goto ok

:: ================================================================
:: The End
:: ================================================================

:ok
@color 2f
@echo.
@echo           /@@@@@@@\     /@@@        @@@@@@@\    @@@@@@@\  
@echo          /@@    @@@    /@@@@      @@@    @@@  @@@    @@@  
@echo         /@@     @@    /@@ @@     @@@         @@@          
@echo        /@@    @@@    /@@  @@      @@@@@@       @@@@@@     
@echo       /@@@@@@@@     /@@@@@@@          @@@          @@@    
@echo      /@@/         ,@@/    @@   /@     @@/  /@      @@/    
@echo     /@@/         /@@/     @@  /@@@   @@/  /@@@    @@/     
@echo    /@@/        ./@@/      @@   @@@@@@@     @@@@@@@@       
@echo.
@echo.
@echo.
@pause
@exit 0

:err
@color 4f
@echo.
@echo            /@@@@@@@@@/   ,@@           /@@/     /@@/      
@echo           /@@@@@@@@@/   ,@@@          /@@/     /@@/       
@echo          /@@/          /@@@@         /@@/     /@@/        
@echo         /@@/          /@@ @@        /@@/     /@@/         
@echo        /@@@@@@@@/    @@@  @@       /@@/     /@@/          
@echo       /@@/         ,@@@@@@@@      /@@/     /@@/           
@echo      /@@/         /@@`   @@@     /@@/     /@@/            
@echo     /@@/        .@@@`   .@@@    /@@/     /@@@@@@@@@@/     
@echo    /@@/        .@@@     .@@@   /@@/     /@@@@@@@@@@/      
@echo.
@pause
@exit 1

:: ================================================================
:: Function
:: ================================================================

:delete_vim_folder
set /p select="Do you want to delete %HOME%\.vim folder (y/n) :"
if %select% == y (
	rd /q /s "%HOME%\.vim"|| goto err
) else (
	goto err
)
exit /b 0

:delete_nvim_folder
set /p select="Do you want to delete %HOME%\AppData\Local\nvim\.vim folder (y/n) :"
if %select% == y (
	rd /q /s "%HOME%\AppData\Local\nvim\.vim" || goto err
) else (
	goto err
)
exit /b 0