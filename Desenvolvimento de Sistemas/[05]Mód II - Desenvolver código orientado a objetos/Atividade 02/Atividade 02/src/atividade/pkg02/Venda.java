package atividade.pkg02;

public class Venda {
    private String nomeCliente;
    private String formaPagamento;
    private PacoteViagem pacoteViagem;
    private double margemLucro;
    private double taxasAdicionais;

    public Venda(String nomeCliente, String formaPagamento, PacoteViagem pacoteViagem, double margemLucro, double taxasAdicionais) {
        this.nomeCliente = nomeCliente;
        this.formaPagamento = formaPagamento;
        this.pacoteViagem = pacoteViagem;
        this.margemLucro = margemLucro;
        this.taxasAdicionais = taxasAdicionais;
    }

    public double converterParaReais(double valorDolar, double cotacao) {
        return valorDolar * cotacao;
    }

    public void mostrarInformacoes(double cotacao) {
        double totalDolar = pacoteViagem.calcularTotalPacote(margemLucro, taxasAdicionais);
        double totalReais = converterParaReais(totalDolar, cotacao);
        System.out.println("Cliente: " + nomeCliente);
        System.out.println("Forma de Pagamento: " + formaPagamento);
        System.out.println("Destino: " + pacoteViagem.getDestino());
        System.out.println("Total em Dólar: " + totalDolar);
        System.out.println("Total em Reais: " + totalReais);
    }

    // Getters and Setters
    public String getNomeCliente() {
        return nomeCliente;
    }

    public void setNomeCliente(String nomeCliente) {
        this.nomeCliente = nomeCliente;
    }

    public String getFormaPagamento() {
        return formaPagamento;
    }

    public void setFormaPagamento(String formaPagamento) {
        this.formaPagamento = formaPagamento;
    }

    public PacoteViagem getPacoteViagem() {
        return pacoteViagem;
    }

    public void setPacoteViagem(PacoteViagem pacoteViagem) {
        this.pacoteViagem = pacoteViagem;
    }

    public double getMargemLucro() {
        return margemLucro;
    }

    public void setMargemLucro(double margemLucro) {
        this.margemLucro = margemLucro;
    }

    public double getTaxasAdicionais() {
        return taxasAdicionais;
    }

    public void setTaxasAdicionais(double taxasAdicionais) {
        this.taxasAdicionais = taxasAdicionais;
    }
}