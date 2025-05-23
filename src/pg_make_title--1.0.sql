-- complain if script is sourced in psql, rather than via CREATE EXTENSION
\echo Use "CREATE EXTENSION pg_make_title" to load this file. \quit

-- CREATE FUNCTION convert_to_title(inp text)
-- RETURNS text
-- LANGUAGE plpgsql IMMUTABLE STRICT
--   AS $$
--     DECLARE
--       ret text;
--     BEGIN
--       ret := (SELECT INITCAP(inp));
--     RETURN(ret);
--     END;
--   $$;


CREATE FUNCTION convert_to_title(inp text)
RETURNS text AS 'MODULE_PATHNAME'
LANGUAGE C STRICT VOLATILE;
