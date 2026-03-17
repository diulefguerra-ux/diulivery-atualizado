package br.com.projeto.controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import br.com.projeto.dao.PedidoDAO;

@WebServlet("/ListarPedidosController")
public class ListarPedidosController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PedidoDAO dao = new PedidoDAO();
        
        // Busca os dados filtrados
        List<String[]> lista = dao.listarPedidosComStatus();
        double total = dao.calcularFaturamentoReal();
        
        // Envia para o JSP
        request.setAttribute("listaPedidos", lista);
        request.setAttribute("totalFaturamento", total);
        
        request.getRequestDispatcher("listaPedidos.jsp").forward(request, response);
    }
}