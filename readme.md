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
- ID (BIGINT AI) | NOTNULL
- nome | VARCHAR(50) | NOTNULL
- indirizzo_sede | VARCHAR(30) | NOTNULL
- direttore_id? | NULL

*corsi_laurea*
- ID (BIGINT AI) | NOTNULL
- dipartimento_id | NOTNULL
- nome |  VARCHAR(50) | NOTNULL
- tipo_laurea | VARCHAR(20) | NOTNULL

*corsi*
- ID (BIGINT AI) | NOTNULL
- corso_laurea_id | NOTNULL
- insegnante_id | NOTNULL
- nome |  VARCHAR(20) | NOTNULL
- numero_crediti | TINYINT | NOTNULL
- obbligatorio (boolean) | TINYINT | DEFAULT(0)
- tipologia_corso | CHAR(1) | NOTNULL (es. corso di tipo A: corso in presenza)

*insegnanti*
- ID (BIGINT AI) | NOTNULL
- nome | VARCHAR(20) | NOTNULL
- cognome | VARCHAR(30) | NOTNULL
- email | VARCHAR(20) | NOTNULL
- numero_telefono | BIGINT | NOTNULL

*esami*
- ID (BIGINT AI) | NOTNULL
- corso_id | NOTNULL
- insegnante_id | NOTNULL
- data | DATETIME | NOTNULL
- indirizzo_sede | VARCHAR(30) | NOTNULL
- tipo_esame | VARCHAR(7) | NOTNULL (es. orale o scritto)

*studenti*
- ID (BIGINT AI) | NOTNULL
- corso_laurea_id | NOTNULL
- nome | VARCHAR(20) | NOTNULL
- cognome | VARCHAR(30) | NOTNULL
- email | VARCHAR(20) | NOTNULL
- numero_matricola | INT | NOTNULL
- esami_passati? | NULL

*voti*
- ID (BIGINT AI) | NOTNULL
- voto | TINYINT | NOTNULL