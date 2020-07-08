@echo off
git add .
::set /p commitDesc=InputCommitDesc:
::git commit -m "%commitDesc%"
git commit -m "I'm lazy and don't want to write a description (use English to avoid coding errors)"
git pull
git push