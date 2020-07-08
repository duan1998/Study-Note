@echo off
git add .
::set /p commitDesc=InputCommitDesc:
::git commit -m "%commitDesc%"
git commit -m "懒得写描述"
git pull
git push