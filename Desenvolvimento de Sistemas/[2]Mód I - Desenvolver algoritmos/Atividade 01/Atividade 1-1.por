programa
{
	
	/*
	*Quando uma empresa contrata o hotel para abrigar eventos, o hotel oferece
	*garçons para servir os convidados. Considerando que cada garçom custa R$
	*10,50 por hora, escreva um algoritmo que recebe o número de garçons
	*necessários e o total de horas do evento. Depois calcule o custo total que o
	*hotel terá com a contratação desses profissionais e mostre na tela o resultado
	*/
	funcao inicio()
	{
		inteiro numeroGarcons
		real horasEvento, custoTotal
		
		// Solicita o número de garçons necessários
		escreva("Digite quantos garçons que você deseja contratar: ")
		leia(numeroGarcons)
		
		// Solicita o total de horas do evento
		escreva("Digite o total de horas previstas do evento: ")
		leia(horasEvento)
		
		//Calcula o Total com base do número de garçons e horas do evento
		custoTotal = numeroGarcons * horasEvento * 10.50
		
		// Exibe o resultado na tela
   		escreva("O custo total previsto, com a contratação dos garçons e horas é: R$", custoTotal)
		
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1001; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 */