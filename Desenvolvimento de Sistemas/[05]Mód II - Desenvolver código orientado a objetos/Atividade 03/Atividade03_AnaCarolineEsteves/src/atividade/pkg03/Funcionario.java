package atividade.pkg03;

public abstract class Funcionario {
    private String nome;
    private String cpf;
    private String endereco;
    private String telefone;
    private String setor;

    // Construtor
    public Funcionario(String nome, String cpf, String endereco, String telefone, String setor) {
        this.nome = nome;
        this.cpf = cpf;
        this.endereco = endereco;
        this.telefone = telefone;
        this.setor = setor;
    }

    // Getter para nome
    public String getNome() {
        return nome;
    }

    // Setter para nome
    public void setNome(String nome) {
        this.nome = nome;
    }

    // Getter para cpf
    public String getCpf() {
        return cpf;
    }

    // Setter para cpf
    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    // Getter para endereco
    public String getEndereco() {
        return endereco;
    }

    // Setter para endereco
    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    // Getter para telefone
    public String getTelefone() {
        return telefone;
    }

    // Setter para telefone
    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    // Getter para setor
    public String getSetor() {
        return setor;
    }

    // Setter para setor
    public void setSetor(String setor) {
        this.setor = setor;
    }

    // Método abstrato para calcular o pagamento do funcionário
    public abstract double calcularPagamento();

    // Método para aplicar aumento no pagamento do funcionário
    public double aplicarAumento(double percentualAumento) {
        // Implementação padrão: aumenta o pagamento de acordo com o percentual informado
        double aumento = calcularPagamento() * (percentualAumento / 100);
        System.out.println("Aumento de " + percentualAumento + "% aplicado.");
        System.out.println("Novo pagamento: $" + (calcularPagamento() + aumento));
        return aumento;
    }

    // Método para exibir os dados do funcionário
    public void mostrarDados() {
        System.out.println("Nome: " + nome);
        System.out.println("CPF: " + cpf);
        System.out.println("Endereço: " + endereco);
        System.out.println("Telefone: " + telefone);
        System.out.println("Setor: " + setor);
    }
}
