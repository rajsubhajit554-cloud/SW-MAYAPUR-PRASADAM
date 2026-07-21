@echo off
cls
echo ====================================================
echo          SW MAYAPUR PRASADAM - GIT UPDATE
echo ====================================================
echo.

:: Check if git is installed
where git >nul 2>nul
if %errorlevel% neq 0 (
    echo [ERROR] Git is not installed or not in PATH!
    echo Please install Git from https://git-scm.com/
    pause
    exit /b 1
)

:: Show current Git status
echo [INFO] Current Git Status:
echo ----------------------------------------------------
git status -s
echo ----------------------------------------------------
echo.

:: Confirm if the user wants to push changes
set /p CONFIRM="Do you want to stage, commit, and push all changes? (Y/N, default Y): "
if /i "%CONFIRM%"=="N" (
    echo [INFO] Update cancelled by user.
    pause
    exit /b 0
)

:: Ask for commit message
set /p COMMIT_MSG="Enter commit message (default 'Update website'): "
if "%COMMIT_MSG%"=="" set COMMIT_MSG=Update website

echo.
echo [INFO] Adding all changes...
git add .

echo.
echo [INFO] Committing changes...
git commit -m "%COMMIT_MSG%"

echo.
echo [INFO] Pushing changes to remote (origin main)...
git push origin main

if %errorlevel% equ 0 (
    echo.
    echo ====================================================
    echo [SUCCESS] Git repository updated successfully!
    echo ====================================================
) else (
    echo.
    echo ====================================================
    echo [ERROR] Git push failed. Please check your internet
    echo         connection or repository permissions.
    echo ====================================================
)

echo.
pause
