package controller;

import dao.AlunoDao;
import dao.TurmaDao;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "AssociarAluno", urlPatterns = {"/associarAluno", "/selection"})
public class AssociarAluno extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static final String LIST_NOTA = "/listarNota";
    private final TurmaDao daoT;
    private final AlunoDao daoA;

    public AssociarAluno() {
        daoT = new TurmaDao();
        daoA = new AlunoDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        boolean temErro = false;
        String forward = "";

        String action = request.getServletPath();

        if (action.equals("/associarAluno")) {
            //Captando informações do banco para o Select
            try {
                request.setAttribute("turmas", daoT.getAllTurmas());
                request.setAttribute("aluno", daoA.alunoSemTurma());
            } catch (SQLException ex) {
                Logger.getLogger(ProfessorController.class.getName()).log(Level.SEVERE, null, ex);
            }
            request.getRequestDispatcher("/WEB-INF/jsp/aluno/associar.jsp").forward(request, response);
        }
        if (action.equals("/selection")) {
            int codTurma;
            int codAluno;

            if (request.getParameter("codTurma").equals("") || request.getParameter("codTurma") == null) {
                codTurma = 0;
                temErro = true;
                request.setAttribute("erroTurma", "Série não informada.");
            } else {
                codTurma = Integer.parseInt(request.getParameter("codTurma"));
            }
            if (request.getParameter("aluno") == null
                    || request.getParameter("aluno").equals("")) {
                codAluno = 0;
                temErro = true;
                request.setAttribute("erroAluno", "Selecione primeiro a série!");

            } else {
                codAluno = Integer.parseInt(request.getParameter("aluno"));
            }

            if (codTurma == 0 && codAluno == 0) {

                try {
                    request.setAttribute("turmas", daoT.getAllTurmas());
                    request.setAttribute("aluno", daoA.alunoSemTurma());
                } catch (SQLException ex) {
                    Logger.getLogger(ProfessorController.class.getName()).log(Level.SEVERE, null, ex);
                }
                request.getRequestDispatcher("/WEB-INF/jsp/aluno/associarValidacao.jsp").forward(request, response);
            } else if (codTurma != 0 && codAluno == 0) {
                try {
                    request.setAttribute("turmaD", daoT.recuperaListaTurmaDifer(codTurma));
                    request.setAttribute("turmaR", daoT.recuperaTurma(codTurma));
                    request.setAttribute("aluno", daoA.alunoSemTurma());
                    request.setAttribute("turmaCod", codTurma);
                } catch (SQLException ex) {
                    Logger.getLogger(ProfessorController.class.getName()).log(Level.SEVERE, null, ex);
                }
                request.getRequestDispatcher("/WEB-INF/jsp/aluno/associar2.jsp").forward(request, response);
            } else {
                try {
                    request.setAttribute("turmas", daoT.getAllTurmas());
                    request.setAttribute("aluno", daoA.alunoSemTurma());
                } catch (SQLException ex) {
                    Logger.getLogger(ProfessorController.class.getName()).log(Level.SEVERE, null, ex);
                }
                request.getRequestDispatcher("/WEB-INF/jsp/aluno/associar.jsp").forward(request, response);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        boolean temErro = false;
        int codTurma;
        int codAluno;
        int qtdeTurma = 0;
        


        if (request.getParameter("turmaCod") == null ||
                request.getParameter("turmaCod").equals("") && request.getParameter("aluno") == null
                || request.getParameter("aluno").equals("")) {
            codAluno = 0;
            temErro = true;
            request.setAttribute("erroAluno", "Selecione um aluno!");
        } else {
            codAluno = Integer.parseInt(request.getParameter("aluno"));
        }
        if(request.getParameter("turmaCod") == null ||
                request.getParameter("turmaCod").equals("")){
            codTurma = 0;
            temErro = true;
            request.setAttribute("erroTurma", "Selecione primeiro a série!");
                }
        else{
            codTurma = Integer.parseInt(request.getParameter("turmaCod"));
        }
        try {
            qtdeTurma = daoT.SelecionarDesempenho(codTurma).getQte();
        } catch (SQLException ex) {
            Logger.getLogger(AssociarAluno.class.getName()).log(Level.SEVERE, null, ex);
        }
        if(codTurma == 0 || qtdeTurma <1 ){
            try {
                request.setAttribute("turmas", daoT.getAllTurmas());
                request.setAttribute("aluno", daoA.alunoSemTurma());
            } catch (SQLException ex) {
                Logger.getLogger(AssociarAluno.class.getName()).log(Level.SEVERE, null, ex);
            }   
            request.getRequestDispatcher("/WEB-INF/jsp/aluno/associar2.jsp").forward(request, response);
        }else if(codTurma != 0 && codAluno == 0 ){
            try {
                request.setAttribute("turmaD", daoT.recuperaListaTurmaDifer(codTurma));
                request.setAttribute("turmaR", daoT.recuperaTurma(codTurma));
                request.setAttribute("aluno", daoA.alunoSemTurma());
                request.setAttribute("turmaCod", codTurma);
            } catch (SQLException ex) {
                Logger.getLogger(AssociarAluno.class.getName()).log(Level.SEVERE, null, ex);
            }
            request.getRequestDispatcher("/WEB-INF/jsp/aluno/associar2.jsp").forward(request, response);
        }
        else {
            try {
                daoT.associarAlunoTurma(codAluno, codTurma);
            } catch (SQLException ex) {
                Logger.getLogger(AssociarAluno.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        request.getRequestDispatcher("/WEB-INF/jsp/aluno/associarSucesso.jsp").forward(request, response);

    }
}
