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


## Creating Triggers

# Testing

