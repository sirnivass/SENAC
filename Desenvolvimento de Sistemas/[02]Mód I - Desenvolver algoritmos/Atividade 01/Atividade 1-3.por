programa
{
	/*O auditório Alfa conta com 150 lugares e espaço para até 70
	 * cadeiras adicionais que são colocadas quando necessário. O cálculo leva em
	 * consideração o valor informado pelo usuário e a quantidade de cadeiras do
	 * auditório.
	 * O auditório Beta já conta com 350 lugares, sem a necessidade de cadeiras
	 * adicionais. Desenvolva um algoritmo que receba o número de convidados do
	 * evento e faça uma verificação sobre a quantidade: se for maior que 350 ou se
	 * for menor que zero, mostre a mensagem “Número de convidados inválido”. Se
	 * o valor informado é válido, mostre na tela qual dos auditórios é o mais
	 * adequado. No caso do auditório Alfa, calcule, quando necessário, a quantidade
	 * de cadeiras adicionais que serão necessárias, observando o limite citado acima.
	 * Utilize obrigatoriamente condicionais SE, SENAO SE
	*/	
	funcao inicio()
	{
		inteiro numeroConvidados
		// Definindo a capacidade dos auditórios
		const inteiro lugaresAuditorioAlfa = 150 //declaração de Constantes
		const inteiro lugaresAuditorioBeta = 350 //declaração de Constantes
		// Solicitando o número de convidados
		escreva("Informe o número de convidados: ")
		leia(numeroConvidados)
		// Verificando se o número de convidados é válido
		se (numeroConvidados < 0 ou numeroConvidados > lugaresAuditorioBeta)
		{
			escreva("Número de convidados inválido")
		}
		// Verificando qual auditório é mais adequado
		senao se (numeroConvidados <= lugaresAuditorioAlfa)
		{
         		escreva("Auditório Alfa é o mais adequado.\n Não serão necessárias cadeiras adicionais.")
		}
         	// Calculando a quantidade de cadeiras adicionais, até o limite estabelecido.
		senao se (numeroConvidados > lugaresAuditorioAlfa e numeroConvidados <= 220)
         	{
            	inteiro cadeirasAdicionais = numeroConvidados - lugaresAuditorioAlfa
            	escreva("Serão necessárias ", cadeirasAdicionais, " cadeiras adicionais a mais que as do Auditório Alfa.")
         	}
         	//Caso ultrapasse as 70 cadeiras
         	senao se(numeroConvidados > 220)
		{
			escreva("O Auditório Beta é o mais adequado")
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 2023; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */