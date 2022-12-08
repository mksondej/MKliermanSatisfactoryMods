$SMLPath = "C:\Code\SF\SML\Plugins"
$ModDir = "C:\Code\SF\SatisfactoryMods"

function New-Sym-Link ($Link) {
    Remove-Item ($SMLPath + "\" + $Link) -ErrorAction SilentlyContinue -Recurse
    New-Item -Path ($SMLPath + "\" + $Link) -ItemType SymbolicLink -Value ($ModDir + "\" + $Link) -Force
}

$dir = Get-ChildItem $ModDir | Where-Object{$_.PSISContainer}
foreach ($d in $dir){
    New-Sym-Link($d.Name)
}