USE registro;

INSERT INTO tbl_docente(
	CF_docente,
    nome,
    cognome,
    data_di_nascita
) VALUES (
	'CodFiscaleProfDB',
    'Roberto',
    'Rubolotta',
    '2000-07-01'
);

SELECT
	CF_docente,
    nome,
    cognome,
    data_di_nascita
FROM tbl_docente;