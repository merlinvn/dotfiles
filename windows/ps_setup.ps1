# Install Hack font at https://github.com/ryanoasis/nerd-fonts
#
# Install Scoop at https://scoop.sh/
#
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser # Optional: Needed to run a remote script the first time
Invoke-WebRequest get.scoop.sh | Invoke-Expression

# Install some useful tools
scoop install curl sudo jq

# Install git
winget install -e --id Git.Git

# Install neovim gcc
scoop install neovim gcc

# copy over the user profile to ~/.config/powershell/
# edit file $PROFILE.CurrentUserCurrentHost
#
# . $env:USERPROFILE\.config\powershell\user_profile.ps1


# Install OhMyPosh
Install-Module posh-git -Scope CurrentUser -Force

#Install-Module oh-my-posh -Scope CurrentUser -Force
scoop install oh-my-posh

# Install Nvm
scoop install nvm
# nvm install lts


# Install Terminal Icons, z (jump)
Install-Module -Name Terminal-Icons -Repository PSGallery -Force
Install-Module -Name z -Force
Install-Module -Name PSReadLine -AllowPrerelease -Scope CurrentUser -Force -SkipPublisherCheck

# Install fzf
scoop install fzf
Install-Module --name PSFzf -Scope CurrentUser -Force


