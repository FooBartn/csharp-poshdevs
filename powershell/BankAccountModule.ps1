$FunctionList = Get-ChildItem -Path $PSScriptRoot\Functions
foreach ($Function in $FunctionList) {
    Write-Verbose -Message ('Importing function file: {0}' -f $Function.FullName)
	. $Function.FullName
}

$ClassList = Get-ChildItem -Path $PSScriptRoot\Classes
foreach ($Class in $ClassList) {
    Write-Verbose -Message ('Importing class file: {0}' -f $Class.FullName)
	. $Class.FullName
}