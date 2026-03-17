package br.com.projeto.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import br.com.projeto.model.Prato;
import br.com.projeto.model.Categoria;
import br.com.projeto.dao.PratoDAO;

@WebServlet("/PratoController")
public class PratoController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        
        try {
            // 1. Captura os dados exatamente como estão no seu JSP
            String nome = request.getParameter("txtNome");
            String desc = request.getParameter("txtDescricao");
            String precoStr = request.getParameter("txtPreco");
            String nomeCategoria = request.getParameter("txtCategoria"); 

            Prato p = new Prato();
            p.setNome(nome);
            p.setDescricao(desc);
            
            if (precoStr != null && !precoStr.isEmpty()) {
                p.setPreco(Double.parseDouble(precoStr.replace(",", ".")));
            } else {
                p.setPreco(0.0);
            }
            
            // 2. Monta a Categoria (O DAO precisa do Nome para o seu diagrama)
            Categoria c = new Categoria();
            c.setNomeCategoria(nomeCategoria != null ? nomeCategoria : "Geral");
            p.setCategoria(c); 

            // 3. Salva no Banco
            PratoDAO dao = new PratoDAO();
            dao.adicionarPrato(p);

            // 4. AQUI ESTAVA O ERRO: Redireciona para o LISTAR, não para o JSP
            // Isso força o sistema a buscar o que acabou de ser salvo
            response.sendRedirect("ListarPratosController");

        } catch (Exception e) {
            e.printStackTrace();
            // Se der erro, volta para o cadastro com sinal de erro
            response.sendRedirect("cadastroPrato.jsp?erro=1");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // No GET também mandamos listar para não vir tabela vazia
        response.sendRedirect("ListarPratosController");
    }
}