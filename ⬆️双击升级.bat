@echo off
cd /d "%~dp0"
echo "Searching for Git Bash..."
if exist "%ProgramFiles%\Git\bin\bash.exe" (
    "%ProgramFiles%\Git\bin\bash.exe" scripts/user_upgrade.sh
) else (
    if exist "%ProgramFiles(x86)%\Git\bin\bash.exe" (
        "%ProgramFiles(x86)%\Git\bin\bash.exe" scripts/user_upgrade.sh
    ) else (
        echo Error: Git Bash not found. Please install Git for Windows.
        pause
    )
)
pause
