Remove-Item -Recurse -Force merge-with-conflict
New-Item -Path . -Name "merge-with-conflict" -ItemType "directory"
Push-Location ".\merge-with-conflict"

New-Item -Path . -Name "books" -ItemType "file"

git init
git add books
git commit -m "Initial commit"

"ABC" | Out-File .\books
$env:GIT_AUTHOR_DATE = 619863300
git commit -m "ABC" -a
$split = (git rev-parse HEAD) | Out-String

"Alchemist" | Out-File -Append .\books
$env:GIT_AUTHOR_DATE = 992007000
git commit -m "'Alchemist' by Paulo Coelho" -a

"Siddhartha" | Out-File -Append .\books
$env:GIT_AUTHOR_DATE = 1239045600
git commit -m "'Siddhartha' by Hermann Hesse" -a

git checkout -b sci-fi $split.Trim()

"A Journey to the Center of the Earth" | Out-File -Append .\books
$env:GIT_AUTHOR_DATE = 1508746500
git commit -m "'A Journey to the Center of the Earth' by Jules Verne" -a

"The War of the Worlds" | Out-File -Append .\books
$env:GIT_AUTHOR_DATE = 1529698920
git commit -m "'The War of the Worlds' by Herbert George Wells" -a

$env:GIT_AUTHOR_DATE = ''

git checkout master
git merge sci-fi
git branch -D sci-fi

"ABC" | Out-File .\books
"Alchemist" | Out-File -Append .\books
"A Journey to the Center of the Earth" | Out-File -Append .\books
"The War of the Worlds" | Out-File -Append .\books

git add books
git commit --no-edit

"The Trial" | Out-File -Append .\books
git commit -m "'The Trial' by Franz Kafka" -a

"Metro 2033" | Out-File -Append .\books
git commit -m "'Metro 2033' by Dmitry Glukhovsky" -a

Pop-Location
