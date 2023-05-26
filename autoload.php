<?php 

spl_autoload_register(function ($className) {
    // Diretório base onde estão localizadas as classes
    $baseDir = __DIR__ . '/';

    // Substitui os caracteres '\' por '/'
    $className = str_replace('\\', '/', $className);

    // Caminho completo para o arquivo da classe
    $filePath = $baseDir . $className . '.php';

    var_dump($filePath); // Verifica o caminho do arquivo

    // Restante do código do autoload
});
