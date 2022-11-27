/*
* Length = tamanho do vetor
*
* 
* Declarando um Array:
* tipo[] identificador.
* Exemplo: string[] contatos = new string[3]; !!!![O 3 mostra um array estático]!!!!
* ========================================================================================
* Como C# é uma linguagem orientada a objetos, vetores são considerados objetos. 
* A palavra reservada “new” é utilizada para criar um array justamente por esse motivo. 
* Com isso, também está sendo alocada (ou reservada) 
* a memória necessária para o array (no exemplo, espaço para três valores do tipo string).
* ========================================================================================
* Quanto ao tamanho, arrays são entidades estáticas (posições que permanecerá até o fim da aplicação).
* Entretanto, os valores de cada espaço podem ser modificados, trocados e excluídos livremente. 
* ========================================================================================
* Desenvolva um programa que declare o vetor “contatos”, que inicialize e que mostre os elementos 
* na tela. Depois, siga lendo o conteúdo disponível neste material. 

* No Vetor, usamos Length para nos definir ao tamaho do Array (semelhante ao vector size)

*/

using System;

class program
{
    static void Main()
    {
        double[] notas;
        string[] nomes;
        double media;
        int quantidade;

        Console.Write("Informe quantos alunos: ");
        quantidade = int.Parse(Console.ReadLine());
        notas = new double[quantidade];
        nomes = new string[quantidade];
        media = 0;

        for (int i = 0; i < quantidade; i++)
        {
            Console.Write("Digite o nome do aluno: ");
            nomes[i] = Console.ReadLine();
            Console.Write("Digite a nota do aluno: ");
            notas[i] = double.Parse(Console.ReadLine());
            //vírgula separa decimal p/ o double.Parse
            media = media + notas[i];
        }
        media = media / quantidade;
        Console.WriteLine("Média: {0}", media);
        for (int i = 0; i < quantidade; i++)
        {
            if (notas[i] >= media)
            {
                Console.WriteLine("Aluno {0} acima da média. Nota {1}",
                nomes[i], notas[i]);
            }
        }
        Console.WriteLine("Fim do Programa");
    }
}