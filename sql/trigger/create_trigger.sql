CREATE EVENT TRIGGER trg_audit_ddl_event on ddl_command_end EXECUTE FUNCTION audit.f_audit_ddl_event_trg();
CREATE EVENT TRIGGER trg_audit_ddl_drop_event on sql_drop EXECUTE FUNCTION audit.f_audit_ddl_drop_event_trg();
