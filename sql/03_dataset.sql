-- ============================================================
-- Project Work L-31
-- Dataset di esempio
-- File: 03_dataset.sql
--
-- Tutti i dati utilizzati sono fittizi e servono esclusivamente
-- per le prove previste dal progetto.
-- Il collaudo su Oracle verrà eseguito in una fase successiva.
-- ============================================================

-- Gli ID del dataset utilizzano valori inferiori a 1000, lasciando separata
-- la numerazione automatica definita dalle colonne IDENTITY.

-- 1. Organizzazione
INSERT INTO organizzazioni (id_organizzazione, nome_organizzazione)
VALUES (1, 'Digital Services Srl');

-- 2. Fornitori esterni fittizi
INSERT INTO fornitori (id_fornitore, nome_fornitore)
VALUES (1, 'Cloud Provider Alfa - Societa Fittizia');

INSERT INTO fornitori (id_fornitore, nome_fornitore)
VALUES (2, 'Connettivita Beta - Societa Fittizia');

INSERT INTO fornitori (id_fornitore, nome_fornitore)
VALUES (3, 'Backup Gamma - Societa Fittizia');

INSERT INTO fornitori (id_fornitore, nome_fornitore)
VALUES (4, 'Messaggistica Delta - Societa Fittizia');

-- 3. Asset
INSERT INTO asset
    (id_asset, id_organizzazione, nome_asset, tipo_asset, criticita, stato)
VALUES
    (1, 1, 'Portale Clienti', 'Applicazione web', 'CRITICA', 'ATTIVO');

INSERT INTO asset
    (id_asset, id_organizzazione, nome_asset, tipo_asset, criticita, stato)
VALUES
    (2, 1, 'Database Clienti', 'Database Oracle', 'CRITICA', 'ATTIVO');

INSERT INTO asset
    (id_asset, id_organizzazione, nome_asset, tipo_asset, criticita, stato)
VALUES
    (3, 1, 'Server Applicativo', 'Server virtuale', 'ALTA', 'ATTIVO');

INSERT INTO asset
    (id_asset, id_organizzazione, nome_asset, tipo_asset, criticita, stato)
VALUES
    (4, 1, 'Gateway di Autenticazione', 'Componente software', 'CRITICA', 'ATTIVO');

INSERT INTO asset
    (id_asset, id_organizzazione, nome_asset, tipo_asset, criticita, stato)
VALUES
    (5, 1, 'Sistema Backup', 'Sistema di backup', 'ALTA', 'ATTIVO');

INSERT INTO asset
    (id_asset, id_organizzazione, nome_asset, tipo_asset, criticita, stato)
VALUES
    (6, 1, 'Bilanciatore Web', 'Appliance virtuale', 'ALTA', 'ATTIVO');

INSERT INTO asset
    (id_asset, id_organizzazione, nome_asset, tipo_asset, criticita, stato)
VALUES
    (7, 1, 'Server Reportistica', 'Server virtuale', 'MEDIA', 'INATTIVO');

INSERT INTO asset
    (id_asset, id_organizzazione, nome_asset, tipo_asset, criticita, stato)
VALUES
    (8, 1, 'Archivio Legacy', 'Archivio dati', 'BASSA', 'DISMESSO');

-- 4. Servizi erogati
INSERT INTO servizi
    (id_servizio, id_organizzazione, nome_servizio, criticita)
VALUES
    (1, 1, 'Gestione Portale Clienti', 'CRITICA');

INSERT INTO servizi
    (id_servizio, id_organizzazione, nome_servizio, criticita)
VALUES
    (2, 1, 'Autenticazione Utenti', 'CRITICA');

INSERT INTO servizi
    (id_servizio, id_organizzazione, nome_servizio, criticita)
VALUES
    (3, 1, 'Continuita e Ripristino', 'ALTA');

INSERT INTO servizi
    (id_servizio, id_organizzazione, nome_servizio, criticita)
VALUES
    (4, 1, 'Reportistica Clienti', 'MEDIA');

INSERT INTO servizi
    (id_servizio, id_organizzazione, nome_servizio, criticita)
