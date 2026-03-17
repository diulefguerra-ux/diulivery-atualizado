<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="br.com.projeto.dao.ClienteDAO" %>
<%@ page import="br.com.projeto.dao.PratoDAO" %>
<%@ page import="br.com.projeto.model.Prato" %>
<%@ page import="br.com.projeto.model.Cliente" %> <%-- ADICIONADO ESTE IMPORT --%>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Novo Pedido - Diulivery</title>
    <link rel="stylesheet" type="text/css" href="css/estilo.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&display=swap" rel="stylesheet">
</head>
<body style="background-color: var(--fundo-creme); padding: 40px; font-family: 'Poppins', sans-serif;">

    <div class="container" style="display: flex; justify-content: center; align-items: center; min-height: 80vh;">
        
        <div class="card-prato" style="width: 100%; max-width: 550px; padding: 40px; background: white; border-radius: 15px; box-shadow: 0 4px 15px rgba(0,0,0,0.1);">
            
            <header style="text-align: center; margin-bottom: 30px;">
                <h2 style="color: var(--laranja-vibrante); margin: 0;">📝 Novo Pedido</h2>
                <p style="color: #666; font-size: 0.9em;">Selecione os dados registrados no banco</p>
            </header>
            
            <form action="SalvarPedidoController" method="post">
                
                <label style="font-weight: bold; display: block; margin-bottom: 5px;">Selecione o Cliente:</label>
                <select name="txtCliente" required style="width: 100%; margin-bottom: 15px; padding: 12px; border-radius: 8px; border: 1px solid #ddd; background: white;">
                    <option value="">-- Escolha um cliente --</option>
                    <%
                        ClienteDAO cDao = new ClienteDAO();
                        // CORREÇÃO AQUI: Mudado de String[] para Cliente
                        List<Cliente> clientes = cDao.listarClientes(); 
                        if(clientes != null) {
                            for(Cliente c : clientes) {
                    %>
                        <%-- CORREÇÃO AQUI: Usando os métodos do objeto Cliente --%>
                        <option value="<%= c.getIdcliente() %>"><%= c.getNome() %></option>
                    <%      } 
                        } 
                    %>
                </select>

                <label style="font-weight: bold; display: block; margin-bottom: 5px;">Selecione o Prato:</label>
                <select name="txtPrato" required style="width: 100%; margin-bottom: 15px; padding: 12px; border-radius: 8px; border: 1px solid #ddd; background: white;">
                    <option value="">-- Escolha um prato --</option>
                    <%
                        PratoDAO pDao = new PratoDAO();
                        List<Prato> pratos = pDao.listarTodos();
                        if(pratos != null) {
                            for(Prato p : pratos) {
                    %>
                        <option value="<%= p.getIdprato() %>"><%= p.getNome() %> (R$ <%= p.getPreco() %>)</option>
                    <%      }
                        }
                    %>
                </select>

                <div style="display: flex; gap: 15px; margin-bottom: 15px;">
                    <div style="flex: 1;">
                        <label style="font-weight: bold; display: block; margin-bottom: 5px;">Quantidade:</label>
                        <input type="number" name="txtQtd" value="1" min="1" required 
                               style="width: 100%; padding: 12px; border-radius: 8px; border: 1px solid #ddd;">
                    </div>
                    <div style="flex: 1;">
                        <label style="font-weight: bold; display: block; margin-bottom: 5px;">Data do Pedido:</label>
                        <input type="date" name="txtData" value="2026-03-16" required 
                               style="width: 100%; padding: 12px; border-radius: 8px; border: 1px solid #ddd; background: white;">
                    </div>
                </div>

                <div style="display: flex; gap: 10px; margin-top: 20px;">
                    <button type="submit" class="btn-delivery" style="flex: 2; cursor: pointer;">🚀 Finalizar Pedido</button>
                    <a href="index.jsp" class="btn-delivery" 
                       style="flex: 1; background-color: #95a5a6; text-decoration: none; text-align: center; display: flex; align-items: center; justify-content: center; color: white; border-radius: 8px; font-weight: bold;">
                       Voltar
                    </a>
                </div>
            </form>
        </div>
    </div>

</body>
</html>