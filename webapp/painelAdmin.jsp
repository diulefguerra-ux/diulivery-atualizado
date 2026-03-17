<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Painel Admin - Diulivery</title>
    <style>
        body { font-family: sans-serif; background-color: #f4f4f4; padding: 20px; }
        .container { background: white; padding: 20px; border-radius: 8px; box-shadow: 0 2px 5px rgba(0,0,0,0.1); }
        h2 { color: #9b59b6; text-align: center; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; background-color: white; }
        th, td { border: 1px solid #ddd; padding: 12px; text-align: left; }
        th { background-color: #9b59b6; color: white; }
        tr:nth-child(even) { background-color: #f9f9f9; }
        .faturamento { 
            font-size: 24px; 
            color: #27ae60; 
            font-weight: bold; 
            margin-bottom: 20px; 
            padding: 15px; 
            border: 2px solid #27ae60; 
            border-radius: 5px; 
            display: inline-block;
        }
        .obs-texto { color: #8e44ad; font-style: italic; font-size: 0.9em; }
        .btn-excluir { color: #e74c3c; text-decoration: none; font-weight: bold; }
        .btn-excluir:hover { text-decoration: underline; }
    </style>
</head>
<body>
    <div class="container">
        <h2>📊 Painel de Controle Administrativo - Diulivery</h2>
        
        <div class="faturamento">
            💰 Faturamento Total: R$ ${faturamento}
        </div>

        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Data</th>
                    <th>Cliente</th>
                    <th>Prato</th>
                    <th>Qtd</th>
                    <th>📝 Observações</th>
                    <th>📍 Endereço de Entrega</th>
                    <th>💳 Pagamento</th>
                    <th>Ações</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="item" items="${pedidos}">
                    <tr>
                        <td>${item.pedido.idpedido}</td>
                        <td>${item.pedido.data}</td>
                        <td>${item.pedido.cliente.nome}</td>
                        <td>${item.prato.nome}</td>
                        <td>${item.quantidade}</td>
                        <td class="obs-texto">${item.observacao != null ? item.observacao : "-"}</td> 
                        <td>${item.pedido.enderecoTemp}</td> 
                        <td>${item.pedido.pagamentoTemp}</td>
                        <td>
                            <a href="ExcluirPedidoController?id=${item.pedido.idpedido}" 
                               class="btn-excluir" 
                               onclick="return confirm('Deseja realmente excluir este pedido?')">❌ Excluir</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        
        <br>
        <hr>
        <a href="index.jsp" style="text-decoration:none; color: #7f8c8d; font-weight: bold;">⬅️ Voltar ao Menu Principal</a>
    </div>
</body>
</html>