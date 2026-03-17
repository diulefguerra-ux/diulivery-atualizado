package br.com.projeto.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import br.com.projeto.dao.Conexao;

@WebServlet("/RecuperarSenhaController")
public class RecuperarSenhaController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        
        // Verifica se o e-mail existe na tabela usuario
        String sql = "SELECT nome FROM usuario WHERE email = ?";
        
        try (Connection conn = Conexao.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                // Simulação de envio (Para o relatório: e-mail validado com sucesso)
                request.setAttribute("mensagem", "Sucesso! Um link de recuperação foi enviado para: " + email);
            } else {
                request.setAttribute("erro", "O e-mail informado não foi encontrado.");
            }
            
            // Retorna para a mesma página para exibir o feedback
            request.getRequestDispatcher("recuperarSenha.jsp").forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp?erro=ErroInterno");
        }
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("recuperarSenha.jsp");
    }
}