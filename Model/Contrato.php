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
    public function campos_agrupados()
        {
            $query = "SELECT Tb_banco.nome AS nome_banco, Tb_convenio.verba AS verba,
                    MIN(Tb_contrato.data_inclusao) AS data_inclusao_minima,
                    MAX(Tb_contrato.data_inclusao) AS data_inclusao_maxima,
                    SUM(Tb_contrato.valor) AS soma_valor_contratos
                    FROM Tb_contrato
                    JOIN Tb_convenio_servico ON Tb_contrato.convenio_servico = Tb_convenio_servico.codigo
                    JOIN Tb_convenio ON Tb_convenio_servico.convenio = Tb_convenio.codigo
                    JOIN Tb_banco ON Tb_convenio.banco = Tb_banco.codigo
                    GROUP BY Tb_banco.nome, Tb_convenio.verba";

            $stmt = $this->db->executeQuery($query);
            $campos_agrupados = $stmt->fetchAll(PDO::FETCH_ASSOC);

            return $campos_agrupados;
        }

}

?>
