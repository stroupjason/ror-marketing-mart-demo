# 15-Minute Demo Walkthrough

## Story to tell

This project mirrors the shape of ROR's role:

- raw marketing data enters as source tables
- staging models clean and standardize the raw data
- leads are deduped with a CTE + `row_number()` window function
- dimensions provide descriptive context
- a fact table aligns metrics at one reporting grain
- a final mart exposes business KPIs
- tests validate basic data quality and relationships

## Interview walkthrough

### 1. Business problem
"I modeled a small location marketing mart to answer how campaign spend is performing by location and channel, and which locations are converting most efficiently."

### 2. Grain
"The fact table is one row per date + campaign + location. Defining the grain first kept the model clean and made the KPI logic reliable."

### 3. Staging
"I used staging models to standardize column names and types and dedupe leads early so the downstream models inherit cleaner records."

### 4. Dedupe logic
"In `stg_marketing__leads`, I used a CTE and `row_number()` partitioned by `lead_id` and ordered by the most recent timestamp so the dedupe logic is deterministic instead of relying on `distinct`."

### 5. Dimensional modeling
"I split descriptive data into `dim_campaign` and `dim_location`, and kept business events in `fct_daily_campaign_location`."

### 6. Tests
"I added tests for uniqueness, not-null, accepted values, referential integrity, and a custom singular test for negative spend."

### 7. How it maps to dbt concepts
- `source()` = raw tables
- `ref()` = dependencies between models
- tests = assertions about output quality
- materializations = whether a model is a view, table, or incremental object

## Resume bridge line

"My production experience has been more around SQL, ELT-style validation, data integration, and cloud data workflows. I built this project in a dbt style because the concepts map directly to the work ROR described: clean sources, layered transformations, quality checks, and business-facing data models."
