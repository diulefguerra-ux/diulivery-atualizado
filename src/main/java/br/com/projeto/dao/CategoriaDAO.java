package br.com.projeto.dao;

import java.sql.*;
import java.util.*;
import br.com.projeto.model.Categoria;

public class CategoriaDAO {
    public List<Categoria> listarCategorias() {
        List<Categoria> lista = new ArrayList<>();
        String sql = "SELECT * FROM categoria";
        try (Connection conn = Conexao.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Categoria cat = new Categoria();
                cat.setIdCategoria(rs.getInt("idcategoria"));
                cat.setNomeCategoria(rs.getString("nome_Categoria"));
                lista.add(cat);
            }
        } catch (Exception e) { e.printStackTrace(); }
        return lista;
    }
}