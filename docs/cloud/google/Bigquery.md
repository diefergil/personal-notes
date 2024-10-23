---
tags:
  - GCP
  - BigQuery
  - DataBase
---

## Python

### Read table

```python
from google.cloud import bigquery

def extract_table(db_name, table, project, location):

	client = bigquery.Client(project=project, location=location)
	query = f"SELECT * FROM `{db_name}.{table}`"
	table = client.query_and_wait(query).to_dataframe()
	
	return table
```
