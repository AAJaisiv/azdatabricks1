# Infrastructure as Code (IaC) for Azure Data Engineering Pipeline

This directory contains Terraform scripts to provision the core Azure resources required for the end-to-end e-commerce data engineering pipeline.

## Resources Deployed
- Azure Resource Group
- Azure Storage Account (Data Lake Gen2)
- Azure Databricks Workspace
- Azure Synapse Analytics Workspace
- Azure Data Factory

## Prerequisites
- [Terraform](https://www.terraform.io/downloads.html) installed
- Azure CLI installed and authenticated (`az login`)
- Sufficient permissions to create resources in your Azure subscription

## Usage
1. **Initialize Terraform**
   ```sh
   terraform init
   ```
2. **Review the Plan**
   ```sh
   terraform plan
   ```
3. **Apply the Configuration**
   ```sh
   terraform apply
   ```
   Confirm the action when prompted.

4. **Destroy Resources (Optional)**
   ```sh
   terraform destroy
   ```

## Customization
- Edit `variables.tf` to change resource names, region, or other parameters.
- Ensure the storage account name is globally unique.
- Update sensitive values (e.g., Synapse SQL admin password) before production use.

---

For more details, see the main project [README](../README.md). 