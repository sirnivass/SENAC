package supermercado;

public class Pedido {

    private int numeroPedido;
    private CarrinhoDeCompras carrinho;
    private Cliente cliente;  // Substituído os atributos cliente, cpf e email por um objeto Cliente

    // Getter para número do pedido
    public int getNumeroPedido() {
        return this.numeroPedido;
    }

    // Getter para nome do cliente através do objeto Cliente
    public String getNomeCliente() {
        return this.cliente.getNome();
    }

    // Getter para CPF do cliente através do objeto Cliente
    public String getCpfCliente() {
        return this.cliente.getCpf();
    }

    // Getter para email do cliente através do objeto Cliente
    public String getEmailCliente() {
        return cliente.getEmail();
    }   
    public String fecharPedido() { // <- Mudei para string, assim fica mais fácil exibir e manipular.
        return String.format("Numero do pedido: %d\n" // <- Tentei em vão deixar isso bonito. Não deu.
                            +"Cliente: %s\n" // Que COISA HORROROSA! MEU DEUS!
                            + "Total do pedido: %.2f\n", numeroPedido, cliente.getNome(), this.carrinho.calcularTotal());
    }

    // Getter para o carrinho de compras
    public CarrinhoDeCompras getCarrinho() {
        return carrinho;
    }

    // Setter para o carrinho de compras
    public void setCarrinho(CarrinhoDeCompras carrinho) {
        this.carrinho = carrinho;
    }

    // Setter para número do pedido
    public void setNumeroPedido(int numeroPedido) {
        this.numeroPedido = numeroPedido;
    }   

    // Setter para o cliente
    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }
}