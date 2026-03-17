package br.com.projeto.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import br.com.projeto.dao.ClienteDAO;
import br.com.projeto.model.Cliente;

@WebServlet("/AtualizarClienteController")
public class AtualizarClienteController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        // 1. Pegamos os dados que vêm do formulário (note os nomes txtNome, txtEmail...)
        int id = Integer.parseInt(request.getParameter("txtId"));
        String nome = request.getParameter("txtNome");
        String email = request.getParameter("txtEmail"); // Trocado CPF por Email
        String telefone = request.getParameter("txtTelefone");
        String endereco = request.getParameter("txtEndereco");

        // 2. Montamos o objeto Cliente com os novos dados
        Cliente cliente = new Cliente();
        cliente.setIdcliente(id);
        cliente.setNome(nome);
        cliente.setEmail(email); // Aqui estava o erro! Agora usamos setEmail
        cliente.setTelefone(telefone);
        cliente.setEndereco(endereco);

        // 3. Chamamos o DAO para fazer o UPDATE no banco
        ClienteDAO dao = new ClienteDAO();
        dao.atualizarCliente(cliente);

        // 4. Redirecionamos de volta para a lista de clientes
        response.sendRedirect("gerenciarClientes.jsp");
    }
}