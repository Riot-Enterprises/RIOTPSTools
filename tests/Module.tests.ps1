Describe 'Release Module File' -Tag 'Integration' {
    BeforeAll {
        [System.IO.FileInfo]$ModuleManifest = Get-ChildItem $PSScriptRoot\..\Release\*.psd1 -Recurse -File | Sort-Object -Property FullName.Length | Select-Object -First 1
    }
    It 'Should Exist' {
        $ModuleManifest | Should -BeOfType System.IO.FileInfo
        $ModuleManifest | Should -Not -BeNullOrEmpty
    }
    It 'Should be valid' {
        Test-ModuleManifest -Path $ModuleManifest.FullName | Should -Not -BeNullOrEmpty
    }
}