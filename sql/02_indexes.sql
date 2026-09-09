-- ============================================================
-- Project Work L-31
-- Indici Oracle aggiuntivi
-- File: 02_indexes.sql
--
-- Sono presenti solo gli indici non già coperti da PK o UNIQUE.
-- Lo script è stato verificato su Oracle Database 26ai con Oracle SQLcl.
-- ============================================================

-- Gli indici possono velocizzare le JOIN e alcune ricerche, ma richiedono
-- spazio aggiuntivo e incidono sulle operazioni di scrittura.
-- Per il progetto ne vengono quindi aggiunti soltanto tre.

-- Q6: utile per cercare gli asset associati a un servizio.
-- La PK di asset_servizi inizia da id_asset.
CREATE INDEX idx_asset_servizi_servizio
    ON asset_servizi (id_servizio);

-- Q4/Q5: utile per cercare gli asset associati a un responsabile.
-- La PK di asset_responsabili inizia da id_asset.
CREATE INDEX idx_asset_resp_responsabile
    ON asset_responsabili (id_responsabile);

-- Q4/Q5: utile per cercare i servizi associati a un responsabile.
-- La PK di servizi_responsabili inizia da id_servizio.
CREATE INDEX idx_servizi_resp_responsabile
    ON servizi_responsabili (id_responsabile);

-- Non viene creato un indice su asset.criticita: i valori possibili sono
-- soltanto quattro e il dataset di prova è ridotto, quindi l'indice avrebbe
-- una selettività limitata.
