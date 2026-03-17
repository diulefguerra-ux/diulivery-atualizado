<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista de Clientes - Diulivery</title>
    <style>
        table { width: 90%; border-collapse: collapse; margin: 20px 0; }
        th, td { border: 1px solid #ddd; padding: 12px; text-align: left; }
        th { background-color: #f2f2f2; }
        .btn-excluir { color: red; cursor: pointer; }
        button { cursor: pointer; }
    </style>
</head>
<body>
    <h2>👥 Clientes Cadastrados</h2>
    
    <table>
        <thead>
            <tr>
                <th>Nome</th>
                <th>CPF</th>
                <th>Telefone</th>
                <th>Endereço</th>
                <th>Ações</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="c" items="${listaClientes}">
                <tr>
                    <td>${c.nome}</td>
                    <td>${c.cpf}</td>
                    <td>${c.telefone}</td>
                    <td>${c.endereco}</td>
                    <td>
                        <a href="BuscarClienteController?id=${c.idcliente}">
                           <button type="button">Editar</button>
                        </a>

                        <a href="ExcluirClienteController?id=${c.idcliente}" 
                           onclick="return confirm('Excluir cliente ${c.nome}?')">
                           <button type="button" class="btn-excluir">Excluir</button>
                        </a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <br>
    <a href="cadastroCliente.jsp">➕ Cadastrar Novo Cliente</a> | 
    <a href="index.jsp">🏠 Início</a>
</body>
</html>