
# Get-DiskSpace.ps1
# Monitor available disk space on Windows drives.

Write-Host "DISK SPACE MONITOR" -ForegroundColor Cyan

$Disks = Get-CimInstance Win32_LogicalDisk -Filter "DriveType=3"

foreach ($Disk in $Disks) {

    $FreeSpace = [math]::Round($Disk.FreeSpace / 1GB, 2)
    $TotalSpace = [math]::Round($Disk.Size / 1GB, 2)
    $UsedSpace = [math]::Round($TotalSpace - $FreeSpace, 2)

    $FreePercentage = [math]::Round(
        ($Disk.FreeSpace / $Disk.Size) * 100, 2
    )

    Write-Host "Drive: $($Disk.DeviceID)"
    Write-Host "Total: $TotalSpace GB"
    Write-Host "Used: $UsedSpace GB"
    Write-Host "Free: $FreeSpace GB"
    Write-Host "Free Percentage: $FreePercentage%"

    if ($FreePercentage -lt 15) {
        Write-Warning "LOW DISK SPACE: $($Disk.DeviceID)"
    }

    Write-Host "----------------------------"
}
