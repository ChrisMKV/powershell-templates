function Get-Template {
	<#
	.SYNOPSIS
	Describe the function here.
	.DESCRIPTION
	Describe the function in more detail.
	.EXAMPLE
	Give an example of how to use it.
	.NOTES
	Author : ChrisMKV
	V1.0 2017-08-05 Initial Version
	#>

	#Requires -Version 5.1
	[CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'Medium')]

	param
	(
		#Describe the function parameter here.
		[parameter(Mandatory, ValueFromPipeline)]
		[string]$ExampleParameter
	)

	BEGIN {
		Write-Debug -Message "$(Get-Date -Format s) | Call Function: $($MyInvocation.MyCommand)"
	}

	PROCESS {
		try {
			if ($PSCmdlet.ShouldProcess($ExampleParameter, 'WhatIsItDoing')) {
				Write-Output -InputObject "$ExampleParameter"



			}
		} catch {
			$PSCmdlet.ThrowTerminatingError($PSitem)
		} finally {
		}
	}

	END {
	}
}