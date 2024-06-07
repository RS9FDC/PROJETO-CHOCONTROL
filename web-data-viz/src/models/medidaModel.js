var database = require("../database/config");

function buscarUltimasMedidas(idMaquina, limite_linhas) {

    var instrucaoSql = `SELECT temperatura, 
     DATE_FORMAT (monitoramento.dtHora, '%H:%i:%s') AS momento
    FROM monitoramento JOIN sensor ON idsensor = fksensor 
    JOIN maquina ON fkmaquina = ${idMaquina}
    WHERE idMaquina = 1`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarMedidasEmTempoReal(idMaquina) {

    var instrucaoSql = `SELECT temperatura, 
    DATE_FORMAT (monitoramento.dtHora, '%H:%i:%s') AS momento
    FROM monitoramento JOIN sensor ON idsensor = fksensor 
    JOIN maquina ON fkmaquina = ${idMaquina}
    WHERE idmaquina = 1`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    buscarUltimasMedidas,
    buscarMedidasEmTempoReal
}
