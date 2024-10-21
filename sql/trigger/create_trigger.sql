CREATE EVENT TRIGGER trg_audit_ddl_event on ddl_command_end EXECUTE FUNCTION audit.f_audit_ddl_event_trg();
CREATE EVENT TRIGGER trg_audit_ddl_drop_event on sql_drop EXECUTE FUNCTION audit.f_audit_ddl_drop_event_trg();

select * from pg_event_trigger;

ALTER EVENT TRIGGER trg_audit_ddl_event enable;
ALTER EVENT TRIGGER trg_audit_ddl_drop_event enable;

ALTER EVENT TRIGGER trg_audit_ddl_event disable;
ALTER EVENT TRIGGER trg_audit_ddl_drop_event disable;
