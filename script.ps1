Write-Host "This script will create a folder structure for the DAP course."
Write-Host "Script by Taufeeq Riyaz, 2023."

$locationChoice = Read-Host "Enter '1' to create folders in Documents folder or '2' to create folders in the current directory"

if ($locationChoice -eq '1') {
    $baseDirectory = "$env:USERPROFILE\Documents\Course_DAP"
} elseif ($locationChoice -eq '2') {
    $baseDirectory = (Get-Location).Path
} else {
    Write-Host "Invalid choice. Exiting script."
    exit
}


1..5 | ForEach-Object {
    $courseFolder = "CO$_"
    New-Item -Path (Join-Path -Path $baseDirectory -ChildPath $courseFolder) -ItemType Directory

    $subfolders = "Course Material", "Assessment", "Activity"
    $coursePath = Join-Path -Path $baseDirectory -ChildPath $courseFolder
    $subfolders | ForEach-Object {
        New-Item -Path (Join-Path -Path $coursePath -ChildPath $_) -ItemType Directory
    }
}

Write-Host "Folder structure created up to CO5 in $baseDirectory."
