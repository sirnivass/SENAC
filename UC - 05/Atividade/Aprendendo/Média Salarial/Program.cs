class Prgram{
    static void Main()
    {
        float salario, soma = 0, N = 0, media;

            do{
            Console.WriteLine("Informe o valor do salário:");
            salario = float.Parse(Console.ReadLine());
            soma = soma + salario; //ACUMULADOR
            N = N +1;        //CONTADOR
            }while(N<5);

        media = soma / N;

        Console.WriteLine("O valor médio dos salários é: {0} ", media);

    }
}