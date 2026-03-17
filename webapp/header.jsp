<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- header.jsp --%>
<%@ page import="br.com.projeto.model.Usuario" %>
<%
    Usuario userHeader = (Usuario) session.getAttribute("usuarioLogado");
%>

<header style="display: flex; justify-content: space-between; align-items: center; padding: 20px 40px; background: white; border-bottom: var(--borda-ilustracao); margin-bottom: 20px;">
    <div style="font-weight: bold; font-size: 1.5em; color: var(--laranja-vibrante);">🚀 Diulivery</div>
    
    <nav style="display: flex; gap: 20px; align-items: center;">
        <a href="index.jsp" style="text-decoration: none; color: var(--texto-escuro);">Início</a>
        <a href="gerenciarCardapio.jsp" style="text-decoration: none; color: var(--texto-escuro);">Cardápio</a>
        <a href="gerenciarClientes.jsp" style="text-decoration: none; color: var(--texto-escuro);">Clientes</a>
        
        <span style="font-size: 0.9em; background: #eee; padding: 5px 12px; border-radius: 20px;">
            Olá, <strong><%= (userHeader != null) ? userHeader.getNome() : "Usuário" %></strong>
        </span>
        <a href="LogoutController" style="color: #ff4d4d; text-decoration: none; font-weight: bold;">Sair</a>
    </nav>
</header>