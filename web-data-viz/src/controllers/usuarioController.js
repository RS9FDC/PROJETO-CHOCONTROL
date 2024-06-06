var usuarioModel = require("../models/usuarioModel");
var aquarioModel = require("../models/aquarioModel");

function autenticar(req, res) {
    var email = req.body.emailServer;
    var senha = req.body.senhaServer;

    if (email == undefined) {
        res.status(400).send("Seu email está undefined!");
    } else if (senha == undefined) {
        res.status(400).send("Sua senha está indefinida!");
    } else {

        usuarioModel.autenticar(email, senha)
            .then(
                function (resultadoAutenticar) {
                    console.log(`\nResultados encontrados: ${resultadoAutenticar.length}`);
                    console.log(`Resultados: ${JSON.stringify(resultadoAutenticar)}`); // transforma JSON em String

                    if (resultadoAutenticar.length == 1) {
                        console.log(resultadoAutenticar);



                        res.json({
                            // empresaId: resultadoAutenticar[0].empresaId,
                            email: resultadoAutenticar[0].email,
                            nome: resultadoAutenticar[0].nome,
                            fkEmpresa: resultadoAutenticar[0].fkEmpresa,
                            // senha: resultadoAutenticar[0].senha,

                        });


                    } else if (resultadoAutenticar.length == 0) {
                        res.status(403).send("Email e/ou senha inválido(s)");
                    } else {
                        res.status(403).send("Mais de um usuário com o mesmo login e senha!");
                    }
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log("\nHouve um erro ao realizar o login! Erro: ", erro.sqlMessage);
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }

}

// function cadastrar(req, res) {
//     // Crie uma variável que vá recuperar os valores do arquivo cadastro.html
//     var nome = req.body.nomeServer;
//     var email = req.body.emailServer;
//     // var senha = req.body.senhaServer;
//     var empresaId = req.body.empresaServer;
//     var telefone = req.body.telefoneServer;
//     var cnpj = req.body.cnpjServer;
//     var cep =req.body.cepServer;
//     var numero =req.body.numeroServer;
//     var complemento =req.body.complementoServer;
   

//     // Faça as validações dos valores
//     if (nome == undefined) {
//         res.status(400).send("Seu nome está undefined!");
//     } else if (email == undefined) {
//         res.status(400).send("Seu email está undefined!");
//     } 
//     // else if (senha == undefined) {
//     //     res.status(400).send("Sua senha está undefined!");
//     // } 
//     // else if (empresaId == undefined) {
//     //     res.status(400).send("Sua empresa está undefined!");
        
//     // } 
//     else if (telefone == undefined) {
//         res.status(400).send("Sua empresa está undefined!");
        
//     }else if (cnpj == undefined) {
//         res.status(400).send("Sua empresa está undefined!");
        
//     }else if (cep == undefined) {
//         res.status(400).send("Sua empresa está undefined!");
        
//     }else if (numero == undefined) {
//         res.status(400).send("Sua empresa está undefined!");
        
//     }else if (complemento == undefined) {
//         res.status(400).send("Sua empresa está undefined!");
        
//     }
//     else {

//         // Passe os valores como parâmetro e vá para o arquivo usuarioModel.js
//         usuarioModel.cadastrar(nome,telefone,email,cnpj,cep,numero,complemento )
//             .then(
//                 function (resultado) {
//                     res.json(resultado);
//                 }
//             ).catch(
//                 function (erro) {
//                     console.log(erro);
//                     console.log(
//                         "\nHouve um erro ao realizar o cadastro! Erro: ",
//                         erro.sqlMessage
//                     );
//                     res.status(500).json(erro.sqlMessage);
//                 }
//             );
//     }
// }


function cadastrar(req, res) {
    // Crie uma variável que vá recuperar os valores do arquivo cadastro.html
    var nome = req.body.nomeServer;
    var email = req.body.emailServer;
    var senha = req.body.senhaServer;
    var empresaId = req.body.empresaServer;

    // Faça as validações dos valores
    if (nome == undefined) {
        res.status(400).send("Seu nome está undefined!");
    } else if (email == undefined) {
        res.status(400).send("Seu email está undefined!");
    } else if (senha == undefined) {
        res.status(400).send("Sua senha está undefined!");
    } else if (empresaId == undefined) {
        res.status(400).send("Sua empresa está undefined!");
    } else {

        // Passe os valores como parâmetro e vá para o arquivo usuarioModel.js
        usuarioModel.cadastrar(nome, email, senha, empresaId)
            .then(
                function (resultado) {
                    res.json(resultado);
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log(
                        "\nHouve um erro ao realizar o cadastro! Erro: ",
                        erro.sqlMessage
                    );
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }
}



function cadastrarMaquina(req, res) {
    // Crie uma variável que vá recuperar os valores do arquivo cadastro.html
    var tipoCholocate = req.body.tipoCholocateServer;
    var modeloMaquina = req.body.modeloMaquinaServer
    var fkEmpresa = req.body.fkEmpresa
   

    // Faça as validações dos valores
    if (tipoCholocate == undefined) {
        res.status(400).send("Seu nome está undefined!");
    }else if (modeloMaquina == undefined) {
        res.status(400).send("Seu email está undefined!");
    }else if (fkEmpresa == undefined) {
        res.status(400).send("Seu email está undefined!");
    }  else {

        // Passe os valores como parâmetro e vá para o arquivo usuarioModel.js
        usuarioModel.cadastrarMaquina(modeloMaquina,tipoCholocate,fkEmpresa)
            .then(
                function (resultado) {
                    res.json(resultado);
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log(
                        "\nHouve um erro ao realizar o cadastro! Erro: ",
                        erro.sqlMessage
                    );
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }
}

module.exports = {
    autenticar,
    cadastrar,
    cadastrarMaquina
}