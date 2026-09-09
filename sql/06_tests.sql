-- ============================================================
-- Project Work L-31
-- Test di controllo
-- File: 06_tests.sql
--
-- Eseguire dopo 01_schema.sql, 02_indexes.sql, 03_dataset.sql e 04_views.sql.
-- I test sono di sola lettura e non modificano i dati.
-- Lo script è stato verificato su Oracle Database 26ai con Oracle SQLcl.
-- ============================================================

SET PAGESIZE 100
SET LINESIZE 220

PROMPT === T01 - Conteggi attesi del dataset dimostrativo ===
SELECT 'organizzazioni' AS oggetto, COUNT(*) AS valore_rilevato, 1 AS valore_atteso,
       CASE WHEN COUNT(*) = 1 THEN 'OK' ELSE 'KO' END AS esito
FROM organizzazioni
UNION ALL
SELECT 'fornitori', COUNT(*), 4, CASE WHEN COUNT(*) = 4 THEN 'OK' ELSE 'KO' END
FROM fornitori
UNION ALL
SELECT 'asset', COUNT(*), 8, CASE WHEN COUNT(*) = 8 THEN 'OK' ELSE 'KO' END
FROM asset
UNION ALL
SELECT 'servizi', COUNT(*), 5, CASE WHEN COUNT(*) = 5 THEN 'OK' ELSE 'KO' END
FROM servizi
UNION ALL
SELECT 'responsabili', COUNT(*), 5, CASE WHEN COUNT(*) = 5 THEN 'OK' ELSE 'KO' END
FROM responsabili
UNION ALL
SELECT 'punti_contatto', COUNT(*), 7, CASE WHEN COUNT(*) = 7 THEN 'OK' ELSE 'KO' END
FROM punti_contatto
UNION ALL
SELECT 'asset_servizi', COUNT(*), 14, CASE WHEN COUNT(*) = 14 THEN 'OK' ELSE 'KO' END
FROM asset_servizi
UNION ALL
SELECT 'servizi_fornitori', COUNT(*), 7, CASE WHEN COUNT(*) = 7 THEN 'OK' ELSE 'KO' END
FROM servizi_fornitori
UNION ALL
SELECT 'asset_responsabili', COUNT(*), 13, CASE WHEN COUNT(*) = 13 THEN 'OK' ELSE 'KO' END
FROM asset_responsabili
UNION ALL
SELECT 'servizi_responsabili', COUNT(*), 8, CASE WHEN COUNT(*) = 8 THEN 'OK' ELSE 'KO' END
FROM servizi_responsabili
UNION ALL
SELECT 'dipendenze', COUNT(*), 10, CASE WHEN COUNT(*) = 10 THEN 'OK' ELSE 'KO' END
FROM dipendenze
UNION ALL
SELECT 'storico_asset', COUNT(*), 9, CASE WHEN COUNT(*) = 9 THEN 'OK' ELSE 'KO' END
FROM storico_asset
UNION ALL
SELECT 'storico_servizi', COUNT(*), 7, CASE WHEN COUNT(*) = 7 THEN 'OK' ELSE 'KO' END
FROM storico_servizi
ORDER BY oggetto;

PROMPT === T02 - Copertura degli elementi principali ===
SELECT controllo, valore_rilevato, valore_minimo,
       CASE WHEN valore_rilevato >= valore_minimo THEN 'OK' ELSE 'KO' END AS esito
FROM (
    SELECT 'asset critici' AS controllo, COUNT(*) AS valore_rilevato, 1 AS valore_minimo
    FROM asset WHERE criticita = 'CRITICA'
    UNION ALL
    SELECT 'servizi', COUNT(*), 1 FROM servizi
    UNION ALL
    SELECT 'servizi con fornitori', COUNT(DISTINCT id_servizio), 1 FROM servizi_fornitori
    UNION ALL
    SELECT 'responsabilita su asset', COUNT(*), 1 FROM asset_responsabili
    UNION ALL
    SELECT 'responsabilita su servizi', COUNT(*), 1 FROM servizi_responsabili
    UNION ALL
    SELECT 'punti di contatto', COUNT(*), 1 FROM punti_contatto
    UNION ALL
    SELECT 'dipendenze tecniche', COUNT(*), 1 FROM dipendenze
)
ORDER BY controllo;

PROMPT === T03 - Relazioni N:M effettivamente popolate ===
SELECT
    CASE
        WHEN EXISTS (
            SELECT 1 FROM asset_servizi
            GROUP BY id_asset HAVING COUNT(*) > 1
        )
        AND EXISTS (
            SELECT 1 FROM asset_servizi
            GROUP BY id_servizio HAVING COUNT(*) > 1
        )
        THEN 'OK' ELSE 'KO'
    END AS esito_asset_servizi,
    CASE
        WHEN EXISTS (
            SELECT 1 FROM asset_responsabili
            GROUP BY id_responsabile HAVING COUNT(*) > 1
        )
        AND EXISTS (
            SELECT 1 FROM servizi_responsabili
            GROUP BY id_responsabile HAVING COUNT(*) > 1
        )
        THEN 'OK' ELSE 'KO'
    END AS esito_responsabilita
FROM dual;

PROMPT === T04 - Assenza di auto-dipendenze ===
SELECT COUNT(*) AS auto_dipendenze,
       CASE WHEN COUNT(*) = 0 THEN 'OK' ELSE 'KO' END AS esito
