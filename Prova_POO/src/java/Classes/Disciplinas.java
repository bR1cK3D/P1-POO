/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Classes;

import java.lang.reflect.Array;
import java.util.ArrayList;

/**
 *
 * @author Bruno
 */
public class Disciplinas {
    private String nome;
    private String ementa;
    private int ciclo;
    private double nota;
    private ArrayList<Disciplinas> Lista = new ArrayList<Disciplinas>();

    public Disciplinas() {
        this.nome = null;
        this.ementa = null;
        this.ciclo = 0;
        this.nota = 0; 
    }

    public Disciplinas(String nome, String ementa, int ciclo, double nota) {
        this.nome = nome;
        this.ementa = ementa;
        this.ciclo = ciclo;
        this.nota = nota;
    }
    
    public Disciplinas(String nome, String ementa, int ciclo) {
        this.nome = nome;
        this.ementa = ementa;
        this.ciclo = ciclo;
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

    public int getCiclo() {
        return ciclo;
    }

    public void setCiclo(int ciclo) {
        this.ciclo = ciclo;
    }

    public double getNota() {
        return nota;
    }

    public void setNota(double nota) {
        this.nota = nota;
    }

    public ArrayList<Disciplinas> getLista() {
        return Lista;
    }

    public void addList(Disciplinas disciplina) {
        Lista.add(new Disciplinas(disciplina.getNome(), disciplina.getEmenta(), disciplina.getCiclo()));
    }
    
    public void addNota (int indice, double nota) {
        Lista.get(indice).setNota(nota);
    }
    
}
