USE registro;

INSERT INTO tbl_lezione(
	ID_corso,
    data_lezione,
    orario_inizio,
    orario_termine,
    CF_docente,
    materia,
    tipologia,
    nome_docente,
    cognome_docente,
    firma_docente
) VALUES (
	'FSD-2021',
    '2022-03-01',
    '14:00:00',
    '18:00:00',
    'CodFiscaleProfDB',
    'Basi di Dati',
    'TEORIA',
    'Roberto',
    'Rubolotta',
    'firmaprof'
);

SELECT *
FROM tbl_lezione;