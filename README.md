# Description

epg_ddlaudit is a package to enable auditing ddl commands running within a postgressql database. This package is tested on postgresql version 15 and 16. 

# Installation

Installation is handled with the sql scripts underde /sql sub directory. 

## Creating Audit User

With the superuser of the database run the sql/pre/audit_user.sql

## Creating Database Objects

Login to the database with created user in the previous step. 

### Creating audit table

Execute the sql/pre/t_ddl_audit_logs.sql file to create the audit table. 

### Creating trigger functions

Execute the following scripts to create the functions for the event triggers. 

sql/function/f_audit_ddl_drop_event_trg.sql
sql/function/f_audit_ddl_event_trg.sql

## Creating Triggers

With the superuser of the database;

sql/trigger/create_trigger.sql

## Enable/Disable Event Triggers

```
-- identify current event triggers
select * from pg_event_trigger;

-- enabling event triggers
ALTER EVENT TRIGGER trg_audit_ddl_event enable;
ALTER EVENT TRIGGER trg_audit_ddl_drop_event enable;

-- disabling event triggers
ALTER EVENT TRIGGER trg_audit_ddl_event disable;
ALTER EVENT TRIGGER trg_audit_ddl_drop_event disable;
```

# Testing



