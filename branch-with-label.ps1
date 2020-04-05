Remove-Item -Recurse -Force branch-with-branch
New-Item -Path . -Name "branch-with-label" -ItemType "directory"
Push-Location ".\branch-with-label"

git init

New-Item -Path . -Name "zork" -ItemType "file"
git add .
git commit -m "Initial commit"

"1" | Out-File .\zork
git add .
git commit -m "Starting with 1"
git branch octopus
git checkout -b cat

git branch -D master

"1.1.1" | Out-File -Append .\zork
git add .
git commit -m "Added 1.1.1"

"1.1.2" | Out-File -Append .\zork
git add .
git commit -m "Added 1.1.2"

git checkout octopus
git branch -D master

"1.2.1" | Out-File -Append .\zork
git add .
git commit -m "Added 1.2.1"

"1.2.2" | Out-File -Append .\zork
git add .
git commit -m "Added 1.2.2"

Pop-Location
