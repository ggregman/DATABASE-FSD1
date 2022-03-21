USE registro;

INSERT INTO tbl_studente(
	CF_studente,
    nome,
    cognome,
    data_di_nascita,
    numero_ordine)
VALUES (
	'MNHGGR01L09F205G',
    'Gregorio',
    'Manahan',
    '2001-07-09',
    '12');

SELECT
	CF_studente,
    nome,
    cognome,
    data_di_nascita,
    numero_ordine
FROM tbl_studente;
	