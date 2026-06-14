import pandas as pd
from config import engine

df = pd.read_csv(
    r"C:\Users\user\Desktop\Jobtellect\Data\postings.csv",
    low_memory=False
)

jobs_df = df[
    [
        "job_id",
        "company_name",
        "title",
        "description",
        "location",
        "min_salary",
        "med_salary",
        "max_salary",
        "currency",
        "pay_period",
        "formatted_work_type",
        "applies",
        "remote_allowed",
        "listed_time",
        "posting_domain",
        "sponsored",
        "formatted_experience_level"
    ]
]

print("Loading jobs into MySQL...")

jobs_df.to_sql(
    "jobs",
    con=engine,
    if_exists="append",
    index=False
)

print("Jobs loaded successfully!")