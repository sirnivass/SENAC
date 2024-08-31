/*
Monte um algoritmo em que o usuário poderá cadastrar e pesquisar hóspedes. O
algoritmo deve oferecer um menu com três opções ao usuário: 1- cadastrar; 2-
pesquisar; 3- sair. A opção “cadastrar” deve permitir que o usuário informe um
nome de hóspede, gravando-o em memória (máximo de 15 cadastros; caso atinja
essa quantidade, mostre “Máximo de cadastros atingido”). A opção “pesquisar” deve
permitir que o usuário informe um nome e, caso seja encontrado um nome
exatamente igual, mostre a mensagem “Hóspede (nome) foi encontrado no índice
(índice onde foi cadastrado)”. Se o nome não foi encontrado, mostre “Hóspede não
encontrado”. O algoritmo deve permitir que o usuário realize essas operações
repetidas vezes, até que use a opção “3”, que encerra o algoritmo.
Exemplo:
[Saída de dados]
Digite 1- cadastrar; 2- pesquisar; 3- sair
[Entrada de dados]
1 (opção)
Maria da Silva (nome do hóspede)
[Saída de dados]
Digite 1- cadastrar; 2- pesquisar; 3- sair
[Entrada de dados]
1 (opção)
José Freitas (nome do hóspede)
[Saída de dados]
Digite 1- cadastrar; 2- pesquisar; 3- sair
[Entrada de dados]
2 (opção)
José Freitas
[Saída de dados]
Hóspede José Freitas foi encontrado no índice 1
[Saída de dados]
Digite 1- cadastrar; 2- pesquisar; 3- sair
[Entrada de dados]
3
 */
package atividade.pkg1.pkg4;

import java.util.Scanner;

public class Atividade14 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Array para armazenar os nomes dos hóspedes
        String[] hospedes = new String[15]; // Máximo de 15 cadastros

        int totalCadastros = 0; // Contador para controlar o número de cadastros realizados

        // Menu principal
        int opcao;
        do {
            System.out.println("\nMenu:");
            System.out.println("1 - Cadastrar");
            System.out.println("2 - Pesquisar");
            System.out.println("3 - Sair");
            System.out.print("Escolha uma opção: ");
            opcao = scanner.nextInt();

            switch (opcao) {
                case 1:
                    if (totalCadastros < 15) { // Verifica se ainda há espaço para mais cadastros
                        System.out.print("Digite o nome do hóspede: ");
                        String nome = scanner.next();
                        hospedes[totalCadastros] = nome; // Armazena o nome no array de hóspedes
                        totalCadastros++; // Incrementa o contador de cadastros
                        System.out.println("Hóspede cadastrado com sucesso.");
                    } else {
                        System.out.println("Máximo de cadastros atingido.");
                    }
                    break;

                case 2:
                    System.out.print("Digite o nome a ser pesquisado: ");
                    String nomePesquisa = scanner.next();

                    boolean encontrado = false;
                    for (int i = 0; i < totalCadastros; i++) {
                        if (hospedes[i].equalsIgnoreCase(nomePesquisa)) { // Compara os nomes ignorando maiúsculas/minúsculas
                            System.out.println("Hóspede " + nomePesquisa + " encontrado no índice " + i + ".");
                            encontrado = true;
                            break; // Interrompe o loop ao encontrar o nome
                        }
                    }

                    if (!encontrado) {
                        System.out.println("Hóspede não encontrado.");
                    }
                    break;

                case 3:
                    System.out.println("Encerrando o programa.");
                    break;

                default:
                    System.out.println("Opção inválida. Escolha novamente.");
                    break;
            }

        } while (opcao != 3); // Continua o loop até que o usuário escolha a opção de sair

        scanner.close(); // Fecha o scanner
    }
    
}
