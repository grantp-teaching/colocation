# Checks for cloud setup lab

# commands expected
$commands = @( "dot" )
foreach ( $command in $commands ) {
    Write-Host "checking for $command command... " -NoNewline
    if ( Get-command $command ) {
        Write-Host "OK"
    }
    else {
        Write-Host "not found" -ForegroundColor Red
        Write-Host "  -- install and re-run to continue checks"
    }

}

# compile graphviz pictures
$files = Get-ChildItem | Where {$_.Extension -match "gv" }
$format = "svg"
foreach ( $file in $files ) {
	$command = "dot -T svg -o \"$file.svg\" \"$file.gv\""
	Write-Host $command
}

# confirmation screen
Write-Host "You have completed AWS setup lab" -ForegroundColor Green

