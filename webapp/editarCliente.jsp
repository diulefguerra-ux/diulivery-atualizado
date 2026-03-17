<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="br.com.projeto.model.Cliente" %>
<%@ include file="header.jsp" %>

<%
    // Recupera o objeto cliente enviado pelo EditarClienteController
    Cliente c = (Cliente) request.getAttribute("cliente");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Editar Cliente - Diulivery</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/estilo.css">
</head>
<body>

    <div class="container" style="display: flex; justify-content: center; align-items: center; min-height: 80vh;">
        
        <div class="card-prato" style="width: 100%; max-width: 500px; padding: 40px;">
            
            <h2 style="color: var(--laranja-vibrante); margin-top: 0; text-align: center;">
                ✏️ Editar Cliente
            </h2>

            <% if (c != null) { %>
                <form action="AtualizarClienteController" method="post">
                    
                    <input type="hidden" name="txtId" value="<%= c.getIdcliente() %>">

                    <label style="font-weight: bold;">Nome Completo:</label>
                    <input type="text" name="txtNome" value="<%= c.getNome() %>" required>

                    <label style="font-weight: bold;">E-mail:</label>
                    <input type="email" name="txtEmail" value="<%= c.getEmail() %>" required>

                    <label style="font-weight: bold;">Telefone:</label>
                    <input type="text" name="txtTelefone" value="<%= (c.getTelefone() != null) ? c.getTelefone() : "" %>">

                    <label style="font-weight: bold;">Endereço de Entrega:</label>
                    <textarea name="txtEndereco" rows="3" required 
                              style="width: 100%; border: var(--borda-ilustracao); border-radius: 10px; padding: 10px; font-family: 'Poppins'; margin-bottom: 20px; box-sizing: border-box;"><%= (c.getEndereco() != null) ? c.getEndereco() : "" %></textarea>

                    <div style="display: flex; gap: 15px;">
                        <button type="submit" class="btn-delivery" style="flex: 2;">
                            💾 Salvar Alterações
                        </button>
                        <a href="gerenciarClientes.jsp" class="btn-delivery" 
                           style="flex: 1; background-color: #999; text-decoration: none; text-align: center; display: flex; align-items: center; justify-content: center;">
                           Cancelar
                        </a>
                    </div>
                </form>
            <% } else { %>
                <p style="text-align: center; color: red;">Erro: Cliente não encontrado.</p>
                <a href="gerenciarClientes.jsp">Voltar</a>
            <% } %>
        </div>
    </div>

</body>
</html>