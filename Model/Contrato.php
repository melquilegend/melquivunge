<?php

require_once 'Database.php';

class Contrato {
    private $db;

    public function __construct() {
        $this->db = new Database();
    }

    public function listarRelacaoContratos()
    {
        $query = "SELECT Tb_banco.nome AS nome_banco, Tb_convenio.verba, Tb_contrato.codigo, Tb_contrato.data_inclusao, Tb_contrato.valor, Tb_contrato.prazo FROM Tb_contrato 
                  JOIN Tb_convenio_servico ON Tb_contrato.convenio_servico = Tb_convenio_servico.codigo
                  JOIN Tb_convenio ON Tb_convenio_servico.convenio = Tb_convenio.codigo
                  JOIN Tb_banco ON Tb_convenio.banco = Tb_banco.codigo";

        $stmt = $this->db->executeQuery($query);
        $relacaoContratos = $stmt->fetchAll(PDO::FETCH_ASSOC);
        
        return $relacaoContratos;
    }
}

?>
