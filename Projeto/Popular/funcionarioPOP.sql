use assistech;

-- desabilita a checagem de FOREIGN KEY
SET FOREIGN_KEY_CHECKS = 0;

LOAD DATA LOCAL INFILE "Bibliotecas\\Documentos\\Excel_BD.ods - CONTRACHEQUE.csv"
INTO TABLE CONTRACHEQUE
FIELDS ENCLOSED BY '\'' TERMINATED BY ','
;

select * from DESPESA_VIAGEM;

-- habilita de novo a checagem de restrições de chaves estrangeiras
SET FOREIGN_KEY_CHECKS = 1;
