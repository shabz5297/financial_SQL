USE finance;
SHOW TABLES;
/*show ticker, price_date and close_price for only tech companies*/
SELECT c.ticker, p.price_date, p.close_price
FROM companies c
JOIN prices_daily p
    ON c.company_id = p.company_id
WHERE c.sector='Technology'
ORDER BY c.ticker, p.price_date ASC;

/*Average close_price across all dates*/
SELECT c.ticker, AVG(p.close_price) AS avg_close_price
FROM companies c
JOIN prices_daily p
    ON c.company_id = p.company_id
WHERE c.sector = 'Technology'
GROUP BY c.ticker;

/*Min,max and average close price for only tech tickers*/
SELECT c.ticker,
       MIN(p.close_price) AS min_close_price,
       MAX(p.close_price) AS max_close_price,
       AVG(p.close_price) AS avg_close_price
FROM companies c
JOIN prices_daily p
    ON c.company_id = p.company_id
WHERE c.sector = 'Technology'
GROUP BY c.ticker;