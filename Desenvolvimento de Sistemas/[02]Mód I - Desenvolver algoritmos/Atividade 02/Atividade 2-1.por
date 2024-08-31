programa
{

	/*É obrigatório utilizar um único FACA ENQUANTO. Desenvolva um
	 * algoritmo que receba o valor de uma diária no hotel e a quantidade de dias de
	 * hospedagem. Valide as informações, ou seja, caso o usuário insira dados
	 * inválidos não permita que ele saia do laço de repetição até informar dados
	 * válidos.
	 * As condições são:
	 * •Nenhum dos valores pode ser negativo.
	 * •A quantidade de dias não pode ser maior que 30.
	 * Em caso de informação inválida escreva na tela “ValorInválido”. Ao final de tudo
	 * escreva “Fim do programa”.
	 */
	funcao inicio()
	{
		//Variaveis
		real valorDiaria 
		inteiro quantidadeDias
		// Repetição do bloco abaixo ENQUANTO as condições não forem atendidas
		faca 
		{
			// Solicita ao usuário que digite o valor da diária no hotel
			escreva("Digite o valor da diária no hotel: ")
			// Lê o valor da diária 
			leia(valorDiaria)
			// Solicita ao usuário que digite a quantidade de dias de hospedagem
			escreva("Digite quantos dias de hospedagem: ")
			// Lê a quantidade de dias 
			leia(quantidadeDias)
			// Verifica se as condições de validação não foram atendidas
			se ( quantidadeDias <= 0 ou quantidadeDias > 30 ou valorDiaria <= 0)
				// Se as condições não forem atendidas, exibe uma mensagem de valor inválido
				escreva("Valor inválido\n")
	       // Continua repetindo o bloco enquanto as descritas no parênmteses condições não forem atendidas	
		} enquanto (quantidadeDias < 0 ou quantidadeDias > 30 ou valorDiaria <= 0)
			// Exibe uma mensagem indicando o fim do programa
			escreva("Fim do Programa")

	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1393; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */