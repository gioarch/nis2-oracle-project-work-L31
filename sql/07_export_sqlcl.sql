-- ============================================================
-- Project Work L-31
-- Esportazione CSV con Oracle SQLcl
-- File: 07_export_sqlcl.sql
--
-- Eseguire dopo 04_views.sql in una sessione Oracle SQLcl.
-- Lo script è stato verificato su Oracle Database 26ai con Oracle SQLcl.
-- ============================================================

-- Imposta il formato CSV per l'output di SQLcl.
SET ECHO OFF
SET FEEDBACK OFF
SET SQLFORMAT csv

-- Scrive il risultato nel file di esportazione.
SPOOL export_nis2_demo.csv

SELECT *
FROM vw_export_nis2_demo
ORDER BY id_servizio;

SPOOL OFF
