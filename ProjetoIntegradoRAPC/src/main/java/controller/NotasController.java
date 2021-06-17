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
import model.Turma;

import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "notasController", urlPatterns = {"/notasController", "/selectionDisc", "/registrar-frequencia"})
public class NotasController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static final String LIST_NOTA = "/listarNota";
    private final DisciplinaDao daoDisc;
    private final TurmaDao daoT;
    private final AlunoDao daoA;
    private final DesempenhoDao daoDesp;
    Desempenho desempenho = new Desempenho();

    public NotasController() {
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

        if (action.equals("/notasController")) {
            //Captando informações do banco para o Select

            try {
                request.setAttribute("turmas", daoT.getAllTurmas());
                request.setAttribute("Disciplinas", daoDisc.getAllDisciplinas());
            } catch (SQLException ex) {
                Logger.getLogger(ProfessorController.class.getName()).log(Level.SEVERE, null, ex);
            }
            request.getRequestDispatcher("/WEB-INF/jsp/registro/notas.jsp").forward(request, response);

        } else if (action.equalsIgnoreCase("ListNota")) {
            forward = LIST_NOTA;
            try {
                request.setAttribute("notas", daoDesp.getAllDesempenho());
            } catch (SQLException ex) {
                Logger.getLogger(NotasController.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (action.equals("/selectionDisc")) {
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
                temErro = true;
                request.setAttribute("erroDisciplina", "Disciplina não informada.");

            } else {
                codDisciplina = Integer.parseInt(request.getParameter("codDisciplina"));
            }
            if (codTurma != 0 && codDisciplina == 0) {

                try {
                    request.setAttribute("turmaD", daoT.recuperaListaTurmaDifer(codTurma));
                    request.setAttribute("turmaR", daoT.recuperaTurma(codTurma));
                    request.setAttribute("Disciplinas", daoDisc.getAllDisciplinas());
                    request.setAttribute("listaTurma", daoDesp.desempenhoPorTurma(codTurma));

                } catch (SQLException ex) {
                    Logger.getLogger(ProfessorController.class.getName()).log(Level.SEVERE, null, ex);
                }
                request.getRequestDispatcher("/WEB-INF/jsp/registro/notasValidacao1.jsp").forward(request, response);
            } else if (codDisciplina != 0 && codTurma == 0) {

                try {
                    request.setAttribute("turmas", daoT.getAllTurmas());
                    request.setAttribute("disciplinaR", daoDisc.recuperaDisci(codDisciplina));
                    request.setAttribute("discplinaD", daoDisc.recuperaListaDisciDifer(codDisciplina));

                } catch (SQLException ex) {
                    Logger.getLogger(ProfessorController.class.getName()).log(Level.SEVERE, null, ex);
                }
                request.getRequestDispatcher("/WEB-INF/jsp/registro/notasValidacao2.jsp").forward(request, response);
            } else if (codTurma == 0 && codDisciplina == 0) {

                try {
                    request.setAttribute("turmas", daoT.getAllTurmas());
                    request.setAttribute("Disciplinas", daoDisc.getAllDisciplinas());

                } catch (SQLException ex) {
                    Logger.getLogger(ProfessorController.class.getName()).log(Level.SEVERE, null, ex);
                }
                request.getRequestDispatcher("/WEB-INF/jsp/registro/notasValidacao.jsp").forward(request, response);
            } else {
                try {
                    request.setAttribute("turmaD", daoT.recuperaListaTurmaDifer(codTurma));
                    request.setAttribute("turmaR", daoT.recuperaTurma(codTurma));
                    request.setAttribute("listaTurmaDisciplina", daoDesp.desempenhoPorTurmaDisciplina(codTurma, codDisciplina));
                    request.setAttribute("disciplinaR", daoDisc.recuperaDisci(codDisciplina));
                    request.setAttribute("discplinaD", daoDisc.recuperaListaDisciDifer(codDisciplina));
                } catch (SQLException ex) {
                    Logger.getLogger(NotasController.class.getName()).log(Level.SEVERE, null, ex);
                }
                request.setAttribute("codTurma", codTurma);
                request.setAttribute("codDisciplina", codDisciplina);
                request.getRequestDispatcher("/WEB-INF/jsp/registro/notas2.jsp").forward(request, response);
            }
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        int cod_aluno;
        int codTurma;
        int codDisciplina;
        double nota1;
        double nota2;
        double nota3;
        double nota4;
        int qtdeTurma = 0;
        int qteOcoAluno = 0;

        boolean temErro = false;

        // VALIDAÇÕES
        if (request.getParameter("turmaCod") == null || request.getParameter("turmaCod").equals("")) {
            codTurma = 0;
            temErro = true;
            request.setAttribute("erroTurma", "Turma não informada.");
        } else {

            codTurma = Integer.parseInt(request.getParameter("turmaCod"));

        }
        if (request.getParameter("DisciplinaCod") == null || request.getParameter("DisciplinaCod").equals("")) {
            codDisciplina = 0;
            temErro = true;
            request.setAttribute("erroDisciplina", "Disciplina não informada.");
        } else {

            codDisciplina = Integer.parseInt(request.getParameter("DisciplinaCod"));

        }
        if (request.getParameter("nota1") == null || request.getParameter("nota1").equals("")) {
            nota1 = 0.0;

        } else {
            nota1 = (double) Double.parseDouble(request.getParameter("nota1"));

        }
        if (request.getParameter("nota2") == null || request.getParameter("nota2").equals("")) {
            nota2 = 0.0;
        } else {
            nota2 = (double) Double.parseDouble(request.getParameter("nota2"));

        }
        if (request.getParameter("nota3") == null || request.getParameter("nota3").equals("")) {
            nota3 = 0.0;
        } else {
            nota3 = (double) Double.parseDouble(request.getParameter("nota3"));

        }
        if (request.getParameter("nota4") == null || request.getParameter("nota4").equals("")) {
            nota4 = 0.0;
        } else {
            nota4 = (double) Double.parseDouble(request.getParameter("nota4"));

        }
        if (codTurma != 0) {

            try {
                request.setAttribute("turmaD", daoT.recuperaListaTurmaDifer(codTurma));
                request.setAttribute("turmaR", daoT.recuperaTurma(codTurma));
                request.setAttribute("Disciplinas", daoDisc.getAllDisciplinas());
                request.setAttribute("listaTurma", daoDesp.desempenhoPorTurma(codTurma));

            } catch (SQLException ex) {
                Logger.getLogger(ProfessorController.class.getName()).log(Level.SEVERE, null, ex);
            }

        } else if (codDisciplina != 0) {

            try {
                request.setAttribute("turmas", daoT.getAllTurmas());
                request.setAttribute("disciplinaR", daoDisc.recuperaDisci(codDisciplina));
                request.setAttribute("discplinaD", daoDisc.recuperaListaDisciDifer(codDisciplina));

            } catch (SQLException ex) {
                Logger.getLogger(ProfessorController.class.getName()).log(Level.SEVERE, null, ex);
            }
            request.getRequestDispatcher("/WEB-INF/jsp/registro/notasValidacao2.jsp").forward(request, response);
        } else if (codTurma == 0 && codDisciplina == 0) {

            try {
                request.setAttribute("turmas", daoT.getAllTurmas());
                request.setAttribute("Disciplinas", daoDisc.getAllDisciplinas());

            } catch (SQLException ex) {
                Logger.getLogger(ProfessorController.class.getName()).log(Level.SEVERE, null, ex);
            }
            request.getRequestDispatcher("/WEB-INF/jsp/registro/notasValidacao.jsp").forward(request, response);
        } else {
            try {
                request.setAttribute("turmaD", daoT.recuperaListaTurmaDifer(codTurma));
                request.setAttribute("turmaR", daoT.recuperaTurma(codTurma));
                request.setAttribute("listaTurmaDisciplina", daoDesp.desempenhoPorTurmaDisciplina(codTurma, codDisciplina));
                request.setAttribute("disciplinaR", daoDisc.recuperaDisci(codDisciplina));
                request.setAttribute("discplinaD", daoDisc.recuperaListaDisciDifer(codDisciplina));

            } catch (SQLException ex) {
                Logger.getLogger(NotasController.class.getName()).log(Level.SEVERE, null, ex);
            }
            request.setAttribute("codTurma", codTurma);
            request.setAttribute("codDisciplina", codDisciplina);
            request.getRequestDispatcher("/WEB-INF/jsp/registro/notas2.jsp").forward(request, response);
        }
        if (codTurma != 0 && codDisciplina != 0) {
            try {
                qtdeTurma = daoDesp.qteAlunoTurmaDisciplina(codTurma, codDisciplina);
            } catch (SQLException ex) {
                Logger.getLogger(NotasController.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            try {
                qtdeTurma = daoDesp.qteAlunoTurma(codTurma);
            } catch (SQLException ex) {
                Logger.getLogger(NotasController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        String[] codAlunoStr = request.getParameterValues("alunoCod");
        String[] nota1Str = request.getParameterValues("nota1");
        String[] nota2Str = request.getParameterValues("nota2");
        String[] nota3Str = request.getParameterValues("nota3");
        String[] nota4Str = request.getParameterValues("nota4");
        String[] disciplinaStr = request.getParameterValues("disciCod");

        for (int i = 0; i < qtdeTurma; i++) {

            cod_aluno = Integer.parseInt(codAlunoStr[i]);
            nota1 = (double) Double.parseDouble(nota1Str[i]);
            nota2 = (double) Double.parseDouble(nota2Str[i]);
            nota3 = (double) Double.parseDouble(nota3Str[i]);
            nota4 = (double) Double.parseDouble(nota4Str[i]);
            codDisciplina = Integer.parseInt(disciplinaStr[i]);
            try {
                Desempenho notas = new Desempenho(nota1, nota2, nota3, nota4);
                daoDesp.updateDesempenho(notas, codDisciplina, cod_aluno);
            } catch (SQLException ex) {
                Logger.getLogger(NotasController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        request.getRequestDispatcher("/WEB-INF/jsp/registro/notasSucesso.jsp").forward(request, response);
    }
}
