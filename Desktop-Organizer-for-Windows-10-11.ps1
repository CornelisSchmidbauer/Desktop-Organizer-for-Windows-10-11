$desktopPath = [Environment]::GetFolderPath("Desktop")
$files = Get-ChildItem -Path $desktopPath -File

foreach ($file in $files) {
    $extension = $file.Extension.TrimStart('.')
    $folderPath = Join-Path -Path $desktopPath -ChildPath $extension

    if (-not (Test-Path -Path $folderPath)) {
        $null = New-Item -Path $folderPath -ItemType Directory
    }

    $destination = Join-Path -Path $folderPath -ChildPath $file.Name
    Move-Item -Path $file.FullName -Destination $destination
}
