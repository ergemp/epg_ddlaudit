create table audit.t_ddl_audit_logs
(
  ttimestamp timestamp default current_timestamp,
  tg_tag text,
  tg_event text,
  ccurrent_user text,
  ssession_user text,    
  schema_name text,
  object_type text,
  object_name text,
  object_oid text,
  ccurrent_query text
);
