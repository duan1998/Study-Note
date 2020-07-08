@echo off
git add .
set /p commitDesc=InputCommitDesc:
git commit -m "%commitDesc%"
git pull
git push