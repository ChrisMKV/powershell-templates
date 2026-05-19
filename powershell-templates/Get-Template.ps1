function Get-Template{
    <#
    .SYNOPSIS
    .DESCRIPTION
    .EXAMPLE
    .NOTES
    Author : ChrisMKV
    #>

    #Requires -Version 5.1
    # Remove SupportsShouldProcess for read-only (Get-*) functions
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'Medium')]
    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]$ExampleParameter
    )

    $fn = $MyInvocation.MyCommand.Name
    Write-Verbose "$fn : Start"

    try {
        if ($PSCmdlet.ShouldProcess($ExampleParameter, 'WhatIsItDoing')) {
            # work goes here
            $ExampleParameter
        }
    }
    catch {
        $MyErrorMessage = "$fn failed: $($_.Exception.Message)"
        $MyErrorRecord  = [System.Management.Automation.ErrorRecord]::new([System.Management.Automation.RuntimeException]::new($MyErrorMessage, $_.Exception),"$fn.Failed",$_.CategoryInfo.Category,$null)
        $MyErrorRecord.ErrorDetails = "$MyErrorMessage`n--- Inner ScriptStackTrace ---`n$($_.ScriptStackTrace)"
        $PSCmdlet.ThrowTerminatingError($MyErrorRecord)
    }

    Write-Verbose "$fn : End"
}