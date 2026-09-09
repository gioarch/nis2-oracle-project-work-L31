-- ============================================================
-- Project Work L-31
-- Esportazione CSV con Oracle SQLcl
-- File: 07_export_sqlcl.sql
--
-- Eseguire dopo 04_views.sql in una sessione Oracle SQLcl.
-- Il collaudo su Oracle verrà eseguito in una fase successiva.
-- ============================================================

-- Imposta il formato CSV per l'output di SQLcl.
SET SQLFORMAT csv

-- Scrive il risultato nel file di esportazione.
SPOOL export_nis2_demo.csv

SELECT *
FROM vw_export_nis2_demo
ORDER BY id_servizio;

SPOOL OFF
