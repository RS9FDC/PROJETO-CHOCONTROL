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

function cadastrar(req, res) {
    // Crie uma variável que vá recuperar os valores do arquivo cadastro.html
    var nome = req.body.nomeServer;
    var email = req.body.emailServer;
    // var senha = req.body.senhaServer;
    var empresaId = req.body.empresaServer;
    var telefone = req.body.telefoneServer;
    var cnpj = req.body.cnpjServer;
    var cep = req.body.cepServer;
    var numero = req.body.numeroServer;
    var complemento = req.body.complementoServer;


    // Faça as validações dos valores
    if (nome == undefined) {
        res.status(400).send("Seu nome está undefined!");
    } else if (email == undefined) {
        res.status(400).send("Seu email está undefined!");
    }
    // else if (senha == undefined) {
    //     res.status(400).send("Sua senha está undefined!");
    // } 
    // else if (empresaId == undefined) {
    //     res.status(400).send("Sua empresa está undefined!");

    // } 
    else if (telefone == undefined) {
        res.status(400).send("Sua empresa está undefined!");

    } else if (cnpj == undefined) {
        res.status(400).send("Sua empresa está undefined!");

    } else if (cep == undefined) {
        res.status(400).send("Sua empresa está undefined!");

    } else if (numero == undefined) {
        res.status(400).send("Sua empresa está undefined!");

    } else if (complemento == undefined) {
        res.status(400).send("Sua empresa está undefined!");

    }
    else {

        // Passe os valores como parâmetro e vá para o arquivo usuarioModel.js
        usuarioModel.cadastrar(nome, telefone, email, cnpj, cep, numero, complemento)
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


function cadastrarFunc(req, res) {
    console.log(req.body)
    console.log(req.file)

    // var senha = req.body.senhaServer;
    // var email = req.body.emailServer;


    // Se chegou até aqui, significa que o arquivo foi enviado
    const foto = req.file.filename;
    const { nome, email, senha } = req.body;
    const usuario = { nome, email, senha, foto };
    console.log(usuario)
    console.log(foto)

    // Faça as validações dos valores
    if (!foto || !nome || !email || !senha) {
        return res.status(400).send("Todos os campos são obrigatórios!");
    }
    else {

        // Passe os valores como parâmetro e vá para o arquivo usuarioModel.js
        usuarioModel.cadastrarFunc(usuario)
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
    cadastrarFunc
}