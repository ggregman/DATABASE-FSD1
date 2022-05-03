CREATE DEFINER=`root`@`localhost` TRIGGER `statistiche_BEFORE_INSERT` BEFORE INSERT ON `statistiche` FOR EACH ROW BEGIN

DECLARE numero_squadre INT; -- variabile che conta squadra
DECLARE tc ENUM('C','T');	-- caratteri che si possono inserire

SELECT COUNT(*) INTO numero_squadre FROM statistiche
WHERE id_partita = new.id_partita;	-- seleziona tra i record 'statistiche' con il parametro id_partita
									-- che stiamo inserendo

IF numero_squadre = 2 THEN 			-- se ne trova due da l'errore
    SIGNAL SQLSTATE '45000' 
    SET MESSAGE_TEXT = 'Errore: non puoi inserire più di due squadre nella stessa partita!';
END IF;
	
SELECT casa_trasferta INTO tc FROM statistiche
WHERE id_partita=new.id_partita; 	
    
IF tc=new.casa_trasferta THEN 	-- se trova un record con lo stesso id_partita e stesso 'casa_trasferta'
	SIGNAL SQLSTATE '45000' 
	SET MESSAGE_TEXT = 'Errore: Non puoi inserire due squadre entrambe in casa/trasferta!';
END IF;

END