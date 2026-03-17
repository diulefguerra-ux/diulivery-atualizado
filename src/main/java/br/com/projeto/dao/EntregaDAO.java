package br.com.projeto.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import br.com.projeto.model.Entrega;

public class EntregaDAO {
    public void agendarEntrega(Entrega entrega) {
        String sql = "INSERT INTO entrega (endereco_Entrega, data_Entrega, status_Entrega, pedido_idpedido) VALUES (?, CURDATE(), ?, ?)";
        
        try (Connection conn = Conexao.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, entrega.getEnderecoEntrega());
            stmt.setString(2, "Em processamento"); // Status inicial conforme o diagrama
            stmt.setInt(3, entrega.getPedido().getIdpedido());
            
            stmt.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