VALUES
    (5, 1, 'Assistenza Digitale', 'BASSA');

-- 5. Responsabili con nominativi fittizi
INSERT INTO responsabili
    (id_responsabile, id_organizzazione, nome, cognome, ruolo)
VALUES
    (1, 1, 'NomeFittizio01', 'CognomeFittizio01', 'Responsabile sicurezza informatica');

INSERT INTO responsabili
    (id_responsabile, id_organizzazione, nome, cognome, ruolo)
VALUES
    (2, 1, 'NomeFittizio02', 'CognomeFittizio02', 'Responsabile infrastrutture');

INSERT INTO responsabili
    (id_responsabile, id_organizzazione, nome, cognome, ruolo)
VALUES
    (3, 1, 'NomeFittizio03', 'CognomeFittizio03', 'Responsabile applicazioni');

INSERT INTO responsabili
    (id_responsabile, id_organizzazione, nome, cognome, ruolo)
VALUES
    (4, 1, 'NomeFittizio04', 'CognomeFittizio04', 'Responsabile continuita operativa');

INSERT INTO responsabili
    (id_responsabile, id_organizzazione, nome, cognome, ruolo)
VALUES
    (5, 1, 'NomeFittizio05', 'CognomeFittizio05', 'Responsabile supporto utenti');

-- 6. Punti di contatto fittizi
-- Il dominio .invalid e i numeri con prefisso 000 sono utilizzati solo come dati di esempio.
INSERT INTO punti_contatto
    (id_punto_contatto, id_responsabile, funzione, priorita_contatto, email, telefono)
VALUES
    (1, 1, 'Sicurezza informatica', 1,
     'sicurezza.p01@digital-services.example.invalid', '+39 000 0000001');

INSERT INTO punti_contatto
    (id_punto_contatto, id_responsabile, funzione, priorita_contatto, email, telefono)
VALUES
    (2, 1, 'Sicurezza informatica', 2,
     'sicurezza.backup.p01@digital-services.example.invalid', NULL);

INSERT INTO punti_contatto
    (id_punto_contatto, id_responsabile, funzione, priorita_contatto, email, telefono)
VALUES
    (3, 2, 'Gestione infrastrutture', 1,
     NULL, '+39 000 0000002');

INSERT INTO punti_contatto
    (id_punto_contatto, id_responsabile, funzione, priorita_contatto, email, telefono)
VALUES
    (4, 3, 'Gestione applicazioni', 1,
     'applicazioni.p03@digital-services.example.invalid', '+39 000 0000003');

INSERT INTO punti_contatto
    (id_punto_contatto, id_responsabile, funzione, priorita_contatto, email, telefono)
VALUES
    (5, 4, 'Continuita operativa', 1,
     'continuita.p04@digital-services.example.invalid', '+39 000 0000004');

INSERT INTO punti_contatto
    (id_punto_contatto, id_responsabile, funzione, priorita_contatto, email, telefono)
VALUES
    (6, 5, 'Supporto utenti', 1,
     'supporto.p05@digital-services.example.invalid', '+39 000 0000005');

INSERT INTO punti_contatto
    (id_punto_contatto, id_responsabile, funzione, priorita_contatto, email, telefono)
VALUES
    (7, 2, 'Reperibilita infrastrutture', 1,
     'reperibilita.p02@digital-services.example.invalid', NULL);

-- 7. Associazioni molti-a-molti tra asset e servizi
INSERT INTO asset_servizi (id_asset, id_servizio) VALUES (1, 1);
INSERT INTO asset_servizi (id_asset, id_servizio) VALUES (2, 1);
INSERT INTO asset_servizi (id_asset, id_servizio) VALUES (3, 1);
INSERT INTO asset_servizi (id_asset, id_servizio) VALUES (4, 1);
INSERT INTO asset_servizi (id_asset, id_servizio) VALUES (6, 1);
INSERT INTO asset_servizi (id_asset, id_servizio) VALUES (2, 2);
INSERT INTO asset_servizi (id_asset, id_servizio) VALUES (3, 2);
INSERT INTO asset_servizi (id_asset, id_servizio) VALUES (4, 2);
INSERT INTO asset_servizi (id_asset, id_servizio) VALUES (2, 3);
INSERT INTO asset_servizi (id_asset, id_servizio) VALUES (5, 3);
INSERT INTO asset_servizi (id_asset, id_servizio) VALUES (2, 4);
INSERT INTO asset_servizi (id_asset, id_servizio) VALUES (7, 4);
INSERT INTO asset_servizi (id_asset, id_servizio) VALUES (1, 5);
INSERT INTO asset_servizi (id_asset, id_servizio) VALUES (3, 5);

