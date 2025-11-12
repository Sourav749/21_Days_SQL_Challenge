/* Calculate the average length of stay (in days) for each service, 
showing only services where the average stay is more than 7 days. 
Also show the count of patients and order by average stay descending. */

SELECT
    service,
    COUNT(patient_id) AS patient_count,
    ROUND(AVG(DATEDIFF(departure_date, arrival_date)),2) AS avg_length_of_stay_days
FROM
    patients
GROUP BY service
HAVING avg_length_of_stay_days > 7 
ORDER BY avg_length_of_stay_days DESC; 