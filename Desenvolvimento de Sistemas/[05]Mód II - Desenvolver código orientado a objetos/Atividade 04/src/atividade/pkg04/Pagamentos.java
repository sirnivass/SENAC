package atividade.pkg04;

import java.util.ArrayList;
import java.util.List;

public class Pagamentos {

    private String nomeEmpresa;
    private List<Imposto> impostos;

    // Construtor
    public Pagamentos(String nomeEmpresa) {
        this.nomeEmpresa = nomeEmpresa;
        this.impostos = new ArrayList<>();
    }

    // Método para adicionar imposto à lista
    public void adicionarImposto(Imposto imposto) {
        impostos.add(imposto);
    }

    // Método para calcular e mostrar todos os impostos
    public void calcularEExibirImpostos() {
        System.out.println("------ Calculando Impostos ------");
        for (Imposto imposto : impostos) {
            double valorImposto = imposto.calcularImposto();
            System.out.println(imposto.getDescricao() + ": R$ " + valorImposto);
        }
    }
}
