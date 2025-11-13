/* Create a service performance report showing service name, total patients admitted,
and a performance category based on the following: 'Excellent' if avg satisfaction >= 85,
'Good' if >= 75, 'Fair' if >= 65, otherwise 'Needs Improvement'. Order by average satisfaction descending. */

SELECT
    service,
    SUM(patients_admitted) AS Total_Admitted, 
    ROUND(AVG(patient_satisfaction),2) AS Avg_Satisfaction, 
    CASE
        WHEN AVG(patient_satisfaction) >= 85 THEN 'Excellent'
        WHEN AVG(patient_satisfaction) >= 75 THEN 'Good'     
        WHEN AVG(patient_satisfaction) >= 65 THEN 'Fair'     
        ELSE 'Needs Improvement'
    END AS Performance_Category
FROM services_weekly
GROUP BY service
ORDER BY Avg_Satisfaction DESC; 