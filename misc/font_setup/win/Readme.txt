1/ Set execution policy (similar to sudo chmod 777
	Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope LocalMachine
	Get-ExecutionPolicy -List
* Run as an admin

2/ Install nerd font using install.ps1 in nerd font repo
	Repo url: https://github.com/ryanoasis/nerd-fonts
	Run: ./\install.ps1 (install all available fonts) or ./\install.ps1 <font_name>
	Ex: ./\install.ps1 "JetBrainsMono"

3/ Run font_setup.ps1 as an admin
4/ Open your PowerShell Appearance Settings and change Fontface.
5/ Reboot