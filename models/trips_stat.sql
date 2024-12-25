SELECT
    count(*) AS trips,
    count(distinct user_id) AS users,
    avg(extract(epoch from (finished_at - started_at))) / 60 AS avg_duration_m,
    sum(price) / 100 AS revenue_rub,
    count(price = 0 or null) / cast(count(*) AS real) * 100 AS free_trips_pct
FROM
    scooters_raw.trips