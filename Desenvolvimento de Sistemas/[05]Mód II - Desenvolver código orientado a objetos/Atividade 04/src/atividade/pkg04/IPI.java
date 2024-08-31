package atividade.pkg04;

public class IPI implements Imposto {

    private double valorProduto;
    private double frete;
    private double seguro;
    private double outrasDespesas;
    private double aliquota; // Em percentual

    // Construtor
    public IPI(double valorProduto, double frete, double seguro, double outrasDespesas, double aliquota) {
        this.valorProduto = valorProduto;
        this.frete = frete;
        this.seguro = seguro;
        this.outrasDespesas = outrasDespesas;
        this.aliquota = aliquota;
    }

    @Override
    public double calcularImposto() {
        double baseCalculo = valorProduto + frete + seguro + outrasDespesas;
        return baseCalculo * (aliquota / 100);
    }

    @Override
    public String getDescricao() {
        return "IPI (Imposto sobre Produtos Industrializados)";
    }
}
