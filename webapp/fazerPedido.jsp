<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Novo Pedido - Diulivery</title>
    <style>
        body { font-family: sans-serif; background-color: #f4f4f4; display: flex; justify-content: center; padding: 50px; }
        .card { background: white; padding: 30px; border-radius: 8px; box-shadow: 0 4px 10px rgba(0,0,0,0.1); width: 450px; }
        h2 { color: #9b59b6; text-align: center; }
        label { display: block; margin-top: 15px; font-weight: bold; }
        select, input { width: 100%; padding: 10px; margin-top: 5px; border: 1px solid #ddd; border-radius: 4px; box-sizing: border-box; }
        .btn { background-color: #27ae60; color: white; border: none; padding: 12px; width: 100%; border-radius: 4px; cursor: pointer; margin-top: 20px; font-size: 16px; }
        .btn:hover { background-color: #219150; }
        .secao-cartao { border: 1px solid #9b59b6; padding: 15px; margin-top: 15px; border-radius: 4px; background-color: #fdfaf3; display: none; }
    </style>
</head>
<body>
    <div class="card">
        <h2>🍕 Novo Pedido</h2>
        <form action="SalvarPedidoController" method="post">
            
            <label>Selecione o Cliente:</label>
            <select name="idcliente" required>
                <c:forEach var="c" items="${listaClientes}">
                    <option value="${c.idcliente}">${c.nome}</option>
                </c:forEach>
            </select>

            <label>Selecione o Prato:</label>
            <select name="idprato" id="idprato" onchange="atualizarPreco()" required>
                <option value="">-- Escolha um prato --</option>
                <c:forEach var="p" items="${listaPratos}">
                    <option value="${p.idprato}" data-preco="${p.preco}">${p.nome} - R$ ${p.preco}</option>
                </c:forEach>
            </select>

            <input type="hidden" name="precoPrato" id="precoPrato">

            <label>Quantidade:</label>
            <input type="number" name="quantidade" min="1" value="1" required>

            <label>Observações do Prato:</label>
            <input type="text" name="observacao" placeholder="Ex: Sem cebola, caprichar no queijo...">

            <label>Endereço de Entrega:</label>
            <input type="text" name="enderecoEntrega" placeholder="Ex: Rua Bahia, 123 - Camaçari" required>

            <label>Forma de Pagamento:</label>
            <select name="formaPagamento" id="formaPagamento" onchange="toggleCartao()" required>
                <option value="Dinheiro">Dinheiro</option>
                <option value="Cartao">Cartão de Crédito/Débito</option>
            </select>

            <div id="secaoCartao" class="secao-cartao">
                <h4 style="margin: 0 0 10px 0; color: #9b59b6;">💳 Dados do Cartão</h4>
                
                <label>Nome no Cartão:</label>
                <input type="text" name="nomeCartao" id="nomeCartao">

                <label>Número do Cartão:</label>
                <input type="text" name="numeroCartao" id="numeroCartao" placeholder="0000 0000 0000 0000">

                <div style="display: flex; gap: 10px;">
                    <div style="flex: 1;">
                        <label>Bandeira:</label>
                        <input type="text" name="bandeira" placeholder="Visa/Master">
                    </div>
                    <div style="flex: 1;">
                        <label>Tipo:</label>
                        <select name="tipoCartao">
                            <option value="Credito">Crédito</option>
                            <option value="Debito">Débito</option>
                        </select>
                    </div>
                </div>

                <div style="display: flex; gap: 10px;">
                    <div style="flex: 1;">
                        <label>Validade:</label>
                        <input type="text" name="validade" placeholder="MM/AAAA">
                    </div>
                    <div style="flex: 1;">
                        <label>CVV:</label>
                        <input type="text" name="cvv" maxlength="4">
                    </div>
                </div>
            </div>

            <button type="submit" class="btn">Confirmar Pedido</button>
        </form>
        <br>
        <a href="index.jsp" style="text-decoration:none; color: #7f8c8d; display:block; text-align:center;">Cancelar</a>
    </div>

    <script>
        function atualizarPreco() {
            var select = document.getElementById("idprato");
            var preco = select.options[select.selectedIndex].getAttribute("data-preco");
            document.getElementById("precoPrato").value = preco;
        }

        function toggleCartao() {
            var forma = document.getElementById("formaPagamento").value;
            var secao = document.getElementById("secaoCartao");
            var camposObrigatorios = ["nomeCartao", "numeroCartao"];
            
            if (forma === "Cartao") {
                secao.style.display = "block";
                camposObrigatorios.forEach(id => document.getElementById(id).required = true);
            } else {
                secao.style.display = "none";
                camposObrigatorios.forEach(id => document.getElementById(id).required = false);
            }
        }
    </script>
</body>
</html>