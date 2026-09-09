# Data Dictionary

## Legenda

Il Data Dictionary descrive le 13 tabelle e le 61 colonne definite in `sql/01_schema.sql`. La tabella seguente riporta tipi e vincoli presenti nel DDL senza aggiungere elementi al modello.

Nella colonna **Vincolo**:

- `PK` indica la partecipazione alla chiave primaria, anche composta;
- `FK` indica la tabella e la colonna referenziate;
- `NN` corrisponde a un `NOT NULL` esplicito nel DDL;
- `UQ` riporta il vincolo `UNIQUE`, anche multicolonna;
- `CK` riporta l'espressione del vincolo `CHECK`;
- `IDENTITY BY DEFAULT (START WITH 1000)` indica la proprietà Oracle utilizzata per le chiavi surrogate;
- `—` indica l'assenza di altri vincoli rispetto al tipo dichiarato.

## Data Dictionary

| Tabella | Attributo | Tipo Oracle | Vincolo | Descrizione |
| --- | --- | --- | --- | --- |
| `organizzazioni` | `id_organizzazione` | `NUMBER(10)` | PK; IDENTITY BY DEFAULT (START WITH 1000) | Identificativo univoco dell'organizzazione. |
| `organizzazioni` | `nome_organizzazione` | `VARCHAR2(150)` | NN | Denominazione dell'organizzazione rappresentata nel registro. |
| `fornitori` | `id_fornitore` | `NUMBER(10)` | PK; IDENTITY BY DEFAULT (START WITH 1000) | Identificativo univoco del fornitore. |
| `fornitori` | `nome_fornitore` | `VARCHAR2(150)` | NN | Denominazione del fornitore esterno censito. |
| `asset` | `id_asset` | `NUMBER(10)` | PK; IDENTITY BY DEFAULT (START WITH 1000) | Identificativo univoco dell'asset. |
| `asset` | `id_organizzazione` | `NUMBER(10)` | FK → organizzazioni(id_organizzazione); NN | Organizzazione alla quale l'asset appartiene. |
| `asset` | `nome_asset` | `VARCHAR2(150)` | NN | Nome descrittivo dell'asset. |
| `asset` | `tipo_asset` | `VARCHAR2(80)` | NN | Tipologia dell'asset censito. |
| `asset` | `criticita` | `VARCHAR2(10)` | NN; CK (criticita IN ('BASSA', 'MEDIA', 'ALTA', 'CRITICA')) | Livello di criticità interno attribuito all'asset. |
| `asset` | `stato` | `VARCHAR2(10)` | NN; CK (stato IN ('ATTIVO', 'INATTIVO', 'DISMESSO')) | Stato corrente dell'asset nel ciclo di vita previsto dal progetto. |
| `servizi` | `id_servizio` | `NUMBER(10)` | PK; IDENTITY BY DEFAULT (START WITH 1000) | Identificativo univoco del servizio. |
| `servizi` | `id_organizzazione` | `NUMBER(10)` | FK → organizzazioni(id_organizzazione); NN | Organizzazione che eroga o gestisce il servizio nel caso di studio. |
| `servizi` | `nome_servizio` | `VARCHAR2(150)` | NN | Nome descrittivo del servizio. |
| `servizi` | `criticita` | `VARCHAR2(10)` | NN; CK (criticita IN ('BASSA', 'MEDIA', 'ALTA', 'CRITICA')) | Livello di criticità interno attribuito al servizio. |
| `responsabili` | `id_responsabile` | `NUMBER(10)` | PK; IDENTITY BY DEFAULT (START WITH 1000) | Identificativo univoco del responsabile. |
| `responsabili` | `id_organizzazione` | `NUMBER(10)` | FK → organizzazioni(id_organizzazione); NN | Organizzazione alla quale il responsabile appartiene. |
| `responsabili` | `nome` | `VARCHAR2(80)` | NN | Nome del responsabile. |
| `responsabili` | `cognome` | `VARCHAR2(80)` | NN | Cognome del responsabile. |
| `responsabili` | `ruolo` | `VARCHAR2(120)` | NN | Ruolo organizzativo o tecnico ricoperto dal responsabile. |
| `punti_contatto` | `id_punto_contatto` | `NUMBER(10)` | PK; IDENTITY BY DEFAULT (START WITH 1000) | Identificativo univoco del punto di contatto. |
| `punti_contatto` | `id_responsabile` | `NUMBER(10)` | FK → responsabili(id_responsabile); NN; UQ (id_responsabile, funzione, priorita_contatto) | Responsabile al quale il punto di contatto è associato. |
| `punti_contatto` | `funzione` | `VARCHAR2(120)` | NN; UQ (id_responsabile, funzione, priorita_contatto) | Funzione o ambito nel quale il recapito deve essere utilizzato. |
| `punti_contatto` | `priorita_contatto` | `NUMBER(2)` | NN; UQ (id_responsabile, funzione, priorita_contatto); CK (priorita_contatto > 0) | Ordine di priorità del recapito per lo stesso responsabile e funzione; valori più bassi indicano priorità maggiore. |
| `punti_contatto` | `email` | `VARCHAR2(150)` | CK (email IS NOT NULL OR telefono IS NOT NULL) | Indirizzo email fittizio utilizzabile come recapito. |
| `punti_contatto` | `telefono` | `VARCHAR2(30)` | CK (email IS NOT NULL OR telefono IS NOT NULL) | Numero telefonico fittizio utilizzabile come recapito. |
| `asset_servizi` | `id_asset` | `NUMBER(10)` | PK; FK → asset(id_asset); NN | Asset coinvolto nella relazione asset-servizio. |
| `asset_servizi` | `id_servizio` | `NUMBER(10)` | PK; FK → servizi(id_servizio); NN | Servizio coinvolto nella relazione asset-servizio. |
| `servizi_fornitori` | `id_servizio` | `NUMBER(10)` | PK; FK → servizi(id_servizio); NN | Servizio che dipende dal fornitore indicato. |
| `servizi_fornitori` | `id_fornitore` | `NUMBER(10)` | PK; FK → fornitori(id_fornitore); NN | Fornitore dal quale dipende il servizio. |
| `servizi_fornitori` | `tipo_dipendenza` | `VARCHAR2(100)` | NN | Natura o tipologia della dipendenza servizio-fornitore. |
| `servizi_fornitori` | `criticita_dipendenza` | `VARCHAR2(10)` | NN; CK (criticita_dipendenza IN ('BASSA', 'MEDIA', 'ALTA', 'CRITICA')) | Livello di criticità attribuito alla specifica dipendenza dal fornitore. |
| `servizi_fornitori` | `descrizione` | `VARCHAR2(500)` | — | Eventuale descrizione integrativa della dipendenza. |
| `asset_responsabili` | `id_asset` | `NUMBER(10)` | PK; FK → asset(id_asset); NN | Asset associato al responsabile. |
| `asset_responsabili` | `id_responsabile` | `NUMBER(10)` | PK; FK → responsabili(id_responsabile); NN | Responsabile associato all'asset. |
| `servizi_responsabili` | `id_servizio` | `NUMBER(10)` | PK; FK → servizi(id_servizio); NN | Servizio associato al responsabile. |
| `servizi_responsabili` | `id_responsabile` | `NUMBER(10)` | PK; FK → responsabili(id_responsabile); NN | Responsabile associato al servizio. |
| `dipendenze` | `id_dipendenza` | `NUMBER(10)` | PK; IDENTITY BY DEFAULT (START WITH 1000) | Identificativo univoco della dipendenza tecnica. |
| `dipendenze` | `id_asset_origine` | `NUMBER(10)` | FK → asset(id_asset); NN; UQ (id_asset_origine, id_asset_richiesto); CK (id_asset_origine <> id_asset_richiesto) | Asset che dipende dal funzionamento di un altro asset. |
| `dipendenze` | `id_asset_richiesto` | `NUMBER(10)` | FK → asset(id_asset); NN; UQ (id_asset_origine, id_asset_richiesto); CK (id_asset_origine <> id_asset_richiesto) | Asset il cui funzionamento è richiesto dall'asset origine. |
| `dipendenze` | `tipo_dipendenza` | `VARCHAR2(100)` | NN | Natura o tipologia della dipendenza tecnica tra i due asset. |
| `dipendenze` | `descrizione` | `VARCHAR2(500)` | — | Eventuale descrizione integrativa della dipendenza tecnica. |
| `storico_asset` | `id_storico_asset` | `NUMBER(10)` | PK; IDENTITY BY DEFAULT (START WITH 1000) | Identificativo univoco della registrazione storica dell'asset. |
| `storico_asset` | `id_asset` | `NUMBER(10)` | FK → asset(id_asset); NN; UQ (id_asset, numero_versione) | Asset al quale appartiene la versione storica. |
| `storico_asset` | `numero_versione` | `NUMBER(10)` | NN; UQ (id_asset, numero_versione); CK (numero_versione > 0) | Numero progressivo della versione dell'asset. |
| `storico_asset` | `data_inizio_validita` | `DATE` | NN; CK (data_fine_validita IS NULL OR data_fine_validita >= data_inizio_validita) | Data dalla quale la fotografia storica è considerata valida. |
| `storico_asset` | `data_fine_validita` | `DATE` | CK (data_fine_validita IS NULL OR data_fine_validita >= data_inizio_validita) | Data di fine validità della fotografia storica, se applicabile. |
| `storico_asset` | `nome_asset` | `VARCHAR2(150)` | NN | Nome dell'asset fotografato nella specifica versione. |
| `storico_asset` | `tipo_asset` | `VARCHAR2(80)` | NN | Tipologia dell'asset fotografata nella specifica versione. |
| `storico_asset` | `criticita` | `VARCHAR2(10)` | NN; CK (criticita IN ('BASSA', 'MEDIA', 'ALTA', 'CRITICA')) | Criticità dell'asset fotografata nella specifica versione. |
| `storico_asset` | `stato` | `VARCHAR2(10)` | NN; CK (stato IN ('ATTIVO', 'INATTIVO', 'DISMESSO')) | Stato dell'asset fotografato nella specifica versione. |
| `storico_asset` | `tipo_modifica` | `VARCHAR2(50)` | NN | Tipologia sintetica della modifica che ha determinato la versione. |
| `storico_asset` | `descrizione_modifica` | `VARCHAR2(500)` | — | Eventuale descrizione della modifica registrata. |
| `storico_servizi` | `id_storico_servizio` | `NUMBER(10)` | PK; IDENTITY BY DEFAULT (START WITH 1000) | Identificativo univoco della registrazione storica del servizio. |
| `storico_servizi` | `id_servizio` | `NUMBER(10)` | FK → servizi(id_servizio); NN; UQ (id_servizio, numero_versione) | Servizio al quale appartiene la versione storica. |
| `storico_servizi` | `numero_versione` | `NUMBER(10)` | NN; UQ (id_servizio, numero_versione); CK (numero_versione > 0) | Numero progressivo della versione del servizio. |
| `storico_servizi` | `data_inizio_validita` | `DATE` | NN; CK (data_fine_validita IS NULL OR data_fine_validita >= data_inizio_validita) | Data dalla quale la fotografia storica è considerata valida. |
| `storico_servizi` | `data_fine_validita` | `DATE` | CK (data_fine_validita IS NULL OR data_fine_validita >= data_inizio_validita) | Data di fine validità della fotografia storica, se applicabile. |
| `storico_servizi` | `nome_servizio` | `VARCHAR2(150)` | NN | Nome del servizio fotografato nella specifica versione. |
| `storico_servizi` | `criticita` | `VARCHAR2(10)` | NN; CK (criticita IN ('BASSA', 'MEDIA', 'ALTA', 'CRITICA')) | Criticità del servizio fotografata nella specifica versione. |
| `storico_servizi` | `tipo_modifica` | `VARCHAR2(50)` | NN | Tipologia sintetica della modifica che ha determinato la versione. |
| `storico_servizi` | `descrizione_modifica` | `VARCHAR2(500)` | — | Eventuale descrizione della modifica registrata. |

## Stato di verifica

Il contenuto del Data Dictionary è stato confrontato con `sql/01_schema.sql`, verificando nomi delle tabelle e delle colonne, tipi Oracle e principali vincoli.

Lo schema è stato inoltre collaudato su Oracle Database 26ai con Oracle SQLcl. Le evidenze dell'esecuzione sono raccolte nella directory `evidenze/`.

Il Data Dictionary descrive lo schema definito nei sorgenti del progetto e non costituisce un'estrazione automatica del catalogo Oracle.
