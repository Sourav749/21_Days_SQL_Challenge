/* Create a report showing each service with: service name, total patients admitted, the 
difference between their total admissions and the average admissions across all services, and a rank 
indicator ('Above Average', 'Average', 'Below Average'). Order by total patients admitted descending. */

SELECT
    Calculated_Admissions.service,
    Calculated_Admissions.Total_Admitted,
    ROUND(
        Calculated_Admissions.Total_Admitted - Calculated_Admissions.Hospital_Avg, 2) AS Difference_From_Average,
    CASE
        WHEN Calculated_Admissions.Total_Admitted > Calculated_Admissions.Hospital_Avg THEN 'Above Average'
        WHEN Calculated_Admissions.Total_Admitted < Calculated_Admissions.Hospital_Avg THEN 'Below Average'
        ELSE 'Average'
    END AS Admission_Rank
FROM
    (	SELECT
            sw.service,
            SUM(sw.patients_admitted) AS Total_Admitted,
            (SELECT AVG(patients_admitted) FROM services_weekly) AS Hospital_Avg
        FROM services_weekly sw
        GROUP BY sw.service
    ) AS Calculated_Admissions
ORDER BY
	Total_Admitted DESC;