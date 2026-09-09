# Popolamento e manutenzione dei dati

## Ordine degli inserimenti

Per rispettare le chiavi esterne, i dati devono essere inseriti in un ordine coerente con le dipendenze tra le tabelle:

1. `organizzazioni` e `fornitori`;
2. `asset`, `servizi` e `responsabili`;
3. `punti_contatto`;
4. `asset_servizi`, `servizi_fornitori`, `asset_responsabili` e `servizi_responsabili`;
5. `dipendenze`;
6. `storico_asset` e `storico_servizi`.

`sql/03_dataset.sql` segue già questo ordine.

Nel dataset vengono utilizzati ID espliciti inferiori a 1000. Le colonne con generazione automatica partono invece da 1000, evitando sovrapposizioni con i dati di esempio.

## Valori controllati

I valori ammessi per la criticità sono:

`BASSA`, `MEDIA`, `ALTA`, `CRITICA`.

Per lo stato degli asset sono previsti:

`ATTIVO`, `INATTIVO`, `DISMESSO`.

La priorità di un punto di contatto deve essere un numero positivo. Un valore più basso indica una priorità maggiore.

Ogni punto di contatto deve avere almeno uno tra email e telefono. Per lo stesso responsabile non può inoltre essere ripetuta la stessa combinazione di funzione e priorità.

## Aggiornamento di asset e servizi

Quando viene modificato un asset o un servizio che possiede uno storico, devono rimanere coerenti sia il dato corrente sia le relative versioni storiche.

Una possibile sequenza è:

1. individuare la versione corrente, cioè quella con `data_fine_validita IS NULL`;
2. impostarne la data di fine validità;
3. aggiornare la riga corrente in `asset` o `servizi`;
4. inserire la nuova versione nella relativa tabella storica;
5. controllare che la nuova versione corrisponda allo stato corrente;
6. eseguire il `COMMIT`.

Le versioni storiche già registrate non dovrebbero essere modificate, salvo la correzione di un dato errato.

## Cancellazione dei dati

Prima di eliminare una riga è necessario verificare le relazioni che dipendono da essa.

Il DDL non utilizza cancellazioni a cascata. Per un asset che non deve più essere utilizzato può essere più appropriato impostare lo stato `DISMESSO` anziché cancellarlo, quando questo rappresenta correttamente il caso reale.

## Controlli sui dati

Tra i controlli utili rientrano:

- presenza dei campi obbligatori;
- valori ammessi per criticità e stato;
- coerenza delle relazioni tra le tabelle;
- assenza di dipendenze di un asset verso se stesso;
- presenza di almeno un recapito nei punti di contatto;
- unicità delle versioni storiche;
- corrispondenza tra ultima versione storica e dato corrente.

`sql/06_tests.sql` contiene una serie di controlli di sola lettura sul dataset di esempio.

## Modifiche allo schema

Se vengono modificate tabelle, colonne o vincoli, è necessario verificare anche gli elementi che dipendono dallo schema.

In particolare vanno ricontrollati diagramma ER, dataset, query, VIEW, test, esportazione e Data Dictionary.
