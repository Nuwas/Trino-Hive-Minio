CREATE SCHEMA IF NOT EXISTS minio.sales
WITH (location = 's3a://sales/');


CREATE TABLE IF NOT EXISTS minio.sales.sales_parquet (
  productcategoryname VARCHAR, 
  productsubcategoryname VARCHAR, 
  productname VARCHAR, 
  country VARCHAR, 
  salesamount DOUBLE, 
  orderdate timestamp
)
WITH (
  external_location = 's3a://sales/',
  format = 'PARQUET'
);

SELECT productcategoryname, sum(salesamount) as sales 
FROM minio.sales.sales_parquet 
where productsubcategoryname = 'Road Bikes' 
group by productcategoryname;