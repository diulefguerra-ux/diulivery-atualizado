package br.com.projeto.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import br.com.projeto.dao.ClienteDAO;
import br.com.projeto.model.Cliente;

@WebServlet("/EditarClienteController")
public class EditarClienteController extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        
        ClienteDAO dao = new ClienteDAO();
        Cliente cliente = dao.buscarPorId(id);
        
        request.setAttribute("cliente", cliente);
        request.getRequestDispatcher("editarCliente.jsp").forward(request, response);
    }
}