import argparse
import jinja2
import json
import os.path
import sys

TEMPLATES = {
                'select': 'select_template.jinja',
                'merge': 'merge_template.jinja'
            }

def init_parser():
    parser = argparse.ArgumentParser(description='Module for generating BigQuery queries')

    parser.add_argument('--query_type', action='store', dest='query_type')
    parser.add_argument('--raw_schema', action='store', dest='raw_schema')

    return parser

def load_raw_schema(raw_schema_path):
    with open(raw_schema_path, 'r') as f:
        schema = json.load(f)
    return schema

def load_template(template_path):
    with open(template_path, 'r') as f:
        return f.read()

def raw_schema_to_template_params(schema):
    params = {}
    params['project_id'] = schema['tableReference']['projectId']
    params['dataset_id'] = schema['tableReference']['datasetId']
    params['table_id'] = schema['tableReference']['tableId']
    params['columns'] = get_column_names(schema['schema'])
    params['indent'] = '    '
    return params

def get_column_names(schema):
    return [column['name'] for column in schema['fields']]

def get_template(query_type):
    if query_type not in TEMPLATES:
        raise ValueError(f'query_type {query_type} is not supported')
    return TEMPLATES[query_type]

def generate_query(query_template, template_params):
    t = jinja2.Template(query_template)
    return t.render(params=template_params)

def save_query(query, path, file_name):
    with open(os.path.join(path, file_name), 'w') as f:
        f.write(query)

if __name__ == '__main__':
    parser = init_parser()
    args = parser.parse_args(sys.argv[1:])
    schema = load_raw_schema(args.raw_schema)
    template = load_template(get_template(args.query_type))
    params = raw_schema_to_template_params(schema)
    query = generate_query(template, params)
    path = os.path.split(args.raw_schema)
    save_query(query, path[0], f"{params['dataset_id']}_{params['table_id']}_{args.query_type}.sql")

