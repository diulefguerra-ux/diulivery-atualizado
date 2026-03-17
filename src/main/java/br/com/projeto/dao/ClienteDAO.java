package br.com.projeto.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import br.com.projeto.model.Cliente;

public class ClienteDAO {

    public List<Cliente> listarClientes() {
        return listarTodos();
    }

    public List<Cliente> listarTodos() {
        List<Cliente> lista = new ArrayList<>();
        // SQL com todas as colunas necessárias
        String sql = "SELECT idcliente, nome_cliente, email, telefone FROM cliente";
        try (Connection conn = Conexao.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Cliente c = new Cliente();
                c.setIdcliente(rs.getInt("idcliente"));
                c.setNome(rs.getString("nome_cliente"));
                c.setEmail(rs.getString("email"));
                c.setTelefone(rs.getString("telefone")); 
                lista.add(c);
            }
        } catch (Exception e) { 
            System.err.println("Erro ao listar clientes: " + e.getMessage());
        }
        return lista;
    }

    public void adicionarCliente(Cliente c) {
        String sql = "INSERT INTO cliente (nome_cliente, email, telefone) VALUES (?, ?, ?)";
        try (Connection conn = Conexao.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, c.getNome());
            stmt.setString(2, c.getEmail());
            stmt.setString(3, c.getTelefone());
            stmt.executeUpdate();
        } catch (Exception e) { 
            System.err.println("Erro ao adicionar cliente: " + e.getMessage());
        }
    }

    public Cliente buscarPorId(int id) {
        Cliente c = null;
        String sql = "SELECT * FROM cliente WHERE idcliente = ?";
        try (Connection conn = Conexao.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    c = new Cliente();
                    c.setIdcliente(rs.getInt("idcliente"));
                    c.setNome(rs.getString("nome_cliente"));
                    c.setEmail(rs.getString("email"));
                    c.setTelefone(rs.getString("telefone"));
                }
            }
        } catch (Exception e) { e.printStackTrace(); }
        return c;
    }

    public void atualizarCliente(Cliente c) {
        String sql = "UPDATE cliente SET nome_cliente=?, email=?, telefone=? WHERE idcliente=?";
        try (Connection conn = Conexao.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, c.getNome());
            stmt.setString(2, c.getEmail());
            stmt.setString(3, c.getTelefone());
            stmt.setInt(4, c.getIdcliente());
            stmt.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }

    public void excluirCliente(int id) {
        String sql = "DELETE FROM cliente WHERE idcliente = ?";
        try (Connection conn = Conexao.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }
}