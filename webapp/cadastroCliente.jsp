<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Novo Cliente - Diulivery</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/estilo.css">
</head>
<body>

    <div class="container" style="display: flex; justify-content: center; align-items: center; min-height: 80vh;">
        
        <div class="card-prato" style="width: 100%; max-width: 500px; padding: 40px;">
            
            <h2 style="color: var(--laranja-vibrante); margin-top: 0; text-align: center;">
                👤 Cadastro de Cliente
            </h2>
            <p style="text-align: center; font-size: 0.9em; margin-bottom: 25px;">
                Preencha os dados para entrega do pedido! 
            </p>

            <form action="SalvarClienteController" method="post">
                
                <label style="font-weight: bold;">Nome Completo:</label>
                <input type="text" name="txtNome" placeholder="Ex: Daniel Silva" required>

                <label style="font-weight: bold;">E-mail:</label>
                <input type="email" name="txtEmail" placeholder="daniel@email.com" required>

                <label style="font-weight: bold;">Telefone:</label>
                <input type="text" name="txtTelefone" placeholder="(71) 99999-9999">

                <label style="font-weight: bold;">Endereço de Entrega:</label>
                <textarea name="txtEndereco" rows="3" placeholder="Rua, Número, Bairro e Ponto de referência" required 
                          style="width: 100%; border: var(--borda-ilustracao); border-radius: 10px; padding: 10px; font-family: 'Poppins'; margin-bottom: 20px; box-sizing: border-box;"></textarea>

                <div style="display: flex; gap: 15px;">
                    <button type="submit" class="btn-delivery" style="flex: 2;">
                        ✅ Cadastrar
                    </button>
                    <a href="gerenciarClientes.jsp" class="btn-delivery" 
                       style="flex: 1; background-color: #999; text-decoration: none; text-align: center; display: flex; align-items: center; justify-content: center;">
                       Cancelar
                    </a>
                </div>
            </form>
        </div>
    </div>

</body>
</html>