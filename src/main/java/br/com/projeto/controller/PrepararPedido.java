package br.com.projeto.controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.projeto.dao.ClienteDAO;
import br.com.projeto.dao.PratoDAO;
import br.com.projeto.model.Cliente;
import br.com.projeto.model.Prato;

@WebServlet("/PrepararPedidoController") 
public class PrepararPedido extends HttpServlet { 
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            ClienteDAO cDAO = new ClienteDAO();
            PratoDAO pDAO = new PratoDAO();

            List<Cliente> listaClientes = cDAO.listarTodos();
            List<Prato> listaPratos = pDAO.listarTodos();

            // Verifique esses números no Console do Eclipse após clicar no botão!
            System.out.println("DEBUG - Clientes encontrados: " + (listaClientes != null ? listaClientes.size() : "null"));
            System.out.println("DEBUG - Pratos encontrados: " + (listaPratos != null ? listaPratos.size() : "null"));

            request.setAttribute("listaClientes", listaClientes);
            request.setAttribute("listaPratos", listaPratos);

            // CORREÇÃO: O nome do arquivo agora está igual ao seu (fazerPedido.jsp)
            request.getRequestDispatcher("fazerPedido.jsp").forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}