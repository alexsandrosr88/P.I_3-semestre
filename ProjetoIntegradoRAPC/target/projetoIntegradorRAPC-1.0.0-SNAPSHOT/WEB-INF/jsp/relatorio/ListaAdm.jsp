<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    </head>
    <body>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

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

        <h1>Adm's cadastrados</h1>
        <table class="table table-striped">
            <thead class="thead-dark">
                <tr>
                    <th scope="col">ID ADM</th>
                    <th scope="col">Nome</th>
                    <th scope="col">Data de nascimento</th>
                    <th scope="col">Sexo</th>
                    <th scope="col">RG</th>
                    <th scope="col">CPF</th>
                    <th scope="col">Celular</th>
                    <th scope="col">E-mail</th>
                    <th scope="col">Rua</th>
                    <th scope="col">Número</th>
                    <th colspan="2" scope="col">Ação</th>
                </tr>
            </thead>
            <tbody>
                <!<!-- atributo Adms vem da classe AdmControlles na linha 65  -->
                         
                <c:forEach items="${adms}" var="adm">
                    <tr>
                        <th scope="row"><c:out value="${adm.codAdm}" /></th>
                        <td><c:out value="${adm.nome}" /></td>
                        <fmt:parseDate value="${adm.dataNasc}" type="date" pattern="yyyy-MM-dd" var="dataDateParsed" />
                        <td><fmt:formatDate value="${dataDateParsed}" pattern="dd/MM/yyyy" /></td>
                        <td><c:out value="${adm.sexo}" /></td>
                        <td><c:out value="${adm.rg}" /></td>
                        <td><c:out value="${adm.cpf}" /></td>
                        <td><c:out value="${adm.celular}" /></td>
                        <td><c:out value="${adm.email}" /></td>
                        <td><c:out value="${adm.rua}" /></td>
                        <td><c:out value="${adm.numero}" /></td>
                        <td><a type="button" class="btn btn-primary" href="admController?action=edit&codAdm=<c:out value="${adm.codAdm}" />">Editar</a>
                        <td>
                            <form action="admDeleta?action=delete" method="post">
                                <input type="hidden" class="form-control" readonly="readonly" name="codAdm" value="<c:out value="${adm.codAdm}" />" >
                                <input class="btn btn-danger" role="button" aria-pressed="true" type="submit" name="remove" value="Deletar"/>   
                            </form>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        
        <a href="${pageContext.request.contextPath}/listaAdm.pdf"> Imprimir</a>
    </body>
</html>
