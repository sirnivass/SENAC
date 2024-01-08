programa
{
	/*
	 * É obrigatório utilizar um único ENQUANTO. Escreva um algoritmo que
	 * receba o valor padrão de uma diária. Em seguida, receba os nomes dos
	 * hóspedes e suas idades. Caso o hóspede tenha até 4 anos ele não paga
	 * hospedagem – nesses casos mostre na tela “(Nome do hóspede) possui
	 * gratuidade” – e hóspedes com 80 anos ou mais pagam metade – mostre na tela
	 * “(Nome do hóspede) paga meia”. Pergunte ao usuário se ele deseja continuar
	 * a informar os dados (“S” ou “N”) e, caso digite “N”, encerre a execução. Ao fim,
	 * mostre a quantidade de gratuidades, a quantidade de meias hospedagens e o
	 * valor total, considerando todos os hóspedes informados.
	 */
	funcao inicio()
	{
		real valorDiaria, totalValor = 0.0
		//É importante iniciar com 0 para não herdar lixo de memória(!)
		inteiro gratuidades = 0, meiasHospedagens = 0 
		caracter continuar
		continuar = 'S'
		
		// Solicita ao usuário que informe o valor padrão da diária
		escreva("Informe o valor padrão da diária: ")
		leia(valorDiaria)
		
		// Enquanto o usuário desejar continuar informando dados
		//Somente N maiúsculo, qualquer outra coisa nao irá parar o programa...
		enquanto (continuar != 'N')
		{
		    cadeia nomeHospede //ainda acho estranho chamar string/varchar de cadeia
		    inteiro idadeHospede
		
		    // Solicita ao usuário que informe o nome do hóspede
		    escreva("Informe o nome do hóspede: ")
		    leia(nomeHospede)
		
		    // Solicita ao usuário que informe a idade do hóspede
		    escreva("Informe a idade do hóspede: ")
		    leia(idadeHospede)
		
		    // Verifica as condições de gratuidade e meia hospedagem
		    se (idadeHospede <= 4)
		    {
		        // Hóspede com até 4 anos possui gratuidade
		        escreva("(", nomeHospede, ") possui gratuidade\n")
		        gratuidades = gratuidades + 1
		    }
		    senao se (idadeHospede >= 80)
		    {
		        // Hóspede com 80 anos ou mais paga meia
		        escreva("(", nomeHospede, ") paga meia\n")
		        meiasHospedagens = meiasHospedagens + 1
		        totalValor = totalValor + (valorDiaria / 2)
		    }
		    senao
		    {
		        // Hóspede com idade entre 4 e 80 anos paga valor integral
		        escreva("(", nomeHospede, ") paga valor integral\n")
		        totalValor = totalValor + valorDiaria
		    }
		
		    // Pergunta ao usuário se deseja continuar informando dados
		    escreva("Deseja continuar informando dados? (S/N): ")
		    leia(continuar)
		}
		
		// Mostra os resultados ao final
		escreva("\nResumo:")
		escreva("\n- Não pagantes: ", gratuidades)
		escreva("\n- Meias: ", meiasHospedagens)
		escreva("\n- Total: R$ ", totalValor)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 148; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */