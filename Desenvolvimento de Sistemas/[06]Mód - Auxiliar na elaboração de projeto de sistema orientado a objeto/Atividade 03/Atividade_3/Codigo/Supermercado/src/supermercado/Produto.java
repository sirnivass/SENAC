package supermercado;

public class Produto {

    private String nome;
    private int quantidade;
    private double precoUnitario;

    // Construtor para inicializar os atributos de Produto
    public Produto(String nome, int quantidade, double precoUnitario) {
        this.nome = nome;
        this.quantidade = quantidade;
        this.precoUnitario = precoUnitario;
    }

    // Getter para quantidade
    public int getQuantidade() {
        return quantidade;
    }

    // Getter para preço unitário
    public double getPrecoUnitario() {
        return precoUnitario;
    }
    
    // Método calcularTotal foi removido deixei uma lá CarrinhoDeCompras, onde faz sentido.
}

