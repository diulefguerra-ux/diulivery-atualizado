<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cardápio - Diulivery</title>
    <style>
        table { width: 80%; border-collapse: collapse; margin: 20px 0; }
        th, td { border: 1px solid #ddd; padding: 12px; text-align: left; }
        th { background-color: #f2f2f2; }
        .btn-excluir { color: red; cursor: pointer; }
    </style>
</head>
<body>
    <h2>📋 Cardápio Diulivery</h2>
    
    <table>
        <thead>
            <tr>
                <th>Nome</th>
                <th>Descrição</th>
                <th>Preço</th>
                <th>Ações</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="p" items="${listaPratos}">
                <tr>
                    <td>${p.nome}</td>
                    <td>${p.descricao}</td>
                    <td>R$ ${p.preco}</td>
                    <td>
                        <a href="BuscarPratoController?id=${p.idprato}">
                           <button type="button">Editar</button>
                        </a>
                        
                        <a href="ExcluirPratoController?id=${p.idprato}" 
                           onclick="return confirm('Tem certeza que deseja excluir o prato ${p.nome}?')">
                           <button type="button" class="btn-excluir">Excluir</button>
                        </a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <br>
    <a href="cadastroPrato.jsp">➕ Cadastrar Novo Prato</a>
</body>
</html>