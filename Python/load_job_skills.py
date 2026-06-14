import pandas as pd
from config import engine

df = pd.read_csv(
    r"C:\Users\user\Desktop\Jobtellect\Data\job_skills.csv"
)

print("Loading job skills into MySQL...")

df.to_sql(
    "job_skills",
    con=engine,
    if_exists="append",
    index=False
)

print("Job skills loaded successfully!")