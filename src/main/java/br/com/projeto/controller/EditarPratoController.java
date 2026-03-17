package br.com.projeto.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import br.com.projeto.dao.PratoDAO;
import br.com.projeto.model.Prato;

@WebServlet("/EditarPratoController")
public class EditarPratoController extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Pega o ID da URL
        int id = Integer.parseInt(request.getParameter("id"));
        
        PratoDAO dao = new PratoDAO();
        Prato p = dao.buscarPorId(id);
        
        // Pendura o objeto prato na requisição para a JSP ler
        request.setAttribute("prato", p);
        request.getRequestDispatcher("editarPrato.jsp").forward(request, response);
    }
}