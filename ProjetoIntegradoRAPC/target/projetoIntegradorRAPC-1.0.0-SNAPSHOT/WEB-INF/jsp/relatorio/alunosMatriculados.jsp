<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listagem de alunos</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
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

        <h1>Alunos Matriculados</h1>
        <table class="table table-striped">
            <thead class="thead-dark">
                <tr>
                    <th scope="col">Matrícula</th>
                    <th scope="col">Nome</th>
                    <th scope="col">Data de nascimento</th>
                    <th scope="col">Sexo</th>
                    <th scope="col">Pai</th>
                    <th scope="col">Mãe</th>
                    <th scope="col">Celular</th>
                    <th scope="col">Cel. do pai</th>
                    <th scope="col">Cel. da Mãe</th>
                    <th scope="col">E-mail</th>
                    <th colspan="2" scope="col">Ação</th>
                </tr>
            </thead>
            <tbody>
                <!<!-- atributo Alunos vem da classe AlunoControlles na linha 65  -->
                <c:forEach items="${alunos}" var="aluno">
                    <tr>
                        <th scope="row"><c:out value="${aluno.codAluno}" /></th>
                        <td><c:out value="${aluno.nome}" /></td>
                        <fmt:parseDate value="${aluno.dataNasc}" type="date" pattern="yyyy-MM-dd" var="dataDateParsed" />
                        <td><fmt:formatDate value="${dataDateParsed}" pattern="dd/MM/yyyy" /></td>
                        <td><c:out value="${aluno.sexo}" /></td>
                        <td><c:out value="${aluno.nomePai}" /></td>
                        <td><c:out value="${aluno.nomeMae}" /></td>
                        <td><c:out value="${aluno.celular}" /></td>
                        <td><c:out value="${aluno.celularPai}" /></td>
                        <td><c:out value="${aluno.celularMae}" /></td>
                        <td><c:out value="${aluno.email}" /></td>
                        <td><a type="button" class="btn btn-primary" href="alunoController?action=edit&codAluno=<c:out value="${aluno.codAluno}" />">Editar</a>
                        <td><a type="button" class="btn btn-danger" href="alunoController?action=delete&codAluno=<c:out value="${aluno.codAluno}" />">deletar</a>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    </body>
</html>
