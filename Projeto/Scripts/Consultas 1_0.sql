#selecionar a matrícula, o nome do funcionario e o nome da unidade de suporte em que cada funcionário trabalha.
SELECT f.Matricula, u.Nome as Nome_Unid_Suporte, f.Nome as Nome_Funcionario
FROM
	funcionario f JOIN unidade_de_suporte u
    ON f.Cod_Unid_Suporte = u.Cod;
    
#selecionar os dependentes de um determinado funcionário
SELECT d.Sequencial, d.Nome as Nome_dependente, d.Sexo, d.Data_nascimento, d.Parentesco, d.Idade, d.Matricula_funcionario
FROM
	dependente d
WHERE d.Matricula_funcionario = '3221219790129';

#para cada funcionario listar todos os seus dependentes
SELECT f.Matricula as Matricula_titular, f.Nome as Nome_titular, d.Nome as Nome_dependente, d.Sexo, d.Data_nascimento, d.Parentesco, d.Idade
FROM 
	funcionario f JOIN dependente d
    ON f.Matricula = d.Matricula_funcionario;
 
    
#mostrar o nome do funcionário e seu supervisor
SELECT f.Nome as Nome_funcionario, f2.Nome as Supervisor
FROM 
	funcionario f JOIN funcionario f2
    ON f.Matricula_supervisor = f2.Matricula;
    
#exibir a quantidade de funcionários supervisionados por cada supervisor
SELECT f2.Nome as Nome_supervisor, COUNT(f.Matricula_supervisor) as Nro_Supervisionados  
FROM
	funcionario f JOIN funcionario f2
    ON f.Matricula_supervisor = f2.Matricula
GROUP BY f.Matricula_supervisor;

#exibir a matrícula, o nome de cada funcionário a quantidade de horas da jornada de trabalho e se ele trabalha sábado ou não
SELECT f.Matricula, f.Nome, j.Hora_inicio, j.Hora_final, j.Trabalha_sabado
FROM
	funcionario f JOIN jornada_de_trabalho j
    ON f.Matricula = j.Matricula_funcionario;

#exibir a localização de cada unidade de suporte  ou de uma determinada unidade de suporte

#exibir para cada funcionário quais os contracheques que ele tem

#exibir para determinado funcionário todos os seus contracheques

#exibir em o número do contrato em que determinado equipamento encontra-se

#exibir quais chamados determinado técnico de campo está atendendo ou atendeu

#exibir quais chamados foram criados por quais clientes e quando

#exibir o ID do almoxarifado em que determinado item de estoque se encontra

#exibir quantos e quais são os clientes jurídicos

#exibir qauntos e quais são os clientes físicos
