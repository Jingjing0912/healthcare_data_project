--- 1. Create database
CREATE DATABASE HealthcareAnalytics;
GO

USE HealthcareAnalytics;
GO

--- 2. Create tabels
CREATE TABLE staging_cihi_wait_times(
Place_organization VARCHAR(MAX), 
Province_territory VARCHAR(MAX), 
Region VARCHAR(MAX), 
Reporting_level VARCHAR(MAX), 
Indicator VARCHAR(MAX), 
Measure_type VARCHAR(MAX), 
Indicator_segment VARCHAR(MAX), 
Segment_value VARCHAR(MAX), 
Time_scale VARCHAR(MAX), 
Time_frame VARCHAR(MAX), 
Metric VARCHAR(MAX), 
Main_metric VARCHAR(MAX), 
Metric_value VARCHAR(MAX), 
Unit_of_measure VARCHAR(MAX), 
Confidence_interval_lower_limit VARCHAR(MAX), 
Confidence_interval_upper_limit VARCHAR(MAX), 
Refresh_date VARCHAR(MAX));
Go

--- 3. Load data to sql
BULK INSERT staging_cihi_wait_times FROM '/var/opt/mssql/data/cihi_ed_data.csv' WITH (
    FORMAT = 'csv', 
    FIRSTROW = 2, 
    FIELDTERMINATOR = ',', 
    ROWTERMINATOR = '\n',
    TABLOCK
    );

