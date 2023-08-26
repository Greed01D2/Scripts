<#
.SYNOPSIS
    Installs common applications I use with winget
.DESCRIPTION
    Since windows has a package manager now I don't want to go to invdividual sites for installs and everything I really want is in winget
.EXAMPLE
    ./install_apps.ps1
.INPUTS
    none
.OUTPUTS
    none
.NOTES
    Finally all my apps in one place
#>

$packages = @(
    @{name ="VideoLAN.VLC"},
    @{name ="Olivia.VIA"},
    @{name ="Yubico.YubikeyManager"},
    @{name ="Yubico.YubiKeyPersonalizationTool"},
    @{name ="Bitwarden.Bitwarden"},
    @{name ="Logitech.GHUB"},
    @{name ="Valve.Steam"},
    @{name ="Mozilla.Firefox"},
    @{name ="Microsoft.PowerToys"},
    @{name ="Discord.Discord"},
    @{name ="Nvidia.GeForceExperience"},
    @{name ="Yubico.YubiKeyPersonalizationTool"},
    @{name ="RaspberryPiFoundation.RaspberryPiImager"},
    @{name ="MusicBee.MusicBee"},
    @{name ="yt-dlp.yt-dlp"},
    @{name ="Balena.Etcher"},
    @{name ="Microsoft.VisualStudioCode"}.
    @{name ="Nvidia.GeForceExperience"}
)

foreach($package in $packages){
    $listApp = winget install --exact $package.name
}