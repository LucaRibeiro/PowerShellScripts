Function Set-Sudo () {
    $commands = '';
    ForEach-Object -InputObject $args -Process {
        $commands += $_;
    }

    New-Item -Path '.\.OutputSudoPS' -ItemType File -Force | Out-Null
    
    Start-Process pwsh.exe -Verb RunAs -Wait -ArgumentList "-command $commands | Out-File .\.OutputSudoPS" -WindowStyle Hidden

    Remove-Item -Path '.\.OutputSudoPS' -Force | Out-Null

    Get-Content ".\.OutputSudoPS"
}