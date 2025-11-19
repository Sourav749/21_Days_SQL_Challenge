/* Create a comprehensive service analysis report for week 20 showing: service name, total patients 
admitted that week, total patients refused, average patient satisfaction, count of staff 
assigned to service, and count of staff present that week. Order by patients admitted descending. */

SELECT
    sw.service,
    sw.patients_admitted,
    sw.patients_refused,
    sw.patient_satisfaction AS avg_satisfaction,
    COUNT(s.staff_id) AS staff_assigned, 
    SUM( sc.present ) AS staff_present 
FROM 
	services_weekly sw
LEFT JOIN
    staff s ON sw.service = s.service 
LEFT JOIN
    staff_schedule sc ON s.staff_id = sc.staff_id 
WHERE
    sw.week = 20 AND sc.week = 20
GROUP BY
    sw.service, sw.patients_admitted, sw.patients_refused, sw.patient_satisfaction
ORDER BY 
	sw.patients_admitted DESC;