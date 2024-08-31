package atividade.pkg04;

import java.util.Scanner;

public class Atividade04 {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Pedir nome da empresa
        System.out.print("Digite o nome da empresa: ");
        String nomeEmpresa = scanner.nextLine();

        // Criar objeto Pagamentos
        Pagamentos pagamentos = new Pagamentos(nomeEmpresa);

        // Cadastro de impostos
        while (true) { //Esse "enquanto garante que será digitado PIS ou IPI
            System.out.print("Digite o tipo de imposto (PIS ou IPI) ou 'pare' para encerrar: ");
            String tipoImposto = scanner.nextLine();

            if (tipoImposto.equalsIgnoreCase("pare")) {
                break;
            }

            if (tipoImposto.equalsIgnoreCase("PIS")) {
                System.out.print("Digite o valor total de débito: ");
                double debito = scanner.nextDouble();
                System.out.print("Digite o valor total de crédito: ");
                double credito = scanner.nextDouble();
                scanner.nextLine(); // Limpar o buffer

                // Criar e adicionar objeto PIS à lista de impostos
                PIS pis = new PIS(debito, credito);
                pagamentos.adicionarImposto(pis);
            } else if (tipoImposto.equalsIgnoreCase("IPI")) {
                System.out.print("Digite o valor do produto: ");
                double valorProduto = scanner.nextDouble();
                System.out.print("Digite o valor do frete: ");
                double frete = scanner.nextDouble();
                System.out.print("Digite o valor do seguro: ");
                double seguro = scanner.nextDouble();
                System.out.print("Digite o valor de outras despesas: ");
                double outrasDespesas = scanner.nextDouble();
                System.out.print("Digite a alíquota (%): ");
                double aliquota = scanner.nextDouble();
                scanner.nextLine(); // Limpar o buffer

                // Criar e adicionar objeto IPI à lista de impostos
                IPI ipi = new IPI(valorProduto, frete, seguro, outrasDespesas, aliquota);
                pagamentos.adicionarImposto(ipi);
            } else {
                System.out.println("Tipo de imposto inválido.");
            }
        }

        // Calcular e exibir todos os impostos cadastrados
        pagamentos.calcularEExibirImpostos();

        scanner.close();
    }
}
