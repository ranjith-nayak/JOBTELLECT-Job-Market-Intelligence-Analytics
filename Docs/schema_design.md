companies
----------
company_id (PK)
company_name
description
company_size

industries
----------
industry_id (PK)
industry_name

skills
----------
skill_id (PK)
skill_name

jobs
----------
job_id (PK)
job_title
company_id (FK)
location
job_description
employment_type
posted_date

salaries
----------
salary_id (PK)
job_id (FK)
min_salary
max_salary
pay_period
currency

job_skills
----------
job_id (FK)
skill_id (FK)

job_industries
----------
job_id (FK)
industry_id (FK)