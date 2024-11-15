/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;
import model.Filme;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;


@WebServlet(name = "CadFilme", urlPatterns = {"/CadFilme"})
@MultipartConfig
public class CadFilme extends HttpServlet {
    
    private String statusSQL;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        
        String sHTML = "";
        String Modal = "";

        HttpSession session = request.getSession(true);
        if (String.valueOf(session.getAttribute("nome")) == null) 
            response.sendRedirect("./login.html");
        
        statusSQL = "Entrou no serverlet";
        
        Filme film = new Filme(); // Instancia o objeto Usuario
        film.nome = request.getParameter("nomeFilme");
/* Código para trazer a requisição do arquivo e colocar na objeto user */
        Part part = request.getPart("arquivoCapa");
        if(part != null){
        InputStream arquivoCapa = part.getInputStream();
        film.capatamanho = part.getSize();
        film.capa = arquivoCapa; }
        
        Part part2 = request.getPart("arquivoBanner");
        if(part != null){
        InputStream arquivoBanner = part.getInputStream();
        film.bannertamanho = part.getSize();
        film.banner = arquivoBanner; }
/* Código para trazer a requisição do arquivo e colocar na objeto user */
        if (request.getParameter("oper") != null) {
           statusSQL = film.nome + film.sinopse + film.bannerimagemBase64 + film.banner + film.banner + film.bannerimagemBase64 + film.capaimagemBase64 + film.banner;
            film.incluirFilme();
            if (film.statusSQL == null) {
                statusSQL = "Registro Alterado com Sucesso !";
            }}
        
        
        if (request.getParameter("deletar") != null) {
            film.deletar();
            session.invalidate();
            statusSQL = "Você deletou seu usuário, sua sessão foi fechada!";}

        
        
        
        try (PrintWriter out = response.getWriter()) {
            sHTML = "<!DOCTYPE html>"
                    + "<html><head><title>Cadastro de Usuários</title>"
                    + "</head><body style=\"background-color: black;\">"
                    + " <center style=\"color: white;\" > "+ statusSQL+ "<center> </body>"
                    + "<script>window.open('./Home.jsp');</script></html>";
                    out.print(sHTML);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
