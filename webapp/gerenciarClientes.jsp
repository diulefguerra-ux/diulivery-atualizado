<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="br.com.projeto.model.Cliente" %>
<%@ page import="br.com.projeto.dao.ClienteDAO" %>
<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Clientes - Diulivery</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/estilo.css">
</head>
<body>

<div class="container">
    <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 30px; margin-top: 20px;">
        <h1 style="color: var(--laranja-vibrante);">👥 Gestão de Clientes</h1>
        <a href="cadastroCliente.jsp" class="btn-delivery" style="text-decoration: none;">+ Novo Cliente</a>
    </div>

    <div class="card-prato" style="padding: 0; overflow: hidden; border-radius: 12px; box-shadow: 0 4px 15px rgba(0,0,0,0.1);">
        <table class="tabela-diulivery" style="width: 100%; border-collapse: collapse;">
            <thead style="background-color: var(--laranja-vibrante); color: white;">
                <tr>
                    <th style="padding: 15px;">ID</th>
                    <th>Nome</th>
                    <th>E-mail</th>
                    <th>Telefone</th>
                    <th style="text-align: center;">Ações</th>
                </tr>
            </thead>
            <tbody>
                <%
                    // Buscando a lista atualizada (agora com telefone incluso no DAO)
                    ClienteDAO dao = new ClienteDAO();
                    List<Cliente> lista = dao.listarTodos();
                    
                    if (lista != null && !lista.isEmpty()) {
                        for (Cliente c : lista) {
                %>
                <tr style="border-bottom: 1px solid #eee; text-align: center;">
                    <td style="padding: 12px; font-weight: bold;"><%= c.getIdcliente() %></td>
                    <td><%= c.getNome() %></td>
                    <td><%= c.getEmail() %></td>
                    
                    <%-- Tratamento para não exibir 'null' na tela --%>
                    <td style="color: <%= (c.getTelefone() == null) ? "#999" : "#333" %>;">
                        <%= (c.getTelefone() != null && !c.getTelefone().isEmpty()) ? c.getTelefone() : "---" %>
                    </td>
                    
                    <td style="padding: 10px; text-align: center;">
                        <a href="${pageContext.request.contextPath}/EditarClienteController?id=<%= c.getIdcliente() %>" 
                           title="Editar" style="text-decoration:none; font-size: 1.2em;">✏️</a>
                        
                        <a href="${pageContext.request.contextPath}/ExcluirClienteController?id=<%= c.getIdcliente() %>" 
                           title="Excluir" 
                           onclick="return confirm('Tem certeza que deseja excluir o cliente <%= c.getNome() %>?')" 
                           style="text-decoration:none; margin-left:15px; font-size: 1.2em;">🗑️</a>
                    </td>
                </tr>
                <% 
                        } 
                    } else { 
                %>
                <tr>
                    <td colspan="5" style="text-align: center; padding: 40px; color: #666;">
                        Nenhum cliente cadastrado ainda. 🍔
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
    
    <div style="margin-top: 20px; text-align: center;">
        <a href="index.jsp" style="color: #666; text-decoration: none; font-weight: bold;">🏠 Voltar ao Início</a>
    </div>
</div>

</body>
</html>