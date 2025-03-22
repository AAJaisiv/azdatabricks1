# End-to-End E-Commerce Data Engineering Pipeline on Azure

## Project Overview
#### This project demonstrates the design and implementation of a fully dynamic and scalable data pipeline using Microsoft Azure services. The goal was to ingest, transform, and analyze e-commerce sales data efficiently using cloud-native solutions. The entire data lifecycle—from raw ingestion to analytics-ready datasets—was orchestrated using a combination of Azure Data Factory, Azure Databricks, and Azure Synapse Analytics, with final visualizations set up for Power BI.

## Tech Stack
#### Azure Data Factory |  Azure Databricks |  Azure Synapse Analytics |  Azure Data Lake Storage |  Power BI

## Data Description
#### The dataset used in this project is a mock-up of e-commerce sales data
#### This dataset simulates real-world transactions and is used to replicate a business use case for building a modern data platform.

## Architecture
![image](https://github.com/user-attachments/assets/d70a8388-9628-4f1c-821f-7136b8b69fcb)

## Step-by-Step Implementation
#### Resource Deployment in Azure
#### Provisioned required services via Azure Resource Manager (ARM) templates:

#### Azure Synapse Analytics

#### Azure Data Factory

#### Azure Data Lake Storage

#### Validated the deployment via Azure Portal

#### Data Ingestion with Azure Data Factory
#### Created two separate dynamic pipelines (raw_data and raw_data_2) using the Lookup + ForEach + Copy Data pattern.

#### The Lookup activity dynamically fetches metadata or file names.

#### ForEach loops through the returned values and performs data copy using the Copy Data activity.

#### Source: HTTP endpoint simulating external raw data feed
#### Sink: Azure Data Lake (Bronze Layer)
#### Runtime: AutoResolveIntegrationRuntime

#### Data Transformation Using Azure Databricks
#### Launched Azure Databricks notebooks to perform cleaning, null-handling, type casting, and derived column generation.

#### Applied business logic such as:

##### Normalization of order quantities

##### Derivation of time-based features

#### Product category enrichments

#### Data Serving with Azure Synapse Analytics
#### Created external tables over Parquet files using CREATE EXTERNAL TABLE in Synapse SQL.

#### Utilized OPENROWSET for on-demand access to Parquet files stored in Azure Data Lake.

#### Final Output (Gold Layer)
#### The final  table exposed analytics-ready data for downstream use in Power BI. Key highlights include:

#### Clean schema for order, product, and customer data

#### Read-optimized Parquet format with SnappyCodec compression

#### Seamless integration with Power BI for visualization
