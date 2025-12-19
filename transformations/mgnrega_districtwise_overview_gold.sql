CREATE OR REFRESH MATERIALIZED VIEW mgnrega_analytics.mgnrega_gold.mgnrega_districtwise_overview_gold AS
SELECT
    financial_year,
    month,
    state_code,
    state_name,
    district_code,
    district_name,
    ROUND(SUM(approved_labour_budget)/100000,2) AS total_labour_budget_in_lakhs,
    ROUND(SUM(total_expenses)/100000,2) AS total_expenses_in_lakhs,
    ROUND((SUM(total_expenses)/SUM(approved_labour_budget))*100,2) AS percentage_of_budget_spent,
    ROUND(SUM(total_no_of_active_workers)/100000,2) AS total_active_workers_in_lakhs,
    ROUND(SUM(total_no_of_active_job_cards)/100000,2) AS total_active_jobcards_in_lakhs,
    ROUND(SUM(average_days_of_employment_provided_per_household),2) AS avg_days_of_employment_provided_per_household,
    ROUND(SUM(average_wage_rate_per_day_per_person),2) AS avg_wage_rate_per_day_per_person,
    ROUND(SUM(total_no_of_works_takenup)/100000,2) AS total_works_takenup_in_lakhs,
    ROUND(SUM(number_of_completed_works)/100000,2) AS total_completed_works_in_lakhs,
    ROUND(SUM(number_of_ongoing_works)/100000,2) AS total_ongoing_works_in_lakhs,
    ROUND((SUM(number_of_ongoing_works)/SUM(total_no_of_works_takenup))*100,2) AS percentage_of_works_ongoing,
    SUM(no_of_GP_with_no_work) AS total_GP_with_no_work
FROM mgnrega_analytics.mgnrega_silver.mgnrega_transformation_silver
GROUP BY financial_year, month, state_code, state_name, district_code, district_name;