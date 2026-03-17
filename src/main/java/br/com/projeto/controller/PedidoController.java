package br.com.projeto.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import br.com.projeto.dao.PedidoDAO;

@WebServlet("/PedidoController")
public class PedidoController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 1. Define a codificação para não dar erro em nomes com acento
        request.setCharacterEncoding("UTF-8");

        try {
            // 2. Captura os dados que vêm do cadastroPedido.jsp
            int idCliente = Integer.parseInt(request.getParameter("txtCliente"));
            int idPrato = Integer.parseInt(request.getParameter("txtPrato"));
            int quantidade = Integer.parseInt(request.getParameter("txtQtd"));
            String data = request.getParameter("txtData");

            // 3. Instancia o DAO e chama o método de registro
            PedidoDAO dao = new PedidoDAO();
            dao.registrarPedido(idCliente, idPrato, quantidade, data);

            // 4. Redireciona para o cardápio com um parâmetro de sucesso
            response.sendRedirect("gerenciarCardapio.jsp?sucesso=pedido");

        } catch (Exception e) {
            System.err.println("❌ Erro no Controller de Pedido: " + e.getMessage());
            e.printStackTrace();
            response.sendRedirect("cadastroPedido.jsp?erro=1");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("cadastroPedido.jsp");
    }
}