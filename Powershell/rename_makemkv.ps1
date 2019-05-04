<#
.SYNOPSIS
  Renames all video files in a folder for consumption by Plex
.DESCRIPTION
  Steps through each file in sorted order numbering them based on the user inputed starting value
.EXAMPLE
  PS C:\> ./rename_makemkv.ps1 -start_eps 01 -end_eps 13 -title Ah! My Goddess -directory "c:/users/sample/videos/Ah My Goddess/"
.INPUTS
  System.String[]
.OUTPUTS
  none
.NOTES
  This command is a bit of a blunt implement. Since it's using Win32_NetworkAdapterConfiguration it can't easily filter for a specific network adapter.
#>
Param
(
  [Parameter(Mandatory=$true)][int]$start_eps,
  [Parameter(Mandatory=$true)][int]$end_eps,
  [Parameter(Mandatory=$true)][string]$title,
  [Parameter(Mandatory=$true)][string]$directory
)

begin{
  $working_eps=$start_eps
  $episodes = Get-Childitem -Path $directory | Where-Object {$_.Extension -eq ".mkv"}
  $log_file = $directory+"\\conversion_results.log"
}
process{
  if(Test-Path $log_file){
      $rotate_log = $directory+"\\conversion_results.log.old"
      
      if(test-path $rotate_log){
          remove-item $rotate_log
      }

      rename-item $log_file $rotate_log
  }


  if(($end_eps - $start_eps) -gt $episodes.Length){
      write-warning "WARNING number of episodes requested does not match number of episodes in directory"
      exit
  }

  foreach($x in $episodes){
    
    $new_title = $title+" - "+$working_eps+".mkv"
    $full_path = $directory+"\\"+$x
    write-host "Renaming " $x " to " $new_title
    rename-item $full_path $new_title
    $log_content = "Renamed "+$x+" to "+$new_title
    add-content $log_file $log_content
    $working_eps++
  }
}
end {}
