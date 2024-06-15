
# Aliases ----------------------------------------------------------------------
# ------------------------------------------------------------------------------

$createAlias = "$($powershellConfig)/create-alias.ps1"
. $createAlias grep Select-String


function reset {
  Clear-Host; .$PROFILE;
}

function gst {
  Write-Output $line
  git status
  Write-Output $line
}

function gaa {
  git add .
}

function gco($param) {
  git checkout $param
}

function l {
  Get-ChildItem -h
}

function la {
  Get-ChildItem
}

function getPort {
  param(
    [Parameter()]
    [string]$port
  )
  Get-Process -Id (Get-NetTCPConnection -LocalPort $port).OwningProcess
}



