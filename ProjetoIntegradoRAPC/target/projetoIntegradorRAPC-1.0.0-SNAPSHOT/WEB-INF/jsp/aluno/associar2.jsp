<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page buffer="8192kb" autoFlush="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" href="css/ui-lightness/jquery-ui-1.8.18.custom.css" rel="stylesheet"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
              integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/Associar.css"/>
        <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/erro.css"/>
        <title>Associar aluno a turma</title>
    </head>
    <body>
    <nav class="navbar navbar-dark bg-dark  navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="${pageContext.request.contextPath}"><img src="Imagens/logo.png" alt="some text" width=120 height=60>CyberSchool</a>

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#conteudoNavbarSuportado" aria-controls="conteudoNavbarSuportado" aria-expanded="false" aria-label="Alterna navegação">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="conteudoNavbarSuportado">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Cadastro
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/cadastroAluno">Aluno</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/cadastroProfessor">Professor</a>
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/cadastroAdm">Adiministrativo</a>

                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Listagem
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/alunoController?action=ListAluno">Alunos Matriculados</a>
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/professorController?action=ListProfessor">Professores</a>
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/admController?action=ListAdm">Adiministrativo</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Registro
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/notasController">Notas</a>
                    <a class="dropdown-item" href="#">Presença</a>
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/associarAluno">Associar Aluno a turma</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Relátorios
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="#">Presença</a>
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/boletim">Boletim</a>
                </div>
            </li>


        </div>
    </nav>
    <div class="container">
        <h1>Associar aluno a turma</h1>
        <form name="frmTurmas" action="${request.contextPath}selection" id="turmaDisciplina">
            <label>Série:</label>
            <select class="custom-select mr-sm-2" name="codTurma"
                    id="inputTurma">
                <!-- Carregando o select do Banco -->
                <option value="<c:out value="${turmaR.turmaID}" />"/>
                <c:out value="${turmaR.serie}"/></option>
                <c:forEach items="${turmaD}" var="turma">
                    <option value="${turma.turmaID}"/>
                    ${turma.serie}</option>
                </c:forEach>
            </select>
            <c:if test="${not empty erroTurma}">
                <span class="msg-erro"><c:out value="${erroTurma}"/></span>
            </c:if>
            <br>
            <button type="submit" value="form1">Pesquisar</button>
        </form>
        <div id="SelecaoAluno">
            <form method="POST" name="frAluno" action="${request.contextPath}selection" var="form2">
                <label for="nome_aluno" id="textcolor">Aluno:</label>
                <select class="custom-select mr-sm-2" name="aluno"
                        id="inputTurma">
                    <!-- Carregando o select do Banco -->
                    <option value=""/>
                    Selecione</option>
                    <c:forEach items="${aluno}" var="alunos">
                        <option value="${alunos.codAluno}"/>
                        ${alunos.nome}</option>
                    </c:forEach>
                </select>
                <c:if test="${not empty erroAluno}">
                <span class="msg-erro"><c:out value="${erroAluno}"/></span>
                </c:if>
                <input type="hidden" name="turmaCod" value="<c:out value="${turmaCod}" />">
            </form>

                </div>
                <div class="row">
                    <div class="col" id="tabelaTurma">
                        <table class="table table-striped table-hover" id="table-title">
                            <th id="textcolor">Turma</th>
                            <th id="textcolor">Quantidade livre</th>
                            <th id="textcolor">Opções</th>
                            <tr>
                                <td id="textcolor"><c:out value="${turmaR.serie}"/></td>
                                <td id="textcolor"><c:out value="${turmaR.qte}"/></td>
                                <td id="textcolor">
                                    <button type="submit" class="btn btn-primary">Associar</button>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
        </div>
        <footer class="footer navbar-fixed-bottom" id="myFooter">
            <div class="container">
                <div class="row">
                    <div class="col">
                        <img src="Imagens/logo.png" alt="some text">
                    </div>
                    <div class="col">
                        <h2>Desenvolvido por RAPC</h2>
                    </div>
                    <div class="col">
                        <div class="social-networks">
                            <a href="https://github.com/CarlosPavao/ProjetoIntegradoRAPC" class="instagram"><i
                                    class="fa fa-github"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
                integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
                integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
                integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
        crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.11/jquery.mask.min.js"></script>
        <script src="http://code.jquery.com/jquery-1.7.1.js"></script>
        <script src="http://www.godtur.no/godtur/js/jquery-ui-1.8.18.custom.min.js"></script>
    </body>
</html>