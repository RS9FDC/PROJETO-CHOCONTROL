var express = require("express");
var router = express.Router();
// const upload = require('..//config/configUpload');
var usuarioController = require("../controllers/usuarioController");

//Recebendo os dados do html e direcionando para a função cadastrar de usuarioController.js
router.post("/cadastrar", function (req, res) {
    usuarioController.cadastrar(req, res);
})

router.post("/autenticar", function (req, res) {
    usuarioController.autenticar(req, res);
});

// // Rota para renderizar a página inicial
// router.get("", (req, res) => {
//     res.render("index");
// });


module.exports = router;