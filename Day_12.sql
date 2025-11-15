/* Analyze the event impact by comparing weeks with events vs weeks without events. 
Show: event status ('With Event' or 'No Event'), count of weeks, average patient satisfaction, 
and average staff morale. Order by average patient satisfaction descending. */

SELECT
    CASE
        WHEN event IS NULL OR event = 'None' THEN 'No Event'
        ELSE 'With Event'
    END AS Event_Status,
    COUNT(*) AS Count_of_Weeks, 
    AVG(patient_satisfaction) AS Avg_Patient_Satisfaction,
    AVG(staff_morale) AS Avg_Staff_Morale 
FROM services_weekly
GROUP BY
    CASE 
        WHEN event IS NULL OR event = 'None' THEN 'No Event'
        ELSE 'With Event'
    END
ORDER BY Avg_Patient_Satisfaction DESC;