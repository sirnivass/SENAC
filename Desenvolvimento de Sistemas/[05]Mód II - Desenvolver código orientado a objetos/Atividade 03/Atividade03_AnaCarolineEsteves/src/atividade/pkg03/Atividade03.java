package atividade.pkg03;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Atividade03 {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        List<Funcionario> funcionarios = new ArrayList<>();

        boolean cadastrarNovoFuncionario = true;
        while (cadastrarNovoFuncionario && funcionarios.size() < 10) {
            System.out.println("Digite os dados do funcionário:");

            System.out.print("Nome: ");
            String nome = scanner.nextLine();
            System.out.print("CPF: ");
            String cpf = scanner.nextLine();
            System.out.print("Endereço: ");
            String endereco = scanner.nextLine();
            System.out.print("Telefone: ");
            String telefone = scanner.nextLine();
            System.out.print("Setor: ");
            String setor = scanner.nextLine();

            System.out.print("Tipo de funcionário (1 - Assalariado / 2 - Horista): ");
            int tipoFuncionario = scanner.nextInt();
            scanner.nextLine(); // Limpar o buffer do scanner

            if (tipoFuncionario == 1) {
                System.out.print("Salário mensal: $");
                double salarioMensal = scanner.nextDouble();
                scanner.nextLine(); // Limpar o buffer do scanner

                FuncionarioAssalariado assalariado = new FuncionarioAssalariado(nome, cpf, endereco, telefone, setor, salarioMensal);
                funcionarios.add(assalariado);
            } else if (tipoFuncionario == 2) {
                System.out.print("Horas trabalhadas: ");
                double horasTrabalhadas = scanner.nextDouble();
                System.out.print("Valor da hora: $");
                double valorHora = scanner.nextDouble();
                scanner.nextLine(); // Limpar o buffer do scanner

                FuncionarioHorista horista = new FuncionarioHorista(nome, cpf, endereco, telefone, setor, horasTrabalhadas, valorHora);
                funcionarios.add(horista);
            } else {
                System.out.println("Opção inválida. Digite 1 para Assalariado ou 2 para Horista.");
                continue; // Volta ao início do loop para cadastrar novo funcionário
            }

            if (funcionarios.size() < 10) {
                System.out.print("Deseja cadastrar mais um funcionário? (S/N): ");
                String resposta = scanner.nextLine();
                if (!resposta.equalsIgnoreCase("S")) {
                    cadastrarNovoFuncionario = false;
                }
            } else {
                System.out.println("Limite de 10 funcionários atingido.");
            }
        }

        // Mostrar os dados e pagamento de cada funcionário
        System.out.println("\n----- Dados dos Funcionários e Pagamentos -----");
        for (Funcionario funcionario : funcionarios) {
            funcionario.mostrarDados();
            System.out.println("Pagamento: $" + funcionario.calcularPagamento() + "\n");
        }

        // Aplicar aumento geral
        System.out.print("Digite o percentual de aumento a ser aplicado a todos os funcionários (%): ");
        double aumentoGeral = scanner.nextDouble();
        for (Funcionario funcionario : funcionarios) {
            funcionario.aplicarAumento(aumentoGeral);
        }

        // Mostrar novamente os dados e pagamento de cada funcionário após o aumento
        System.out.println("\n----- Dados Atualizados dos Funcionários e Pagamentos -----");
        for (Funcionario funcionario : funcionarios) {
            funcionario.mostrarDados();
            System.out.println("Pagamento atualizado: $" + funcionario.calcularPagamento());
            System.out.println(); // Espaço entre os funcionários
        }

        scanner.close();
    }
}

// Classe abstrata Funcionario
abstract class Funcionario {
    private String nome;
    private String cpf;
    private String endereco;
    private String telefone;
    private String setor;

    public Funcionario(String nome, String cpf, String endereco, String telefone, String setor) {
        this.nome = nome;
        this.cpf = cpf;
        this.endereco = endereco;
        this.telefone = telefone;
        this.setor = setor;
    }

    public abstract double calcularPagamento();

    public abstract void aplicarAumento(double percentual);

    public void mostrarDados() {
        System.out.println("Nome: " + nome);
        System.out.println("CPF: " + cpf);
        System.out.println("Endereço: " + endereco);
        System.out.println("Telefone: " + telefone);
        System.out.println("Setor: " + setor);
    }
}

// Classe FuncionarioAssalariado
class FuncionarioAssalariado extends Funcionario {
    private double salarioMensal;

    public FuncionarioAssalariado(String nome, String cpf, String endereco, String telefone, String setor, double salarioMensal) {
        super(nome, cpf, endereco, telefone, setor);
        this.salarioMensal = salarioMensal;
    }

    @Override
    public double calcularPagamento() {
        return salarioMensal;
    }

    @Override
    public void aplicarAumento(double percentual) {
        salarioMensal += salarioMensal * (percentual / 100);
    }
}

// Classe FuncionarioHorista
class FuncionarioHorista extends Funcionario {
    private double horasTrabalhadas;
    private double valorHora;

    public FuncionarioHorista(String nome, String cpf, String endereco, String telefone, String setor, double horasTrabalhadas, double valorHora) {
        super(nome, cpf, endereco, telefone, setor);
        this.horasTrabalhadas = horasTrabalhadas;
        this.valorHora = valorHora;
    }

    @Override
    public double calcularPagamento() {
        return horasTrabalhadas * valorHora;
    }

    @Override
    public void aplicarAumento(double percentual) {
        valorHora += valorHora * (percentual / 100);
    }
}

