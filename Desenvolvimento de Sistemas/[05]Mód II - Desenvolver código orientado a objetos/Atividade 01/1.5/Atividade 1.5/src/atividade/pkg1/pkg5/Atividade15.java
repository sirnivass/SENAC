/*Monte um programa Java que mostre na tela em formato de tabela os
quartos ocupados e os desocupados. Considere que o hotel tem 4 andares e 3
quartos por andar. Primeiro, o usuário registrará os quartos ocupados,
informando para cada ocupação o número do apartamento (andar de 1 a 4 e
número de quarto de 1 a 3). O programa deverá questionar “Deseja informar
outra ocupação? (S/N)” e o usuário poderá informar quantos quartos quiser, até
que responda “N” a essa pergunta. Em seguida, o programa mostrará uma
tabela, em que o primeiro andar é o inferior e o último, o superior, marcando
com X o quarto ocupado.*/

package atividade.pkg1.pkg5;

import java.util.Scanner;

public class Atividade15 {
    public static void main(String[] args) {


            Scanner scanner = new Scanner(System.in);

        // Número total de quartos no hotel
        int totalQuartos = 4 * 3; // 4 andares x 3 quartos por andar
        
        // Array para armazenar a ocupação dos quartos (true para ocupado, false para desocupado)
        boolean[] quartos = new boolean[totalQuartos];
        
        // Loop para registrar quartos ocupados
        do {
            System.out.println("\nInforme o número do apartamento (andar de 1 a 4 e número de quarto de 1 a 3): ");
            System.out.print("Andar (1 a 4): ");
            int andar = scanner.nextInt();
            
            // Verifica se o andar informado está dentro do intervalo válido
            if (andar < 1 || andar > 4) {
                System.out.println("Andar inválido. Informe um número entre 1 e 4.");
                continue; // Reinicia o loop para pedir um novo andar
            }
            
            System.out.print("Número do quarto (1 a 3): ");
            int quarto = scanner.nextInt();
            
            // Verifica se o número do quarto informado está dentro do intervalo válido
            if (quarto < 1 || quarto > 3) {
                System.out.println("Quarto inválido. Informe um número entre 1 e 3.");
                continue; // Reinicia o loop para pedir um novo número de quarto
            }
            
            // Calcula o índice correspondente ao quarto na matriz unidimensional
            int indiceQuarto = (andar - 1) * 3 + (quarto - 1);
            
            // Marca o quarto como ocupado na matriz
            quartos[indiceQuarto] = true;
            
            // Pergunta se deseja informar outra ocupação
            System.out.print("Deseja informar outra ocupação? (S/N): ");
        } while (scanner.next().equalsIgnoreCase("S"));
        
        // Exibe a tabela de ocupação dos quartos
        System.out.println("\nTabela de Ocupação dos Quartos:");
        System.out.println("++++++++++++++++++");
        // Loop para percorrer os andares de cima para baixo (de 4 a 1)
        for (int andar = 4; andar >= 1; andar--) {
            System.out.print("+ Andar " + andar + ": ");
            
            // Loop para percorrer os quartos de cada andar (de 1 a 3)
            for (int quarto = 1; quarto <= 3; quarto++) {
                // Calcula o índice correspondente ao quarto na matriz unidimensional
                int indiceQuarto = (andar - 1) * 3 + (quarto - 1);
                
                // Verifica se o quarto está ocupado ou não e exibe "X" para ocupado e "O" para desocupado
                if (quartos[indiceQuarto]) {
                    System.out.print("X "); // Quarto ocupado
                } else {
                    System.out.print("O "); // Quarto desocupado
                }
            }
            
            System.out.println("+"); // Nova linha para próximo andar
        }
        System.out.println("++++++++++++++++++");
         
        scanner.close(); // Fecha o scanner
    }
    
}
