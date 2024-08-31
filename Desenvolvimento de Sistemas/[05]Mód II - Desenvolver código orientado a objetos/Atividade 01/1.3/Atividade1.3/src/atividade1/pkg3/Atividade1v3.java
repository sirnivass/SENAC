/*
Escreva um programa Java que receba o valor padrão de uma diária e em
seguida receba vários nomes de hóspedes e suas idades. Caso a idade do
hóspede seja menor de 4 anos, ele não paga hospedagem – nesses casos, é
preciso que seja mostrada na tela a mensagem “(Nome do hóspede) possui
gratuidade”. Hóspedes com mais de 80 anos pagam metade – então dever ser
mostrado na tela “(Nome do hóspede) paga meia”. O usuário informará hóspedes
até digitar a palavra “PARE”, que interrompe a entrada de dados. Ao fim, o
programa deve mostrar a quantidade de gratuidades, a quantidade de meias
hospedagens e o valor total, considerando todos os hóspedes informados
*/

package atividade1.pkg3;

import java.util.Scanner;

public class Atividade1v3 {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);        
        
        // Solicitar valor da diária
        System.out.print("Digite o valor da diária: R$ ");
        double valorDiaria = scanner.nextDouble();

        // Variáveis para contagem
        int gratuidades = 0; // Contador de hóspedes com idade < 4 anos
        int meiasHospedagens = 0; // Contador de hóspedes com idade > 80 anos
        double valorTotal = 0.0; // Valor total arrecadado com hospedagens

        // Entrada de nomes de hóspedes
        while (true) { // Loop infinito para receber múltiplos hóspedes
            System.out.print("Digite o nome do hóspede (ou 'PARE' para encerrar): ");
            String nome = scanner.next();

            if (nome.equalsIgnoreCase("PARE")) { // Verifica se o usuário digitou "PARE" para sair do loop
                break; // Encerra o loop
            }

            System.out.print("Digite a idade do hóspede: ");
            int idade = scanner.nextInt();

            if (idade < 4) { // Verifica se o hóspede tem menos de 4 anos
                System.out.println(nome + " possui gratuidade."); // Mensagem de gratuidade
                gratuidades++; // Incrementa o contador de gratuidades
            } else if (idade > 80) { // Verifica se o hóspede tem mais de 80 anos
                System.out.println(nome + " paga meia."); // Mensagem de meia hospedagem
                meiasHospedagens++; // Incrementa o contador de meias hospedagens
                valorTotal += valorDiaria / 2; // Adiciona metade do valor da diária ao valor total
            } else { // Se não se encaixar nas condições anteriores, paga valor completo da diária
                valorTotal += valorDiaria; // Adiciona o valor completo da diária ao valor total
            }
        }

        // Exibição dos resultados
        System.out.println("\nResumo da Hospedagem:");
        System.out.println("Total de gratuidades: " + gratuidades); // Exibe o total de gratuidades
        System.out.println("Total de meias hospedagens: " + meiasHospedagens); // Exibe o total de meias hospedagens
        System.out.printf("Valor total arrecadado: R$ %.2f\n", valorTotal); // Exibe o valor total arrecadado

        scanner.close(); // Fecha o scanner

    }
    
}
