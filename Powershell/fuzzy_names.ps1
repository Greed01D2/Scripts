<#
.SYNOPSIS
    (Pseudo)Randomizes all characters in a name and preserves the extension
.DESCRIPTION
    This tries to randomize the text in a file name for testing other recovery scripts
.EXAMPLE
    TBF
.INPUTS
    System.String[]
.OUTPUTS
    none
.NOTES
    Sometimes you just need to shake files till their names fall out
#>

Param
(
  [Parameter(Mandatory=$true)][string]$location
)

begin{}

process{
    if(Test-Path $location -PathType Container){
        $files = Get-ChildItem $location
        foreach($file in $files){
            $name = $file.BaseName
            $ext = $file.Extension 
            $nameLen = $name.length
            $usedLoc = @()
            $nameRan = ""
            
            while($usedLoc.Length -ne $nameLen){
                $curLoc = Get-Random -Maximum $nameLen -Minimum 0
                if($curLoc -notin $usedLoc){
                    $nameRan += $name[$curLoc]
                    $usedLoc+=$curLoc
                }
            }
            Rename-Item -Path $file.FullName -NewName $nameRan$ext
        }
    }
    elseif (Test-Path $location -PathType Leaf) {
        $file = Get-ChildItem $location
        $name = $file.BaseName
        $ext = $file.Extension 
        $nameLen = $name.length
        $usedLoc = @()
        $nameRan = ""
        
        while($usedLoc.Length -ne $nameLen){
            $curLoc = Get-Random -Maximum $nameLen -Minimum 0
            if($curLoc -notin $usedLoc){
                $nameRan += $name[$curLoc]
                $usedLoc+=$curLoc
            }
        }
        Rename-Item -Path $location -NewName $nameRan$ext
    }
}

end{}