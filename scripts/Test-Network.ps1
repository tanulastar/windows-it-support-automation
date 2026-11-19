
# Test-Network.ps1
# Perform basic network connectivity checks.

Write-Host "NETWORK CONNECTIVITY TEST" -ForegroundColor Cyan

$Targets = @(
    "8.8.8.8",
    "1.1.1.1",
    "google.com"
)

foreach ($Target in $Targets) {

    Write-Host "`nTesting connection to $Target ..."

    $Result = Test-Connection -ComputerName $Target -Count 2 -Quiet

    if ($Result) {
        Write-Host "$Target is reachable." -ForegroundColor Green
    }
    else {
        Write-Warning "$Target is unreachable."
    }
}

Write-Host "`nNetwork diagnostic completed." -ForegroundColor Cyan
