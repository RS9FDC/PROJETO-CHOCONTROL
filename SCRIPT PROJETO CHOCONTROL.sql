create database chocontrol;

use chocontrol;

create table Usuario (
idFuncionario char(12) primary key,
senhaUsuario varchar(50) not null,
nomeFuncionario varchar(70) not null,
email varchar(70) not null,
DatNasc date not null,
fkEmpresa CHAR(10) not null,
constraint fkUsuarioEmpresa foreign key (fkEmpresa)
references Empresa (idEmpresa)
);

create table Empresa (
idEmpresa char(10) primary key,
nome varchar(50) not null,
telefone char(14),
CNPJ char(14) unique not null,
cep char(9),
numero varchar(45),
complemento varchar(45)
);

create table Maquina (
idMaquina char(10) primary key,
modeloMaquina varchar(60) not null,
saborChocolate varchar(30),
fkEmpresa CHAR(10) not null,
constraint fkMaquinaEmpresa foreign key (fkEmpresa)
references Empresa (idEmpresa)
);

create table sensor (
idSensor char(10) primary key,
modeloSensor varchar(45),
fkMaquina char(10) UNIQUE,
constraint fkSensorMaquina foreign key (fkMaquina)
references Maquina (idMaquina)
);

create table intervaloTemperatura (
idIntervaloTemperatura INT,
temperaturaMaxima DECIMAL (3,1),
temperaturaMinima DECIMAL (3,1),
fkSensor char(10) not null, 
constraint fkintervaloTemperaturaSensor foreign key (fkSensor)
references sensor (idSensor)
);


create table Monitoramento (
idMonitoramento char(10) primary key,
dataHoraLeva datetime,
temperatura decimal(3,1),
picoTemperatura decimal(3,1),
fkSensor char(10) not null,
constraint fkMonitoramentoSensor foreign key (fkSensor)
references Sensor (idSensor)
);

-- Tabelas USUARIO, EMPRESA, MAQUINA, SENSOR, INTERVALOTEMPERATURA E MONITORAMENTO foram criadas!


-- TESTES - Inserts nas tabelas

INSERT INTO Usuario (idFuncionario, senhaUsuario, nomeFuncionario, email, DatNasc, fkEmpresa) VALUES
('FUNC001', 'senha123', 'João Silva', 'joao.silva@example.com', '1990-05-15', 'EMP001'),
('FUNC002', 'abc@123', 'Maria Souza', 'maria.souza@example.com', '1985-10-20', 'EMP002');

INSERT INTO Empresa (idEmpresa, nome, telefone, CNPJ, cep, numero, complemento) VALUES
('EMP001', 'Empresa A', '1234567890', '12345678901234', '12345-678', '123', 'Bloco A'),
('EMP002', 'Empresa B', '0987654321', '98765432109876', '98765-432', '456', 'Bloco B');

-- Inserções na tabela Maquina
INSERT INTO Maquina (idMaquina, modeloMaquina, saborChocolate, fkEmpresa) VALUES
('MAQ001', 'Máquina 1', 'Ao leite', 'EMP001'),
('MAQ002', 'Máquina 2', 'Amargo', 'EMP002');

-- Inserções na tabela Sensor
INSERT INTO Sensor (idSensor, modeloSensor, fkMaquina) VALUES
('SENSOR001', 'Sensor 1', 'MAQ001'),
('SENSOR002', 'Sensor 2', 'MAQ002');

-- Inserções na tabela intervaloTemperatura
INSERT INTO intervaloTemperatura (idIntervaloTemperatura, temperaturaMaxima, temperaturaMinima, fkSensor) VALUES
(1, 30.0, 20.0, 'SENSOR001'),
(2, 35.0, 25.0, 'SENSOR002');

-- Inserções na tabela Monitoramento
INSERT INTO Monitoramento (idMonitoramento, dataHoraLeva, temperatura, picoTemperatura, fkSensor) VALUES
('MON001', '2024-04-21 08:00:00', 25.5, 28.0, 'SENSOR001'),
('MON002', '2024-04-21 08:15:00', 27.0, 30.0, 'SENSOR002');


-- SPRINT 2 - MODELAGEM DE DADOS

SELECT * FROM usuario;
SELECT * FROM empresa;
SELECT * FROM maquina;
SELECT * FROM sensor;
SELECT * FROM intervaloTemperatura;
SELECT * FROM monitoramento;


-- Teste Simples

SELECT * FROM Usuario JOIN Empresa ON idEmpresa = fkEmpresa;


-- SELECTS (Com conceitos de relacionamentos de tabelas)

SELECT Usuario.nomeFuncionario, Empresa.nome AS nomeEmpresa
FROM Usuario
INNER JOIN Empresa ON Usuario.fkEmpresa = Empresa.idEmpresa;

SELECT Maquina.idMaquina, Maquina.modeloMaquina, Empresa.nome AS nomeEmpresa
FROM Maquina
INNER JOIN Empresa ON Maquina.fkEmpresa = Empresa.idEmpresa;

SELECT sensor.idSensor, sensor.modeloSensor, Maquina.modeloMaquina
FROM sensor
INNER JOIN Maquina ON sensor.fkMaquina = Maquina.idMaquina;

SELECT Monitoramento.idMonitoramento, Monitoramento.dataHoraLeva, Monitoramento.temperatura, Maquina.modeloMaquina
FROM Monitoramento
INNER JOIN Sensor ON Monitoramento.fkSensor = Sensor.idSensor
INNER JOIN Maquina ON Sensor.fkMaquina = Maquina.idMaquina;

drop database chocontrol;



