<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login - Diulivery</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/estilo.css">
</head>
<body style="display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0;">

    <div class="card-prato" style="width: 350px; padding: 40px; text-align: center; background: white;">
        
        <h1 style="color: var(--laranja-vibrante); margin-bottom: 5px; font-size: 2.5em;">Diulivery</h1>
        <p style="margin-bottom: 30px; font-size: 0.9em; color: #555;">Gestão de pedidos e clientes</p>

        <%-- Mostra mensagem de erro se o login falhar --%>
        <% if(request.getAttribute("msg") != null) { %>
            <div style="background: #ffebee; color: #c62828; padding: 10px; border-radius: 8px; margin-bottom: 15px; font-size: 0.8em; border: 1px solid #ef9a9a;">
                <%= request.getAttribute("msg") %>
            </div>
        <% } %>

        <form action="LoginController" method="post">
            <input type="email" name="email" placeholder="E-mail de acesso" required 
                   style="width: 100%; padding: 12px; margin-bottom: 15px; border: var(--borda-ilustracao); border-radius: 10px; box-sizing: border-box;">
            
            <input type="password" name="senha" placeholder="Sua senha" required 
                   style="width: 100%; padding: 12px; margin-bottom: 20px; border: var(--borda-ilustracao); border-radius: 10px; box-sizing: border-box;">
            
            <button type="submit" class="btn-delivery" style="width: 100%;">Entrar no Sistema</button>
        </form>
        
        <div style="margin-top: 25px; display: flex; flex-direction: column; gap: 10px;">
             <a href="recuperarSenha.jsp" style="color: var(--laranja-vibrante); text-decoration: none; font-size: 0.85em; font-weight: bold;">Esqueceu a senha?</a>
             <hr style="border: 0; border-top: 1px solid #eee; width: 100%;">
             <span style="font-size: 0.8em; color: #888;">Ainda não tem acesso? Contate a Tatiane.</span>
        </div>
    </div>

</body>
</html>