package atividade.pkg03;

public class FuncionarioHorista extends Funcionario {
    private double horasTrabalhadas;
    private double valorHora;

    // Construtor
    public FuncionarioHorista(String nome, String cpf, String endereco, String telefone, String setor, double horasTrabalhadas, double valorHora) {
        super(nome, cpf, endereco, telefone, setor);
        this.horasTrabalhadas = horasTrabalhadas;
        this.valorHora = valorHora;
    }

    // Implementação do método abstrato para calcular o pagamento
    @Override
    public double calcularPagamento() {
        return horasTrabalhadas * valorHora;
    }
}
