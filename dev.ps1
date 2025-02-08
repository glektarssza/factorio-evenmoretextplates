$local:factorioPath = $args[0];

$local:modName = "even-more-text-plates-2_0";

if (-not "$local:factorioPath" -and -not "$env:FACTORIO_PATH") {
    Write-Error "No Factorio path provided and not found in environment!";
    exit $false;
}
if (-not "$local:factorioPath") {
    $local:factorioPath = "$env:FACTORIO_PATH";
}

if (-not (Test-Path -PathType Container -Path "$local:factorioPath\mods")) {
    New-Item -Type Directory -Name "mods" -Path "$local:factorioPath";
}

$local:modVersion = Get-Content -Path "$local:modName\info.json" | Select-String -Pattern '"version": "(.+)"' | Select-Object -ExpandProperty Matches | Select-Object -ExpandProperty Groups | Select-Object -ExpandProperty Captures | Select-Object -Property Value -Last 1 -ExpandProperty Value;

Write-Output "Symbolic linking $local:modName v$local:modVersion to $local:factorioPath\mods\$($local:modName)_$($local:modVersion)";

return New-Item -Force -Type SymbolicLink -Target "$PSScriptRoot/$modName" "$local:factorioPath/mods/$($local:modName)_$($local:modVersion)";
