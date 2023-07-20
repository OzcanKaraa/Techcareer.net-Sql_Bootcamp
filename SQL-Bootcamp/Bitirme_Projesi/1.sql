CREATE EXTENSION IF NOT EXISTS aws_s3 CASCADE; ##Bu komut aws_s3 extension i yaratmak icin kullanilir.

 SELECT aws_s3.table_import_from_s3(
  'market_sales_master', '', '(FORMAT CSV, HEADER true)', 
  'sqlproje', 'test_market_utf_full.csv', 'eu-west-3');

 CREATE TABLE market_sales_master (
  ID SERIAL PRIMARY KEY,
  ITEMCODE VARCHAR(50),
  ITEMNAME VARCHAR(100),
  FICHENO VARCHAR(50),
  DATE_ DATE,
  AMOUNT NUMERIC,
  PRICE NUMERIC,
  LINENETTOTAL NUMERIC,
  LINENET NUMERIC,
  BRANCHNR VARCHAR(50),
  BRANCH VARCHAR(100),
  SALESMAN VARCHAR(100),
  CITY VARCHAR(100),
  REGION VARCHAR(100),
  LATITUDE NUMERIC,
  LONGITUDE NUMERIC,
  CLIENTCODE VARCHAR(50),
  CLIENTNAME VARCHAR(100),
  BRANDCODE VARCHAR(50),
  BRAND VARCHAR(100),
  CATEGORY_NAME1 VARCHAR(100),
  CATEGORY_NAME2 VARCHAR(100),
  CATEGORY_NAME3 VARCHAR(100),
  STARTDATE DATE,
  ENDDATE DATE,
  GENDER VARCHAR(10)
);



select * from market_sales_master 


CREATE table branch (
  ID SERIAL PRIMARY KEY,
  BRANCHNR VARCHAR(50),
  BRANCH VARCHAR(100),
  CITY VARCHAR(100),
  REGION VARCHAR(100),
  LATITUDE numeric,
   LONGITUDE NUMERIC
);



 CREATE TABLE item (
  ID SERIAL PRIMARY KEY,
  ITEMCODE VARCHAR(50),
  ITEMNAME VARCHAR(100),
  CATEGORY_NAME1 VARCHAR(100),
  CATEGORY_NAME2 VARCHAR(100),
  CATEGORY_NAME3 VARCHAR(100)
);


 CREATE TABLE brand (
  ID SERIAL PRIMARY KEY,
  BRANDCODE VARCHAR(50),
  BRAND VARCHAR(100)
);

 CREATE TABLE client (
  ID SERIAL PRIMARY KEY,
  CLIENTCODE VARCHAR(50),
  CLIENTNAME VARCHAR(100),
  GENDER VARCHAR(10)
);





