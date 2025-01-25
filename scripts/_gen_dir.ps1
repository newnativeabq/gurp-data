# Script Name: Initialize-GURPProject.ps1
# Description: Creates the directory structure and empty files for the GURP project.
# Usage: Navigate to the root directory of your project and run the script.

# Define the list of directories to create
$directories = @(
    "src/core/data_structures",
    "src/core/apis",
    "src/core/utils",
    "src/core/config",
    "tests/core",
    "docs/tutorials",
    "examples",
    "scripts",
    "requirements"
)

# Define the list of files to create
$files = @(
    # Root Files
    ".python-version",
    "LICENSE",
    "pyproject.toml",
    "README.md",
    ".gitignore",

    # Source Code Files
    "src/core/__init__.py",
    "src/core/data_structures/__init__.py",
    "src/core/data_structures/image.py",
    "src/core/data_structures/audio.py",
    "src/core/data_structures/video.py",
    "src/core/data_structures/text.py",
    "src/core/data_structures/table.py",
    "src/core/apis/__init__.py",
    "src/core/apis/compute.py",
    "src/core/apis/search.py",
    "src/core/apis/transform.py",
    "src/core/utils/__init__.py",
    "src/core/utils/helpers.py",
    "src/core/config/__init__.py",
    "src/core/config/settings.py",

    # Testing Files
    "tests/core/__init__.py",
    "tests/core/test_data_structures.py",
    "tests/core/test_apis.py",
    "tests/core/test_utils.py",
    "tests/core/test_config.py",

    # Documentation Files
    "docs/index.md",
    "docs/architecture.md",
    "docs/api_reference.md",
    "docs/tutorials/getting_started.md",
    "docs/tutorials/advanced_topics.md",

    # Example Scripts
    "examples/example_image.py",
    "examples/example_audio.py",
    "examples/example_search.py",

    # Scripts
    "scripts/setup_env.sh",
    "scripts/deploy.sh",

    # Requirements
    "requirements/base.txt",
    "requirements/dev.txt",
    "requirements/production.txt"
)

# Function to create directories
function Create-Directories {
    foreach ($dir in $directories) {
        if (-Not (Test-Path -Path $dir)) {
            New-Item -Path $dir -ItemType Directory -Force | Out-Null
            Write-Host "Created directory: $dir" -ForegroundColor Green
        } else {
            Write-Host "Directory already exists: $dir" -ForegroundColor Yellow
        }
    }
}

# Function to create files
function Create-Files {
    foreach ($file in $files) {
        if (-Not (Test-Path -Path $file)) {
            New-Item -Path $file -ItemType File -Force | Out-Null
            Write-Host "Created file: $file" -ForegroundColor Green
        } else {
            Write-Host "File already exists: $file" -ForegroundColor Yellow
        }
    }
}

# Execute the functions
Create-Directories
Create-Files

Write-Host "GURP project structure initialized successfully!" -ForegroundColor Cyan