-- 8. Dipendenze dei servizi da fornitori esterni
INSERT INTO servizi_fornitori
    (id_servizio, id_fornitore, tipo_dipendenza, criticita_dipendenza, descrizione)
VALUES
    (1, 1, 'Hosting cloud', 'CRITICA', 'Erogazione fittizia delle risorse cloud del portale.');

INSERT INTO servizi_fornitori
    (id_servizio, id_fornitore, tipo_dipendenza, criticita_dipendenza, descrizione)
VALUES
    (1, 2, 'Connettivita', 'ALTA', 'Collegamento fittizio necessario alla raggiungibilita del portale.');

INSERT INTO servizi_fornitori
    (id_servizio, id_fornitore, tipo_dipendenza, criticita_dipendenza, descrizione)
VALUES
    (2, 1, 'Piattaforma cloud', 'ALTA', 'Risorse fittizie per i componenti di autenticazione.');

INSERT INTO servizi_fornitori
    (id_servizio, id_fornitore, tipo_dipendenza, criticita_dipendenza, descrizione)
VALUES
    (3, 1, 'Storage cloud', 'ALTA', 'Destinazione fittizia secondaria delle copie.');

INSERT INTO servizi_fornitori
    (id_servizio, id_fornitore, tipo_dipendenza, criticita_dipendenza, descrizione)
VALUES
    (3, 3, 'Backup gestito', 'CRITICA', 'Supporto fittizio alle copie e al ripristino.');

INSERT INTO servizi_fornitori
    (id_servizio, id_fornitore, tipo_dipendenza, criticita_dipendenza, descrizione)
VALUES
    (5, 2, 'Connettivita', 'MEDIA', 'Canale fittizio per il servizio di assistenza.');

INSERT INTO servizi_fornitori
    (id_servizio, id_fornitore, tipo_dipendenza, criticita_dipendenza, descrizione)
VALUES
    (5, 4, 'Invio notifiche', 'MEDIA', 'Recapito fittizio delle notifiche di assistenza.');

-- 9. Responsabilita sugli asset
INSERT INTO asset_responsabili (id_asset, id_responsabile) VALUES (1, 1);
INSERT INTO asset_responsabili (id_asset, id_responsabile) VALUES (1, 3);
INSERT INTO asset_responsabili (id_asset, id_responsabile) VALUES (2, 1);
INSERT INTO asset_responsabili (id_asset, id_responsabile) VALUES (2, 2);
INSERT INTO asset_responsabili (id_asset, id_responsabile) VALUES (3, 2);
INSERT INTO asset_responsabili (id_asset, id_responsabile) VALUES (3, 3);
INSERT INTO asset_responsabili (id_asset, id_responsabile) VALUES (4, 1);
INSERT INTO asset_responsabili (id_asset, id_responsabile) VALUES (4, 3);
INSERT INTO asset_responsabili (id_asset, id_responsabile) VALUES (5, 2);
INSERT INTO asset_responsabili (id_asset, id_responsabile) VALUES (5, 4);
INSERT INTO asset_responsabili (id_asset, id_responsabile) VALUES (6, 2);
INSERT INTO asset_responsabili (id_asset, id_responsabile) VALUES (7, 3);
INSERT INTO asset_responsabili (id_asset, id_responsabile) VALUES (8, 4);

