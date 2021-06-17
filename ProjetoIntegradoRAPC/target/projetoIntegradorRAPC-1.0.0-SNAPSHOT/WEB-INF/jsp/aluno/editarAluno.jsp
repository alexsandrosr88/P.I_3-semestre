<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link type="text/css"
          href="css/ui-lightness/jquery-ui-1.8.18.custom.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/erro.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/cadastro.css">
    <title>Editar Aluno</title>
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
<div class="container" id="cadastro">
    <h4 class="centro">Editar Aluno</h4>
    <form method="POST" action='${request.contextPath}alunoController' name="frmAddUser">
        <!-- Matricula -->
        <div class="form-row">
            <div class="form-group col-md-1">
                <label>Matrícula</label>
                <input type="text" readonly="readonly" name="codAluno"
                       value="<c:out value="${aluno.codAluno}" />">
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md-3">
                <!-- Nome -->
                <label for="inputNome">Nome</label>
                <input class="form-control"  id="inputNome" type="text" name="nome"
                       value="<c:out value="${aluno.nome}" />" >
            </div>
            <div class="form-group col-md-2">
                <label for="inputCPFAluno">CPF</label>
                <input type="text" class="form-control" id="inputCPFAluno" name="cpf"
                       value="<c:out value="${aluno.cpf}" />"
                       placeholder="XXX.XXX.XXX-XX"
                       onkeypress="$(this).mask('000.000.000-00');">
            </div>
            <div class="form-group col-md-2">
                <!-- Data -->
                <label for="inputData">Data de Nascimento</label>
                <input class="form-control"  id="inputData" type="date"
                       maxlength="10" name="dataNascimento"
                       value="<c:out value="${aluno.dataNasc}" />" >
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md-2">
                <!-- Gênero -->
                <label for="inputGenero">Gênero</label><br/>
                <select class="custom-select mr-sm-2" name="sexo"
                        id="inputGenero" value="<c:out value="${aluno.sexo}" />">
                    <option value="${aluno.sexo}">${aluno.sexo}</option>
                    <option value="Masculino">Masculino</option>
                    <option value="Feminino">Feminino</option>
                </select>
            </div>
            <div class="form-group col-md-2">
                <label for="inputCelularAluno">Celular do Aluno</label>
                <input class="form-control" id="inputCelularAluno"type="text"
                       onkeypress="$(this).mask('(00) 00000-0000')""
                name="celular" value="<c:out value="${aluno.celular}" />"
                placeholder="(XX) XXXXX-XXXX">
            </div>
            <div class="form-group col-md-3">
                <!-- E-mail -->
                <label for="inputEmail4">E-mail</label>
                <input type="email" class="form-control" id="inputEmail4"
                       name="email" value="<c:out value="${aluno.email}" />" >
            </div>
        </div>
        <div class="form-row">

        </div>
        <h4>Dados dos Responsaveis</h4>
        <div class="form-row">
            <div class="form-group col-md-3">
                <!-- Nome -->
                <label for="inputNomeMae">Nome da Mãe</label>
                <input class="form-control"  id="inputNomeMae" type="text" name="mae"
                       value="<c:out value="${aluno.nomeMae}" />" >
            </div>
            <div class="form-group col-md-2">
                <label for="inputCelularMae">Celular da Mãe</label>
                <input class="form-control" id="inputCelularAluno"type="text"
                       onkeypress="$(this).mask('(00) 00000-0000')"
                       name="celularMae" value="<c:out value="${aluno.celularMae}" />"
                       placeholder="(XX) XXXXX-XXXX">
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md-3">
                <!-- Nome -->
                <label for="inputNomePai">Nome do Pai</label>
                <input class="form-control"  id="inputNomePai" type="text" name="pai"
                       value="<c:out value="${aluno.nomePai}" />">
            </div>
            <div class="form-group col-md-2">
                <label for="inputCelularMae">Celular do Pai</label>
                <input class="form-control" id="inputCelularAluno"type="text"
                       name="celularPai" value="<c:out value="${aluno.celularPai}" />"
                       onkeypress="$(this).mask('(00) 00000-0000')"
                       placeholder="(XX) XXXXX-XXXX">
            </div>
        </div>
        <h4>Endereço</h4>
        <div class="form-row">
            <div class="form-group col-md-3">
                <label for="inputLogradouro">Logradouro</label>
                <input class="form-control" id="inputLogradouro" type="text"
                       name="rua" value="<c:out value="${aluno.rua}" />">
            </div>
            <div class="form-group col-md-1">
                <label for="inputNumero">Nº</label>
                <input class="form-control" id="inputNumero" type="text"
                       name="numero" value="<c:out value="${aluno.numero}" />">
            </div>
            <div class="form-group col-md-2">
                <label for="inputComplemento">Complemento</label>
                <input class="form-control" id="inputComplemento" type="text"
                       name="complemento" value="<c:out value="${aluno.complemento}" />">
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md-2">
                <label for="inputBairro">Bairro</label>
                <input class="form-control" id="inputBairro" type="text"
                       name="bairro" value="<c:out value="${aluno.bairro}" />">
            </div>
            <div class="form-group col-md-2">
                <label for="inputCEP">CEP</label>
                <input class="form-control" id="inputCEP" type="text" name="cep"
                       onkeypress="$(this).mask('00000-000')"
                       placeholder="XXXXX-XXX"
                       value="<c:out value="${aluno.cep}" />">
            </div>
        </div>
        <div class="container">
            <div class="form-row">
                <div class="form-group col-md-6">
                    <input class="btn btn-primary btn-lg active" role="button" aria-pressed="true" type="submit"
                           value="Enviar"/>
                </div>
            </div>
        </div>
    </form>
</div>

<footer id="myFooter">
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
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.15/jquery.mask.min.js"></script>
<script>
    $(function () {
        $('input[name=dataNascimento]').datepicker();
    });
</script>
</body>
</html>