package br.com.projeto.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession; // Esta linha resolve o erro da Session

@WebServlet("/LogoutController")
public class LogoutController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Pega a sessão atual
        HttpSession session = request.getSession();
        
        // Invalida a sessão (limpa os dados do usuário logado)
        session.invalidate();
        
        // Manda de volta para a tela de login
        response.sendRedirect("login.jsp");
    }
}