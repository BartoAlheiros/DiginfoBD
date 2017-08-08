use assistech;

select * from empresa;

select * from funcionario;

truncate table funcionario;

insert into funcionario values("16840819-4846",	"1691072733799","16431025-1907", "12.475.369/1254-07",	"Maggy",	"RPR58YMU1CU",	"Acevedo, Honorato D.",	"74899",	"74899",	"dolor.vitae@aultriciesadipiscing.ca",	8
);

insert into funcionario values("16030910-9072","1660041353899","Alexander, Yetta S.","12.475.369/1254-06","16141224-5886","Rae","UFZ71BNY9CU","76758","Maecenas.ornare.egestas@Quisque.edu",6
);

-- POVOA AS TABELAS A PARTIR DE ARQUIVOS NO FORMATO .CSV (arquvos *.dat)

-- desabilita a checagem de FOREIGN KEY durante a carga
SET FOREIGN_KEY_CHECKS = 0;

-- Mude o caminho para sua pasta local 

LOAD DATA LOCAL INFILE "C:\\Users\\BARTOLOMEU.DIAS\\git\\DiginfoBD\\Projeto\\Exemplos_Pop\\csvs\\funcionario.csv"
INTO TABLE funcionario
FIELDS ENCLOSED BY "\"" TERMINATED BY ","
;

select matricula, Cpf, Matricula_supervisor, 
unidade_de_suporte_CNPJ, Login, Senha, Nome, Cod_Contracheque, Sequencial_Dependente, Email, Carga_hora
from funcionario
where Matricula_supervisor = "16050614-0847";

alter table unidade_de_suporte
drop column COD_Unid_Suporte;

select * from unidade_de_suporte;

truncate table unidade_de_suporte;

LOAD DATA LOCAL INFILE "C:\\Users\\BARTOLOMEU.DIAS\\git\\DiginfoBD\\Projeto\\Exemplos_Pop\\csvs\\unidade_de_suporte2.csv"
INTO TABLE unidade_de_suporte
FIELDS ENCLOSED BY "\"" TERMINATED BY ","
;

show variables like '%char%';

show variables like '%coll%';

#ALTER DATABASE `assistech` CHARSET = Latin1 COLLATE = latin1_general_ci;

#ALTER TABLE unidade_de_suporte CONVERT TO CHARACTER SET utf8 COLLATE latin1_swedish_ci;