-- 10. Responsabilita sui servizi
INSERT INTO servizi_responsabili (id_servizio, id_responsabile) VALUES (1, 1);
INSERT INTO servizi_responsabili (id_servizio, id_responsabile) VALUES (1, 3);
INSERT INTO servizi_responsabili (id_servizio, id_responsabile) VALUES (2, 1);
INSERT INTO servizi_responsabili (id_servizio, id_responsabile) VALUES (2, 3);
INSERT INTO servizi_responsabili (id_servizio, id_responsabile) VALUES (3, 2);
INSERT INTO servizi_responsabili (id_servizio, id_responsabile) VALUES (3, 4);
INSERT INTO servizi_responsabili (id_servizio, id_responsabile) VALUES (4, 3);
INSERT INTO servizi_responsabili (id_servizio, id_responsabile) VALUES (5, 5);

-- 11. Dipendenze tecniche tra asset
-- L'asset origine dipende dal funzionamento dell'asset richiesto.
INSERT INTO dipendenze
    (id_dipendenza, id_asset_origine, id_asset_richiesto, tipo_dipendenza, descrizione)
VALUES
    (1, 1, 3, 'Esecuzione applicativa', 'Il portale dipende dal server applicativo.');

INSERT INTO dipendenze
    (id_dipendenza, id_asset_origine, id_asset_richiesto, tipo_dipendenza, descrizione)
VALUES
    (2, 1, 4, 'Autenticazione', 'Il portale dipende dal gateway di autenticazione.');

INSERT INTO dipendenze
    (id_dipendenza, id_asset_origine, id_asset_richiesto, tipo_dipendenza, descrizione)
VALUES
    (3, 1, 6, 'Bilanciamento', 'Il portale dipende dal bilanciatore web.');

INSERT INTO dipendenze
    (id_dipendenza, id_asset_origine, id_asset_richiesto, tipo_dipendenza, descrizione)
VALUES
    (4, 3, 2, 'Persistenza dati', 'Il server applicativo dipende dal database clienti.');

INSERT INTO dipendenze
    (id_dipendenza, id_asset_origine, id_asset_richiesto, tipo_dipendenza, descrizione)
VALUES
    (5, 3, 4, 'Verifica identita', 'Il server applicativo dipende dal gateway di autenticazione.');

INSERT INTO dipendenze
    (id_dipendenza, id_asset_origine, id_asset_richiesto, tipo_dipendenza, descrizione)
VALUES
    (6, 4, 2, 'Consultazione credenziali', 'Il gateway dipende dal database clienti.');

INSERT INTO dipendenze
    (id_dipendenza, id_asset_origine, id_asset_richiesto, tipo_dipendenza, descrizione)
VALUES
    (7, 5, 2, 'Copia dati', 'Il sistema backup dipende dal database clienti.');

INSERT INTO dipendenze
    (id_dipendenza, id_asset_origine, id_asset_richiesto, tipo_dipendenza, descrizione)
VALUES
    (8, 6, 3, 'Instradamento', 'Il bilanciatore dipende dal server applicativo.');

INSERT INTO dipendenze
    (id_dipendenza, id_asset_origine, id_asset_richiesto, tipo_dipendenza, descrizione)
VALUES
    (9, 7, 2, 'Lettura dati', 'Il server reportistica dipende dal database clienti.');

INSERT INTO dipendenze
    (id_dipendenza, id_asset_origine, id_asset_richiesto, tipo_dipendenza, descrizione)
VALUES
    (10, 7, 3, 'Elaborazione report', 'Il server reportistica dipende dal server applicativo.');

-- 12. Storico degli asset
-- Per gli asset versionati, l'ultima versione corrisponde allo stato corrente.
INSERT INTO storico_asset
    (id_storico_asset, id_asset, numero_versione, data_inizio_validita,
     data_fine_validita, nome_asset, tipo_asset, criticita, stato,
     tipo_modifica, descrizione_modifica)
VALUES
    (1, 1, 1, TO_DATE('2025-01-01', 'YYYY-MM-DD'),
     TO_DATE('2025-05-31', 'YYYY-MM-DD'), 'Portale Clienti Legacy',
     'Applicazione web', 'BASSA', 'INATTIVO', 'INSERIMENTO',
     'Prima fotografia fittizia del portale.');

