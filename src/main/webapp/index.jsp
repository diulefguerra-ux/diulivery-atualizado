<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="br.com.projeto.model.Usuario" %>
<%
    // Recupera o usuário que logou com sucesso no LoginController
    Usuario userLogado = (Usuario) session.getAttribute("usuarioLogado");
    
    // Se por acaso alguém tentar acessar sem logar, redireciona para o login
    if (userLogado == null) {
        response.sendRedirect("login.jsp");
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Diulivery - Painel Principal</title>
    
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/estilo.css">
    
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: var(--fundo-creme);
        }
        .botoes-container {
            display: flex;
            flex-direction: column;
            gap: 12px;
            margin-top: 20px;
        }
        .btn-delivery {
            display: block;
            text-decoration: none;
            text-align: center;
            transition: transform 0.2s;
        }
        .btn-delivery:hover {
            transform: scale(1.02);
        }
        .btn-sair {
            background-color: #ff4d4d !important; /* Vermelho para o botão sair */
            margin-top: 10px;
        }
    </style>
</head>
<body>

    <div style="position: absolute; top: 20px; right: 20px;">
        <a href="LogoutController" class="btn-delivery btn-sair" style="padding: 8px 15px; font-size: 0.8em;">
            Encerrar Sessão 🚪
        </a>
    </div>

    <div class="card-prato" style="width: 420px; padding: 40px; text-align: center; background: white;">
        
        <h1 style="color: var(--laranja-vibrante); margin-top: 0; font-size: 2.2em;">🚀 Diulivery</h1>
        
        <p style="margin-bottom: 5px;">Bem-vinda de volta,</p>
        <h2 style="margin-top: 0; color: var(--texto-escuro);">
            <%= (userLogado != null) ? userLogado.getNome() : "Diúle" %>!
        </h2>
        
        <div class="botoes-container">
            <a href="gerenciarCardapio.jsp" class="btn-delivery">🍔 Gerenciar Cardápio</a>
            <a href="gerenciarClientes.jsp" class="btn-delivery">👥 Gerenciar Clientes</a>
            
            <hr style="border: 0; border-top: 2px solid rgba(38, 38, 38, 0.1); margin: 15px 10px;">
            
            <a href="cadastroPedido.jsp" class="btn-delivery" style="background-color: var(--texto-escuro); color: white;">
                📝 Registrar Novo Pedido
            </a>
            <a href="ListarPedidosController" class="btn-delivery" style="background-color: transparent; color: var(--texto-escuro); border: 2px solid var(--texto-escuro);">
                📋 Ver Todos os Pedidos
            </a>
        </div>

    </div>

</body>
</html>