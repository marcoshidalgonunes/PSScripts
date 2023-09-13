Param
(
    [Parameter(Mandatory=$true, ValueFromPipeline=$true)]
    [string[]]$Path
)

Get-ChildItem -Path $Path -Recurse -Directory | 
    ForEach-Object {
        [string]$parentFolder = $_.Parent.FullName
        if ($parentFolder -ne $Path) 
        {
            [string]$folder = $_.FullName
            Get-ChildItem -Path $folder -File -Force | ForEach-Object {
                Move-Item -Path $_ -Destination $parentFolder
            }    
            Remove-Item $folder
        }
    }