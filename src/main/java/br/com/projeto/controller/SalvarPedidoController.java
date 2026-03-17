package br.com.projeto.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import br.com.projeto.dao.PedidoDAO;

@WebServlet("/SalvarPedidoController")
public class SalvarPedidoController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        try {
            int idCliente = Integer.parseInt(request.getParameter("txtCliente"));
            int idPrato = Integer.parseInt(request.getParameter("txtPrato"));
            int quantidade = Integer.parseInt(request.getParameter("txtQtd"));
            String data = request.getParameter("txtData");

            PedidoDAO dao = new PedidoDAO();
            dao.registrarPedido(idCliente, idPrato, quantidade, data);

            // Redireciona para o controller que carrega a lista
            response.sendRedirect("ListarPedidosController");
        } catch (Exception e) {
            response.sendRedirect("cadastroPedido.jsp?erro=1");
        }
    }
}