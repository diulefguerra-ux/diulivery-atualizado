package br.com.projeto.controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import br.com.projeto.dao.ClienteDAO;
import br.com.projeto.model.Cliente;

@WebServlet("/ListarClientesController")
public class ListarClientesController extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 1. Chama o DAO para buscar todos os clientes
        ClienteDAO dao = new ClienteDAO();
        List<Cliente> lista = dao.listarTodos();
        
        // 2. Guarda a lista na requisição para o JSP ler
        request.setAttribute("listaClientes", lista);
        
        // 3. Encaminha para a página JSP de listagem
        request.getRequestDispatcher("listaClientes.jsp").forward(request, response);
    }
}
