<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Recuperar Senha - Diulivery</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/estilo.css">
</head>
<body style="display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; background-color: #fdf5e6;">

    <div class="card-prato" style="width: 400px; padding: 40px; text-align: center; background: white; border-radius: 15px; box-shadow: 0 4px 15px rgba(0,0,0,0.1);">
        <h2 style="color: #ff6600; margin-bottom: 10px;">Esqueceu a senha?</h2>
        
        <% if(request.getAttribute("mensagem") != null) { %>
            <p style="color: green; font-weight: bold;"><%= request.getAttribute("mensagem") %></p>
        <% } %>
        <% if(request.getAttribute("erro") != null) { %>
            <p style="color: red; font-weight: bold;"><%= request.getAttribute("erro") %></p>
        <% } %>

        <p style="margin-bottom: 25px; font-size: 0.9em; color: #666;">
            Informe seu e-mail e enviaremos as instruções para você.
        </p>

        <form action="${pageContext.request.contextPath}/RecuperarSenhaController" method="post">
            <input type="email" name="email" placeholder="Seu e-mail cadastrado" required 
                   style="width: 100%; padding: 12px; margin-bottom: 20px; border: 1px solid #ddd; border-radius: 10px; box-sizing: border-box;">
            
            <button type="submit" style="width: 100%; background: #ff6600; color: white; border: none; padding: 12px; border-radius: 10px; cursor: pointer; font-weight: bold;">
                Enviar Link de Recuperação
            </button>
        </form>
        
        <div style="margin-top: 20px;">
             <a href="login.jsp" style="color: #333; text-decoration: none; font-size: 0.8em; font-weight: bold;">← Voltar para o Login</a>
        </div>
    </div>
</body>
</html>