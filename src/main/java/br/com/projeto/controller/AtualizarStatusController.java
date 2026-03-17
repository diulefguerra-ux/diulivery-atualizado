package br.com.projeto.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import br.com.projeto.dao.PedidoDAO;

@WebServlet("/AtualizarStatusController")
public class AtualizarStatusController extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idParam = request.getParameter("id");
        String acao = request.getParameter("acao");
        
        if (idParam != null && acao != null) {
            int id = Integer.parseInt(idParam);
            PedidoDAO dao = new PedidoDAO();
            if ("entregar".equals(acao)) dao.atualizarStatus(id, "Entregue");
            else if ("cancelar".equals(acao)) dao.atualizarStatus(id, "Cancelado");
        }
        response.sendRedirect("ListarPedidosController");
    }
}