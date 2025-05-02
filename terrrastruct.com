Diagram: https://app.terrastruct.com/diagrams/1842544055

Code to generate the diagram:

title: "School Reporting Architecture – Snowflake + S3"
direction: right

"Source Systems": {
  shape: rectangle
}

"ETL/ELT Pipeline": {
  label: "ETL/ELT Pipeline\n(Airflow, dbt, Fivetran)"
  shape: rectangle
}

"Storage": {
  label: "Storage\n(Snowflake & Amazon S3)"
  shape: rectangle
}

"Dimension/Fact Tables": {
  shape: rectangle
}

"BI Tools": {
  label: "BI Tools\n(Tableau, Looker, Power BI)"
  shape: rectangle
}

"Security": {
  label: "Security & Governance"
  shape: rectangle
}

"Source Systems" -> "ETL/ELT Pipeline"
"ETL/ELT Pipeline" -> "Storage"
"Storage" -> "Dimension/Fact Tables"
"Storage" -> "BI Tools"
"Security" -> "Storage"
"Security" -> "S3"
