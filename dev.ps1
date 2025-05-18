$local:factorioPath = $args[0];

$local:modName = "even-more-text-plates-2_0";

if (-not "$local:factorioPath" -and -not "$env:FACTORIO_PATH") {
    Write-Error "No Factorio path provided and not found in environment!";
    exit $false;
}
if (-not "$local:factorioPath") {
    $local:factorioPath = "$env:FACTORIO_PATH";
}

if (-not (Test-Path -PathType Container -Path "$local:factorioPath/mods")) {
    New-Item -Type Directory -Name "mods" -Path "$local:factorioPath";
}

Write-Output "Symbolic linking `"$local:modName`" v$local:modVersion to `"$local:factorioPath/mods/$local:modName`"";

if (Test-Path -Path "$local:factorioPath/mods/$local:modName") {
    Write-Warning "`"$local:factorioPath/mods/$local:modName`" already exists, attempting to delete..."
    (Get-Item -Path "$local:factorioPath/mods/$local:modName").Delete();
}

return New-Item -Force -Type SymbolicLink -Target "$PSScriptRoot/$local:modName" "$local:factorioPath/mods/$local:modName";
