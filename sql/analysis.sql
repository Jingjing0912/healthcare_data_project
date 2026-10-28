SELECT TOP 30 * FROM staging_cihi_wait_times;

USE HealthcareAnalytics;
GO

DROP VIEW IF EXISTS vw_bc_ed_wait_times;
GO

CREATE VIEW vw_bc_ed_wait_times AS
SELECT
    Place_or_organization AS Hospital_Name,
    Region AS Health_Authority,
    Indicator,
    Time_frame,
     -- Safely convert text to numbers for Power BI math
    TRY_CAST(Metric_value AS FLOAT) AS Wait_Time_Value,
    Unit_of_measure
    FROM 
        staging_cihi_wait_times
    WHERE 
        Metric_value IS NOT NULL 
        AND Metric_value != ''
        -- Focus entirely on the BC healthcare market
        AND Province_territory = 'B.C.' 
        AND Reporting_level IN ('Facility', 'Region');
GO