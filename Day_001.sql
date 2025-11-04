-- Question: List all unique hospital services available in the hospital.

USE hospital_db;

Select 
  distinct service 
from 
  services_weekly;