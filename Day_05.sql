/* Calculate the total number of patients admitted, total patients refused, 
and the average patient satisfaction across all services and weeks. 
Round the average satisfaction to 2 decimal places. */

select 
  sum(patients_admitted) AS Total_Patients_Admitted, 
  sum(patients_refused) AS Total_Patients_Refused, 
  round(
    Avg(patient_satisfaction), 
    2) AS Avg_Patient_Satisfaction 
from 
  services_weekly;