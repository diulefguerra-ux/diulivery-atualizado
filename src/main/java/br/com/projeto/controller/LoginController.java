package br.com.projeto.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

// Importando suas classes de modelo e banco
import br.com.projeto.model.Usuario;
import br.com.projeto.dao.UsuarioDAO;

@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 1. Pega os dados que você digitou na tela laranja
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");

        // 2. Chama o DAO para verificar no MySQL
        UsuarioDAO dao = new UsuarioDAO();
        Usuario user = dao.autenticar(email, senha);

        if (user != null) {
            // SUCESSO: Cria uma sessão para o servidor "lembrar" de você
            HttpSession sessao = request.getSession();
            sessao.setAttribute("usuarioLogado", user);
            
            // Te leva para a Index com fundo creme e bordas pretas
            response.sendRedirect("index.jsp");
        } else {
            // ERRO: Volta para o login e avisa que algo deu errado
            request.setAttribute("msg", "E-mail ou senha incorretos! Tente novamente.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Se alguém tentar acessar o link direto, mandamos de volta para o login
        response.sendRedirect("login.jsp");
    }
}