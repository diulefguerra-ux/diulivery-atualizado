<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="br.com.projeto.model.Prato" %>
<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Cardápio - Diulivery</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/estilo.css">
</head>
<body style="background-color: var(--fundo-creme); padding: 20px;">

    <div class="container">
        
        <div class="card-prato" style="max-width: 600px; margin: 0 auto 40px auto; padding: 30px; background: white; border-radius: 15px; box-shadow: 0 4px 15px rgba(0,0,0,0.1);">
            <header style="text-align: center; margin-bottom: 20px;">
                <h2 style="color: var(--laranja-vibrante);">🍔 Novo Item</h2>
            </header>
            
            <form action="PratoController" method="post">
                <label style="font-weight: bold;">Nome do Prato:</label>
                <input type="text" name="txtNome" placeholder="Ex: Pizza de Calabresa" required 
                       style="width: 100%; margin-bottom: 15px; padding: 10px; border-radius: 8px; border: 1px solid #ddd;">

                <div style="display: flex; gap: 15px; margin-bottom: 15px;">
                    <div style="flex: 1;">
                        <label style="font-weight: bold;">Preço (R$):</label>
                        <input type="number" step="0.01" name="txtPreco" placeholder="0.00" required 
                               style="width: 100%; padding: 10px; border-radius: 8px; border: 1px solid #ddd;">
                    </div>
                    <div style="flex: 1;">
                        <label style="font-weight: bold;">Categoria:</label>
                        <select name="txtCategoria" style="width: 100%; padding: 10px; border-radius: 8px; border: 1px solid #ddd; background: white;">
                            <option value="Hambúrgueres">Hambúrgueres</option>
                            <option value="Pizzas">Pizzas</option>
                            <option value="Bebidas">Bebidas</option>
                            <option value="Sobremesas">Sobremesas</option>
                        </select>
                    </div>
                </div>

                <label style="font-weight: bold;">Descrição:</label>
                <textarea name="txtDescricao" rows="2" required 
                          style="width: 100%; margin-bottom: 15px; padding: 10px; border-radius: 8px; border: 1px solid #ddd; font-family: 'Poppins';"></textarea>

                <button type="submit" class="btn-delivery" style="width: 100%; cursor: pointer;">✨ Cadastrar Item</button>
            </form>
            <div style="text-align: center; margin-top: 15px;">
                <a href="gerenciarCardapio.jsp" style="color: #666; text-decoration: none; font-size: 0.9em;">Voltar ao Cardápio</a>
            </div>
        </div>

        <h2 style="text-align: center; color: var(--laranja-vibrante); margin-bottom: 20px;">📋 Tabela de Controle</h2>
        <div class="card-prato" style="padding: 0; overflow: hidden; border-radius: 12px; background: white;">
            <table class="tabela-diulivery" style="width: 100%; border-collapse: collapse;">
                <thead style="background-color: var(--laranja-vibrante); color: white;">
                    <tr>
                        <th style="padding: 12px;">ID</th>
                        <th>Nome</th>
                        <th>Preço</th>
                        <th>Categoria</th>
                        <th>Ações</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<Prato> listaTabela = (List<Prato>) request.getAttribute("listaPratos");
                        if (listaTabela != null && !listaTabela.isEmpty()) {
                            for (Prato p : listaTabela) {
                    %>
                    <tr style="border-bottom: 1px solid #eee; text-align: center;">
                        <td style="padding: 10px;"><%= p.getIdprato() %></td>
                        <td style="font-weight: bold;"><%= p.getNome() %></td>
                        <td>R$ <%= String.format("%.2f", p.getPreco()) %></td>
                        <td>
                            <span style="background: #eee; padding: 4px 10px; border-radius: 15px; font-size: 0.85em;">
                                <%= (p.getCategoria() != null && p.getCategoria().getNomeCategoria() != null) 
                                    ? p.getCategoria().getNomeCategoria() : "Geral" %>
                            </span>
                        </td>
                        <td>
                            <a href="ExcluirPratoController?id=<%= p.getIdprato() %>" 
                               style="text-decoration: none;" onclick="return confirm('Excluir este item?')">🗑️</a>
                        </td>
                    </tr>
                    <% 
                            }
                        } else { 
                    %>
                    <tr>
                        <td colspan="5" style="padding: 30px; text-align: center; color: #999;">
                            Para ver a tabela atualizada, acesse pelo menu inicial. 🍔
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>