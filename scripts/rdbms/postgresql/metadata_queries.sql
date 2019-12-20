-- Find tables referencing table of interest
select *
  from information_schema.table_constraints tc
 where (tc.constraint_catalog, tc.constraint_schema, tc.constraint_name)
   in (
select rc.constraint_catalog, rc.constraint_schema, rc.constraint_name
  from information_schema.referential_constraints rc
 where (rc.unique_constraint_catalog, rc.unique_constraint_schema, rc.unique_constraint_name) in (
 select tc.constraint_catalog, tc.constraint_schema, tc.constraint_name 
   from information_schema.table_constraints tc
  where tc.constraint_type in ('PRIMARY KEY', 'UNIQUE') 
    and tc.table_name = '<TABLE NAME>'
 ));
