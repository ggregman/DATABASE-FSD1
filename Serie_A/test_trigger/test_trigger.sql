SELECT * FROM statistiche;

/* BEFORE INSERT */

-- Dovrebbe dare errore: esistono già due due squadre con un id_partita
INSERT INTO statistiche
(stagione, id_partita, id_squadra, id_statistiche, casa_trasferta ,gol_segnati ,tiri_totali ,tiri_porta ,possesso_palla ,passaggi, precisione,
falli, ammonizioni, espulsioni, fuorigioco, calci_angolo, esito, punti_ottenuti)
VALUES (
'2021-2022',11,'Lazio','25','C','2','2','2','2','2','2','2','2','2','2','2','V','3'); -- (Valori a caso)

-- Dovrebbe dare errore: non si possono inserire due squadre in casa
INSERT INTO statistiche (stagione, id_partita, id_squadra, id_statistiche, casa_trasferta ,gol_segnati ,tiri_totali ,tiri_porta ,possesso_palla ,passaggi, precisione,
falli, ammonizioni, espulsioni, fuorigioco, calci_angolo, esito, punti_ottenuti)
VALUES ('2021-2022', '12', 'Inter', '24', 'C', '1', '12', '4', '47', '503', '86', '12', '6', '0', '0', '3', 'S', '0');

/* ---------------------------------------------------------------------------------------------------------------------------- */

/* BEFORE UPDATE */

-- Dovrebbero ritornare un errore: l'id_partita esiste già una squadra che gioca in quello stato
UPDATE `serie_a`.`statistiche` SET `casa_trasferta` = 'C' WHERE (`id_partita` = 1 AND `id_squadra`='Spezia');
UPDATE `serie_a`.`statistiche` SET `casa_trasferta` = 'T' WHERE (`id_partita` = 2 AND `id_squadra`='Inter');

-- Dovrebbero ritornare un errore: ci sono gia due squadre per questo id_partita
UPDATE `serie_a`.`statistiche` SET `id_partita` = '1' WHERE (`id_partita` = 2 AND `id_squadra` = 'Inter');
UPDATE `serie_a`.`statistiche` SET `id_partita` = '2' WHERE (`id_partita` = 1 AND `id_squadra` = 'Spezia');

