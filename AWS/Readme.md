                  ┌───────────────┐
                  │ Financial CSV │
                  └───────┬───────┘
                          ↓
                    Amazon S3
                      /raw
                          ↓
                 Data Profiling
                          ↓
                    AWS Glue ETL
                          ↓
                Date + Data Types
                          ↓
                    Amazon S3
                   /processed
                 Parquet + Snappy
                          ↓
                Glue Data Catalog
                          ↓
                    Athena SQL
                      ↙      ↘
             Power BI       SageMaker
             Dashboard      Python EDA
