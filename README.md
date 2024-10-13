docker ps
docker compose up -d
docker logs -f trino-hive-minio-hive-metastore-1
docker exec -it trino-hive-minio-trino-1 trino

CLI -> show catalogs;

Output 

trino> show catalogs;
 Catalog 
---------
 minio   
 system  
 tpcds   
 tpch    
(4 rows)

Query 20241013_124819_00000_my9t5, FINISHED, 1 node
Splits: 19 total, 19 done (100.00%)
0.86 [0 rows, 0B] [0 rows/s, 0B/s]

trino> 



Go to browser and hit the url : http://localhost:9001/

Use below credentials

minio_access_key
minio_secret_key

1) Create bucket 'sales'
2) Upload parquet --> 'sales_summary_updated.parquet'



Go back to trino CLI and execute the sql -> 'sample_query.sql'


Once done shutdown the docker
docker compose down --remove-orphans


Debugging.

Incase if there is a hive connection issue then restart the docker compose and make sure the maria-db table data is populated properly.

Please connect to maria-db run the below query, we should see Hive details.
Post creation of SCHEMA we should see the entry for minio schema

SELECT DB_ID, `DESC`, DB_LOCATION_URI, NAME, OWNER_NAME, OWNER_TYPE, CTLG_NAME FROM metastore_db.DBS;

I used DBeaver tool to connect to Maria-DB and Trino. 


![WhatsApp Image 2024-10-13 at 6 47 07 PM](https://github.com/user-attachments/assets/00eb4a46-99c7-433f-b532-e0583d2c1492)


Good luck.
