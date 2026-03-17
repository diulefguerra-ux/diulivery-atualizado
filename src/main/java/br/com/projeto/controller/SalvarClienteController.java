package br.com.projeto.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import br.com.projeto.dao.ClienteDAO;
import br.com.projeto.model.Cliente;

@WebServlet("/SalvarClienteController")
public class SalvarClienteController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        // 1. Lendo os dados que vêm da cadastroCliente.jsp
        // Usamos os names: txtNome, txtEmail, txtTelefone, txtEndereco
        String nome = request.getParameter("txtNome");
        String email = request.getParameter("txtEmail"); 
        String telefone = request.getParameter("txtTelefone");
        String endereco = request.getParameter("txtEndereco");

        // 2. Criando o objeto Cliente e guardando as informações
        Cliente cliente = new Cliente();
        cliente.setNome(nome);
        cliente.setEmail(email); // Aqui corrigimos: setEmail no lugar de setCpf
        cliente.setTelefone(telefone);
        cliente.setEndereco(endereco);

        // 3. Enviando para o DAO salvar no MySQL
        ClienteDAO dao = new ClienteDAO();
        dao.adicionarCliente(cliente);

        // 4. Sucesso! Redireciona para a lista para ver o novo cliente lá
        response.sendRedirect("gerenciarClientes.jsp");
    }
}