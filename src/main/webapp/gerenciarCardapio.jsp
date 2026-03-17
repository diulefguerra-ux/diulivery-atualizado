<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="br.com.projeto.model.Prato" %>
<%@ page import="br.com.projeto.dao.PratoDAO" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Cardápio - Diulivery</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/estilo.css">
</head>
<body style="background-color: var(--fundo-creme); padding: 40px;">

    <div style="max-width: 1000px; margin: 0 auto;">
        <header style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 40px;">
            <h1 style="color: var(--laranja-vibrante); margin: 0;">🍴 Cardápio Diulivery</h1>
            <a href="index.jsp" style="text-decoration: none; color: var(--texto-escuro); font-weight: bold;">← Voltar ao Início</a>
        </header>

        <div style="display: grid; grid-template-columns: repeat(auto-fill, minmax(280px, 1fr)); gap: 25px;">
            <%
                // Busca direta para garantir que o F5 funcione
                PratoDAO dao = new PratoDAO();
                List<Prato> lista = dao.listarTodos();
                
                if (lista != null && !lista.isEmpty()) {
                    for (Prato p : lista) {
            %>
                <div class="card-prato" style="background: white; padding: 20px; border-radius: 15px; box-shadow: 0 4px 15px rgba(0,0,0,0.05); display: flex; flex-direction: column; justify-content: space-between;">
                    <div>
                        <span style="font-size: 0.7em; background: #ffe8d6; color: var(--laranja-vibrante); padding: 3px 8px; border-radius: 5px; text-transform: uppercase; font-weight: bold;">
                            <%= (p.getCategoria() != null && p.getCategoria().getNomeCategoria() != null) 
                                ? p.getCategoria().getNomeCategoria() : "Geral" %>
                        </span>
                        
                        <h2 style="margin: 10px 0; font-size: 1.3em;"><%= p.getNome() %></h2>
                        <p style="color: #666; font-size: 0.9em; height: 50px; overflow: hidden;"><%= p.getDescricao() %></p>
                    </div>

                    <div style="margin-top: 15px; display: flex; justify-content: space-between; align-items: center;">
                        <span style="color: var(--laranja-vibrante); font-weight: bold; font-size: 1.1em;">
                            R$ <%= String.format("%.2f", p.getPreco()) %>
                        </span>
                        <div>
                            <a href="EditarPratoController?id=<%= p.getIdprato() %>" title="Editar" style="text-decoration: none; margin-right: 10px;">✏️</a>
                            <a href="ExcluirPratoController?id=<%= p.getIdprato() %>" title="Excluir" style="text-decoration: none;" onclick="return confirm('Excluir este item?')">🗑️</a>
                        </div>
                    </div>
                </div>
            <% 
                    } 
                } else { 
            %>
                <div style="grid-column: 1 / -1; text-align: center; padding: 40px;">
                    <p style="color: #999;">Nenhum item cadastrado no cardápio.</p>
                </div>
            <% } %>
        </div>

        <div style="margin-top: 40px; text-align: center;">
            <a href="ListarPratosController" class="btn-delivery" style="text-decoration: none; display: inline-block;">+ Adicionar Novo Prato</a>
        </div>
    </div>
</body>
</html>