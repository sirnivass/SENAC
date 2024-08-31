package supermercado;

public class Cliente {

    private String nome;
    private String cpf;
    private String email;

    // Construtor para inicializar os atributos de Cliente
    public Cliente(String nome, String cpf, String email) {
        this.nome = nome;
        this.cpf = cpf;
        this.email = email;
    }

    // Getter para nome
    public String getNome() {
        return nome;
    }

    // Setter para nome
    public void setNome(String nome) {
        this.nome = nome;
    }

    // Getter para CPF
    public String getCpf() {
        return cpf;
    }

    // Setter para CPF
    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    // Getter para email
    public String getEmail() {
        return email;
    }

    // Setter para email
    public void setEmail(String email) {
        this.email = email;
    }

    // Métodos duplicados getNomeCliente e setNomeCliente foram removidos para reduzir redundância
}
