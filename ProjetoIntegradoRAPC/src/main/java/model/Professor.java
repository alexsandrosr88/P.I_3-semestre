package model;

import java.time.LocalDate;

/**
 *
 * @author Carlos Pavão <carlos.henrique93@msn.com>
 */
public class Professor {
    private int codProfessor;
    private String nome;
    private String sexo;
    private LocalDate dataNasc;
    private String rg;
    private String cpf;
    private String celular;
    private String email;
    private String perfil;
    private String senha;
    private String senha_repetida;
    private String rua;
    private int    numero;
    private String complemento;
    private String bairro;
    private String cep;
    private int fk_disciplinaID;
    private int fk_disciplina2ID;
    

    public Professor() {}

    public Professor(int codProfessor, String nome, String sexo,
           LocalDate dataNasc, String rg, String cpf, String celular,
           String email, String perfil, String senha, String senha_repetida,
           String rua, int numero, String complemento, String bairro,
           String cep, int fk_disciplinaID, int fk_disciplina2ID) {
        this.codProfessor = codProfessor;
        this.nome = nome;
        this.sexo = sexo;
        this.dataNasc = dataNasc;
        this.rg = rg;
        this.cpf = cpf;
        this.celular = celular;
        this.email = email;
        this.perfil = perfil;
        this.senha = senha;
        this.senha_repetida = senha_repetida;
        this.rua = rua;
        this.numero = numero;
        this.complemento = complemento;
        this.bairro = bairro;
        this.cep = cep;
        this.fk_disciplinaID = fk_disciplinaID;
        this.fk_disciplina2ID = fk_disciplina2ID;
    }

    public int getCodProfessor() {
        return codProfessor;
    }

    public void setCodProfessor(int codProfessor) {
        this.codProfessor = codProfessor;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public LocalDate getDataNasc() {
        return dataNasc;
    }

    public void setDataNasc(LocalDate dataNasc) {
        this.dataNasc = dataNasc;
    }

    public String getRg() {
        return rg;
    }

    public void setRg(String rg) {
        this.rg = rg;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getCelular() {
        return celular;
    }

    public void setCelular(String celular) {
        this.celular = celular;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPerfil() {
        return perfil;
    }

    public void setPerfil(String perfil) {
        this.perfil = perfil;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public String getSenha_repetida() {
        return senha_repetida;
    }

    public void setSenha_repetida(String senha_repetida) {
        this.senha_repetida = senha_repetida;
    }

    public String getRua() {
        return rua;
    }

    public void setRua(String rua) {
        this.rua = rua;
    }

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    public String getComplemento() {
        return complemento;
    }

    public void setComplemento(String complemento) {
        this.complemento = complemento;
    }

    public String getBairro() {
        return bairro;
    }

    public void setBairro(String bairro) {
        this.bairro = bairro;
    }

    public String getCep() {
        return cep;
    }

    public void setCep(String cep) {
        this.cep = cep;
    }

    public int getFk_disciplinaID() {
        return fk_disciplinaID;
    }

    public void setFk_disciplinaID(int fk_disciplinaID) {
        this.fk_disciplinaID = fk_disciplinaID;
    }

    public int getFk_disciplina2ID() {
        return fk_disciplina2ID;
    }

    public void setFk_disciplina2ID(int fk_disciplina2ID) {
        this.fk_disciplina2ID = fk_disciplina2ID;
    }
    

}
