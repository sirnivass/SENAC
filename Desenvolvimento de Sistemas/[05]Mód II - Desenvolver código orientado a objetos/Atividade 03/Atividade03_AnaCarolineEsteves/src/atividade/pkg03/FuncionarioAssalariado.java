package atividade.pkg03;

public class FuncionarioAssalariado  extends Funcionario {
    private double salarioMensal;

    // Construtor
    public FuncionarioAssalariado(String nome, String cpf, String endereco, String telefone, String setor, double salarioMensal) {
        super(nome, cpf, endereco, telefone, setor);
        this.salarioMensal = salarioMensal;
    }

    // Implementação do método abstrato para calcular o pagamento
    @Override
    public double calcularPagamento() {
        return salarioMensal;
    }
}
