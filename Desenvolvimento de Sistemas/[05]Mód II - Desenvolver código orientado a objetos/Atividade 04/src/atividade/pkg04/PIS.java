package atividade.pkg04;

public class PIS implements Imposto {

    private double debito;
    private double credito;

    // Construtor
    public PIS(double debito, double credito) {
        this.debito = debito;
        this.credito = credito;
    }

    @Override
    public double calcularImposto() {
        double baseCalculo = debito - credito;
        return baseCalculo * 0.0165; // 1,65%
    }

    @Override
    public String getDescricao() {
        return "PIS (Programa de Integração Social)";
    }
}

