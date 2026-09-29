-- Shared local, preview and integration-test bootstrap (psql 15+).
-- Read credentials from the container environment; preserve existing role passwords.
\getenv app_password DB_PASSWORD
BEGIN;

SELECT format('CREATE ROLE snl_app LOGIN PASSWORD %L NOSUPERUSER NOCREATEDB NOCREATEROLE', :'app_password')
WHERE NOT EXISTS (SELECT FROM pg_roles WHERE rolname = 'snl_app')
\gexec
REVOKE CREATE ON DATABASE "snl-db" FROM PUBLIC;
REVOKE CREATE ON SCHEMA public FROM PUBLIC;
GRANT CONNECT, CREATE ON DATABASE "snl-db" TO snl_app;
GRANT USAGE, CREATE ON SCHEMA public TO snl_app;
COMMIT;
