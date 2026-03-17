package br.com.projeto.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import br.com.projeto.dao.PratoDAO;

@WebServlet("/ExcluirPratoController")
public class ExcluirPratoController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        // CORREÇÃO DO BUG DAS LETRAS: Força o uso de UTF-8 na requisição e na resposta
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        // 1. Pega o ID que veio pelo link da lixeira (?id=X)
        String idParam = request.getParameter("id");
        
        if (idParam != null && !idParam.isEmpty()) {
            try {
                int id = Integer.parseInt(idParam);
                
                // 2. Chama o DAO para remover do banco de dados
                PratoDAO dao = new PratoDAO();
                dao.excluirPrato(id);
                
                System.out.println("Prato ID " + id + " removido com sucesso!");
            } catch (NumberFormatException e) {
                System.out.println("Erro ao converter ID do prato: " + e.getMessage());
            } catch (Exception e) {
                System.out.println("Erro inesperado ao excluir: " + e.getMessage());
            }
        }
        
        // 3. Redireciona de volta para o cardápio
        response.sendRedirect(request.getContextPath() + "/gerenciarCardapio.jsp");
    }
}