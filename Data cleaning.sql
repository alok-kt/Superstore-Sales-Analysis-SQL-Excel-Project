
-- Selecting the Raw Data --
SELECT * FROM rawdata

-- Finding no.of rows --
SELECT COUNT(*) AS total_rows FROM rawdata;

-- Finding empty or null values --
SELECT * FROM rawdata
WHERE Order_ID IS NULL
	OR Customer_Name IS NULL
	OR Sales IS NULL;

-- Remove Leading / Trailing Spaces in Text Columns --
UPDATE rawdata
SET Customer_Name = LTRIM(RTRIM(Customer_Name)),
	Product_Name = LTRIM(RTRIM(Product_Name)),
	Category = LTRIM(RTRIM(Category)),
	Region = LTRIM(RTRIM(Region));

-- Checking & Fix Data Types --
SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'rawdata';

-- Checking & Remove Duplicate Rows --
SELECT Order_ID,Product_ID, COUNT(*) AS cnt
FROM rawdata
GROUP BY Order_ID, Product_ID
HAVING COUNT(*) > 1;

WITH cte AS (
	SELECT *,
		ROW_NUMBER() OVER (PARTITION BY Order_ID, Product_ID ORDER BY Order_Date) AS rn
	FROM rawdata
)
DELETE FROM cte WHERE rn > 1;

-- Standardizing Text Values --
UPDATE rawdata
SET Region = 'Central'
WHERE Region IN ('central', 'CENTRAL', 'Cntrl');

-- Creating final clean copy --
SELECT *
INTO cleandata
FROM rawdata;