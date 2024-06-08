var database = require("../database/config")

function autenticar(email, senha) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function entrar(): ", email, senha)
    var instrucaoSql = `
        SELECT idFuncionario, nome, email, fkEmpresa FROM funcionario WHERE email = '${email}' AND senha = '${senha}';
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

// Coloque os mesmos parâmetros aqui. Vá para a var instrucaoSql
// function cadastrar( nome,telefone, email, cnpj, cep, numero, complemento) {
//     console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar():", nome, email, );

// Insira exatamente a query do banco aqui, lembrando da nomenclatura exata nos valores
//  e na ordem de inserção dos dados.
//     var instrucaoSql = `
//     insert into Empresa (nome,telefone,email,cnpj,cep,numero,complemento) values 
//     ( '${nome}', '${telefone}','${email}', '${cnpj}','${cep}','${numero}','${complemento}');
//     `;
//     console.log("Executando a instrução SQL: \n" + instrucaoSql);
//     return database.executar(instrucaoSql);
// }



function cadastrar(nome, email, senha, empresaId) {


    // Insira exatamente a query do banco aqui, lembrando da nomenclatura exata nos valores
    //  e na ordem de inserção dos dados.
    var instrucaoSql = `
        INSERT INTO funcionario (nome, email,  senha, fkEmpresa) VALUES ('${nome}','${email}','${senha}','${empresaId}');
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}


function cadastrarMaquina(modeloMaquina, tipoCholocate, fkEmpresa) {


    // Insira exatamente a query do banco aqui, lembrando da nomenclatura exata nos valores
    //  e na ordem de inserção dos dados.
    var instrucaoSql = `
        INSERT INTO maquina (modeloMaquina,  saborChocolate, fkEmpresa) VALUES ('${modeloMaquina}','${tipoCholocate}','${fkEmpresa}');
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}



function aparecermaquina(fkempresa) {

    var instrucaoSql = `SELECT maquina.modelomaquina, maquina.saborchocolate, monitoramento.temperatura, maquina.fkempresa,  maquina.idmaquina FROM maquina AS maquina 
    left JOIN sensor AS sensor ON maquina.idmaquina = sensor.fkmaquina  LEFT JOIN monitoramento as monitoramento 
       ON sensor.idsensor = monitoramento.fksensor
           WHERE maquina.fkempresa = ${fkempresa};`

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);

}

module.exports = {
    autenticar,
    cadastrar,
    cadastrarMaquina,
    aparecermaquina

};