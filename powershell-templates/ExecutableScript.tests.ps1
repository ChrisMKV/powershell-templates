
Describe "ExecutableScript Test" {
	It "Should exit cleanly" {
	  {& ./powershell-templates/ExecutableScript.ps1} | Should -Not -Throw
	}
  }