$name = "JetBrainsMono"
$key = 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Console\TrueTypeFont'   # Need to set this for console

Set-ItemProperty -Path $key -Name '000' -Value $name

# Always need this, required for all Modules
Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force

# Set Microsoft PowerShell Gallery to 'Trusted'
Set-PSRepository -Name 'PSGallery' -InstallationPolicy Trusted   
Install-Module Terminal-Icons -Scope AllUsers
Import-Module Terminal-Icons
Install-Module WindowsConsoleFonts
# Set-ConsoleFont $name
# Set-TerminalIconsColorTheme -Name DevBlackOps   # After the above are setup, can add this to Profile to always load
# Set-TerminalIconsTheme -IconTheme "JetBrainsMono"