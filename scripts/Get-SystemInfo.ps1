
# Get-SystemInfo.ps1
# Collect basic Windows system information.
# Author: IT Support Automation Project

Write-Host "==================================" -ForegroundColor Cyan
Write-Host "       SYSTEM INFORMATION         " -ForegroundColor Cyan
Write-Host "==================================" -ForegroundColor Cyan

$Computer = Get-CimInstance Win32_ComputerSystem
$OperatingSystem = Get-CimInstance Win32_OperatingSystem
$Processor = Get-CimInstance Win32_Processor

Write-Host "Computer Name: $($Computer.Name)"
Write-Host "Manufacturer: $($Computer.Manufacturer)"
Write-Host "Model: $($Computer.Model)"
Write-Host "Operating System: $($OperatingSystem.Caption)"
Write-Host "OS Version: $($OperatingSystem.Version)"
Write-Host "Processor: $($Processor.Name)"
Write-Host "Total RAM: $([math]::Round($Computer.TotalPhysicalMemory / 1GB, 2)) GB"

Write-Host "==================================" -ForegroundColor Green
Write-Host "System information collected." -ForegroundColor Green
