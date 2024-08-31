/*
1. Relativo ao atendimento de eventos, o hotel necessita de uma funcionalidade
que indique qual de seus dois auditórios é o mais adequado para um evento. O
auditório Alfa conta com 150 lugares e espaço para até 70 cadeiras adicionais. O
auditório Beta conta com 350 lugares, sem espaço para mais cadeiras. Desenvolva
um programa Java que receba o número de convidados do evento e faça uma
verificação sobre esse número: se for maior que 350 ou menor que zero, deverá ser
mostrada a mensagem “Número de convidados inválido”. Se o valor informado é
válido, deverá ser mostrado na tela qual dos auditórios é o mais adequado. No caso
do auditório Alfa, será preciso calcular ainda quantas cadeiras adicionais serão
necessárias, observando o limite citado anteriormente.
Exemplo:
[Entrada de dados]
190 convidados (número de convidados)
[Saída de dados]
Use o auditório Alfa
Inclua mais 40 cadeiras
*/

package atividade.pkg1.pkg1;
import java.util.Scanner;
public class Atividade11 {

    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        // Solicita o número de convidados
        // Aqui o do while faz a verificação sobre o n de usuarios.
        int numeroConvidados;
        do {
            System.out.println("Digite o número de convidados:");
            // Atribui à variável o proximo int digitado. Caso a entrada nao seja um inteiro, dará erro.
            numeroConvidados = scan.nextInt();       
            if(numeroConvidados <= 0 || numeroConvidados > 350)
                System.out.println("Número de convidados inválido!");
        }while (numeroConvidados <= 0 || numeroConvidados > 350);
            // Verifica qual auditório é mais adequado
            if (numeroConvidados <= 150) {
                System.out.println("Use o auditório Alfa");
                int cadeirasAdicionais = Math.max(0, numeroConvidados - 150);
                if (cadeirasAdicionais > 0) {
                    System.out.println("Inclua mais " + cadeirasAdicionais + " cadeiras");
                }
            } else if (numeroConvidados <= 220) {
                System.out.println("Use o auditório Alfa");
                int cadeirasAdicionais = numeroConvidados - 150;
                System.out.println("Inclua mais " + cadeirasAdicionais + " cadeiras");
            } else {
                System.out.println("Use o auditório Beta");
            }
        scan.close();
    }
}