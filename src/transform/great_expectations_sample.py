# To use this script, install dependencies with:
# pip install -r requirements.txt

try:
    import great_expectations as ge
    from great_expectations.dataset import PandasDataset
    import pandas as pd
except ImportError as e:
    print("Missing required packages. Please install with: pip install -r requirements.txt")
    raise e

# Load data (example: AdventureWorks_Sales_2017.csv)
df = pd.read_csv('../../dataset/AdventureWorks_Sales_2017.csv')
ge_df = ge.from_pandas(df)

# Define expectations
ge_df.expect_column_values_to_not_be_null('OrderID')
ge_df.expect_column_values_to_be_between('SalesAmount', min_value=0, max_value=None)
ge_df.expect_column_values_to_match_regex('OrderDate', r'^\d{4}-\d{2}-\d{2}')

# Run validation
results = ge_df.validate()

try:
    from great_expectations.render.renderer import ValidationResultsPageRenderer
    from great_expectations.render.view import DefaultJinjaPageView
except ImportError as e:
    print("Missing rendering dependencies. Please install with: pip install -r requirements.txt")
    raise e

renderer = ValidationResultsPageRenderer()
rendered_document_content = renderer.render(results)
html = DefaultJinjaPageView().render(rendered_document_content)

with open('sales_data_validation_report.html', 'w') as f:
    f.write(html)

print('Validation complete. Report saved to sales_data_validation_report.html') 