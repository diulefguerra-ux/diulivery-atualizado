package br.com.projeto.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import br.com.projeto.dao.ClienteDAO;

@WebServlet("/ExcluirClienteController")
public class ExcluirClienteController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        // 1. Pega o ID que veio pelo link da tabela
        String idParam = request.getParameter("id");
        
        if (idParam != null && !idParam.isEmpty()) {
            try {
                int id = Integer.parseInt(idParam);
                
                // 2. Chama o DAO para deletar o registro no MySQL
                ClienteDAO dao = new ClienteDAO();
                dao.excluirCliente(id);
                
                System.out.println("Cliente com ID " + id + " excluído com sucesso!");
            } catch (NumberFormatException e) {
                System.out.println("Erro ao converter ID para exclusão: " + e.getMessage());
            }
        }
        
        // 3. Redireciona de volta para a tela de gestão
        // Usamos o contextPath para garantir que o redirecionamento não falhe
        response.sendRedirect(request.getContextPath() + "/gerenciarClientes.jsp");
    }
}