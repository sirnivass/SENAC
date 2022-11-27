/* 1. Desenvolva um código que leia um número inteiro e devolva o fatorial deste (por exemplo:
 fatorial de 5 é igual a 5 x 4 x 3 x 2 x 1).

2. Desenvolva um código que leia o nome e o tempo de dez cavalos e traga o nome e o tempo dos cavalos 
mais rápidos.

3. Desenvolva um código que imprima os números menores que 3.000 em ordem decrescente.

4. Desenvolva um código que leia um conjunto de números e imprima a quantidade de números pares e a 
quantidade de números ímpares lidos. A leitura deve acontecer consecutivamente até que o usuário 
digite o número 9999. Neste caso, o programa encerra mostrando as quantidades calculadas. 
*/
using System;
    class Program
    {
        static void Main()
        {
            Console.Write("N: ");
            int N = int.Parse(Console.ReadLine());
            int fact = 1;
            while (true)
            {
                Console.Write(N);
                if (N == 1)
                {
                    break;
                }
                Console.Write("*");
                fact *= N;
                N--;
            }
            Console.WriteLine(" = {0}", fact);
        }
    }
