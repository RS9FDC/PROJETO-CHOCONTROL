CREATE DATABASE chocontrol;

USE chocontrol;

CREATE TABLE tbEmpresa(
idEmpresa char(10) primary key,
nome varchar(50) not null,
telefone char(14)not null,
CNPJ char(22) unique not null,
email varchar(45) not null,
cep char(9) not null,
numero varchar(15) not null,
complemento varchar(45)
);


CREATE TABLE tbUsuario(
idUsuario char(12) primary key,
nomeFuncionario varchar(70) not null,
email varchar(70) not null,
senha varchar(30) not null,
fkEmpresa CHAR(10) not null,
constraint fkUsuarioEmpresa foreign key (fkEmpresa)
references tbEmpresa (idEmpresa)
);



CREATE TABLE tbMaquina(
idMaquina char(10) primary key,
modeloMaquina varchar(60) not null,
saborChocolate varchar(30),
fkEmpresa CHAR(10) not null,
constraint fkMaquinaEmpresa foreign key (fkEmpresa)
references tbEmpresa (idEmpresa)
);


CREATE TABLE tbSensor(
idSensor char(10) primary key,
modeloSensor varchar(45),
fkMaquina char(10) UNIQUE,
constraint fkSensorMaquina foreign key (fkMaquina)
references tbMaquina (idMaquina)
);


CREATE TABLE tbTemperatura(
	idTemperatura INT PRIMARY KEY AUTO_INCREMENT,
	temperatura decimal(5,2)
);
    
    
CREATE TABLE tbIntervalo (
idIntervaloTemperatura INT,
temperaturaMaxima DECIMAL (3,1),
temperaturaMinima DECIMAL (3,1),
fkSensor char(10) not null, 
constraint fkintervaloTemperaturaSensor foreign key (fkSensor)
references tbsensor (idSensor)
);



create table tbMonitoramento (
idMonitoramento char(10) primary key,
dataHoraLeva datetime,
picoTemperatura decimal(3,1),
fkSensor char(10) not null,
constraint fkMonitoramentoSensor foreign key (fkSensor)
references tbsensor (idSensor)
);



INSERT INTO tbEmpresa (idEmpresa, nome, telefone, CNPJ, email, cep, numero, complemento) VALUES
('EMP001', 'Empresa A', '(11) 5467-9872', '12345678901234','empresaA@example.com', '12345-678', '123', 'Bloco A'),
('EMP002', 'Empresa B', '(11) 2487-3106', '98765432109876', 'empresaB@example.com' ,'98765-432', '456', 'Bloco B');

INSERT INTO tbUsuario (idUsuario, nomeFuncionario, email, senha, fkEmpresa) VALUES
('FUNC001', 'João Silva', 'joao.silva@example.com', 'senha123', 'EMP001'),
('FUNC002', 'Maria Souza', 'maria.souza@example.com', 'senha321', 'EMP002');



-- Inserções na tabela Maquina
INSERT INTO tbMaquina (idMaquina, modeloMaquina, saborChocolate, fkEmpresa) VALUES
('MAQ001', 'Máquina 1', 'Ao leite', 'EMP001'),
('MAQ002', 'Máquina 2', 'Amargo', 'EMP002');

-- Inserções na tabela Sensor
INSERT INTO tbSensor (idSensor, modeloSensor, fkMaquina) VALUES
('SENSOR001', 'Sensor 1', 'MAQ001'),
('SENSOR002', 'Sensor 2', 'MAQ002');


INSERT INTO tbIntervalo (idIntervaloTemperatura, temperaturaMaxima, temperaturaMinima, fkSensor) VALUES
(1, 30.0, 20.0, 'SENSOR001'),
(2, 35.0, 25.0, 'SENSOR002');

-- Inserções na tabela Monitoramento
INSERT INTO tbMonitoramento (idMonitoramento, dataHoraLeva, picoTemperatura, fkSensor) VALUES
('MON001', '2024-04-21 08:00:00', 28.0, 'SENSOR001'),
('MON002', '2024-04-21 08:15:00', 30.0, 'SENSOR002');


select * from tbTemperatura;