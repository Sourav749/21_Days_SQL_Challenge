/* Create a comprehensive report showing patient_id, patient name, age, service, and the 
total number of staff members available in their service. Only include patients from services 
that have more than 5 staff members. Order by number of staff descending, then by patient name. */

SELECT
    p.patient_id,
    p.name AS patient_name,
    p.age,
    p.service,
    COUNT(s.staff_id) AS total_staff_in_service 
FROM
    patients p
INNER JOIN
    staff s ON p.service = s.service 
GROUP BY p.patient_id, p.name, p.age, p.service, p.service 
HAVING COUNT(s.staff_id) > 5 
ORDER BY
    total_staff_in_service DESC, 
    p.name ASC;