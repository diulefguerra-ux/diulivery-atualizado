<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="br.com.projeto.model.Prato" %>
<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Editar Prato - Diulivery</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/estilo.css">
</head>
<body style="background-color: var(--fundo-creme); padding: 40px;">

    <% 
        // Recupera o prato que o EditarPratoController enviou
        Prato p = (Prato) request.getAttribute("prato"); 
    %>

    <div class="container" style="display: flex; justify-content: center; align-items: center; min-height: 70vh;">
        
        <div class="card-prato" style="width: 100%; max-width: 500px; padding: 40px; background: white; border-radius: 15px; box-shadow: 0 4px 15px rgba(0,0,0,0.1);">
            
            <h2 style="color: var(--laranja-vibrante); margin-top: 0; text-align: center;">
                ✏️ Editar Item
            </h2>

            <% if (p != null) { %>
                <form action="AtualizarPratoController" method="post">
                    
                    <input type="hidden" name="txtId" value="<%= p.getIdprato() %>">

                    <label style="font-weight: bold; display: block; margin-bottom: 5px;">Nome do Prato:</label>
                    <input type="text" name="txtNome" value="<%= p.getNome() %>" required style="width: 100%; margin-bottom: 15px; padding: 10px; border-radius: 8px; border: 1px solid #ddd;">

                    <label style="font-weight: bold; display: block; margin-bottom: 5px;">Preço (R$):</label>
                    <input type="number" step="0.01" name="txtPreco" value="<%= p.getPreco() %>" required style="width: 100%; margin-bottom: 15px; padding: 10px; border-radius: 8px; border: 1px solid #ddd;">

                    <label style="font-weight: bold; display: block; margin-bottom: 5px;">Descrição:</label>
                    <textarea name="txtDescricao" rows="3" required style="width: 100%; margin-bottom: 15px; padding: 10px; border-radius: 8px; border: 1px solid #ddd; font-family: 'Poppins';"><%= p.getDescricao() %></textarea>

                    <label style="font-weight: bold; display: block; margin-bottom: 5px;">URL da Imagem:</label>
                    <input type="text" name="txtImagem" value="<%= (p.getImagemurl() != null) ? p.getImagemurl() : "" %>" style="width: 100%; margin-bottom: 25px; padding: 10px; border-radius: 8px; border: 1px solid #ddd;">

                    <div style="display: flex; gap: 15px;">
                        <button type="submit" class="btn-delivery" style="flex: 2; cursor: pointer;">
                            💾 Atualizar
                        </button>
                        <a href="gerenciarCardapio.jsp" class="btn-delivery" 
                           style="flex: 1; background-color: #999; text-decoration: none; text-align: center; display: flex; align-items: center; justify-content: center;">
                           Voltar
                        </a>
                    </div>
                </form>
            <% } else { %>
                <div style="text-align: center;">
                    <p style="color: red;">Ops! Prato não encontrado.</p>
                    <a href="gerenciarCardapio.jsp" class="btn-delivery" style="text-decoration: none;">Voltar ao Cardápio</a>
                </div>
            <% } %>
        </div>
    </div>

</body>
</html>