CREATE DATABASE ger_join;
USE ger_join;

CREATE TABLE funcionarios (
cod int auto_increment primary key not null,
nome varchar(255) not null,
especialidade varchar(255)
);

CREATE TABLE dependentes (
cod int auto_increment primary key not null,
nome varchar(255) not null,
cod_fun int not null,
FOREIGN KEY(cod) REFERENCES funcionarios(cod)
);

insert into funcionarios(nome, especialidade)
	values("José", "Engenheiro"),
		  ("João", "Mestre de obras"),
          ("Maria", "Contabilista");
          
insert into dependentes(nome, cod_fun)
	values("Pedro", "1"),
		  ("Alice", "1 "),
          ("Luana", "3");
          
 select * from dependentes;         
	#iner join;
   SELECT FUNC.nome, DEP.nome
   FROM funcionarios FUNC
   INNER JOIN dependentes DEP
   ON FUNC.cod = DEP.cod_fun
   WHERE FUNC.cod = 1;
   
   #left join
   SELECT FUNC.nome nome_FUNC, DEP.nome nome_DEP
   FROM funcionarios FUNC
   LEFT JOIN dependentes DEP 
   ON FUNC.cod = DEP.cod_fun;
   
    #left excluding join
   SELECT FUNC.nome nome_FUNC, DEP.nome nome_DEP
   FROM funcionarios FUNC
   LEFT JOIN dependentes DEP 
   ON FUNC.cod = DEP.cod_fun
   WHERE DEP.nome is null;
   
   #right join
   SELECT FUNC.nome nome_FUNC, DEP.nome nome_DEP
   FROM funcionarios FUNC
   RIGHT JOIN dependentes DEP 
   ON FUNC.cod = DEP.cod_fun;
   
    #RIGHT excluding join
   SELECT FUNC.nome nome_FUNC, DEP.nome nome_DEP
   FROM funcionarios FUNC
   RIGHT JOIN dependentes DEP 
   ON FUNC.cod = DEP.cod_fun
   WHERE DEP.nome is null;
   
   #cross /full join ; o mysql ñ suporta diretamente
   
   #Aula views
   CREATE VIEW vw_lista_func AS
   SELECT cod, nome, especialidade
   FROM funcionarios;
   
   #Acesso:
   SELECT * FROM vw_lista_func ;
   
    CREATE VIEW vw_lista_dep AS
   SELECT  nome
   FROM dependentes;
   
   #Acesso:
   SELECT * FROM vw_lista_dep ;
   
   
   
