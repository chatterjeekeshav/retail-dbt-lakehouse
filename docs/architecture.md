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
