# This is a template for an executable script, for example to be used by SCCM.
# It is designed around return codes and basically ensures that we return usable info to the caller.
# Example call: powershell.exe -ExecutionPolicy Bypass -NoProfile -NonInterative -WindowStyle Hidden -File ".\ExecutableScript.ps1"

[CmdletBinding()]
param(
	#Default path for the transcript log file.
	[string]$LogPath = [IO.Path]::ChangeExtension((Join-Path -Path ([System.IO.Path]::GetTempPath()) -ChildPath $MyInvocation.MyCommand.Name), 'log')
)

$ErrorActionPreference = 'Stop'
$InformationPreference = 'Continue'

try {
	Start-Transcript -Path $LogPath -Force -ErrorAction SilentlyContinue
	Write-Information -MessageData ('[{0}] Begin script' -f (Get-Date -Format s))

	# Script actions go here.

	[int]$ExitCode = 0
} catch {
	$PSCmdlet.WriteError("Error occurred during execution: $PSItem")
	[int]$ExitCode = -1
} finally {
	Write-Information -MessageData ('[{0}] End script with exit code {1}' -f (Get-Date -Format s), $ExitCode)
	Stop-Transcript -ErrorAction SilentlyContinue
	Exit $ExitCode
}