# Monitoring & Alerting

This directory contains Terraform scripts and documentation for monitoring the Azure Data Engineering Pipeline.

## Features
- Centralized logging with Log Analytics Workspace
- Diagnostic settings for Data Factory, Databricks, Synapse, and Storage
- Sample alert rules for pipeline failures, cost overruns, and data quality issues

## Usage
1. Deploy the Log Analytics workspace and diagnostic settings using Terraform.
2. Customize and deploy alert rules as needed (update action group IDs).
3. View logs and metrics in the Azure Portal under Log Analytics.

## Best Practices
- Set up action groups for email/SMS/Teams notifications.
- Regularly review and tune alert thresholds.
- Use Log Analytics queries for custom monitoring and dashboards. 