INSERT INTO storico_asset
    (id_storico_asset, id_asset, numero_versione, data_inizio_validita,
     data_fine_validita, nome_asset, tipo_asset, criticita, stato,
     tipo_modifica, descrizione_modifica)
VALUES
    (2, 1, 2, TO_DATE('2025-06-01', 'YYYY-MM-DD'),
     TO_DATE('2026-02-28', 'YYYY-MM-DD'), 'Portale Clienti',
     'Applicazione web', 'ALTA', 'ATTIVO', 'ATTIVAZIONE',
     'Attivazione fittizia e rivalutazione della criticita.');

INSERT INTO storico_asset
    (id_storico_asset, id_asset, numero_versione, data_inizio_validita,
     data_fine_validita, nome_asset, tipo_asset, criticita, stato,
     tipo_modifica, descrizione_modifica)
VALUES
    (3, 1, 3, TO_DATE('2026-03-01', 'YYYY-MM-DD'),
     NULL, 'Portale Clienti', 'Applicazione web', 'CRITICA', 'ATTIVO',
     'RIVALUTAZIONE', 'Classificazione fittizia aggiornata a CRITICA.');

INSERT INTO storico_asset
    (id_storico_asset, id_asset, numero_versione, data_inizio_validita,
     data_fine_validita, nome_asset, tipo_asset, criticita, stato,
     tipo_modifica, descrizione_modifica)
VALUES
    (4, 2, 1, TO_DATE('2025-01-01', 'YYYY-MM-DD'),
     TO_DATE('2025-08-31', 'YYYY-MM-DD'), 'Database Clienti',
     'Database Oracle', 'MEDIA', 'ATTIVO', 'INSERIMENTO',
     'Prima fotografia fittizia del database.');

INSERT INTO storico_asset
    (id_storico_asset, id_asset, numero_versione, data_inizio_validita,
     data_fine_validita, nome_asset, tipo_asset, criticita, stato,
     tipo_modifica, descrizione_modifica)
VALUES
    (5, 2, 2, TO_DATE('2025-09-01', 'YYYY-MM-DD'),
     NULL, 'Database Clienti', 'Database Oracle', 'CRITICA', 'ATTIVO',
     'RIVALUTAZIONE', 'Classificazione fittizia aggiornata a CRITICA.');

INSERT INTO storico_asset
    (id_storico_asset, id_asset, numero_versione, data_inizio_validita,
     data_fine_validita, nome_asset, tipo_asset, criticita, stato,
     tipo_modifica, descrizione_modifica)
VALUES
    (6, 5, 1, TO_DATE('2025-02-01', 'YYYY-MM-DD'),
     TO_DATE('2026-01-14', 'YYYY-MM-DD'), 'Sistema Copie',
     'Sistema di backup', 'MEDIA', 'ATTIVO', 'INSERIMENTO',
     'Prima fotografia fittizia del sistema di copie.');

INSERT INTO storico_asset
    (id_storico_asset, id_asset, numero_versione, data_inizio_validita,
     data_fine_validita, nome_asset, tipo_asset, criticita, stato,
     tipo_modifica, descrizione_modifica)
VALUES
    (7, 5, 2, TO_DATE('2026-01-15', 'YYYY-MM-DD'),
     NULL, 'Sistema Backup', 'Sistema di backup', 'ALTA', 'ATTIVO',
     'AGGIORNAMENTO', 'Ridenominazione fittizia e rivalutazione della criticita.');

INSERT INTO storico_asset
    (id_storico_asset, id_asset, numero_versione, data_inizio_validita,
     data_fine_validita, nome_asset, tipo_asset, criticita, stato,
     tipo_modifica, descrizione_modifica)
VALUES
    (8, 8, 1, TO_DATE('2024-01-01', 'YYYY-MM-DD'),
     TO_DATE('2025-12-31', 'YYYY-MM-DD'), 'Archivio Legacy',
     'Archivio dati', 'BASSA', 'INATTIVO', 'INSERIMENTO',
     'Prima fotografia fittizia dell archivio legacy.');

INSERT INTO storico_asset
    (id_storico_asset, id_asset, numero_versione, data_inizio_validita,
     data_fine_validita, nome_asset, tipo_asset, criticita, stato,
     tipo_modifica, descrizione_modifica)
