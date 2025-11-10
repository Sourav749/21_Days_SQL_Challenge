/* Identify services that refused more than 100 patients in total and 
had an average patient satisfaction below 80. Show service name, 
total refused, and average satisfaction. */

select 
  service, 
  sum(patients_refused) AS Patients_Refused, 
  round(
    avg(patient_satisfaction), 
    2
  ) AS Patient_Satisfaction 
from services_weekly 
group by service 
having Patients_Refused > 100 and Patient_Satisfaction  < 80;
