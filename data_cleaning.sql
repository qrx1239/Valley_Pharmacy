SELECT *
FROM pharmacy_sales
LIMIT 200;

-----
-- Checking for NULL or blank values in plan_name
SELECT *
FROM pharmacy_sales
WHERE plan_name IS NULL OR plan_name = '';

-----
-- Will add "Cash" if the insurance_type was Cash
UPDATE pharmacy_sales
SET plan_name = 'Cash'
WHERE insurance_type = 'Cash';

UPDATE pharmacy_sales
SET plan_name = 'Medicare'
WHERE insurance_type = 'Medicare';

UPDATE pharmacy_sales
SET plan_name = 'Commercial'
WHERE insurance_type = 'Commercial';

-------
-- Checking for Null in other columns
SELECT *
FROM pharmacy_sales
WHERE patient_age IS NULL OR patient_age = '';

SELECT *
FROM pharmacy_sales
WHERE patient_id IS NULL OR patient_id = '';

SELECT *
FROM pharmacy_sales
WHERE gender IS NULL OR gender = '';

SELECT *
FROM pharmacy_sales
WHERE drug_class IS NULL OR drug_class = '';

SELECT *
FROM pharmacy_sales
WHERE qty IS NULL OR qty = '';

SELECT *
FROM pharmacy_sales
WHERE days_supply IS NULL OR days_supply = '';

SELECT *
FROM pharmacy_sales
WHERE copay IS NULL OR copay = '';

SELECT *
FROM pharmacy_sales
WHERE ingredient_cost IS NULL OR ingredient_cost = '';

SELECT *
FROM pharmacy_sales
WHERE pharmacy_cost IS NULL OR pharmacy_cost= '';

SELECT *
FROM pharmacy_sales
WHERE total_paid IS NULL OR total_paid = '';

SELECT *
FROM pharmacy_sales
WHERE pharmacist IS NULL OR pharmacist = '';

SELECT *
FROM pharmacy_sales
WHERE store_id IS NULL OR store_id = '';

SELECT *
FROM pharmacy_sales
WHERE state IS NULL OR state = '';

-----------------
-- Making drug name all UPPER CASE
UPDATE pharmacy_sales
SET drug_name = UPPER(drug_name);

-- Distinct count of drug_name
SELECT drug_name,
	COUNT(*) AS DRUGS
FROM pharmacy_sales
GROUP BY drug_name
ORDER BY drug_name;

-- Getting rid of hidden spaces
UPDATE pharmacy_sales
SET drug_name = TRIM(drug_name);

-- Distinct count of drug_class
SELECT drug_class,
	COUNT(*) AS Class
FROM pharmacy_sales
GROUP BY drug_class
ORDER BY drug_class;

-- Renaming GLP1 to GLP-1
UPDATE pharmacy_sales
SET drug_class = 'GLP-1'
WHERE drug_class = 'GLP1';

-- Distinct count of insurance_type
SELECT insurance_type,
	COUNT(*) AS insurance
FROM pharmacy_sales
GROUP BY insurance_type
ORDER BY insurance_type;

-- Distinct count of plan_name
SELECT plan_name,
	COUNT(*) AS plan
FROM pharmacy_sales
GROUP BY plan_name
ORDER BY plan_name;

-- Distinct count of pharmacist
SELECT pharmacist,
	COUNT(*) AS pharmacist
FROM pharmacy_sales
GROUP BY pharmacist
ORDER BY pharmacist;

-- Distinct count of store_id
SELECT store_id,
	COUNT(*) AS store
FROM pharmacy_sales
GROUP BY store_id
ORDER BY store_id;

-- Distinct count of state
SELECT state,
	COUNT(*) AS state
FROM pharmacy_sales
GROUP BY state
ORDER BY state;

-- Distinct count of gender
SELECT gender,
	COUNT(*) AS gender
FROM pharmacy_sales
GROUP BY gender
ORDER BY gender;

------------------------
-- Inspect date formatting
SELECT fill_date
FROM pharmacy_sales
LIMIT 50;

-- Create table for new dates
ALTER TABLE pharmacy_sales
ADD fill_date_updated DATE;

-- Finding hidden spaces in date
SELECT fill_date,
	LENGTH(fill_date) AS Length,
    CONCAT('|', fill_date, '|') AS seen_value
FROM pharmacy_sales;

-- Convert to standard date
UPDATE pharmacy_sales
SET fill_date_updated = STR_TO_DATE(fill_date, '%Y-%m-%d')
WHERE fill_date LIKE '____-__-__';

UPDATE pharmacy_sales
SET fill_date_updated = STR_TO_DATE(fill_date, '%Y/%m/%d')
WHERE fill_date LIKE '____/__/__';

UPDATE pharmacy_sales
SET fill_date_updated = STR_TO_DATE(fill_date, '%m/%d/%Y')
WHERE fill_date LIKE '__/__/__';

-- Check to see if I have any dates that did not convert
SELECT *
FROM pharmacy_sales
WHERE fill_date_updated IS NULL;

-- Drop the old date column
ALTER TABLE pharmacy_sales
DROP COLUMN fill_date;

----------------

-- Fix trailing spaces
UPDATE pharmacy_sales
SET drug_name = TRIM(drug_name);

UPDATE pharmacy_sales
SET plan_name = TRIM(plan_name);

UPDATE pharmacy_sales
SET drug_class = TRIM(drug_class);

UPDATE pharmacy_sales
SET insurance_type = TRIM(insurance_type);


-- My copay, ingredient_cost, pharmacy_cost, and total_paid are "Double". Will convert to decimal

ALTER TABLE pharmacy_sales
MODIFY copay DECIMAL(10,2);

ALTER TABLE pharmacy_sales
MODIFY ingredient_cost DECIMAL(10,2);

ALTER TABLE pharmacy_sales
MODIFY pharmacy_cost DECIMAL(10,2);

SELECT *
FROM pharmacy_sales;

ALTER TABLE pharmacy_sales
MODIFY total_paid DECIMAL(10,2);













-- Top Drugs

SELECT drug_name,
		Count(*) as Prescriptions
FROM pharmacy_sales
GROUP BY drug_name
ORDER BY Prescriptions DESC;
















