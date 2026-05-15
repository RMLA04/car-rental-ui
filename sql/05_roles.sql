-- 05_roles.sql
-- Security model and database roles

DO $$
BEGIN
    IF NOT EXISTS (SELECT FROM pg_roles WHERE rolname = 'manager_role') THEN
        CREATE ROLE manager_role;
    END IF;

    IF NOT EXISTS (SELECT FROM pg_roles WHERE rolname = 'employee_role') THEN
        CREATE ROLE employee_role;
    END IF;

    IF NOT EXISTS (SELECT FROM pg_roles WHERE rolname = 'readonly_role') THEN
        CREATE ROLE readonly_role;
    END IF;
END $$;

GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO manager_role;

GRANT SELECT, INSERT, UPDATE
ON customers, rentals, payments
TO employee_role;

GRANT SELECT
ON ALL TABLES IN SCHEMA public
TO readonly_role;
