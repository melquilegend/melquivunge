<?php

class Database {
    private $host = 'localhost';
    private $username = 'root';
    private $password = '';
    private $dbname = 'contratos_bd';
    private $conn;

    public function __construct() {
        $this->conn = $this->connect();
    }

    private function connect() {
        $conn = new PDO("mysql:host={$this->host};dbname={$this->dbname}", $this->username, $this->password);
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        return $conn;
    }

    public function executeQuery($query, $params = []) {
        $stmt = $this->conn->prepare($query);
        $stmt->execute($params);
        return $stmt;
    }

    // Outros métodos para realizar operações no banco de dados, como inserção, atualização, exclusão, etc.
}

?>
