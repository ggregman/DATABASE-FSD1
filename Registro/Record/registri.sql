/* PRIMO INSERIMENTO RECORD, PER PROX LEZIONE INSERIRE ANCHE IL SECONDO RECORD*/

USE registro;

INSERT INTO tbl_registro(
	ID_corso,
    classe,
    ente,
    figura_professionale,
    sede_corso,
    indirizzo,
    data_inizio,
    data_termine,
    durata_corso)
VALUES (
	'FSD-2021',
    'Full Stack Developer',
    'Tech Talent Factory',
    'Tecnico superiore lo sviluppo di applicazioni web e mobile con tecnologie cloud',
    'Via Adelaide Bono Cairoli, 34 - 20127 Milano',
    'Via San Vittore, 21 - 20123 Milano',
    '2021-10-26',
    '2022-07-31',
    '1000'
);

/* secondo record */

INSERT INTO tbl_registro(
	ID_corso,
    classe,
    ente,
    figura_professionale,
    sede_corso,
    indirizzo,
    data_inizio,
    data_termine,
    durata_corso)
VALUES (
	'FSD-2022',
    'Full Stack Developer',
    'Tech Talent Factory',
    'Tecnico superiore lo sviluppo di applicazioni web e mobile con tecnologie cloud',
    'Via Adelaide Bono Cairoli, 34 - 20127 Milano',
    'Via San Vittore, 21 - 20123 Milano',
    '2022-10-26',
    '2023-07-31',
    '1000'
);

SELECT ID_corso,
    classe,
    ente,
    figura_professionale,
    sede_corso,
    indirizzo,
    data_inizio,
    data_termine,
    durata_corso
FROM tbl_registro;