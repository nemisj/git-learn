Remove-Item -Recurse -Force branch-without-branch
New-Item -Path . -Name "branch-without-branch" -ItemType "directory"
Push-Location ".\branch-without-branch"

git init

New-Item -Path . -Name "zork" -ItemType "file"
git add .
git commit -m "Initial commit"

"1" | Out-File .\zork
git add .
git commit -m "Starting with 1"
$split = (git rev-parse HEAD) | Out-String

"1.1.1" | Out-File -Append .\zork
git add .
git commit -m "Added 1.1.1"

"1.1.2" | Out-File -Append .\zork
git add .
git commit -m "Added 1.1.2"

git checkout $split.Trim()
git branch -D master

"1.2.1" | Out-File -Append .\zork
git add .
git commit -m "Added 1.2.1"

"1.2.2" | Out-File -Append .\zork
git add .
git commit -m "Added 1.2.2"

Pop-Location
