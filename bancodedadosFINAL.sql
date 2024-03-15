create database sprint1;

use sprint1;

create table Usuario (
idFuncionario char(12) primary key,
senhaUsuario varchar(50) not null,
nome varchar(70) not null,
email varchar(70) not null,
DatNasc date not null
);

select * from Maquina;

create table Empresa (
id_empresa char(10) primary key,
nome varchar(50) not null,
telefone char(14),
CNPJ char(14) unique not null,
enderecoEmpresa varchar(100) not null ,
maquinaAdquirida varchar(60) not null
);

create table Monitoramento (
idMonitoramento char(10) primary key,
saborChocolate varchar(30),
dataHoraLeva datetime,
nomeFuncionario varchar(70),
temperatura decimal(3,1),
mediaTemperatura decimal(3,1)
);
 
 create table Maquina (
idMaquina char(10) primary key,
modeloMaquina varchar(60) not null,
empresaDona varchar(60) not null
);

CREATE TABLE LogsOperacao (
idLog int AUTO_INCREMENT PRIMARY KEY,
descricao varchar(200),
dataHoraRegistro datetime
);

INSERT INTO Usuario (idFuncionario, senhaUsuario, nome, email, DatNasc)
VALUES ('1234567890', 'senha123', 'João Silva', 'joao@example.com', '1990-05-15');
INSERT INTO Usuario (idFuncionario, senhaUsuario, nome, email, DatNasc)
VALUES ('9876543210', 'senha456', 'Ana Oliveira', 'ana@example.com', '1995-08-20');
INSERT INTO Usuario (idFuncionario, senhaUsuario, nome, email, DatNasc)
VALUES ('9876543211', 'senha789', 'Ryan Nunes', 'ryan@example.com', '2000-10-07');
INSERT INTO Usuario (idFuncionario, senhaUsuario, nome, email, DatNasc)
VALUES ('9876543212', 'senha012', 'Julia Almeida', 'juju@example.com', '2003-03-15');
INSERT INTO Usuario (idFuncionario, senhaUsuario, nome, email, DatNasc)
VALUES ('9876543298', 'senha023', 'Emerson Ribeiro', 'emerson@example.com', '1980-12-25');

select * from Usuario;


INSERT INTO Empresa (id_empresa, nome, telefone, CNPJ, enderecoEmpresa, maquinaAdquirida)
VALUES ('E123456789', 'Empresa ABC', '1234567890', '12345678901234', 'Rua A, 123', 'Maquina XYZ');
INSERT INTO Empresa (id_empresa, nome, telefone, CNPJ, enderecoEmpresa, maquinaAdquirida)
VALUES ('E987654321', 'Empresa XYZ', '9876543210', '98765432109876', 'Avenida B, 456', 'Maquina ABC');
INSERT INTO Empresa (id_empresa, nome, telefone, CNPJ, enderecoEmpresa, maquinaAdquirida)
VALUES ('D987654312', 'Empresa DMF', '9876543209', '98765432109789', 'Avenida C, 789', 'Maquina DMF');
INSERT INTO Empresa (id_empresa, nome, telefone, CNPJ, enderecoEmpresa, maquinaAdquirida)
VALUES ('E987654323', 'Empresa ENZ', '9876543206', '98765432109702', 'Avenida D, 007', 'Maquina ENZ');

select * from Empresa;


INSERT INTO Monitoramento (idMonitoramento, saborChocolate, dataHoraLeva, nomeFuncionario, temperatura, mediaTemperatura)
VALUES ('M001', 'Chocolate ao Leite', '2024-03-18 09:30:00', 'Maria Oliveira', 32.5, 30.0);
INSERT INTO Monitoramento (idMonitoramento, saborChocolate, dataHoraLeva, nomeFuncionario, temperatura, mediaTemperatura)
VALUES ('M002', 'Chocolate Branco', '2024-03-18 10:15:00', 'José Santos', 28.0, 25.5);
INSERT INTO Monitoramento (idMonitoramento, saborChocolate, dataHoraLeva, nomeFuncionario, temperatura, mediaTemperatura)
VALUES ('M003', 'Chocolate Meio Amargo', '2024-03-18 11:30:00', 'David Ferreiro', 29.0, 27.5);
INSERT INTO Monitoramento (idMonitoramento, saborChocolate, dataHoraLeva, nomeFuncionario, temperatura, mediaTemperatura)
VALUES ('M004', 'Chocolate Amargo', '2024-03-18 12:00:00', 'Maria Eduarda Santos', 28.0, 26.0);

select * from Monitoramento;

INSERT INTO Maquina (idMaquina, modeloMaquina, empresaDona)
VALUES ('M001', 'Modelo X', 'Empresa XYZ');
INSERT INTO Maquina (idMaquina, modeloMaquina, empresaDona)
VALUES ('M002', 'Modelo Y', 'Empresa ABC');
INSERT INTO Maquina (idMaquina, modeloMaquina, empresaDona)
VALUES ('M003', 'Modelo Z', 'Empresa DMF');
INSERT INTO Maquina (idMaquina, modeloMaquina, empresaDona)
VALUES ('M004', 'Modelo W', 'Empresa ENZ');

select * from Maquina;


INSERT INTO LogsOperacao (descricao, dataHoraRegistro)
VALUES ('Usuário João Silva fez login no sistema.', '2024-03-18 09:00:00');
INSERT INTO LogsOperacao (descricao, dataHoraRegistro)
VALUES ('Usuário Ana Oliveira alterou configurações do sistema.', '2024-03-18 10:30:00');
INSERT INTO LogsOperacao (descricao, dataHoraRegistro)
VALUES ('Usuário Ryan Nunes alterou configurações do sistema.', '2024-03-18 11:00:00');
INSERT INTO LogsOperacao (descricao, dataHoraRegistro)
VALUES ('Usuário Julia Almeida alterou configurações do sistema.', '2024-03-18 11:15:00');
INSERT INTO LogsOperacao (descricao, dataHoraRegistro)
VALUES ('Usuário Emerson Ribeiro alterou configurações do sistema.', '2024-03-18 12:00:00');


select * from LogsOperacao;

show tables ;
desc monitoramento;


















-- Integrantes do Grupo 06 : 
-- Bruno Milici: 03241011 
-- Bruno Tonini: 03241058 
-- Davidson Ferreira: 03241047 
-- Enzo Kassawara: 03241033 
-- Fabio Thiago: 03241057 
-- João Pedro de Souza: 03241019 
-- Pedro Porfirio: 03241027 
-- Ruan Santos: 03241044