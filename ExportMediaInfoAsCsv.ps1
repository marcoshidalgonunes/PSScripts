Param
    (
        [Parameter(Mandatory=$true, ValueFromPipeline=$true)]
        [string[]]$Path,
 
        [Parameter(Mandatory=$true, ValueFromPipeline=$true)] 
        [string]$Destination
    )

    Get-ChildItem -Path $Path -Filter *.mp3 -Recurse -File | ForEach-Object { Get-MediaInfo $_.FullName | Select-Object Performer,Album,Track } | Export-Csv -Path $Destination