<?php
// Habilitar a exibição de erros
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
require_once 'autoload.php';
// Incluir o arquivo do controlador
require_once 'Controller/ContratoController.php';

// Criar uma instância do controlador
$contratoController = new ContratoController();

// Chamar o método para exibir a lista de contratos
$contratoController->listarContratos();
