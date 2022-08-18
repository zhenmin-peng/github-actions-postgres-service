DO
$do$
BEGIN
   IF EXISTS (SELECT FROM pg_catalog.pg_roles WHERE  rolname = 'rw_only') THEN
      RAISE NOTICE 'Role "rw_only" already exists. Skipping.';
   ELSE
      CREATE ROLE rw_only;
   END IF;
   GRANT USAGE ON SCHEMA "public" TO rw_only;
   GRANT ALL ON ALL TABLES IN SCHEMA "public" TO rw_only;
   GRANT ALL ON ALL TABLES IN SCHEMA "_timescaledb_internal" TO rw_only;
   ALTER DEFAULT PRIVILEGES IN SCHEMA "public" GRANT ALL ON TABLES TO rw_only;
END
$do$;
DO
$do$
BEGIN
   IF EXISTS (SELECT FROM pg_catalog.pg_roles WHERE  rolname = :db_username) THEN
      RAISE NOTICE 'User % already exists! Skipping.', :db_username;
   ELSE
      CREATE USER :db_username WITH PASSWORD :db_password;
   END IF;
   GRANT rw_only TO :db_username;
END
$do$;