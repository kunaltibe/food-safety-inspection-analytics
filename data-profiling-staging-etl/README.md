# Data Profiling, ETL Workflows, and Staging Table Setup

This directory focuses on preparing raw datasets through profiling, ETL processing, and structured staging — setting the foundation for downstream dimensional modeling and analytics.

---

## Workflow Overview

### 1. Data Profiling (with `ydata-profiling`)
- Conducted initial data exploration using Python and `ydata-profiling`.
- Generated interactive HTML profiling reports for both **Chicago** and **Dallas** datasets.
- Assessed data quality, missing values, schema inconsistencies, and value distributions.

### 2. ETL Workflows (with Talend)
- Built Talend workflows to extract, clean, and stage datasets:
  - `cfi_read`, `dallas_read` jobs for ingesting source data.
  - `stg_cfi_load_data`, `stg_dfi_load_data` jobs for staging cleaned outputs.
- Mapped raw fields into staging structures consistent across sources.

### 3. Stage Table DDL Generation
- Created SQL DDL scripts for:
  - `stg_chicago_food_inspection`
  - `stg_dallas_food_inspection`
- The DDL scripts for the staging tables were manually generated after the Talend ETL workflows were created and executed, ensuring that the table structures align with the actual staged output.

---

## Purpose

This stage ensures that:
- Raw datasets are thoroughly analyzed and understood before processing.
- Data is consistently cleaned and transformed using repeatable ETL workflows.
- Staging schemas are production-ready and aligned with actual ETL output.
