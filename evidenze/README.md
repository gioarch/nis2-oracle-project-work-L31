# Evidenze di collaudo

Questa directory raccoglie le evidenze prodotte durante il collaudo tecnico degli script SQL del progetto.

Il collaudo finale è stato eseguito il 10 settembre 2026 su Oracle Database 26ai utilizzando Oracle SQLcl 26.2.2.

Gli script da `01_schema.sql` a `07_export_sqlcl.sql` sono stati eseguiti nell'ordine previsto.

Durante il collaudo di `05_queries.sql` è stato riprodotto un problema di esecuzione delle query multilinea con `SQLBLANKLINES` disattivato. Il log `05_queries_c4_26ai.log` conserva l'esecuzione precedente alla correzione, mentre `05_queries_c5_final_26ai.log` documenta l'esecuzione finale completata senza errori.

I test contenuti in `06_tests.sql` hanno completato i gruppi T01–T09 senza esiti KO.

L'esportazione finale `export_nis2_demo_26ai.csv` contiene 5 record e 9 colonne ed è priva di prompt e messaggi di feedback SQLcl.

Il file `SHA256SUMS.txt` contiene le impronte SHA-256 delle evidenze tecniche conservate in questa directory.
