CREATE OR REFRESH MATERIALIZED VIEW mgnrega_analytics.mgnrega_monitoring.pipeline_monitoring_audit
AS
SELECT
  "mgnrega_etl_pipeline" AS pipeline_name,
  current_timestamp() AS run_time,
  (SELECT COUNT(*) FROM mgnrega_analytics.mgnrega_broonze.data_ingestion_broonze) AS bronze_rows,
  (SELECT COUNT(*) FROM mgnrega_analytics.mgnrega_silver.mgnrega_transformation_silver) AS silver_rows,
  (SELECT COUNT(*) FROM mgnrega_analytics.mgnrega_gold.mgnrega_statewise_overview_gold) AS gold_rows,
  'SUCCESS' AS status
;