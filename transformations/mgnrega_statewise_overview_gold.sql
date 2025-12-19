CREATE OR REFRESH MATERIALIZED VIEW mgnrega_analytics.mgnrega_gold.mgnrega_statewise_overview_gold AS
SELECT
    financial_year,
    month,
    state_code,
    state_name,
    COUNT(DISTINCT district_code) AS total_districts,
    ROUND(SUM(approved_labour_budget)/10000000,2) AS total_labour_budget_in_crore,
    ROUND(SUM(total_expenses)/10000000,2) AS total_expenses_in_crores,
    ROUND((SUM(total_expenses)/SUM(approved_labour_budget))*100,2) AS percentage_of_budget_spent,
    ROUND(SUM(total_no_of_workers)/10000000,2) AS total_workers_in_crore,
    ROUND(SUM(total_no_of_active_workers)/10000000,2) AS total_active_workers_in_crore,
    ROUND(SUM(total_no_of_jobcards_issued)/10000000,2) AS total_jobcards_issued_in_crore,
    ROUND(SUM(total_no_of_active_job_cards)/10000000,2) AS total_active_jobcards_in_crore,
    SUM(SC_workers_against_active_workers) AS total_SC_workers,
    ROUND((SUM(SC_workers_against_active_workers)/SUM(total_no_of_active_workers))*100,2) AS percentage_of_SC_workers,
    SUM(ST_workers_against_active_workers) AS total_ST_workers,
    ROUND((SUM(ST_workers_against_active_workers)/SUM(total_no_of_active_workers))*100,2) AS percentage_of_ST_workers,
    SUM(total_households_completed_100_days_work) AS total_households_completed_100_days_work,
    ROUND(SUM(total_no_of_works_takenup)/100000,2) AS total_works_takenup_in_lakhs,
    ROUND(SUM(number_of_completed_works)/100000,2) AS total_completed_works_in_lakhs,
    ROUND(SUM(number_of_ongoing_works)/100000,2) AS total_ongoing_works_in_lakhs,
    SUM(no_of_GP_with_no_work) AS total_GP_with_no_work,
    SUM(differently_abled_persons_worked) AS total_differently_abled_persons_worked
FROM mgnrega_analytics.mgnrega_silver.mgnrega_transformation_silver
GROUP BY financial_year, month, state_code, state_name;