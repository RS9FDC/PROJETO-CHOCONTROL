CREATE DATABASE chocontrol;

USE chocontrol;

CREATE TABLE tbEmpresa(
idEmpresa char(10) primary key,
nome varchar(50) not null,
telefone char(14),
CNPJ char(14) unique not null,
cep char(9),
numero varchar(45),
complemento varchar(45)
);


CREATE TABLE tbUsuario(
idUsuario char(12) primary key,
senhaUsuario varchar(50) not null,
nomeFuncionario varchar(70) not null,
email varchar(70) not null,
DatNasc date not null,
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
	idTemperatura INT PRIMARY KEY AUTO_INCREMENT
	,temperatura decimal(5,2)
);
    
    
CREATE TABLE tbIntervalo (
idIntervaloTemperatura INT,
temperaturaMaxima DECIMAL (3,1),
temperaturaMinima DECIMAL (3,1),
fkSensor char(10) not null, 
constraint fkintervaloTemperaturaSensor foreign key (fkSensor)
references tbsensor (idSensor)
);



create table Monitoramento (
idMonitoramento char(10) primary key,
dataHoraLeva datetime,
picoTemperatura decimal(3,1),
fkSensor char(10) not null,
constraint fkMonitoramentoSensor foreign key (fkSensor)
references tbsensor (idSensor)
);



INSERT INTO tbEmpresa (idEmpresa, nome, telefone, CNPJ, cep, numero, complemento) VALUES
('EMP001', 'Empresa A', '1234567890', '12345678901234', '12345-678', '123', 'Bloco A'),
('EMP002', 'Empresa B', '0987654321', '98765432109876', '98765-432', '456', 'Bloco B');

INSERT INTO Usuario (idUsuario, senhaUsuario, nomeFuncionario, email, DatNasc, fkEmpresa) VALUES
('FUNC001', 'senha123', 'João Silva', 'joao.silva@example.com', '1990-05-15', 'EMP001'),
('FUNC002', 'abc@123', 'Maria Souza', 'maria.souza@example.com', '1985-10-20', 'EMP002');



-- Inserções na tabela Maquina
INSERT INTO Maquina (idMaquina, modeloMaquina, saborChocolate, fkEmpresa) VALUES
('MAQ001', 'Máquina 1', 'Ao leite', 'EMP001'),
('MAQ002', 'Máquina 2', 'Amargo', 'EMP002');

-- Inserções na tabela Sensor
INSERT INTO Sensor (idSensor, modeloSensor, fkMaquina) VALUES
('SENSOR001', 'Sensor 1', 'MAQ001'),
('SENSOR002', 'Sensor 2', 'MAQ002');


INSERT INTO intervaloTemperatura (idIntervaloTemperatura, temperaturaMaxima, temperaturaMinima, fkSensor) VALUES
(1, 30.0, 20.0, 'SENSOR001'),
(2, 35.0, 25.0, 'SENSOR002');

-- Inserções na tabela Monitoramento
INSERT INTO Monitoramento (idMonitoramento, dataHoraLeva, picoTemperatura, fkSensor) VALUES
('MON001', '2024-04-21 08:00:00', 28.0, 'SENSOR001'),
('MON002', '2024-04-21 08:15:00', 30.0, 'SENSOR002');


select * from tbTemperatura;