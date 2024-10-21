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

## Create a test user 

create user u_test with password 'u_test';
grant connect on database postgres to u_test;

grant all on schema public to u_test;

## Execute a DDL command with test user 

create table t_test (col1 text);

## View Audit Results with privileged user 

```
select *  from audit.t_ddl_audit_logs  where ssession_user='u_test';

Name          |Value                          |
--------------+-------------------------------+
ttimestamp    |2024-10-21 15:22:13.789        |
tg_tag        |CREATE TABLE                   |
tg_event      |ddl_command_end                |
ccurrent_user |audit                          |
ssession_user |u_test                         |
schema_name   |public                         |
object_type   |table                          |
object_name   |public.t_test                  |
object_oid    |18267                          |
ccurrent_query|create table t_test (col1 text)|
```




