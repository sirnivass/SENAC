package trocaquartos;

import java.util.Scanner;

public class TrocaQuartos {

    public static void main(String[] args) {
        Scanner entrada = new Scanner(System.in);

        // Variáveis para armazenar os dados dos hóspedes e quartos
        String nome1, nome2, quartoA, quartoB;
        int idade1, idade2;
        double desconto1 = 0.0, desconto2 = 0.0;

        // Entrada de dados para o primeiro hóspede
        System.out.println("Nome do primeiro hospede: ");
        nome1 = entrada.nextLine();
        System.out.println("Idade:");
        idade1 = entrada.nextInt();
        entrada.nextLine(); // Limpar o buffer

        // Entrada de dados para o segundo hóspede
        System.out.println("Nome do segundo hospede: ");
        nome2 = entrada.nextLine();
        System.out.println("Idade:");
        idade2 = entrada.nextInt();
        entrada.nextLine(); // Limpar o buffer

        // Determinar quem ficará em cada quarto
        if (idade1 < idade2) {
            quartoA = nome2;
            quartoB = nome1;
        } else if (idade1 > idade2) {
            quartoA = nome1;
            quartoB = nome2;
        } else { // idades iguais
            quartoA = nome1;
            quartoB = nome2;
        }

        // Aplicar desconto se o hóspede for idoso
        if (idade1 >= 60) {
            desconto1 = 0.4;
        }
        if (idade2 >= 60) {
            desconto2 = 0.4;
        }

        // Exibir resultados
        System.out.println("Quarto A: " + quartoA);
        System.out.println("Quarto B: " + quartoB);
        System.out.println(desconto1);
        System.out.println(desconto2);
        //System.out.println("Quarto A: " + quartoA + (desconto1 > 0.0 ? " com desconto de " + (desconto1 * 100) + "%;" : ";"));
        //System.out.println("Quarto B: " + quartoB + (desconto2 > 0.0 ? " com desconto de " + (desconto2 * 100) + "%;" : ";"));

        entrada.close();
    }
}
