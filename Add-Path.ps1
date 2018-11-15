function Add-Path {
    [CmdletBinding()]
    Param (
        [parameter(
            Position = 0,
            Mandatory = $true,
            ValueFromPipeline = $true,
            HelpMessage = "Path you want to add.")]
        [string]$PathName
     )

    $regex='^[c-zC-Z]:\\.'
    if ($PathName -notmatch $regex)
    {
        Write-Host "Forgot drive letter?"
    }
    elif (Test-Path $PathName)
    {
        $oldPath=(Get-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name PATH).Path
        $newPath=$oldPath + ';' + $PathName
        Set-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name PATH –Value $newPath
    }
    else
    {
        Write-Host "The folder you want to add doesn't exist."
    }
}