package br.com.projeto.controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import br.com.projeto.dao.PratoDAO;
import br.com.projeto.model.Prato;

@WebServlet("/ListarPratosController")
public class ListarPratosController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PratoDAO dao = new PratoDAO();
        List<Prato> lista = dao.listarPratos();
        request.setAttribute("listaPratos", lista);
        request.getRequestDispatcher("cadastroPrato.jsp").forward(request, response);
    }
}