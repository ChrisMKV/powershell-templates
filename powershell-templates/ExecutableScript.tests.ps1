
Describe "ExecutableScript Test" {
	It "Should exit cleanly" {
	  {& ./ExecutableScript.ps1} | Should -Not -Throw
	}
  }