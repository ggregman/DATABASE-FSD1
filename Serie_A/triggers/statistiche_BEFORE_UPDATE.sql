CREATE DEFINER=`root`@`localhost` TRIGGER `statistiche_BEFORE_UPDATE_1` BEFORE UPDATE ON `statistiche` FOR EACH ROW -- Trigger che non permette di aggiornare un record se esiste già
-- per un id_partita 2 id_squadra. (non si possono avere 3 squadre per un id_partita
-- Non permette di fare update con due squadre in casa o due squadre in trasferta.

BEGIN

DECLARE conta_partite INT;
DECLARE conta_squadre int;

SELECT COUNT(*) INTO conta_partite -- Conta quanti record esistono per questo id_partita
FROM statistiche
WHERE id_partita = new.id_partita;

SELECT COUNT(*) INTO conta_squadre -- Controlla se esiste gia una squadra che gioca nello stato inserito (C,T)
FROM statistiche
WHERE id_partita = new.id_partita AND casa_trasferta = new.casa_trasferta ;

IF conta_partite > 1 AND old.id_partita != new.id_partita THEN -- L'utente sta cambiando l'id_partita di un record statistiche
	SIGNAL SQLSTATE '45000'
	SET MESSAGE_TEXT = 'Errore: sono già presenti due squadre per questo id_partita.';
		
ELSE -- Se l'utente non sta facendo l'update di un id_partita ma di casa_trasferta
	IF conta_squadre > 0 AND old.casa_trasferta != new.casa_trasferta THEN -- Se trova un record con lo stesso 'casa_trasferta' AND l'utente sta cercando di modificare il campo casa_trasferta
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Errore: è gia presente una squadra che gioca in questo stato';
	END IF;
END IF;

END