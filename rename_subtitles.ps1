param ($path)


########## LOCAL Variables ##########
$path = $path + "\*"


$movies = Get-ChildItem -Path $path -Include *.mkv,*.mp4,*.avi
$subs = Get-ChildItem -Path $path -Include *.srt

Write-Host "$($movies.count) episodes found" -ForegroundColor Green
Write-Host "$($subs.count) subtitles found" -ForegroundColor Green


Foreach($movie in $movies)
{
    $epNum = $movie.Name | Select-String -Pattern "[sS][01][0-9][eE][0-9][0-9]" -AllMatches | % { $_.Matches } | % { $_.Value }
    $srtMatch = $subs | Where-Object {$_.name -like "*$($epnum)*"}
    Rename-Item -LiteralPath $srtMatch.FullName -NewName $movie.Name.Replace(".mkv",".srt")
}