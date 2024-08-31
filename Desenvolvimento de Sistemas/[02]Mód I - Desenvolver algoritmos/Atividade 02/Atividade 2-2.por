programa
{
	/*
	 * É obrigatório utilizar um único PARA e não usar vetor ou listas. Monte
	 * um algoritmo em que se informa a quantidade de hóspedes e, para cada
	 * hóspede, leia o número do quarto e o valor da diária. Mostre na tela a
	 * mensagem “Quarto [numero]: R$ [valor]”. Ao final, mostre o total de diárias, o
	 * valor da menor diária e o valor da maior diária.
	 */
	
	funcao inicio()
	{
		inteiro hospedes, numeroQuarto
		real valorDiaria
		real maiorDiaria = 0.0 //inicio a variável com o menor valor possível para ela pegar imediatamente o valor acima de 0
		real menorDiaria = 9999999.9 //inicio a variável com o maior valor possível para ela pegar imediatamente o valor abaixo
		real totalDiarias = 0.0 //inicio a variável por puro capricho desa "IDE"

		escreva("Informe o número de hóspedes: ")
		leia(hospedes)
		
			para(inteiro i = 1; i <= hospedes; i++)
		{
			escreva("Informe o quarto do ", i, "º hóspede: ")
			leia(numeroQuarto)
			escreva("Informe o valor da diária do ", i, "º hóspede: ")
			leia(valorDiaria)

			// Atualiza o total de diárias
			
			totalDiarias = totalDiarias + valorDiaria


			// Verifica o valor da diária e compara com a Menor, atualiza se necessário
			se(valorDiaria < menorDiaria)
			{
				menorDiaria = valorDiaria
			}

			// Verifica o valor da diária e compara com a Mario, atualiza se necessário
			se(valorDiaria > maiorDiaria)
			{
				maiorDiaria = valorDiaria
			}

			// Mostra na tela a mensagem solicitada
			escreva("Quarto ", numeroQuarto, ": R$ ", valorDiaria, "\n")
		}

		// Mostra na tela o total de diárias, o valor da menor diária e o valor da maior diária
		escreva("Total de diárias: R$ ", totalDiarias, "\n")
		escreva("Menor diária: R$ ", menorDiaria, "\n")
		escreva("Maior diária: R$ ", maiorDiaria, "\n")
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 914; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */