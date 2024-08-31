/*Escreva um programa Java que faça a troca de quartos entre dois hospedes. É
preciso que ele receba o nome de um cliente e sua idade; o cliente a princípio será
hospedado no quarto A. Depois, o programa deve receber o nome de outro cliente
e sua idade; se o cliente for mais jovem, ficará no quarto B, mas, se a idade deste
for maior que a do primeiro cliente, ele ficará no quarto A e o primeiro cliente ficará
no quarto B. Além disso, se a pessoa mais velha for idosa (com 60 anos ou mais),
terá desconto de 40%. O programa deve mostrar ao final o nome do cliente que
ficou no quarto A e o desconto, se houver, e o nome do cliente que ficou no quarto B
*/

package atividade1.pkg2;

import java.util.Scanner;

public class Atividade1v2 {

    public static void main(String[] args) {
        Scanner entrada = new Scanner(System.in);

        System.out.println("Informe o nome do primeiro Cliente");
        String nomeClienteA = entrada.nextLine();

        System.out.println("Informe o nome do segundo Cliente");
        String nomeClienteB = entrada.nextLine();
        entrada.nextLine();

        System.out.println("Informe a idade do primeiro Cliente");
        int idadeClienteA = entrada.nextInt();
        System.out.println("Informe a idade do segundo Cliente");
        int idadeClienteB = entrada.nextInt();

        String QuartoA, QuartoB;

        if (idadeClienteA >= idadeClienteB) {
            QuartoA = nomeClienteA;
            QuartoB = nomeClienteB;
            System.out.println("O hóspede " + nomeClienteA + " Se hospedará no quartoA.");
            System.out.println("O hóspede " + nomeClienteB + " Se hospedará no quartoB.");

        } else {
            QuartoA = nomeClienteB;
            QuartoB = nomeClienteA;
            System.out.println("O hóspede " + nomeClienteB + " Se hospedará no quartoA.");
            System.out.println("O hóspede " + nomeClienteA + " Se hospedará no quartoB.");

        }
        if (idadeClienteA >= 60) {
            System.out.println("O hóspede " + nomeClienteA + " recebe 40% de desconto. ");
        } else {
            System.out.println("O hóspede " + nomeClienteA + " não recebe desconto");
        }
        if (idadeClienteB >= 60) {
            System.out.println("O hóspede " + nomeClienteB + " recebe 40% de desconto. ");
        } else {
            System.out.println("O hóspede " + nomeClienteB + " não recebe desconto");
        }
    }
}
