Bank Customer Churn Analytics Platform

1.Overview

Built an end-to-end modern data platform to analyze and understand customer churn behavior using a production-grade data stack. The project ingests raw data, transforms it into analytics-ready models, tracks historical changes, and enables business insights through interactive dashboards.

2.Architecture

S3 → Airbyte → Snowflake (RAW) → dbt (STAGING → MART) → Snapshots (SCD Type 2) → Tableau Dashboard

3.Tech Stack :

Data Warehouse: Snowflake
Ingestion: Airbyte (S3 → Snowflake)
Transformation: dbt (modular models, tests, documentation)
Data Modeling: Kimball (1 Fact + 2 Dimensions)
History Tracking: dbt Snapshots (SCD Type 2)
Visualization: Tableau

4.Data Modeling:

Fact Table
f_customer_snapshot — customer-level churn outcomes at snapshot grain

Dimension Tables
c_customer_profile — demographics (age, gender, geography, salary)
c_customer_behavior — financial, product, and experience attributes

Designed a clean star schema for scalable analytics and BI consumption.

5.Key Features:

Built ELT pipeline from S3 to Snowflake using Airbyte
Developed clean staging layer with standardized schema and data quality checks
Implemented dbt tests (not null, unique, accepted values, ranges)
Created analytics-ready marts using Kimball dimensional modeling
Added SCD Type 2 snapshots to track historical changes in customer attributes
Enabled self-service analytics via Tableau dashboard
Business Use Case

6.The platform enables analysis of:

Customer churn rate and trends
Churn segmentation by geography, demographics, and behavior
Impact of complaints and satisfaction on churn
Product usage patterns and customer retention
Identification of high-value customers at risk
Key Insights (Example)
Customers with fewer products show higher churn rates
Complaints and low satisfaction strongly correlate with churn
Mid-tier customers exhibit higher churn risk compared to high-value segments

7.Outcome:

Delivered a production-style analytics solution that mirrors real-world data workflows, enabling data-driven decision-making and serving as a foundation for advanced use cases such as predictive modeling and AI-driven insights.
