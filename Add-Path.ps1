Set-ExecutionPolicy Unrestricted
$newPath=Read-Host "Folder path to add"
$regex='^[c-zC-Z]:\\.'
if ($newPath -notmatch $regex)
{
    Write-Host "Forgot drive letter?"
}
elif (Test-Path $newPath)
{
    $oldPath=(Get-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name PATH).Path
    $newPath=$oldPath + ';' + $newPath
    Set-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name PATH –Value $newPath
}
else
{
    Write-Host "The folder you want to add doesn't exist."
}