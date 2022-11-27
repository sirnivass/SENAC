using System; // Algma extensão chamou para mim...
class Prgram{// Aparentemente isso é da linguagem.

    static void Main() // Meu Main
    {
        int nascimento = 0, idade = 0; //Variáveis
        Console.WriteLine("Em qual ano você nasceu?");
        //"Lógica"
        nascimento = int.Parse(Console.ReadLine());
        idade = DateTime.Now.Year - nascimento;
        //Desvio condicional.
        if (idade > 0)
            if(idade <= 18)
            {
                Console.WriteLine("Menor de Idade");            
            }
            else
            {
                Console.WriteLine("Maior de Idade");            
            }
        else
        {
            Console.WriteLine("Ano de nascimento Inválido");
        }
    }
}