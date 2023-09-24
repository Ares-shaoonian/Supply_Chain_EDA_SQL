-- Quick check
SELECT 
    *
FROM
    supply_chain_data;


                                                              -- Cost Analysis
   
     -- What are the most costly products to produce?
     
-- Most expensive products in cost 
SELECT 
    SKU, `Manufacturing costs` + `Shipping costs` AS Cost
FROM
    supply_chain_data
ORDER BY Cost DESC
LIMIT 10;

-- Most expensive product types in cost
SELECT 
    `Product type`,
    SUM(`Manufacturing costs` + `Shipping costs`) AS cost
FROM
    supply_chain_data
GROUP BY `Product type`
ORDER BY cost DESC;


             -- How do manufacturing costs relate to selling prices?
             
SELECT 
    `Product type`,
    SKU,
    ROUND(`Manufacturing costs`, 3) AS Cost,
    ROUND(price, 2) AS Price,
    ROUND(Price - `Manufacturing costs`, 2) AS Profit,
    ROUND(((Price - `Manufacturing costs`) / Price) * 100,
            2) AS Profit_Margin
FROM
    supply_chain_data
ORDER BY Profit_Margin DESC;


             -- What is the overall profitability (revenue - costs) for each product?

SELECT 
    `Product type`,
    SKU,
    ROUND(`Manufacturing costs`, 3) AS Cost,
    ROUND(price, 2) AS Price,
    ROUND(Price - `Manufacturing costs`, 2) AS Profit,
    ROUND(((Price - `Manufacturing costs`) / Price) * 100,
            2) AS Profit_Margin
FROM
    supply_chain_data
ORDER BY Profit DESC;

                                                              -- Supply Chain Analysis
                                                              
															
SELECT 
    ROUND(AVG(`Lead time`), 2) AS Average_lead_time
FROM
    supply_chain_data;

-- How does lead time affect stock levels and availability?
SELECT 
    `Lead time`, `Stock levels`, `Availability`
FROM
    supply_chain_data;

SELECT 
    `Lead time`,
    ROUND(AVG(`Stock levels`), 2) AS Average_stock_levels
FROM
    supply_chain_data
GROUP BY `Lead time`
ORDER BY `Lead time`;

SELECT 
    `Lead time`,
    ROUND(AVG(`Availability`), 2) AS Average_Availability
FROM
    supply_chain_data
GROUP BY `Lead time`
ORDER BY `Lead time`;

-- Are there correlations between defect rates and inspection results?

SELECT 
    `Inspection results`,
    ROUND(AVG(`Defect rates`), 2) Average_defect_rate
FROM
    supply_chain_data
GROUP BY `Inspection results`
ORDER BY `Inspection results`;

                                                              -- Logistics Analysis

SELECT 
    COUNT(*) AS Total,
    SUM(CASE
        WHEN `Transportation modes` = 'Road' THEN 1
    END) AS Road,
    SUM(CASE
        WHEN `Transportation modes` = 'Air' THEN 1
    END) AS Air,
    SUM(CASE
        WHEN `Transportation modes` = 'Rail' THEN 1
    END) AS Rail,
    SUM(CASE
        WHEN `Transportation modes` = 'sea' THEN 1
    END) AS Sea
FROM
    supply_chain_data;

-- How do different transportation modes affect lead times and costs?

SELECT 
    `Transportation modes`,
    ROUND(AVG(`Lead time`), 2) AS Avg_Lead_Time,
    ROUND(AVG(`Shipping costs`), 2) AS Avg_Transportation_Cost
FROM
    supply_chain_data
GROUP BY `Transportation modes`
ORDER BY Avg_Lead_Time , Avg_Transportation_Cost;
    
-- Which routes are most commonly used, and what is their impact on costs and lead times?

SELECT 
    Routes,
    ROUND(AVG(`Lead time`), 2) AS Avg_Lead_Time,
    ROUND(AVG(`Shipping costs`), 2) AS Avg_Transportation_Cost
FROM
    supply_chain_data
GROUP BY Routes
ORDER BY Avg_Lead_Time , Avg_Transportation_Cost;
    
                                                              -- Quality Analysis

    
SELECT 
    `Product type`,
    ROUND(AVG(`Defect rates`), 2) AS Avg_Defect_rate
FROM
    supply_chain_data
GROUP BY `Product type`;

-- How do defect rates correlate with inspection results and manufacturing costs?

SELECT 
    `Inspection results`,
    ROUND(AVG(`Defect rates`), 2) Average_defect_rate,
    ROUND(AVG(`Manufacturing costs`), 2) AS _Avg_Manufacturing_Cost
FROM
    supply_chain_data
GROUP BY `Inspection results`
ORDER BY `Inspection results`;


                                                              -- Production Analysis
                                                              
                                                              
SELECT 
    `Production volumes`,
    `Stock levels`,
    `Number of products sold`
FROM
    supply_chain_data;


SELECT 
    AVG(`Production volumes`) AS AVG_pv,
    AVG(`Stock levels`) AS AVG_SL,
    AVG(`Number of products sold`) AS AVG_sold
FROM
    supply_chain_data;

-- Are production volumes aligned with market demand?
SELECT 
    AVG(`Production volumes`) AS AVG_pv,
    AVG(`Number of products sold`) AS AVG_sold
FROM
    supply_chain_data;




