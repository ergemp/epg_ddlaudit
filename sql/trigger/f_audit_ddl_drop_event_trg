create or replace function audit.f_audit_ddl_drop_event_trg()
RETURNS EVENT_TRIGGER
SECURITY DEFINER
language plpgsql
AS
$$
declare 
    rec record;
begin
	if (tg_tag like 'DROP%') then	
      for rec in select * from pg_event_trigger_dropped_objects() loop 
	    if rec.object_identity is not null then
		  insert into audit.t_ddl_audit_logs  
		  (tg_tag, 
		   tg_event, 
		   ccurrent_user, 
		   ssession_user, 
		   schema_name, 
		   object_type, 
		   object_name, 
		   object_oid, 
		   ccurrent_query)
		  values
		  (tg_tag, 
		   tg_event, 
		   current_user, 
		   session_user, 
		   rec.schema_name, 
		   rec.object_type, 
		   rec.object_identity, 
		   rec.objid, 
		   current_query());
	    end if;
	  end loop;
    end if;
end;
$$;
