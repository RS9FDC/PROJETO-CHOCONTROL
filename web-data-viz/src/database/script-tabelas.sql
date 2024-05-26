-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/*
comandos para mysql server
*/
CREATE DATABASE chocontrol;

USE chocontrol;

CREATE TABLE Empresa(
	empresaId CHAR(10) PRIMARY KEY NOT NULL
    ,nome VARCHAR(50) 
    ,telefone CHAR(14)
    ,email VARCHAR(256)
    ,cnpj CHAR(18) NOT NULL
    ,cep CHAR(9)
    ,numero VARCHAR(20)
    ,complemento VARCHAR(45)
);

CREATE TABLE funcionario(
	idFuncionario CHAR(12)
    ,nome VARCHAR(50)
    ,senha CHAR(8)
    ,email VARCHAR(256)
    ,fkEmpresa  CHAR(10) 
    , FOREIGN KEY (fkEmpresa) REFERENCES Empresa(idEmpresa)
    ,PRIMARY KEY (idFuncionario,fkEmpresa)
);


CREATE TABLE intervaloTemperatura(
	idintervaloTemperatura INT PRIMARY KEY AUTO_INCREMENT
    ,temepraturaMaxima DECIMAL(3,1)
    ,temperaturaMinima DECIMAL(3,1)
);


CREATE TABLE Maquina(
	idMaquina CHAR (10) PRIMARY KEY
    ,modeloMaquina VARCHAR(40)
    ,saborChocolate VARCHAR(30)
    ,fkEmpresa CHAR(10)
    ,fkintervaloTemperatura INT
    ,FOREIGN KEY (fkEmpresa) REFERENCES Empresa(idEmpresa)
    ,FOREIGN KEY (fkIntervaloTemperatura) REFERENCES IntervaloTemperatura(idIntervaloTemperatura)
);
    
    CREATE TABLE Sensor(
		idSensor CHAR(6) PRIMARY KEY
        ,modeloSensor VARCHAR(20)
        ,fkMaquina CHAR(10)
        ,FOREIGN KEY (fkMaquina)REFERENCES Maquina(idMaquina)
);


CREATE TABLE Monitoramento (
	idMonitoramento INT PRIMARY KEY AUTO_INCREMENT 
	,dtHora DATETIME
    ,temperatura DECIMAL(3,1)
    ,fkSensor CHAR(6)
    ,FOREIGN KEY (fkSensor) REFERENCES Sensor(idSensor)
);


INSERT INTO Empresa VALUES ('3021AB12','Cacau Show','(11)97114-5072','cacaushow@outlook.com','00000000000000','01414-001','2568',NULL);

SELECT * FROM Empresa;

-- CREATE DATABASE aquatech;

-- USE aquatech;

-- CREATE TABLE empresa (
-- 	id INT PRIMARY KEY AUTO_INCREMENT,
-- 	razao_social VARCHAR(50),
-- 	cnpj CHAR(14)
-- );

-- CREATE TABLE usuario (
-- 	id INT PRIMARY KEY AUTO_INCREMENT,
-- 	nome VARCHAR(50),
-- 	email VARCHAR(50),
-- 	senha VARCHAR(50),
-- 	fk_empresa INT,
-- 	FOREIGN KEY (fk_empresa) REFERENCES empresa(id)
-- );

-- CREATE TABLE aviso (
-- 	id INT PRIMARY KEY AUTO_INCREMENT,
-- 	titulo VARCHAR(100),
-- 	descricao VARCHAR(150),
-- 	fk_usuario INT,
-- 	FOREIGN KEY (fk_usuario) REFERENCES usuario(id)
-- );

-- create table aquario (
-- /* em nossa regra de negócio, um aquario tem apenas um sensor */
-- 	id INT PRIMARY KEY AUTO_INCREMENT,
-- 	descricao VARCHAR(300),
-- 	fk_empresa INT,
-- 	FOREIGN KEY (fk_empresa) REFERENCES empresa(id)
-- );

-- /* esta tabela deve estar de acordo com o que está em INSERT de sua API do arduino - dat-acqu-ino */

-- create table medida (
-- 	id INT PRIMARY KEY AUTO_INCREMENT,
-- 	dht11_umidade DECIMAL,
-- 	dht11_temperatura DECIMAL,
-- 	luminosidade DECIMAL,
-- 	lm35_temperatura DECIMAL,
-- 	chave TINYINT,
-- 	momento DATETIME,
-- 	fk_aquario INT,
-- 	FOREIGN KEY (fk_aquario) REFERENCES aquario(id)
-- );

-- insert into empresa (razao_social, cnpj) values ('Empresa 1', '00000000000000');
-- insert into aquario (descricao, fk_empresa) values ('Aquário de Estrela-do-mar', 1);