# ==========================================
# Gaming PC Guide - Repository Optimizer
# ==========================================

Write-Host "Starting repository structure check..." -ForegroundColor Cyan

# 1. Check and create required directories
$requiredDirs = @(
    "docs",
    "docs/games",
    "assets/css",
    "_layouts",
    ".github/workflows"
)

foreach ($dir in $requiredDirs) {
    if (-not (Test-Path $dir)) {
        New-Item -ItemType Directory -Path $dir | Out-Null
        Write-Host "Created folder: $dir" -ForegroundColor Green
    } else {
        Write-Host "Folder exists: $dir" -ForegroundColor DarkGray
    }
}

# 2. Check Jekyll / Ruby environment
Write-Host "`nChecking Jekyll environment..." -ForegroundColor Cyan
if (Get-Command bundle -ErrorAction SilentlyContinue) {
    Write-Host "Bundler detected. Checking dependencies..." -ForegroundColor Green
    bundle check
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Installing missing gems..." -ForegroundColor Yellow
        bundle install
    }
} else {
    Write-Host "Bundler not found. Local Jekyll preview skipped." -ForegroundColor Yellow
}

# 3. Output Git Status
Write-Host "`nGit Status:" -ForegroundColor Cyan
git status --short

Write-Host "`nAll checks completed successfully!" -ForegroundColor Green