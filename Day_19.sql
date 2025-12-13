/* For each service, rank the weeks by patient satisfaction score (highest first). Show service, 
week, patient_satisfaction, patients_admitted, and the rank. Include only the top 3 weeks per service. */

SELECT
    service, week, patient_satisfaction, patients_admitted, satisfaction_rank
FROM
    (SELECT service, week, patient_satisfaction, patients_admitted,
            RANK() OVER (
                PARTITION BY service
                ORDER BY patient_satisfaction DESC
            ) AS satisfaction_rank
        FROM
            services_weekly
    ) AS t1
WHERE
    t1.satisfaction_rank <= 3
ORDER BY
    patient_satisfaction DESC; 