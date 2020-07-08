@echo off
git add .
set /p commitDesc=InputCommitDesc:
git commit -m "%commitDesc:~1,-1%"
git pull
git push
paused