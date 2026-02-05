--
-- Copyright (c) 1988, 2005, Oracle.  All Rights Reserved.
--
-- NAME
--   glogin.sql
--
-- DESCRIPTION
--   SQL*Plus global login "site profile" file
--
--   Add any SQL*Plus commands here that are to be executed when a
--   user starts SQL*Plus, or uses the SQL*Plus CONNECT command.
--
-- USAGE
--   This script is automatically run
--
column NAME_COL_PLUS_SHOW_PARAM format a40 wrap
column VALUE_COL_PLUS_SHOW_PARAM format a80 wrap
set lines 200 echo on trimsp on tab off pages 10000 serverout on size 1000000 feedback off verify off echo off arraysize 5000
define _pr="SQL> "
column pr new_value _pr
column name for a30
column path for a50
column owner for a20
column table_name for a30
column index_name for a30
select UPPER(substr(sys_context('USERENV','SERVER_HOST'),1,15))||':&_USER@'||SYS_CONTEXT('USERENV','CON_NAME')||':'||SYS_CONTEXT('USERENV','DATABASE_ROLE')||'> '
pr from dual;
set sqlprompt "&_pr"
column pr clear
alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';
set termout on
[oracle@vm-dfx-stg-eastus-aef-oracle-01 admin]$