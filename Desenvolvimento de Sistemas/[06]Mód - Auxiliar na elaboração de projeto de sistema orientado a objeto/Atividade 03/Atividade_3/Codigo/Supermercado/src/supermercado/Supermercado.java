package supermercado;

public class Supermercado {

    /*
    * Sim eu sei que o nome correto é método, mas eu vim do C, então pra mim
    * ainda é função. Método é Função, isso não sai da minha cabeça. (hehe)
    */
    // Método(Função) Cria carrinho de compras ODEIO nomes de objetos com uma letra, então é carrinho
    private static CarrinhoDeCompras criarCarrinho() {
        CarrinhoDeCompras carrinho = new CarrinhoDeCompras();
        carrinho.adicionarProduto("Arroz", 9, 3.99); //Eu preferiria colocar um "scanf" aqui, mas tô seguindo o exemplo.
        carrinho.adicionarProduto("Filé de frango sassami", 10, 21.99); // Mudei os valores pra ver se tava ok. Deve estar, não fiz conta hahahahaha, só vi que o valor mudou :P
        return carrinho;
    }
    // Método(Função) Cria um pedido ODEIO nomes de objetos com uma letra, então é pedido (Humpf!)
    private static Pedido criarPedido(CarrinhoDeCompras carrinho) {
        Pedido pedido = new Pedido();
        pedido.setNumeroPedido(1);
        pedido.setCarrinho(carrinho);
        pedido.setCliente(new Cliente("João da Silva", "123.456.789-00", "joao@email.com"));
        return pedido;
    }

    public static void main(String[] args) {
    
    // Criando o carrinho de compras e adicionando produtos
        CarrinhoDeCompras carrinho = criarCarrinho();

    // Criando o pedido e associando ao carrinho
        Pedido pedido = criarPedido(carrinho);
        
    // Exibindo o resumo do pedido
        System.out.println(pedido.fecharPedido());
    }
}

