package br.com.projeto.controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import br.com.projeto.dao.PedidoDAO;

@WebServlet("/PainelAdminController")
public class PainelAdminController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PedidoDAO dao = new PedidoDAO();

        // 1. Busca a lista de pedidos com os nomes de clientes e pratos
        List<String[]> listaPedidos = dao.listarPedidosComStatus();
        
        // 2. CORREÇÃO: Chama o método novo que criamos no DAO
        double faturamento = dao.calcularFaturamentoReal();

        // 3. Envia os dados para o JSP (painelAdmin.jsp)
        request.setAttribute("listaPedidos", listaPedidos);
        request.setAttribute("faturamento", faturamento);

        request.getRequestDispatcher("painelAdmin.jsp").forward(request, response);
    }
}