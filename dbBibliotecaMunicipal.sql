DROP DATABASE IF EXISTS BIBLIOTECA;
CREATE DATABASE BIBLIOTECA;
USE BIBLIOTECA;

create table Cliente(
cpfCliente VARCHAR(11),
nmCliente VARCHAR(45),
endCliente VARCHAR(45),
cidadeCliente VARCHAR(45),
telCliente VARCHAR(11),
CONSTRAINT pk_cpfCliente PRIMARY KEY (cpfCliente)
);
insert into cliente values ("16516515615", "Gabriel Silva","Av Ana Costa 105","Santos", "1398484848");
insert into cliente values ("49848948944", "Augusto Mendes","Av Conselheiro Nébias 415","Santos", "13991546595");
insert into cliente values ("48759784512", "Guilherme Henrique","Rua do Comércio 75","São Vicente", "13981549065");
insert into cliente values ("15618198198", "Pedro Paulo","Av Francisco Glicério 112","Santos", "13996548514");
insert into cliente values ("98745612358", "Rodrigo Santos","Av Conselheiro Nébias 115","Santos", "13981223356");
insert into cliente values ("24569879845", "Gabriel Souza","Av Ana Costa 312","São Vicente", "13991854157");
insert into cliente values ("05487987899", "Alexandre Garcia","Rua do Comércio 60","Santos", "13997845789");
insert into cliente values ("35498794584", "Vitória Santos","Av Afonso Pena 1057","Santos", "13991651348");
insert into cliente values ("09870954847", "Paula Rodrigues","Av Pedro Lessa 125","Santos", "13996458772");
insert into cliente values ("78459845056", "Otávio Costa","Av Afonso Pena 1035","São Vicente", "13991549012");
insert into cliente values ("87540988705", "Leonardo Santos","Av Pedro Lessa 1072","Santos", "13981666538");
insert into cliente values ("06508709874", "Augusto Sanchez","Rua do Comércio 115","São Vicente", "13991569568");
select * from cliente;

create table genero (
idGenero int auto_increment,
nmGenero VARCHAR (45),
constraint pk_idGenero primary key (idGenero)
)auto_increment = 1;
insert into genero (nmGenero) values ("Aventura");
insert into genero (nmGenero) values ("Conto de Fadas");
insert into genero (nmGenero) values ("Drama");
insert into genero (nmGenero) values ("Novela");
insert into genero (nmGenero) values ("Poesia");
insert into genero (nmGenero) values ("Biografia");
insert into genero (nmGenero) values ("Ficção");
insert into genero (nmGenero) values ("Clássicos");
insert into genero (nmGenero) values ("Sobrenatual");
insert into genero (nmGenero) values ("Infantil");
insert into genero (nmGenero) values ("Romance");
insert into genero (nmGenero) values ("Terror");
select * from genero;

create table editora(
idEditora int auto_increment,
nmEditora VARCHAR(45),
constraint pk_idEditora primary key (idEditora)
)auto_increment = 1;
insert into editora (nmEditora) values ("Editora 1");
insert into editora (nmEditora) values ("Editora 2");
insert into editora (nmEditora) values ("Editora 3");
insert into editora (nmEditora) values ("Editora 4");

create table livro(
idLivro int auto_increment,
nmLivro VARCHAR(100),
autorLivro VARCHAR(45),
idGenero int,
idEditora int,
qtdEstoque int,
constraint pk_idLivro primary key (idLivro, nmLivro),
constraint fk_idGenero foreign key (idGenero) references genero(idGenero),
constraint fk_idEditora foreign key (idEditora) references editora(idEditora)
)auto_increment = 1;
insert into livro (nmLivro, autorLivro, idGenero, idEditora, qtdEstoque) values ("Becoming","Augusto Mendes",1,1,2);
insert into livro (nmLivro, autorLivro, idGenero, idEditora, qtdEstoque) values ("Redemption","Gabriel Mendes",2,2,15);
insert into livro (nmLivro, autorLivro, idGenero, idEditora, qtdEstoque) values ("Educated","Machado de Assis",3,3,11);
insert into livro (nmLivro, autorLivro, idGenero, idEditora, qtdEstoque) values ("A sorte segue a coragem","Allan Percy",4,4,10);
insert into livro (nmLivro, autorLivro, idGenero, idEditora, qtdEstoque) values ("O menino do pijama listrado","Almeida Garret",5,1,9);
insert into livro (nmLivro, autorLivro, idGenero, idEditora, qtdEstoque) values ("O herói perdido","Alice Munro",6,2,8);
insert into livro (nmLivro, autorLivro, idGenero, idEditora, qtdEstoque) values ("O lado oculto da vida","Almada Negreiros",7,3,5);
insert into livro (nmLivro, autorLivro, idGenero, idEditora, qtdEstoque) values ("Pelos caminhos da vida","Augusto Cury",8,4,4);
insert into livro (nmLivro, autorLivro, idGenero, idEditora, qtdEstoque) values ("O viajante e sua sombra","C. S. Lewis",9,1,12);
insert into livro (nmLivro, autorLivro, idGenero, idEditora, qtdEstoque) values ("O turbante da sabedoria e outras histórias de Nasrudin","Coelho Neto",10,2,7);
insert into livro (nmLivro, autorLivro, idGenero, idEditora, qtdEstoque) values ("Memórias póstumas de Machado de Assis","Carina Rissi",11,3,10);
insert into livro (nmLivro, autorLivro, idGenero, idEditora, qtdEstoque) values ("Dom Casmurro","Dan Brown",12,4,4);
select * from livro;

create table Situacao(
idSituacao int,
nmSituacao VARCHAR(45),
constraint pk_idSituacao primary key(idSituacao)
);
insert into Situacao values (1, "Não Devolvido");
insert into Situacao values (2, "Devolvido");
select * from Situacao;

create table aluguel(
idAluguel int AUTO_INCREMENT,
cpfCliente VARCHAR(45),
idSituacao int,
constraint pk_idAluguel primary key(idAluguel),
constraint fk_cpfCliente foreign key (cpfCliente) references Cliente(cpfCliente),
constraint fk_idSituacao foreign key (idSituacao) references Situacao(idSituacao)
)AUTO_INCREMENT = 1;
insert into aluguel (cpfCliente,idSituacao) values ("47939425803",1);
insert into aluguel (cpfCliente,idSituacao) values ("06640028922",1);
select * from aluguel;

create table itemAluguel(
idAluguel int,
idLivro int,
qtdLivros int,
dataAluguel date,
hrAluguel time,
dataDevolucao date,
hrDevolucao time,
constraint pk_itemAluguel primary key (idAluguel, idLivro, qtdLivros),
constraint fk_idAluguell foreign key (idAluguel) references aluguel(idAluguel),
constraint fk_idLivroo foreign key (idLivro) references livro(idLivro)
);
insert into itemAluguel values(1, 1, 2, curdate(), curtime(), null, null);
insert into itemAluguel values(2, 2, 3, curdate(), curtime(), null, null);
select * from itemAluguel