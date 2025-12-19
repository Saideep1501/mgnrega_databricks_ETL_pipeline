# MGNREGA Data ETL Pipeline on Databricks

## Overview
This project implements an end-to-end ETL pipeline for MGNREGA data using the Databricks platform on AWS. 
Raw CSV files sourced from open government data portals are ingested into Databricks Unity Catalog volumes and processed using a SQL-first approach.

The pipeline transforms, cleanses, and enriches the data through multiple stages, making it analytics-ready for reporting and insights.

---

## Key Features
- Incremental ingestion of CSV data using Databricks Auto Loader
- SQL-based implementation without Spark code
- Data storage and governance using Unity Catalog Volumes
- Medallion Architecture (Bronze, Silver, Gold)
- Streaming tables for raw ingestion
- Materialized views for analytics and KPIs
- Basic pipeline monitoring and data quality checks
- Orchestration using Databricks Jobs

---

## Architecture
This ETL pipeline follows the **Medallion Architecture** to transform raw data into analytics-ready datasets.

### 1. Data Ingestion
- Data sourced from the Open Government Data (OGD) portal.
- Raw CSV files are manually uploaded into Databricks Unity Catalog Volumes.

### 2. Bronze Layer
- Implemented using **Streaming Tables** with Databricks Auto Loader.
- Incrementally ingests raw CSV files from Unity Catalog Volumes.
- Stores raw, unprocessed data for traceability and reprocessing.

### 3. Silver Layer
- Implemented using Delta tables.
- Cleanses and validates data from the Bronze layer.
- Applies schema corrections, deduplication, and basic data quality checks.
- Produces standardized and reusable datasets.

### 4. Gold Layer
- Contains business-ready datasets for analytics.
- Uses Delta tables for detailed analytical views.
- Uses **Materialized Views** for aggregated KPIs and summary metrics to improve query performance.

---

## Monitoring & Data Quality
- Row count validation between pipeline layers
- Load timestamps for auditability
- Basic pipeline monitoring using SQL-based audit tables

---

## Tech Stack
- Databricks
- Databricks SQL
- Delta Lake
- Unity Catalog

---

## Learning Outcomes
- Designed an end-to-end ETL pipeline using Databricks SQL
- Implemented incremental ingestion using Auto Loader
- Applied Medallion Architecture best practices
- Understood the difference between streaming tables, Delta tables, and materialized views
- Built analytics-ready datasets for reporting