FROM dipendenze
WHERE id_asset_origine = id_asset_richiesto;

PROMPT === T05 - Unicita delle versioni storiche ===
SELECT 'storico_asset' AS oggetto, COUNT(*) AS duplicati,
       CASE WHEN COUNT(*) = 0 THEN 'OK' ELSE 'KO' END AS esito
FROM (
    SELECT id_asset, numero_versione
    FROM storico_asset
    GROUP BY id_asset, numero_versione
    HAVING COUNT(*) > 1
)
UNION ALL
SELECT 'storico_servizi', COUNT(*),
       CASE WHEN COUNT(*) = 0 THEN 'OK' ELSE 'KO' END
FROM (
    SELECT id_servizio, numero_versione
    FROM storico_servizi
    GROUP BY id_servizio, numero_versione
    HAVING COUNT(*) > 1
);

PROMPT === T06 - Ricostruibilita dello storico ===
SELECT
    CASE
        WHEN EXISTS (
            SELECT 1 FROM storico_asset
            GROUP BY id_asset HAVING COUNT(*) >= 2
        ) THEN 'OK' ELSE 'KO'
    END AS storico_asset_ricostruibile,
    CASE
        WHEN EXISTS (
            SELECT 1 FROM storico_servizi
            GROUP BY id_servizio HAVING COUNT(*) >= 2
        ) THEN 'OK' ELSE 'KO'
    END AS storico_servizi_ricostruibile
FROM dual;

PROMPT === T07 - Coerenza dell'ultimo snapshot con lo stato corrente ===
SELECT 'asset' AS oggetto, COUNT(*) AS incoerenze,
       CASE WHEN COUNT(*) = 0 THEN 'OK' ELSE 'KO' END AS esito
FROM (
    SELECT a.id_asset
    FROM asset a
    JOIN storico_asset sa
      ON sa.id_asset = a.id_asset
     AND sa.data_fine_validita IS NULL
    WHERE sa.nome_asset <> a.nome_asset
       OR sa.tipo_asset <> a.tipo_asset
       OR sa.criticita <> a.criticita
       OR sa.stato <> a.stato
)
UNION ALL
SELECT 'servizi', COUNT(*),
       CASE WHEN COUNT(*) = 0 THEN 'OK' ELSE 'KO' END
FROM (
    SELECT s.id_servizio
    FROM servizi s
    JOIN storico_servizi ss
      ON ss.id_servizio = s.id_servizio
     AND ss.data_fine_validita IS NULL
    WHERE ss.nome_servizio <> s.nome_servizio
       OR ss.criticita <> s.criticita
);

PROMPT === T08 - Risultati significativi delle query principali ===
SELECT requisito, righe_rilevate,
       CASE WHEN righe_rilevate > 0 THEN 'OK' ELSE 'KO' END AS esito
FROM (
    SELECT 'Q1 asset critici' AS requisito, COUNT(*) AS righe_rilevate
    FROM asset WHERE criticita = 'CRITICA'
    UNION ALL
    SELECT 'Q2 servizi erogati', COUNT(*) FROM servizi
    UNION ALL
    SELECT 'Q3 dipendenze da terze parti', COUNT(*) FROM servizi_fornitori
    UNION ALL
    SELECT 'Q4 responsabili',
           (SELECT COUNT(*) FROM asset_responsabili)
         + (SELECT COUNT(*) FROM servizi_responsabili)
    FROM dual
    UNION ALL
    SELECT 'Q5 punti di contatto', COUNT(*) FROM punti_contatto
    UNION ALL
    SELECT 'Q6 riepilogo servizio', COUNT(*)
    FROM servizi s
    WHERE s.id_servizio = 1
      AND EXISTS (
          SELECT 1 FROM asset_servizi ass
          WHERE ass.id_servizio = s.id_servizio
      )
      AND EXISTS (
          SELECT 1 FROM servizi_fornitori sf
          WHERE sf.id_servizio = s.id_servizio
      )
      AND EXISTS (
          SELECT 1 FROM servizi_responsabili sr
          WHERE sr.id_servizio = s.id_servizio
      )
    UNION ALL
    SELECT 'Q7 storico asset', COUNT(*) FROM storico_asset WHERE id_asset = 1
    UNION ALL
    SELECT 'Q8 storico servizi', COUNT(*) FROM storico_servizi WHERE id_servizio = 1
    UNION ALL
    SELECT 'Q9 dipendenze tecniche', COUNT(*) FROM dipendenze
)
ORDER BY requisito;

PROMPT === T09 - Interrogabilita e granularita della VIEW di export ===
SELECT
    (SELECT COUNT(*) FROM vw_export_nis2_demo) AS righe_view,
    (SELECT COUNT(*) FROM servizi) AS righe_servizi,
    (SELECT COUNT(DISTINCT id_servizio) FROM vw_export_nis2_demo) AS servizi_distinti,
    CASE
        WHEN (SELECT COUNT(*) FROM vw_export_nis2_demo) = (SELECT COUNT(*) FROM servizi)
         AND (SELECT COUNT(DISTINCT id_servizio) FROM vw_export_nis2_demo)
             = (SELECT COUNT(*) FROM servizi)
        THEN 'OK' ELSE 'KO'
    END AS esito
FROM dual;

PROMPT === Fine test: verificare che ogni colonna ESITO riporti OK ===
