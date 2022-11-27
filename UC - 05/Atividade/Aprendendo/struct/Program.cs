/*
* A sintaxe de declaração do struct é a seguinte:
* =================================================================================================
* <modificador de acesso> struct <nome>
* {
*    atributos
* }
* =================================================================================================
* Na struct cada atributo é definido por:
* 
* <modificador de acesso> <tipo> <nome>;
* =================================================================================================
* No exemplo “Aluno”, pode-se definir a estrutura desta forma: 
* 
*  struct Aluno
*  {
*    public string nome;
*    public double nota;
*  }
* ================================================================================================= 
* 
* Nome e nota são os atributos, e o acesso a eles ocorre usando “.” . Veja no exemplo a seguir: 
*
* Aluno a = new Aluno();
* a.nome = "Fulano";
* a.nota = 9.75;
* Console.WriteLine("Aluno: " + a.nome + "; nota: " + a.nota);
* ================================================================================================= 
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!Diferentemente de outras linguagens, em C# o funcionamento e a sintaxe do struct são muito!!!!!!!!!!
!!!próximos das classes. De fato, struct é considerado uma versão leve das classes e é útil quando,!!!!
!!!por exemplo, você precisa criar uma matriz grande de objetos e não quer consumir muita memória para!
!!!tanto. Apesar de compartilhar boa parte da sintaxe das classes, os structs são mais limitados. !!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
*
*Programa em C# que calcula uma média de notas entre os alunos informados e mostra aqueles que estão 
* acima da média, utilizando struct
*/

using System;
struct Aluno
{
    public string nome;
    public double nota;
}
class Program
{
    static void Main(string[] args)
    {
        Aluno[] alunos;
        double media;
        int quantidade;

        Console.Write("Informe quantos alunos: ");
        quantidade = int.Parse(Console.ReadLine());
        alunos = new Aluno[quantidade];

        media = 0;

        for (int i = 0; i < quantidade; i++)
        {
            alunos[i] = new Aluno();
            Console.Write("Digite o nome do aluno: ");
            alunos[i].nome = Console.ReadLine();
            Console.Write("Digite a nota do aluno: ");
            alunos[i].nota = double.Parse(Console.ReadLine());
            media = media + alunos[i].nota;
        }

        media = media / quantidade;
        Console.WriteLine("Média: {0}", media);

        for (int i = 0; i < quantidade; i++)
        {
            if (alunos[i].nota >= media)
            {
                Console.WriteLine("Aluno {0} acima da média. Nota {1}",
                alunos[i].nome, alunos[i].nota);
            }
        }
        Console.WriteLine("Fim do Programa");
    }
}