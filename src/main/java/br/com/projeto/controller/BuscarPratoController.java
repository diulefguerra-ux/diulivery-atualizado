package br.com.projeto.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import br.com.projeto.dao.PratoDAO;
import br.com.projeto.model.Prato;

@WebServlet("/BuscarPratoController")
public class BuscarPratoController extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        
        PratoDAO dao = new PratoDAO();
        Prato prato = dao.buscarPorId(id);
        
        // Coloca o prato na "memória" da requisição para o formulário ler
        request.setAttribute("prato", prato);
        
        // Manda para uma página de edição (vamos criar essa página já já)
        request.getRequestDispatcher("editarPrato.jsp").forward(request, response);
    }
}