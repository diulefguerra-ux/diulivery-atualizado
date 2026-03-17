package br.com.projeto.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import br.com.projeto.model.Prato;
import br.com.projeto.model.Categoria;

public class PratoDAO {

    // 1. Resolve: pDAO.listarTodos() e dao.listarPratos()
    public List<Prato> listarTodos() {
        return listarPratos();
    }

    public List<Prato> listarPratos() {
        List<Prato> lista = new ArrayList<>();
        String sql = "SELECT p.*, c.nome_Categoria FROM prato p " +
                     "LEFT JOIN categoria c ON p.idprato = c.prato_idprato";
        try (Connection conn = Conexao.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Prato p = new Prato();
                p.setIdprato(rs.getInt("idprato"));
                p.setNome(rs.getString("nome"));
                p.setDescricao(rs.getString("descricao"));
                p.setPreco(rs.getDouble("preco"));
                
                Categoria cat = new Categoria();
                cat.setNomeCategoria(rs.getString("nome_Categoria"));
                p.setCategoria(cat);
                lista.add(p);
            }
        } catch (Exception e) { e.printStackTrace(); }
        return lista;
    }

    // 2. Resolve: dao.adicionarPrato(p)
    public void adicionarPrato(Prato p) {
        String sqlPrato = "INSERT INTO prato (nome, descricao, preco) VALUES (?, ?, ?)";
        try (Connection conn = Conexao.getConexao()) {
            try (PreparedStatement stmtP = conn.prepareStatement(sqlPrato, Statement.RETURN_GENERATED_KEYS)) {
                stmtP.setString(1, p.getNome());
                stmtP.setString(2, p.getDescricao());
                stmtP.setDouble(3, p.getPreco());
                stmtP.executeUpdate();

                ResultSet rs = stmtP.getGeneratedKeys();
                if (rs.next()) {
                    int idNovoPrato = rs.getInt(1);
                    String sqlCat = "INSERT INTO categoria (nome_Categoria, prato_idprato) VALUES (?, ?)";
                    try (PreparedStatement stmtC = conn.prepareStatement(sqlCat)) {
                        stmtC.setString(1, p.getCategoria().getNomeCategoria());
                        stmtC.setInt(2, idNovoPrato);
                        stmtC.executeUpdate();
                    }
                }
            }
        } catch (Exception e) { e.printStackTrace(); }
    }

    // 3. Resolve: dao.buscarPorId(id)
    public Prato buscarPorId(int id) {
        Prato p = null;
        String sql = "SELECT p.*, c.nome_Categoria FROM prato p " +
                     "LEFT JOIN categoria c ON p.idprato = c.prato_idprato WHERE p.idprato = ?";
        try (Connection conn = Conexao.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    p = new Prato();
                    p.setIdprato(rs.getInt("idprato"));
                    p.setNome(rs.getString("nome"));
                    p.setDescricao(rs.getString("descricao"));
                    p.setPreco(rs.getDouble("preco"));
                    Categoria cat = new Categoria();
                    cat.setNomeCategoria(rs.getString("nome_Categoria"));
                    p.setCategoria(cat);
                }
            }
        } catch (Exception e) { e.printStackTrace(); }
        return p;
    }

    // 4. Resolve: dao.atualizarPrato(p)
    public void atualizarPrato(Prato p) {
        String sqlPrato = "UPDATE prato SET nome=?, descricao=?, preco=? WHERE idprato=?";
        String sqlCat = "UPDATE categoria SET nome_Categoria=? WHERE prato_idprato=?";
        try (Connection conn = Conexao.getConexao()) {
            try (PreparedStatement stmtP = conn.prepareStatement(sqlPrato)) {
                stmtP.setString(1, p.getNome());
                stmtP.setString(2, p.getDescricao());
                stmtP.setDouble(3, p.getPreco());
                stmtP.setInt(4, p.getIdprato());
                stmtP.executeUpdate();
            }
            try (PreparedStatement stmtC = conn.prepareStatement(sqlCat)) {
                stmtC.setString(1, p.getCategoria().getNomeCategoria());
                stmtC.setInt(2, p.getIdprato());
                stmtC.executeUpdate();
            }
        } catch (Exception e) { e.printStackTrace(); }
    }

    // 5. Resolve: dao.excluirPrato(id)
    public void excluirPrato(int id) {
        try (Connection conn = Conexao.getConexao()) {
            String sql1 = "DELETE FROM categoria WHERE prato_idprato = ?";
            String sql2 = "DELETE FROM prato WHERE idprato = ?";
            try (PreparedStatement st1 = conn.prepareStatement(sql1)) { st1.setInt(1, id); st1.executeUpdate(); }
            try (PreparedStatement st2 = conn.prepareStatement(sql2)) { st2.setInt(1, id); st2.executeUpdate(); }
        } catch (Exception e) { e.printStackTrace(); }
    }
}