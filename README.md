Add-Path

Install:
1) Test-Path $profile: if this returns "True" go to 3 else just continue
2) New-Item -Path $profile -ItemType file -Force
3) Copy Add-Path.ps1 to $env:USERPROFILE\Documents\WindowsPowerShell\Scripts *
4) powershell_ise $profile
5) . $env:USERPROFILE\Documents\WindowsPowerShell\Scripts\Add-Path.ps1.ps1 *

Repeat 3-5 for Edit-Path.ps1

*You might want to use the full path, this is not tested. + Don't forget the dot (.) infront of 5!

TODO: make module for easier install