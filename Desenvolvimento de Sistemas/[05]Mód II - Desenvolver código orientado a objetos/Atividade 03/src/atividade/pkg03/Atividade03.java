package atividade.pkg03;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Atividade03 {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        List<Funcionario> funcionarios = new ArrayList<>();

        // Solicitação de dados para até 10 funcionários
        for (int i = 0; i < 10; i++) {
            System.out.println("Digite os dados do funcionário " + (i + 1));

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
                i--; // Volta uma iteração para repetir a entrada para este funcionário
            }

            System.out.println(); // Espaço entre os funcionários
        }

        // Mostrar os dados e pagamento de cada funcionário
        System.out.println("\n----- Dados dos Funcionários e Pagamentos -----");
        for (Funcionario funcionario : funcionarios) {
            funcionario.mostrarDados();
            System.out.println("Pagamento: $" + funcionario.calcularPagamento());
            System.out.println(); // Espaço entre os funcionários
        }

        // Aplicar aumento geral
        System.out.print("Digite o percentual de aumento a ser aplicado a todos os funcionários (%): ");
        double aumentoGeral = scanner.nextDouble();
        for (Funcionario funcionario : funcionarios) {
            funcionario.aplicarAumento(aumentoGeral);
            System.out.println(); // Espaço entre os funcionários
        }

        scanner.close();
    }
}
