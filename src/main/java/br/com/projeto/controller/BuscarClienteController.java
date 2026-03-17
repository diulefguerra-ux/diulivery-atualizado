package br.com.projeto.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import br.com.projeto.dao.ClienteDAO;
import br.com.projeto.model.Cliente;

@WebServlet("/BuscarClienteController")
public class BuscarClienteController extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 1. Pega o ID que veio do link da tabela
        int id = Integer.parseInt(request.getParameter("id"));
        
        // 2. Busca o cliente completo no banco
        ClienteDAO dao = new ClienteDAO();
        Cliente cliente = dao.buscarPorId(id);
        
        // 3. Pendura o cliente na "mochila" (request) e leva para a página de editar
        request.setAttribute("cliente", cliente);
        request.getRequestDispatcher("editarCliente.jsp").forward(request, response);
    }
}
