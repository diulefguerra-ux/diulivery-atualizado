package br.com.projeto.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import br.com.projeto.model.Pedido;

public class PedidoDAO {

    public void atualizarStatus(int id, String status) {
        String sql = "UPDATE pedido SET status_pedido = ? WHERE idpedido = ?";
        try (Connection conn = Conexao.getConexao(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, status);
            stmt.setInt(2, id);
            stmt.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }

    public void excluirPedidoSimples(int id) {
        String sql = "DELETE FROM pedido WHERE idpedido = ?";
        try (Connection conn = Conexao.getConexao(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }

    public List<String[]> listarPedidosComStatus() {
        List<String[]> lista = new ArrayList<>();
        String sql = "SELECT p.idpedido, c.nome_cliente, pr.nome, p.status_pedido FROM pedido p " +
                     "JOIN cliente c ON p.cliente_idcliente = c.idcliente JOIN prato pr ON p.prato_idprato = pr.idprato";
        try (Connection conn = Conexao.getConexao(); PreparedStatement stmt = conn.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                lista.add(new String[]{String.valueOf(rs.getInt(1)), rs.getString(2), rs.getString(3), rs.getString(4)});
            }
        } catch (Exception e) { e.printStackTrace(); }
        return lista;
    }

    public double calcularFaturamentoReal() {
        double total = 0;
        String sql = "SELECT SUM(pr.preco) FROM pedido p JOIN prato pr ON p.prato_idprato = pr.idprato WHERE p.status_pedido != 'Cancelado'";
        try (Connection conn = Conexao.getConexao(); PreparedStatement stmt = conn.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) total = rs.getDouble(1);
        } catch (Exception e) { e.printStackTrace(); }
        return total;
    }

    public void registrarPedido(int idCli, int idPra, int qtd, String data) {
        String sql = "INSERT INTO pedido (cliente_idcliente, prato_idprato, status_pedido) VALUES (?, ?, ?)";
        try (Connection conn = Conexao.getConexao(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idCli); stmt.setInt(2, idPra); stmt.setString(3, "Pendente");
            stmt.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }
}