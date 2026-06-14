import pandas as pd

df = pd.read_csv(
    r"C:\Users\user\Desktop\Jobtellect\Data\postings.csv",
    low_memory=False
)

print("==================================================")
print("DATA VALIDATION")
print("==================================================")

print("\nTotal Rows:", len(df))
print("Unique Job IDs:", df["job_id"].nunique())
print("Duplicate Job IDs:", df["job_id"].duplicated().sum())

print("\nMissing Values:")
print(df.isnull().sum().sort_values(ascending=False).head(10))