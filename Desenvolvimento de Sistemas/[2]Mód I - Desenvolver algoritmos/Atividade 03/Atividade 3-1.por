programa
{
	/*
	 * No restaurante do hotel é oferecida uma cortesia para os hospedes. Em toda
	 *refeição o hotel paga R$ 30,99 reais do valor gasto pelos hospedes. Caso o
	 *hospede gaste menos que R$ 30,99 ou exatamente esse valor ele não precisa
	 *pagar nada. Caso o valor da mesa seja maior que R$ 30,99 o hóspede precisa
	 *pagar a diferença (o valor da refeição descontando a cortesia).
	 *No sistema primeiro precisamos solicitar para o usuário e armazenar o valor de
	 *4 mesas e guardar dentro de um vetor esses valores. Posteriormente
	 *precisamos verificar os valores armazenados para retornar para o usuário se a
	 *mesa precisa pagar ou não algum valor. Caso nenhum valor precise ser pago
	 *deve ser retornada a mensagem "Nada a pagar!", caso a mesa precise pagar
	 *algum valor deve ser retornado "A mesa precisa pagar: " e logo em seguida ser
	 *retornado quanto a mesa deve. Lembrando que precisamos fazer isso para todas as mesas.  
	 */
	
	funcao inicio()
	{
		inteiro vetorMesa[4]
		real valorMesa
		const real cortesia = 30.99

		para (inteiro i = 0; i < 4; i++)
		{
			escreva("Qual o valor da mesa ", i +1, "? : ")
			leia(vetorMesa[i])
		}
		para (inteiro i = 0; i < 4; i++)
		{
			real diferenca = vetorMesa[i] - cortesia

			se(diferenca <= 0)
			{
			escreva("Mesa nº ", i +1, ": Nada a pagar.\n")
			}
			senao
			{
				escreva("Mesa nº ", i +1, ": precisa pagar: R$: ", diferenca, "\n")
			}
			}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 292; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */