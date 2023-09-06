Param
(
    [Parameter(Mandatory=$true, ValueFromPipeline=$true)]
    [string[]]$Path,

    [Parameter(Mandatory=$true, ValueFromPipeline=$true)] 
    [string]$FileName
)

if ((Test-Path -Path $Path) -eq $false) {
    Write-Host "$Path not found" -ForegroundColor Red
    Exit 1
} 

try {
    Get-ChildItem -Path $Path -Filter *.mp3 -Recurse -File | ForEach-Object { Get-MediaInfo $_.FullName | Select-Object Performer,Album,Track } | Export-Csv -Path $FileName
}
catch {
    Write-Host "$($PSItem.ToString())" -ForegroundColor Red
}

