# Retail Analytics Lakehouse - Project Setup

Write-Host "Creating Retail Analytics Lakehouse project..." -ForegroundColor Cyan

# Create directories
$folders = @(
    "data\raw\customers",
    "data\raw\products",
    "data\raw\orders",
    "data\raw\order_items",
    "data\generated",
    "notebooks",
    "pyspark",
    "dbt",
    "tests",
    "docs",
    "scripts"
)

foreach ($folder in $folders) {
    New-Item -ItemType Directory -Path $folder -Force | Out-Null
}

# Create .gitkeep files so empty directories are tracked by Git
$gitkeepFiles = @(
    "data\raw\customers\.gitkeep",
    "data\raw\products\.gitkeep",
    "data\raw\orders\.gitkeep",
    "data\raw\order_items\.gitkeep",
    "data\generated\.gitkeep"
)

foreach ($file in $gitkeepFiles) {
    New-Item -ItemType File -Path $file -Force | Out-Null
}

# Create initial project files
$files = @(
    "scripts\generate_data.py",
    "pyspark\bronze_to_silver.py",
    "dbt\README.md",
    "tests\README.md",
    "docs\architecture.md"
)

foreach ($file in $files) {
    New-Item -ItemType File -Path $file -Force | Out-Null
}

# Create README
$readme = @"
# Retail Analytics Lakehouse

An end-to-end Data Engineering project demonstrating a production-style
lakehouse architecture using PySpark, Databricks, Delta Lake, dbt, and SQL.

## Tech Stack

- Python
- PySpark / Apache Spark
- Databricks
- Delta Lake
- dbt
- SQL
- Git / GitHub

## Architecture

Source Data → Bronze → Silver → dbt → Gold

## Key Engineering Concepts

- Medallion Architecture
- Incremental Data Processing
- Data Quality Validation
- Deterministic Deduplication
- Delta Lake
- dbt Transformations
- dbt Testing
- Incremental dbt Models
- SCD Type 2
- Dimensional Modeling
- Star Schema
- Spark Performance Optimization

## Data Sources

- Customers
- Products
- Orders
- Order Items

## Project Status

Stage 1 - Foundation & Data Generation

## Production Azure Equivalent

ADF → ADLS Gen2 → Azure Databricks → Delta Lake → dbt → Gold
"@

Set-Content -Path "README.md" -Value $readme

# Create architecture documentation
$architecture = @"
# Architecture

## Current Architecture

Source Data
    ↓
Bronze
    ↓
PySpark
    ↓
Silver
    ↓
dbt
    ↓
Gold

## Production Azure Equivalent

Source Systems
    ↓
Azure Data Factory
    ↓
ADLS Gen2
    ↓
Azure Databricks / PySpark
    ↓
Silver Delta Tables
    ↓
dbt
    ↓
Gold Analytics Models
"@

Set-Content -Path "docs\architecture.md" -Value $architecture

# Create dbt README
$dbtReadme = @"
# dbt Project

The dbt transformation layer will contain:

- Sources
- Staging models
- Intermediate models
- Fact and dimension models
- Incremental models
- Data quality tests
- Snapshots
- Macros
"@

Set-Content -Path "dbt\README.md" -Value $dbtReadme

# Create tests README
$testsReadme = @"
# Tests

Project-level validation will include:

- Record count validation
- Null checks
- Duplicate checks
- Referential integrity
- Business rule validation
- Incremental load validation
"@

Set-Content -Path "tests\README.md" -Value $testsReadme

Write-Host ""
Write-Host "==========================================" -ForegroundColor Green
Write-Host "Project structure created successfully!" -ForegroundColor Green
Write-Host "==========================================" -ForegroundColor Green
Write-Host ""

Write-Host "Folders created:" -ForegroundColor Yellow

foreach ($folder in $folders) {
    Write-Host "  [OK] $folder"
}

Write-Host ""
Write-Host "Files created:" -ForegroundColor Yellow

foreach ($file in $files) {
    Write-Host "  [OK] $file"
}

Write-Host "  [OK] README.md"
Write-Host ""

Write-Host "Stage 1 foundation is ready!" -ForegroundColor Green