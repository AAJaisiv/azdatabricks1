# Data Quality Validation with Great Expectations

This directory contains a sample script for validating sales data using [Great Expectations](https://greatexpectations.io/).

## Script
- `great_expectations_sample.py`: Validates a sales CSV file for:
  - Non-null Order IDs
  - Positive Sales Amounts
  - Valid date format for OrderDate
- Generates an HTML validation report.

## Usage
1. Install dependencies:
   ```sh
   pip install -r requirements.txt
   ```
2. Run the script:
   ```sh
   python great_expectations_sample.py
   ```
3. View the generated `sales_data_validation_report.html` for results.

## Customization
- Edit the script to add more expectations or point to different data files as needed. 