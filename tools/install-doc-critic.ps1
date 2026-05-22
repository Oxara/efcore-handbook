param(
    [Parameter(Mandatory = $true)]
    [string]$TargetProjectPath,

    [switch]$Force
)

$ErrorActionPreference = 'Stop'

function Write-Step {
    param([string]$Message)
    Write-Host "[doc-critic] $Message"
}

function Copy-FileWithPolicy {
    param(
        [string]$SourceFile,
        [string]$DestinationFile,
        [bool]$Overwrite
    )

    $destDir = Split-Path -Parent $DestinationFile
    if (-not (Test-Path $destDir)) {
        New-Item -ItemType Directory -Path $destDir -Force | Out-Null
    }

    if ((-not $Overwrite) -and (Test-Path $DestinationFile)) {
        Write-Step "Skip existing: $DestinationFile"
        return
    }

    Copy-Item -Path $SourceFile -Destination $DestinationFile -Force
    Write-Step "Copied: $DestinationFile"
}

$repoRoot = Split-Path -Parent $PSScriptRoot
$targetRoot = (Resolve-Path -Path $TargetProjectPath).Path
$overwrite = $Force.IsPresent

Write-Step "Source repo: $repoRoot"
Write-Step "Target project: $targetRoot"
Write-Step "Overwrite existing files: $overwrite"

$files = @(
    '.github/agents/technical-doc-critic.agent.md',
    '.github/instructions/technical-doc-quality.instructions.md',
    '.github/skills/technical-doc-review/SKILL.md',
    '.github/skills/technical-doc-review/references/rubric.md',
    '.github/skills/technical-doc-review/references/output-template.md'
)

foreach ($relativePath in $files) {
    $sourceFile = Join-Path $repoRoot $relativePath
    if (-not (Test-Path $sourceFile)) {
        throw "Missing source customization file: $sourceFile"
    }

    $destFile = Join-Path $targetRoot $relativePath
    Copy-FileWithPolicy -SourceFile $sourceFile -DestinationFile $destFile -Overwrite $overwrite
}

Write-Step 'Done. Reopen chat in target project to refresh available custom agents/skills/instructions.'
