programa
{
		/* O hotel oferece café, água e salgadinhos para cada um dos convidados de
		 * um evento alocado em suas dependências. A quantidade de café, em litros, é
		 * calculada como 0,2 litro para cada convidado; a quantidade de água é calculada
		 * como 0,5 litro para cada convidado; são oferecidos 7 salgadinhos por pessoa.
		 * O hotel realiza agendamentos de pedidos, onde o usuário informa a quantidade
		 * de convidados. O mínimo é 30 convidados, com no máximo 350 convidados.
		 * Caso o valor não seja adequado mostre a mensagem “quantidade de
		 * convidados superior ou inferior à capacidade”. Caso a quantidade seja válida,
		 * calcule a quantidade de água, café e salgadinhos para o evento, mostrando na tela esses valores.
		 * Utilize obrigatoriamente a estrutura condicional SE com no mínimo um operador lógico (E/OU/NAO).
		*/
	funcao inicio()
	{
		inteiro quantidadeConvidados
		// Solicita a quantidade de convidados
		escreva("Digite a quantidade de convidados (entre 30 e 350): ")
		leia(quantidadeConvidados)

		// Verifica se a quantidade de convidados está dentro da faixa permitida
		se (quantidadeConvidados < 30 ou quantidadeConvidados > 350) 
		{
		// Exibe mensagem de erro se a quantidade de convidados não estiver dentro da faixa permitida
		escreva("Quantidade de convidados superior ou inferior à capacidade.") 
		}
		//Caso a quantidade de COnvidados seja adequada, segue:
		senao
		{
		// Calcula a quantidade de água, café e salgadinhos para o evento
		real quantidadeAgua = quantidadeConvidados * 0.5
		real quantidadeCafe = quantidadeConvidados * 0.2
		inteiro quantidadeSalgadinhos = quantidadeConvidados * 7

		// Exibe os resultados na tela
		escreva("Quantidade de água necessária: ", quantidadeAgua, " litros \n")
		escreva("Quantidade de café necessária: ", quantidadeCafe, " litros \n")
		escreva("Quantidade de salgadinhos necessária: ", quantidadeSalgadinhos)
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 869; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */