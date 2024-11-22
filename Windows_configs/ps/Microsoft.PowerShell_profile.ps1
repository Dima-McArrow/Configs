Invoke-Expression (&starship init powershell)
Import-Module -Name Terminal-Icons

Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'
Set-Alias vim nvim
Set-Alias  cat bat

function la {
  Get-ChildItem -Force
}

function lh {
  Get-ChildItem -Force | Where-Object { $_.Attributes -match "Hidden" }
}


function touch {
  param (
    [string]$Path
  )

  if (Test-Path -Path $Path) {
    (Get-Item -Path $Path).LastWriteTime = Get-Date
  }
  else {
    New-Item -ItemType File -Path $Path | Out-Null
  }
}

fastfetch
