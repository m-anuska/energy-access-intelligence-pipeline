-- Query 1: Rank inverters by average daily yield (CTE + Window Function)
WITH inverter_avg AS (
    SELECT SOURCE_KEY, AVG(DAILY_YIELD) as avg_yield
    FROM generation
    GROUP BY SOURCE_KEY
)
SELECT SOURCE_KEY, avg_yield,
       RANK() OVER (ORDER BY avg_yield DESC) as performance_rank
FROM inverter_avg
ORDER BY performance_rank;

-- Query 2: Rolling average DC power per inverter (Window Function)
SELECT SOURCE_KEY, DATE_TIME, DC_POWER,
       AVG(DC_POWER) OVER (PARTITION BY SOURCE_KEY ORDER BY DATE_TIME 
                            ROWS BETWEEN 5 PRECEDING AND CURRENT ROW) as rolling_avg_dc
FROM generation;
