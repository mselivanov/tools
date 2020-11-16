# Solution for simplifying work with development GCP environment

## Constraints

Solution files has the following structure:

Repository root
+-- dags - folder contains DAG definitions
|   +-- configuration - folder contains configuration files
|   |   +-- <GCP project ID> - folder for GCP project-related configuration 
|   +-- schema - folder contains schema files
|   |   +-- <dag_name> - folder for all dag related table schemas
|   |   |   +-- <table_name>.json - BigQuery table schema
|   +-- sql - folder 
|   |   +-- <dag_name> - folder for all dag related sql files
|   +-- <dag_id>\_dag.py - DAG definition file 
+-- src - folder contains solution source code 
|   +-- main - folder contains source files
|   |   +-- python - folder contains python source files
|   |   |   +-- <project root package> - root folder for solution package
|   |   |   |   +-- pipelines - root folder for modules containing pipelines 
|   +-- test - folder contains tests 
|   |   +-- python - folder contains python tests 
|   |   |   +-- <project root package> - root folder for solution test package

## Use cases
1. Create tables
Overview: capability to create all the tables for a particular DAG (schemas are listed in the dags/schema/<dag_id> folder).

2. Drop tables
Overview: capability to drop all the tables for a particular DAG (schemas are listed in the dags/schema/<dag_id> folder).

3. Re-create tables
Overview: capability to drop/create all the tables for a particular DAG (schemas are listed in the dags/schema/<dag_id> folder).

4. Deploy DAG-related files to GCP
Overview: capability to copy all the DAG related files to GCP Google Cloud Storage:
    - dags/<dag_id>\_dag.py
    - dags/schema/<dag_id>/
    - dags/sql/<dag_id>
    - dags/configuration/<gcp_project_id>/<configuration file>
    - src/main/python/<project_root_package>/pipelines/<dag_id>\_pipeline.py

### 
