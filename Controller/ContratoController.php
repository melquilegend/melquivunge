<?php

require_once 'Model/Contrato.php';

class ContratoController {
    public function listarContratos() {
        // Lógica para obter os dados dos contratos do modelo (Contrato) e passá-los para a visualização (contratos.php)
        $contratoModel = new Contrato();
        $contratos = $contratoModel->listarRelacaoContratos();

        include 'View/contratos.php';
    }

    // Outros métodos para manipular os contratos, como adicionar, editar, excluir, etc.
}

?>
