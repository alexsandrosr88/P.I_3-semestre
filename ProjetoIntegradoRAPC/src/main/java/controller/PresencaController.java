/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.AlunoDao;
import dao.DesempenhoDao;
import dao.DisciplinaDao;
import dao.TurmaDao;
import model.Desempenho;


import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "presencaController", urlPatterns = {"/presenca", "/seletionPresenca"})
public class PresencaController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private final DisciplinaDao daoDisc;
    private final TurmaDao daoT;
    private final AlunoDao daoA;
    private final DesempenhoDao daoDesp;
    Desempenho desempenho = new Desempenho();

    public PresencaController() {
        daoT = new TurmaDao();
        daoDisc = new DisciplinaDao();
        daoA = new AlunoDao();
        daoDesp = new DesempenhoDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        boolean temErro = false;
        String forward = "";
        String action = request.getServletPath();

        if (action.equals("/presenca")) {
            //Captando informações do banco para o Select

            try {

                request.setAttribute("turmas", daoT.getAllTurmas());
                request.setAttribute("Disciplinas", daoDisc.getAllDisciplinas());
            } catch (SQLException ex) {
                Logger.getLogger(ProfessorController.class.getName()).log(Level.SEVERE, null, ex);
            }
            request.getRequestDispatcher("/WEB-INF/jsp/relatorio/boletim.jsp").forward(request, response);
        }
        if (action.equals("/seletionPresenca")) {

            int codTurma;
            int codDisciplina;

            if (request.getParameter("codTurma").equals("")) {
                codTurma = 0;
                temErro = true;
                request.setAttribute("erroTurma", "Turma não informada.");
            } else {
                codTurma = Integer.parseInt(request.getParameter("codTurma"));
            }
            if (request.getParameter("codDisciplina").equals("")) {
                codDisciplina = 0;
            } else {
                codDisciplina = Integer.parseInt(request.getParameter("codDisciplina"));
            }
            if (codTurma != 0 && codDisciplina == 0) {

                try {
                    request.setAttribute("turmaD", daoT.recuperaListaTurmaDifer(codTurma));
                    request.setAttribute("turmaR", daoT.recuperaTurma(codTurma));
                    request.setAttribute("Disciplinas", daoDisc.getAllDisciplinas());
                    request.setAttribute("listaTurma", daoDesp.turmaMedia(codTurma));

                } catch (SQLException ex) {
                    Logger.getLogger(ProfessorController.class.getName()).log(Level.SEVERE, null, ex);
                }
                request.getRequestDispatcher("/WEB-INF/jsp/relatorio/boletim2.jsp").forward(request, response);
            } else if (codTurma != 0 && codDisciplina != 0) {
                try {
                    request.setAttribute("turmaD", daoT.recuperaListaTurmaDifer(codTurma));
                    request.setAttribute("turmaR", daoT.recuperaTurma(codTurma));
                    request.setAttribute("disciplinaR", daoDisc.recuperaDisci(codDisciplina));
                    request.setAttribute("discplinaD", daoDisc.recuperaListaDisciDifer(codDisciplina));
                    request.setAttribute("listaTurma", daoDesp.turmaMediaDisciplina(codTurma, codDisciplina));

                } catch (SQLException ex) {
                    Logger.getLogger(ProfessorController.class.getName()).log(Level.SEVERE, null, ex);
                }
                request.getRequestDispatcher("/WEB-INF/jsp/relatorio/boletim3.jsp").forward(request, response);
            } else {
                try {

                    request.setAttribute("turmas", daoT.getAllTurmas());
                    request.setAttribute("Disciplinas", daoDisc.getAllDisciplinas());
                } catch (SQLException ex) {
                    Logger.getLogger(ProfessorController.class.getName()).log(Level.SEVERE, null, ex);
                }
                request.getRequestDispatcher("/WEB-INF/jsp/relatorio/boletim.jsp").forward(request, response);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

    }
}
