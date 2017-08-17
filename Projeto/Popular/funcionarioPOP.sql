use assistech;

-- desabilita a checagem de FOREIGN KEY
SET FOREIGN_KEY_CHECKS = 0;

LOAD DATA LOCAL INFILE "C:\\Users\\EraNetbook\\Desktop\\BASE_PROBLEMAS_KB.csv"
INTO TABLE CONTRACHEQUE
FIELDS ENCLOSED BY '\'' TERMINATED BY ';'
;

select * from FATURA;

-- habilita de novo a checagem de restrições de chaves estrangeiras
SET FOREIGN_KEY_CHECKS = 1;
