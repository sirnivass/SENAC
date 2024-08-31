programa
{
	/*
	*Monte um algoritmo em que o usuário poderá cadastrar e pesquisar hóspedes.
	*O algoritmo deve oferecer um menu com três opções ao usuário:
	*1- cadastrar; 2- pesquisar; 3- sair.
	*O algoritmo deve permitir que o usuário realize essas operações repetidas vezes,
	*até que ele digite a opção “3”, que encerra o algoritmo. Sempre que o usuário
	*decide repetir o código deve ser solicitado novamente o que ele deseja fazer. A
	*pesquisa deve funcionar mesmo que poucos ou nenhum nome tenha sido
	*cadastrado, realize a pesquisa até última posição preenchida.
	*A opção “cadastrar” deve permitir que o usuário informe um nome de hóspede,
	*gravando-o em memória. O usuário só pode cadastrar até no máximo 7 hospedes,
	*caso o número de hospedes seja maior que sete não deve ser solicitado o novo
	*nome e uma mensagem (“Máximo de cadastros atingido”) deve ser exibida.
	*A opção “Pesquisar” deve permitir que ousuário informe um nome e, caso seja
	*encontrado um nome exatamente igual, mostre a mensagem “Hospede (nome)
	*foi encontrado no índice” (posição do vetor onde foi encontrado). Todas as
	*posições preenchidas do vetor devem ser verificadas. Caso não tenha sido
	*encontrado o nome em nenhuma das posições deve ser exibida a mensagem de “Hospede não encontrado”.
	*/

	// Definindo o vetor para armazenar os hóspedes
	funcao inicio()
	{
		// Variáveis: Vetor(armazena hóspedes), índice(serve como um "ponteiro") opcao usada no Menu
		cadeia vetorHospedes[7], buscaHospede
		inteiro i = 0
		inteiro opcao	
		faca
		{
		// Exibindo o menu
		escreva("========== Menu ==========\n")
          escreva("1. Cadastrar\n")
          escreva("2. Pesquisar\n")
          escreva("3. Sair\n")
          escreva("==========================\n")
          escreva("Escolha uma opção: ")
		//Lendo a opcao do usuario
		leia(opcao)
	
		// Executando a opção escolhida
		escolha (opcao)
			{
			// Caso 1: Cadastrar hóspede				
			caso 1:
				// Verifica se ainda há espaço para cadastrar hóspedes
				se (i < 7)
				{
					limpa()
					escreva("Digite o nome do hóspede: ")
					leia(vetorHospedes[i])
					i++
					escreva("Hóspede cadastrado com sucesso!\n")
				}
				senao
				{
					limpa()
					escreva("Máximo de cadastros atingido!\n")
				}
			pare
			// Caso 2: Pesquisar hóspede
			caso 2:
			escreva("Qual o nome do hóspede que deseja buscar?\n")
			leia(buscaHospede)
				// Gambiarra que indica se o hóspede foi encontrado
                    logico hospedeEncontrado = falso
				para (inteiro j = 0; j < 7; j++)
				{
					se(buscaHospede == vetorHospedes[j])
					{
					escreva("Hóspede encontrado!\n")
					escreva(vetorHospedes[j], " encontra-se na " , j + 1, "ª posição.\n")
					
					// Atualizando a gambiarra, nada eficiente
                         hospedeEncontrado = verdadeiro
					
					}
				}
				// Exibe a mensagem "Hóspede não encontrado" fora do loop. Antes da gambiarra ficava escrevendo para cada posição do vetor.
                    se (hospedeEncontrado == falso)
				{
					limpa()
					escreva("Hóspede não encontrado.\n")
                    }
				pare
					
			
			caso 3:
			// Caso 3: Sair do programa
			escreva("Encerrando o programa.\n")
			pare
			
			caso contrario:
			escreva("Opção inválida. Tente novamente.\n")
			pare
			}
		//Usei para testar, mas gostei e deixei.
		} enquanto (opcao != 3)

		escreva("Você cadastrou os seguintes hóspedes:")
		para (inteiro j = 0; j < 7; j++)
		{
			escreva(vetorHospedes[j],"\n")
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 2415; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {vetorHospedes, 27, 9, 13}-{buscaHospede, 27, 27, 12}-{i, 28, 10, 1}-{opcao, 29, 10, 5}-{hospedeEncontrado, 67, 27, 17};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */