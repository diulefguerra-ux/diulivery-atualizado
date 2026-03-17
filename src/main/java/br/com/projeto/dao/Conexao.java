package br.com.projeto.dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexao {
    public static Connection getConexao() {
        try {
            // Driver que descarregaste
            Class.forName("com.mysql.cj.jdbc.Driver");
            // URL: porta 3306 e o nome da base de dados 'diulivery'
            return DriverManager.getConnection("jdbc:mysql://localhost:3306/diulivery", "root", "12345678");
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}