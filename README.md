# Energy Access & Reliability Analytics Pipeline


## Problem
Solar power plants generate large volumes of sensor data (DC/AC power output, 
daily and cumulative yield) that often goes unmonitored for performance 
degradation, inverter faults, or generation shortfalls. Without systematic 
analysis, operators struggle to identify underperforming inverters or plants 
in time to act.

This project builds an end-to-end pipeline that ingests solar plant 
generation data, cleans and structures it, and surfaces performance and 
reliability gaps across plants/inverters through an interactive dashboard — 
mirroring the kind of operational efficiency analysis used in infrastructure 
and asset performance monitoring.

## Tech Stack
Python | SQL (PostgreSQL) | Power BI

## Architecture
[diagram image goes here once built]

## Data Source
[Solar Power Generation Data](https://www.kaggle.com/datasets/pythonafroz/solar-power) — 
DC/AC power output and yield data from solar plant inverters.


## Key Features
- ETL pipeline: extraction, cleaning, and normalization of raw inverter-level sensor data
- SQL layer: joins across plant/inverter tables, window functions for yield trends, CTEs for ranking underperforming inverters
- BI dashboard: DC/AC power output and daily yield trends by plant and inverter
- Flags inverters with abnormal or declining generation for maintenance review


## Results
- Processed and cleaned 68,778 sensor records from 22 inverters across a single solar plant
- Average DC power output: 3,147.43 kW; average AC power output: 307.8 kW
- Average daily yield across all inverters: 3,295.97 units
- Identified a 7.6% performance gap between the best- and worst-performing 
  inverters (VHMLBKoKgIrUVDU at 3,407.26 avg yield vs. bvBOhCH3iADSZry at 
  3,146.86 avg yield), flagging a candidate for maintenance review

## Setup
1. Clone this repo
2. Open Google Colab (colab.research.google.com) and create a new notebook
3. Upload the raw data file (`data/Plant_1_Generation_Data.csv`) using:
```python
   from google.colab import files
   uploaded = files.upload()
```
4. Run the ETL script (`etl/clean_data.py`) to clean and process the data
5. Run the SQL queries in `sql/queries.sql` against the loaded data
6. Open `dashboard/dashboard.pbix` in Power BI Desktop to view visualizations
