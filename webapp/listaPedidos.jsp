<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Gestão de Pedidos - Diulivery</title>
    <link rel="stylesheet" type="text/css" href="css/estilo.css">
</head>
<body style="background-color: #f8f9fa; padding: 20px; font-family: 'Poppins', sans-serif;">

    <div style="max-width: 900px; margin: auto; background: white; padding: 30px; border-radius: 12px; box-shadow: 0 4px 10px rgba(0,0,0,0.1);">
        <h2 style="color: #e67e22;">📊 Dashboard de Pedidos</h2>
        
        <div style="background: #27ae60; color: white; padding: 15px; border-radius: 8px; margin-bottom: 20px;">
            <h3 style="margin: 0;">Faturamento Real: R$ <%= request.getAttribute("totalFaturamento") %></h3>
        </div>

        <table style="width: 100%; border-collapse: collapse;">
            <thead>
                <tr style="background: #eee; text-align: left;">
                    <th style="padding: 10px; border-bottom: 2px solid #ddd;">ID</th>
                    <th style="padding: 10px; border-bottom: 2px solid #ddd;">Cliente</th>
                    <th style="padding: 10px; border-bottom: 2px solid #ddd;">Prato</th>
                    <th style="padding: 10px; border-bottom: 2px solid #ddd;">Status</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<String[]> pedidos = (List<String[]>) request.getAttribute("listaPedidos");
                    if (pedidos != null) {
                        for (String[] p : pedidos) {
                %>
                    <tr>
                        <td style="padding: 10px; border-bottom: 1px solid #eee;"><%= p[0] %></td>
                        <td style="padding: 10px; border-bottom: 1px solid #eee;"><%= p[1] %></td>
                        <td style="padding: 10px; border-bottom: 1px solid #eee;"><%= p[2] %></td>
                        <td style="padding: 10px; border-bottom: 1px solid #eee;">
                            <span style="padding: 5px 10px; border-radius: 20px; font-size: 0.8em; background: #f39c12; color: white;">
                                <%= p[3] %>
                            </span>
                        </td>
                    </tr>
                <% 
                        }
                    } 
                %>
            </tbody>
        </table>
        
        <div style="margin-top: 20px;">
            <a href="cadastroPedido.jsp" style="text-decoration: none; background: #e67e22; color: white; padding: 10px 20px; border-radius: 5px; font-weight: bold;">+ Novo Pedido</a>
            <a href="index.jsp" style="margin-left: 10px; color: #666;">Voltar ao Início</a>
        </div>
    </div>
</body>
</html>