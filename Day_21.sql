/* Create a comprehensive hospital performance dashboard using CTEs. Calculate: 
1) Service-level metrics (total admissions, refusals, avg satisfaction), 
2) Staff metrics per service (total staff, avg weeks present), 
3) Patient demographics per service (avg age, count). 
Then combine all three CTEs to create a final report showing service name, all calculated metrics, and an overall 
performance score (weighted average of admission rate and satisfaction). Order by performance score descending. */

WITH Service_Metrics AS (
    SELECT
        service,
        SUM(patients_admitted) AS total_admissions,
        SUM(patients_refused) AS total_refusals,
        SUM(patients_request) AS total_requested, 
        ROUND(AVG(patient_satisfaction), 2) AS avg_satisfaction
    FROM services_weekly
    GROUP BY service
),
Staff_Metrics AS (
    SELECT
        service,
        COUNT(DISTINCT staff_id) AS total_staff, 
        ROUND(AVG(total_weeks_present), 2) AS avg_staff_weeks_present
    FROM 
        (  SELECT
                service, staff_id, SUM(present) AS total_weeks_present
            FROM staff_schedule
            GROUP BY service, staff_id
        ) AS staff_weeks
    GROUP BY service
),
Patient_Demographics AS (
    SELECT
        service,
        COUNT(patient_id) AS patient_count,
        ROUND(AVG(age)) AS avg_patient_age
    FROM patients
    GROUP BY service
)    
SELECT
    a.service,
    a.total_admissions,
    a.total_refusals,
    a.avg_satisfaction,
    b.total_staff,
    b.avg_staff_weeks_present,
    c.patient_count,
    c.avg_patient_age,
	ROUND(((a.total_admissions * 100.0 / a.total_requested) + a.avg_satisfaction) / 2,2) AS overall_performance_score
FROM
    Service_Metrics a
INNER JOIN Staff_Metrics b ON a.service = b.service
INNER JOIN Patient_Demographics c ON a.service = c.service
ORDER BY overall_performance_score DESC;