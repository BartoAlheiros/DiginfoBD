use assistech;

-- desabilita a checagem de FOREIGN KEY
SET FOREIGN_KEY_CHECKS = 0;

LOAD DATA LOCAL INFILE "C:\\Users\\BARTOLOMEU.DIAS\\Downloads\\Excel_BD.ods - CONTRACHEQUE.csv"
INTO TABLE CONTRACHEQUE
FIELDS ENCLOSED BY '\'' TERMINATED BY ';'
;

truncate table CONTRACHEQUE;

select * from CLIE_ABRE;

-- habilita de novo a checagem de restrições de chaves estrangeiras
SET FOREIGN_KEY_CHECKS = 1;
