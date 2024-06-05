
CREATE DATABASE chocontrol;
USE chocontrol;

CREATE TABLE Empresa(
	empresaId INT PRIMARY KEY auto_increment
    ,nome VARCHAR(50) 
    ,telefone CHAR(14)
    ,email VARCHAR(256)
    ,cnpj CHAR(18) NOT NULL
    ,cep CHAR(9)
    ,numero VARCHAR(20)
    ,complemento VARCHAR(45)
)auto_increment = 1025;

CREATE TABLE funcionario(
	idFuncionario CHAR(12)
    ,nome VARCHAR(50)
    ,senha CHAR(8)
    ,email VARCHAR(256)
	,foto VARCHAR(800)
    ,fkEmpresa INT 
    , FOREIGN KEY (fkEmpresa) REFERENCES Empresa(empresaId)
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
    ,fkEmpresa INT
    ,fkintervaloTemperatura INT
    ,FOREIGN KEY (fkEmpresa) REFERENCES Empresa(empresaId)
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


-- INSERT INTO Empresa VALUES ('3021AB12','Cacau Show','(11)97114-5072','cacaushow@outlook.com','00000000000000','01414-001','2568',NULL);
SELECT * FROM Empresa;
SELECT * FROM funcionario; 