import jinja2

def generate_query(query_template, template_params):
    t = jinja2.Template(query_template)
    return t.render(params=template_params)

if __name__ == '__main__':
    params = {
                'columns': ['ga360_property_id', 'clicks', 'visits'], 
                'project_id': 'bayer-ch-global-dev',
                'dataset_id': 'digital_kpi',
                'table_id': 'cdh_fact'}
    with open('c:/repo/tools/scripts/cloud/gcp/bigquery/sql_generation/select_template.jinja', 'r') as f:
        print(generate_query(f.read(), params))

