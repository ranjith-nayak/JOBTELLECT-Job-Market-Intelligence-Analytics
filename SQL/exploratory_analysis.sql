CREATE DATABASE jobtellect;
use jobtellect;

CREATE TABLE companies (
    company_name VARCHAR(255) PRIMARY KEY,
    description TEXT,
    company_state VARCHAR(100),
    country VARCHAR(100),
    city VARCHAR(100),
    zip_code VARCHAR(20),
    address TEXT,
    url VARCHAR(500)
);

CREATE TABLE jobs (
    job_id BIGINT PRIMARY KEY,
    company_name VARCHAR(255),
    description TEXT,
    location VARCHAR(255),
    min_salary DECIMAL(12,2),
    med_salary DECIMAL(12,2),
    max_salary DECIMAL(12,2),
    currency VARCHAR(20),
    pay_period VARCHAR(50),
    formatted_work_type VARCHAR(100),
    work_type VARCHAR(100),
    applies INT,
    remote_allowed BOOLEAN,
    listed_time DATETIME,
    posting_domain VARCHAR(255),
    sponsored BOOLEAN,
    formatted_experience_level VARCHAR(100),

    FOREIGN KEY (company_name)
    REFERENCES companies(company_name)
);

CREATE TABLE skills (
    skill_abr VARCHAR(50) PRIMARY KEY,
    skill_name VARCHAR(255)
);

CREATE TABLE job_skills (
    job_id BIGINT,
    skill_abr VARCHAR(50),

    PRIMARY KEY (job_id, skill_abr),

    FOREIGN KEY (job_id)
    REFERENCES jobs(job_id),

    FOREIGN KEY (skill_abr)
    REFERENCES skills(skill_abr)
);

SELECT COUNT(*) FROM skills;

DROP TABLE job_skills;
DROP TABLE jobs;

CREATE TABLE jobs (
    job_id BIGINT PRIMARY KEY,
    company_name VARCHAR(255),
    title VARCHAR(500),
    description LONGTEXT,
    location VARCHAR(255),

    min_salary FLOAT,
    med_salary FLOAT,
    max_salary FLOAT,

    currency VARCHAR(20),
    pay_period VARCHAR(50),

    formatted_work_type VARCHAR(100),

    applies FLOAT,
    remote_allowed FLOAT,

    listed_time DOUBLE,

    posting_domain VARCHAR(255),

    sponsored INT,

    formatted_experience_level VARCHAR(255)
);

SELECT USER();
SHOW DATABASES;

SELECT CURRENT_USER();
ALTER USER 'root'@'localhost'
IDENTIFIED BY 'Ranjith@123';
FLUSH PRIVILEGES;

SELECT COUNT(*) FROM jobs;

SELECT *
FROM jobs
LIMIT 10;
SELECT COUNT(DISTINCT company_name)
FROM jobs;
SELECT COUNT(*)
FROM jobs
WHERE min_salary IS NOT NULL;
SELECT COUNT(*) FROM jobs;

TRUNCATE TABLE jobs;

SELECT COUNT(*) FROM jobs;
SELECT job_id
FROM jobs
LIMIT 10;

SELECT COUNT(DISTINCT job_id)
FROM jobs;
SELECT COUNT(*)
FROM jobs;

SELECT
    formatted_work_type,
    COUNT(*) AS total_jobs
FROM jobs
GROUP BY formatted_work_type
ORDER BY total_jobs DESC;

SELECT
    location,
    COUNT(*) AS total_jobs
FROM jobs
GROUP BY location
ORDER BY total_jobs DESC
LIMIT 10;

SELECT
    formatted_work_type,
    COUNT(*) AS total_jobs
FROM jobs
GROUP BY formatted_work_type
ORDER BY total_jobs DESC;

SELECT
    formatted_experience_level,
    COUNT(*) AS total_jobs
FROM jobs
WHERE formatted_experience_level IS NOT NULL
GROUP BY formatted_experience_level
ORDER BY total_jobs DESC;

SELECT
    location,
    COUNT(*) AS total_jobs
FROM jobs
GROUP BY location
ORDER BY total_jobs DESC
LIMIT 15;

SELECT
    company_name,
    COUNT(*) AS total_jobs
FROM jobs
WHERE company_name IS NOT NULL
GROUP BY company_name
ORDER BY total_jobs DESC
LIMIT 20;

SELECT
    formatted_experience_level,
    COUNT(*) AS total_jobs
FROM jobs
WHERE formatted_experience_level IS NOT NULL
GROUP BY formatted_experience_level
ORDER BY total_jobs DESC;

SELECT
    company_name,
    AVG(max_salary) AS avg_salary
FROM jobs
WHERE max_salary IS NOT NULL
AND company_name IS NOT NULL
GROUP BY company_name
HAVING COUNT(*) >= 10
ORDER BY avg_salary DESC
LIMIT 20;

SELECT
    location,
    AVG(max_salary) AS avg_salary,
    COUNT(*) AS jobs_count
FROM jobs
WHERE max_salary IS NOT NULL
GROUP BY location
HAVING COUNT(*) >= 20
ORDER BY avg_salary DESC
LIMIT 20;

SELECT * FROM skills LIMIT 10;

CREATE TABLE job_skills (
    job_id BIGINT,
    skill_abr VARCHAR(20)
);

SELECT
    s.skill_name,
    COUNT(*) AS demand
FROM job_skills js
JOIN skills s
    ON js.skill_abr = s.skill_abr
GROUP BY s.skill_name
ORDER BY demand DESC;

SELECT
    s.skill_name,
    COUNT(*) AS demand
FROM job_skills js
JOIN skills s
    ON js.skill_abr = s.skill_abr
JOIN jobs j
    ON js.job_id = j.job_id
WHERE j.formatted_experience_level = 'Entry level'
GROUP BY s.skill_name
ORDER BY demand DESC
LIMIT 15;

SELECT
    s.skill_name,
    COUNT(*) AS demand
FROM job_skills js
JOIN skills s
    ON js.skill_abr = s.skill_abr
JOIN jobs j
    ON js.job_id = j.job_id
WHERE j.max_salary IS NOT NULL
GROUP BY s.skill_name
ORDER BY AVG(j.max_salary) DESC
LIMIT 15;

SELECT
    s.skill_name,
    COUNT(*) AS demand
FROM job_skills js
JOIN skills s
    ON js.skill_abr = s.skill_abr
JOIN jobs j
    ON js.job_id = j.job_id
WHERE j.location = 'New York, NY'
GROUP BY s.skill_name
ORDER BY demand DESC
LIMIT 15;

SELECT
    s.skill_name,
    AVG(j.max_salary) AS avg_salary,
    COUNT(*) AS demand
FROM job_skills js
JOIN skills s
    ON js.skill_abr = s.skill_abr
JOIN jobs j
    ON js.job_id = j.job_id
WHERE j.max_salary IS NOT NULL
GROUP BY s.skill_name
HAVING COUNT(*) >= 100
ORDER BY avg_salary DESC;

SELECT
    s.skill_name,
    COUNT(*) AS demand
FROM job_skills js
JOIN skills s
    ON js.skill_abr = s.skill_abr
JOIN jobs j
    ON js.job_id = j.job_id
WHERE j.max_salary >= 150000
GROUP BY s.skill_name
ORDER BY demand DESC
LIMIT 15;

SELECT
    formatted_experience_level,
    AVG(max_salary) AS avg_salary,
    COUNT(*) AS jobs_count
FROM jobs
WHERE max_salary IS NOT NULL
AND formatted_experience_level IS NOT NULL
GROUP BY formatted_experience_level
ORDER BY avg_salary DESC;