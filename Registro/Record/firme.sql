USE registro;

INSERT INTO tbl_firma(
	ID_firma,
    data_presenza,
    ID_corso,
    mattina_pomeriggio,
    CF_studente,
    firma)
VALUES (
	'1',
    '2022-03-01',
    'FSD-2021',
    'P',
    'MNHGGR01L09F205G',
    'firmagreg'
);

SELECT ID_firma,
    data_presenza,
    ID_corso,
    mattina_pomeriggio,
    CF_studente,
    firma
FROM tbl_firma;