VALUES
    (9, 8, 2, TO_DATE('2026-01-01', 'YYYY-MM-DD'),
     NULL, 'Archivio Legacy', 'Archivio dati', 'BASSA', 'DISMESSO',
     'DISMISSIONE', 'Fotografia fittizia della dismissione.');

-- 13. Storico dei servizi
-- Per i servizi versionati, l'ultima versione corrisponde allo stato corrente.
INSERT INTO storico_servizi
    (id_storico_servizio, id_servizio, numero_versione,
     data_inizio_validita, data_fine_validita, nome_servizio, criticita,
     tipo_modifica, descrizione_modifica)
VALUES
    (1, 1, 1, TO_DATE('2025-01-01', 'YYYY-MM-DD'),
     TO_DATE('2025-06-30', 'YYYY-MM-DD'), 'Portale Informativo Clienti',
     'MEDIA', 'INSERIMENTO', 'Prima fotografia fittizia del servizio.');

INSERT INTO storico_servizi
    (id_storico_servizio, id_servizio, numero_versione,
     data_inizio_validita, data_fine_validita, nome_servizio, criticita,
     tipo_modifica, descrizione_modifica)
VALUES
    (2, 1, 2, TO_DATE('2025-07-01', 'YYYY-MM-DD'),
     TO_DATE('2026-02-28', 'YYYY-MM-DD'), 'Gestione Portale Clienti',
     'ALTA', 'AGGIORNAMENTO', 'Ampliamento fittizio del servizio.');

INSERT INTO storico_servizi
    (id_storico_servizio, id_servizio, numero_versione,
     data_inizio_validita, data_fine_validita, nome_servizio, criticita,
     tipo_modifica, descrizione_modifica)
VALUES
    (3, 1, 3, TO_DATE('2026-03-01', 'YYYY-MM-DD'),
     NULL, 'Gestione Portale Clienti', 'CRITICA', 'RIVALUTAZIONE',
     'Classificazione fittizia aggiornata a CRITICA.');

INSERT INTO storico_servizi
    (id_storico_servizio, id_servizio, numero_versione,
     data_inizio_validita, data_fine_validita, nome_servizio, criticita,
     tipo_modifica, descrizione_modifica)
VALUES
    (4, 2, 1, TO_DATE('2025-03-01', 'YYYY-MM-DD'),
     TO_DATE('2025-11-30', 'YYYY-MM-DD'), 'Autenticazione Utenti',
     'ALTA', 'INSERIMENTO', 'Prima fotografia fittizia del servizio.');

INSERT INTO storico_servizi
    (id_storico_servizio, id_servizio, numero_versione,
     data_inizio_validita, data_fine_validita, nome_servizio, criticita,
     tipo_modifica, descrizione_modifica)
VALUES
    (5, 2, 2, TO_DATE('2025-12-01', 'YYYY-MM-DD'),
     NULL, 'Autenticazione Utenti', 'CRITICA', 'RIVALUTAZIONE',
     'Classificazione fittizia aggiornata a CRITICA.');

INSERT INTO storico_servizi
    (id_storico_servizio, id_servizio, numero_versione,
     data_inizio_validita, data_fine_validita, nome_servizio, criticita,
     tipo_modifica, descrizione_modifica)
VALUES
    (6, 3, 1, TO_DATE('2025-04-01', 'YYYY-MM-DD'),
     TO_DATE('2026-01-14', 'YYYY-MM-DD'), 'Backup Dati',
     'MEDIA', 'INSERIMENTO', 'Prima fotografia fittizia del servizio.');

INSERT INTO storico_servizi
    (id_storico_servizio, id_servizio, numero_versione,
     data_inizio_validita, data_fine_validita, nome_servizio, criticita,
     tipo_modifica, descrizione_modifica)
VALUES
    (7, 3, 2, TO_DATE('2026-01-15', 'YYYY-MM-DD'),
     NULL, 'Continuita e Ripristino', 'ALTA', 'AGGIORNAMENTO',
     'Ridenominazione fittizia e ampliamento del servizio.');

COMMIT;
