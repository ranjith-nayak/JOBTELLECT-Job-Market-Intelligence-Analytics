import subprocess
import sys

print("===================================")
print("JOBTELLECT ETL PIPELINE STARTED")
print("===================================")

print("\nStep 1: Validating Data...")
subprocess.run([sys.executable, "validate_data.py"])

print("\nStep 2: Loading Jobs...")
subprocess.run([sys.executable, "load_jobs.py"])

print("\nStep 3: Loading Job Skills...")
subprocess.run([sys.executable, "load_job_skills.py"])

print("\n===================================")
print("ETL PIPELINE COMPLETED SUCCESSFULLY")
print("===================================")