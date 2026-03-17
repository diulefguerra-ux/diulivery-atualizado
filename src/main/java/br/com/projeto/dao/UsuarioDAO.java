package br.com.projeto.dao; // Ajustado para 'dao' minúsculo como no seu Conexao.java

import java.sql.*;
import br.com.projeto.model.Usuario;

public class UsuarioDAO {
    
    public Usuario autenticar(String email, String senha) {
        String sql = "SELECT * FROM usuario WHERE email = ? AND senha = ?";
        
        // Chamando o método exato: Conexao.getConexao()
        try (Connection conn = Conexao.getConexao(); 
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            if (conn == null) {
                System.out.println("Erro: A conexão com o banco falhou!");
                return null;
            }

            stmt.setString(1, email);
            stmt.setString(2, senha);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                Usuario u = new Usuario();
                u.setId(rs.getInt("idusuario"));
                u.setNome(rs.getString("nome"));
                u.setEmail(rs.getString("email"));
                return u;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null; 
    }
}
