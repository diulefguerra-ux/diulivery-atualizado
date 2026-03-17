package br.com.projeto.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import br.com.projeto.dao.PratoDAO;
import br.com.projeto.model.Prato;

@WebServlet("/AtualizarPratoController")
public class AtualizarPratoController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        // 1. Criamos o objeto Prato e preenchemos com os dados vindos do formulário
        Prato p = new Prato();
        
        try {
            // Os nomes dentro do getParameter devem ser IGUAIS ao "name" no formulário JSP
            p.setIdprato(Integer.parseInt(request.getParameter("txtId")));
            p.setNome(request.getParameter("txtNome"));
            p.setDescricao(request.getParameter("txtDescricao"));
            p.setPreco(Double.parseDouble(request.getParameter("txtPreco")));
            p.setImagemurl(request.getParameter("txtImagem"));

            // 2. Chamamos o DAO para fazer o UPDATE no MySQL
            PratoDAO dao = new PratoDAO();
            dao.atualizarPrato(p);
            
            System.out.println("Prato " + p.getNome() + " atualizado com sucesso!");

        } catch (Exception e) {
            System.out.println("Erro ao atualizar prato: " + e.getMessage());
            e.printStackTrace();
        }

        // 3. Redireciona de volta para o cardápio para ver as alterações
        response.sendRedirect(request.getContextPath() + "/gerenciarCardapio.jsp");
    }
}