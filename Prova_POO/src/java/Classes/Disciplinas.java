/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Classes;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import web.DbListener;

/**
 *
 * @author Bruno
 */
public class Disciplinas {
    private String nome;
    private String ementa;
    private String ciclo;
    private double nota;

    public Disciplinas(String nome, String ementa, String ciclo, double nota) {
        this.nome = nome;
        this.ementa = ementa;
        this.ciclo = ciclo;
        this.nota = nota;
    }
    

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEmenta() {
        return ementa;
    }

    public void setEmenta(String ementa) {
        this.ementa = ementa;
    }

    public String getCiclo() {
        return ciclo;
    }

    public void setCiclo(String ciclo) {
        this.ciclo = ciclo;
    }

    public double getNota() {
        return nota;
    }

    public void setNota(double nota) {
        this.nota = nota;
    }

    public static ArrayList<Disciplinas> getList()throws Exception {
        ArrayList<Disciplinas> exibe = new ArrayList<>();
        Connection con = DbListener.getConnection();
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM disciplinas");
        while(rs.next()) {
            exibe.add(new Disciplinas(
                    rs.getString("nome"),
                    rs.getString("ementa"),
                    rs.getString("ciclo"),
                    rs.getDouble("nota")
            ));   
        }
        rs.close();
        stmt.close();
        con.close();
        return exibe;
    }

    public static void inserirDisciplina(String nome, String ementa, String ciclo, double nota) throws Exception {
        Connection con = DbListener.getConnection();
        PreparedStatement stmt = con.prepareStatement
        ("INSERT INTO disciplinas(nome, ementa, ciclo, nota) VALUES(?,?,?,?)");
        stmt.setString(1, nome);
        stmt.setString(2, ementa);
        stmt.setString(3, ciclo);
        stmt.setDouble(4, nota);
        stmt.execute();
        stmt.close();
        con.close();
    }
    
    public static void alterarNota (String nome, double nota) throws Exception {
        Connection con = DbListener.getConnection();
        PreparedStatement stmt = con.prepareStatement
                ("UPDATE disciplinas SET nota=? WHERE nome=?");
                stmt.setDouble(1, nota);
                stmt.setString(2, nome);
                stmt.execute();
                stmt.close();
                con.close();
    }
    
    public static void excluirDisciplina(String nome) throws Exception {
        Connection con = DbListener.getConnection();
        PreparedStatement stmt = con.prepareStatement
        ("DELETE FROM disciplinas WHERE nome= ?");
        stmt.setString(1, nome);
        stmt.execute();
        stmt.close();
        con.close();
    }
    
    public static String getCreateStatement() {
        return "CREATE TABLE IF NOT EXISTS disciplinas("
        + "nome VARCHAR(50) PRIMARY KEY,"
        + "ementa VARCHAR(300) NOT NULL,"
        + "ciclo VARCHAR(2) NOT NULL,"
        + "nota NUMERIC(2,2) NOT NULL"
        + ")";
    }
    
}
