CREATE DATABASE chocontrol;
USE chocontrol;

CREATE TABLE empresa(
    empresaid INT PRIMARY KEY auto_increment
    ,nome VARCHAR(50) 
    ,telefone CHAR(14)
    ,email VARCHAR(256)
    ,cnpj CHAR(18) NOT NULL
    ,cep CHAR(9)
    ,numero VARCHAR(20)
    ,complemento VARCHAR(45)
)auto_increment = 1025;

CREATE TABLE funcionario(
    idfuncionario INT AUTO_INCREMENT
    ,nome VARCHAR(50)
    ,senha CHAR(8)
    ,email VARCHAR(256)
    ,foto VARCHAR(800)
    ,fkempresa INT 
    , FOREIGN KEY (fkempresa) REFERENCES empresa(empresaid)
    ,PRIMARY KEY (idfuncionario,fkempresa)
);


CREATE TABLE intervalotemperatura(
    idintervaloiemperatura INT PRIMARY KEY AUTO_INCREMENT
    ,temepraturamaxima DECIMAL(3,1)
    ,temperaturaminima DECIMAL(3,1)
);


CREATE TABLE maquina(
    idmaquina INT PRIMARY KEY
    ,modelomaquina VARCHAR(40)
    ,saborchocolate VARCHAR(30)
    ,fkempresa INT
    ,fkintervalotemperatura INT
    ,FOREIGN KEY (fkempresa) REFERENCES empresa(empresaid)
    ,FOREIGN KEY (fkintervalotemperatura) REFERENCES intervalotemperatura(idintervaloiemperatura)
);
    
CREATE TABLE sensor(
        idsensor INT PRIMARY KEY
        ,modelosensor VARCHAR(20)
        ,fkmaquina INT
        ,FOREIGN KEY (fkmaquina)REFERENCES maquina(idmaquina)
);


CREATE TABLE monitoramento (
    idmonitoramento INT PRIMARY KEY AUTO_INCREMENT 
    ,dthora timestamp not null default current_timestamp  
    ,temperatura DECIMAL(3,1)
    ,fksensor INT
    ,FOREIGN KEY (fksensor) REFERENCES sensor(idsensor)
);


-- alter table Monitoramento modify column dtHora timestamp not null default current_timestamp;

insert into sensor values (1, 'LM35', 1);
INSERT INTO empresa VALUES (03256841,'Cacau Show','(11)97114-5072','cacaushow@outlook.com','00000000000000','01414-001','2568',NULL);
insert into maquina values (1, 'aa', 'branco', '3256841', null);
insert into monitoramento (fkSensor) values (1);



select temperatura, dtHora from monitoramento join sensor on idSensor = fkSensor 
join maquina on fkMaquina = idMaquina
where idMaquina = 1;





