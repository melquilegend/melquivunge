<?php include 'includes/header.php'; ?>

<!-- Conteúdo específico da página contratos -->
<h1>Contratos</h1>
    <?php if (!empty($contratos)): ?>
        <table>
            <thead>
                <tr>
                    <th>Nome do Banco</th>
                    <th>Verba</th>
                    <th>Código do Contrato</th>
                    <th>Data de Inclusão</th>
                    <th>Valor</th>
                    <th>Prazo</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($contratos as $contrato): ?>
                    <tr>
                        <td><?php echo $contrato['nome_banco']; ?></td>
                        <td><?php echo $contrato['verba']; ?></td>
                        <td><?php echo $contrato['codigo']; ?></td>
                        <td><?php echo $contrato['data_inclusao']; ?></td>
                        <td><?php echo $contrato['valor']; ?></td>
                        <td><?php echo $contrato['prazo']; ?></td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    <?php else: ?>
        <p>Não há contratos para exibir.</p>
    <?php endif; ?>

<?php include 'includes/footer.php'; ?>
