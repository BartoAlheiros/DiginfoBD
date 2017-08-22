#selecionar a matrícula, o nome do funcionario e o nome da unidade de suporte em que cada funcionário trabalha.
SELECT f.Matricula, u.Nome as Nome_Unid_Suporte, f.Nome as Nome_Funcionario
FROM
	funcionario f JOIN unidade_de_suporte u
    ON f.CNPJ = u.CNPJ_empresa;
    
    