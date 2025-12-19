CREATE OR REFRESH STREAMING TABLE mgnrega_analytics.mgnrega_broonze.data_ingestion_broonze
AS 
SELECT *
FROM cloud_files(
  '/Volumes/mgnrega_analytics/mgnrega_broonze/mgnrega_raw_files',
  'csv',
  map('header','true','inferSchema','false')
);