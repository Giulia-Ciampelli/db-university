## CONSEGNA
Modellare la struttura di un database per memorizzare tutti i dati riguardanti una università:
sono presenti diversi Dipartimenti (es.: Lettere e Filosofia, Matematica, Ingegneria ecc.);
ogni Dipartimento offre più Corsi di Laurea (es.: Civiltà e Letterature Classiche, Informatica, Ingegneria Elettronica ecc..)
ogni Corso di Laurea prevede diversi Corsi (es.: Letteratura Latina, Sistemi Operativi 1, Analisi Matematica 2 ecc.);
ogni Corso può essere tenuto da diversi Insegnanti;
ogni Corso prevede più appelli d'Esame;
ogni Studente è iscritto ad un solo Corso di Laurea;
ogni Studente può iscriversi a più appelli di Esame;
per ogni appello d'Esame a cui lo Studente ha partecipato, è necessario memorizzare il voto ottenuto, anche se non sufficiente. Pensiamo a quali entità (tabelle) creare per il nostro database e cerchiamo poi di stabilirne le relazioni. Infine, andiamo a definire le colonne e i tipi di dato di ogni tabella.

## Tabelle:
- dipartimenti
- corsi_laurea
- corsi
- insegnanti
- esami (o appelli?)
- studenti
- voti

*dipartimenti*
- ID (BIGINT AI)
- nome
- indirizzo_sede
- direttore_id?

*corsi_laurea*
- ID (BIGINT AI)
- dipartimento_id
- nome
- tipo_laurea

*corsi*
- ID (BIGINT AI)
- corso_laurea_id
- insegnante_id
- crediti
- obbligatorio (boolean)
- tipologia_corso

*insegnanti*
- ID (BIGINT AI)
- nome
- cognome
- email
- numero_telefono

*esami*
- ID (BIGINT AI)
- corso_id
- insegnante_id
- data
- indirizzo_sede
- tipo_esame

*studenti*
- ID (BIGINT AI)
- corso_laurea_id
- nome
- cognome
- numero_matricola
- esami_passati?

*voti*
- ID (BIGINT AI)
- voto