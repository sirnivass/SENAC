package supermercado;

import java.util.ArrayList;
import java.util.List;

public class CarrinhoDeCompras {

    private List<Produto> produtos;

    // Construtor que inicializa a lista de produtos
    public CarrinhoDeCompras() {
        this.produtos = new ArrayList<>();
    }

    // Método para adicionar um produto ao carrinho
    public void adicionarProduto(String nome, int quantidade, double precoUnitario) {
        this.produtos.add(new Produto(nome, quantidade, precoUnitario));
    }

    // Método para calcular o total do carrinho, somando os preços dos produtos multiplicados pela quantidade
    public double calcularTotal() {
        double total = 0;
        for (Produto produto : produtos) 
            total += produto.getQuantidade() * produto.getPrecoUnitario(); //usei o += pra ficar mais simples, mas dá pra escrever sem esse operador:
          //total = total + (produto.getQuantidade() * produto.getPrecoUnitario()); //Funciona igual. Uso das "(" ")" são opcionais, eu gosto, mas pode remover ,pois o * tem maior procedência.
        
        return total;
    }
}
