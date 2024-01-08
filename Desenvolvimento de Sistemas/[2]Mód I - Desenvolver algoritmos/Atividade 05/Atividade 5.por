programa
{

		// Constantes:
		const real VALOR_DIARIA = 100.0 //uso esse formato em maiúsculo para definir constantes.
		const inteiro MAX_HOSPEDES = 10//uso esse formato em maiúsculo para definir constantes.
		//==================================================================================//
		//Variáveis Globais:
		inteiro numeroHospedes = 0 // Contador de hóspedes cadastrados.
		cadeia nomes[MAX_HOSPEDES] // Array para armazenar os nomes dos hóspedes.
		inteiro cpfs[MAX_HOSPEDES] // Array para armazenar os CPFs dos hóspedes.
		inteiro diasHospedagem[MAX_HOSPEDES] // Array para armazenar a quantidade de dias de hospedagem de cada hóspede.
		real despesasTotais[MAX_HOSPEDES] // Array para armazenar as despesas totais de cada hóspede.
		inteiro indiceHospede // Índice do hóspede usado em operações específicas.
		real valorAreaDeLazer[MAX_HOSPEDES] // Array para armazenar os gastos em áreas de lazer de cada hóspede.

		//"Limpando os veotres"
		funcao limparVetores()
		{	// Inicializando arrays de informações dos hóspedes.
			para(inteiro i = 0; i < MAX_HOSPEDES; i++)
			{
				cpfs[i] = 0
				diasHospedagem[i] = 0
				despesasTotais[i] = 0.0
				nomes[i] = ""
			}
		}

	
	funcao cadastrarHospede()
	{
		se (numeroHospedes < MAX_HOSPEDES)
		{
			
			// Obtendo informações do hóspede
			escreva("Cadastro de Hospede:\n")
			escreva("Nome: ")
			leia(nomes[numeroHospedes])
			escreva("CPF: ")
			leia(cpfs[numeroHospedes])
			escreva("Quantidade de dias de hospedagem: ")
			leia(diasHospedagem[numeroHospedes])
			// Calculando despesas totais
			despesasTotais[numeroHospedes] = diasHospedagem[numeroHospedes] * VALOR_DIARIA
			// Exibindo informações do hóspede cadastrado11
			escreva("\nInformações do Hospede\n")
			escreva("Nome: ", nomes[numeroHospedes], "\n")
			escreva("CPF: ", cpfs[numeroHospedes], "\n")
			escreva("Dias de hospedagem: ", diasHospedagem[numeroHospedes], "\n")
			escreva("Despesas totais: R$", despesasTotais[numeroHospedes], "\n")
			// Perguntando ao usuário se as informações estão corretas
			caracter resposta
			escreva("\nAs informações estão corretas? (S/N): ")
			leia(resposta)
			se (resposta == 'S' ou resposta == 's')
			{	// Revertendo as alterações se as informações não estiverem corretas
				escreva("\nCadastro realizado com sucesso!\n")
				numeroHospedes = numeroHospedes + 1
			}
			se (resposta == 'N' ou resposta == 'n')
			{
				cpfs[numeroHospedes] = 0
				diasHospedagem[numeroHospedes] = 0
				despesasTotais[numeroHospedes] = 0.0
				nomes[numeroHospedes] = "."
				
				escreva("\nPor favor, corrija as informações.\n")
			}
		}
		senao
		{
			escreva("Desculpe, os cadastros estão lotados.\n")
		}
	}

	funcao exibirHospedes()
	{
		
		// Verificando se há hóspedes cadastrados
		se (numeroHospedes == 0)
		{
			escreva("Nenhum hóspede cadastrado.\n")
		}
		senao
		{
			escreva(" Hospedes Cadastrados \n")
			// Exibindo informações de cada hóspede
			para (inteiro i = 0; i < numeroHospedes; i++)
			{
				escreva("Hospede ", i + 1, ":\n")
				escreva("Nome: ", nomes[i], "\n")
				escreva("CPF: ", cpfs[i], "\n")
				escreva("Dias de hospedagem: ", diasHospedagem[i], "\n")
				escreva("Despesas totais: R$", despesasTotais[i], "\n\n")
			}
		}
	}
	
	funcao exibirQuartos()
	{
		
		escreva("Status dos Quartos\n")
		
		// Exibindo informações de cada quarto
		para (inteiro i = 0; i < 10; i++)
		{
			escreva("Quarto ", i + 1, ": ")
			
			// Verificando se o quarto está ocupado
			se (nomes[i] != "")
			{
				escreva("Ocupado por ", nomes[i], " por ", diasHospedagem[i], " dias.\n")
			}
			senao
			{
				escreva("Livre.\n")
			}
		}
		
		escreva("\n")
	}

	funcao atribuirHospedeAQuarto()
	{
		// Exibindo os hóspedes cadastrados
		exibirHospedes()
		
		inteiro numeroQuarto, numeroHospede
		// Solicitando número do quarto
		escreva("Informe o número do quarto desejado para a alocação: ")
		leia(numeroQuarto)
		// Verificando se o quarto está ocupado
		se (nomes[numeroQuarto - 1] != "")
		{
			escreva("Quarto já está ocupado. Escolha outro quarto.\n")
		}
		// Solicitando número do hóspede
		escreva("Informe o número do hóspede: ")
		leia(numeroHospede)
		// Verificando se o número do hóspede é válido
		se (numeroHospede < 1 ou numeroHospede > numeroHospedes)
		{
			escreva("Hóspede não existe.\n")
		}
		// Atribuindo nome do hóspede ao quarto
		nomes[numeroQuarto - 1] = nomes[numeroHospede - 1]
		
		escreva("Hóspede atribuído ao quarto com sucesso!\n")
		
	}

	funcao reservarAreasLazer()
	{
		caracter opcaoArea
		
		// Solicitar o índice do hóspede
		escreva("Digite o índice do hóspede: ")
		leia(indiceHospede)
		
		// Verificar se o índice do hóspede é válido
		se (indiceHospede < 1 ou indiceHospede > 10)
		{
			escreva("Índice de hóspede inválido.\n")
		}
		// Solicitar a área desejada
		escreva("Escolha a área desejada (A - Academia, S - Salão de Festas, R - Restaurante): ")
		leia(opcaoArea)
		// Realizar a reserva conforme a opção escolhida
		escolha (opcaoArea)
		{
			caso 'A':
			valorAreaDeLazer[indiceHospede] = valorAreaDeLazer[indiceHospede] + 20
			escreva("Área de Academia reservada com sucesso.\n")
			pare
			
			caso 'S':
			valorAreaDeLazer[indiceHospede] = valorAreaDeLazer[indiceHospede] + 50
			escreva("Área de Salão de Festas reservada com sucesso.\n")
			pare
			
			caso 'R':
			valorAreaDeLazer[indiceHospede] = valorAreaDeLazer[indiceHospede] + 35
			escreva("Área de Restaurante reservada com sucesso.\n")
			pare
			
			caso contrario:
			escreva("Opção de área inválida.\n")
		}
		// Exibir valor total atualizado
		escreva("Valor total atualizado: R$", valorAreaDeLazer[indiceHospede], "\n")
	}
	
	funcao real calcularTotalGastos(inteiro indiceHospede)
	{
		// Calcular o total dos gastos do hóspede
		real totalGastos = despesasTotais[indiceHospede] + valorAreaDeLazer[indiceHospede]
		
		retorne totalGastos
	}
	
	funcao liberarQuarto(cadeia nomeHospede, cadeia nomesHospedes[])
	{
		// Procurar o quarto ocupado pelo hóspede e liberar
		para (inteiro i = 0; i <10; i++)
		{
			se (nomesHospedes[i] == nomeHospede)
			{
				// Liberar o quarto
				nomesHospedes[i] = ""
				escreva("Quarto liberado com sucesso.\n")
				pare
			}
		}
	}
	
	funcao inicio()
	{
		limparVetores()
		inteiro opcao 
		faca
		{	// Exibir menu de opções
			escreva("\n========== Menu ==========\n")
			escreva("1. Cadastrar Hospedes\n")
			escreva("2. Exibir Hospedes Cadastrados\n")
			escreva("3. Exibir Quartos\n")
			escreva("4. Atribuir Hospede a um quarto\n")
			escreva("5. Reservar Área de Lazer\n")
			escreva("6. Calcular Total a Pagar\n")
			escreva("0. Sair\n")
			escreva("==========================\n")
			escreva("Escolha uma opção: ")
			leia(opcao)
			// Executar a opção escolhida
			escolha (opcao)
			{
				caso 1:
					cadastrarHospede()
				pare
				caso 2:
					exibirHospedes()
				pare
				caso 3:
					exibirQuartos()
				pare
				caso 4:
					atribuirHospedeAQuarto()
					exibirQuartos()
				pare
				caso 5:
					reservarAreasLazer()
				pare
				caso 6:
					// Solicitar índice do hóspede e exibir total a pagar
					escreva("Qual hóspede você gostaria de calcular o total a pagar?\n")
					leia(indiceHospede)
					
					escreva("O valor gasto total foi de: R$", calcularTotalGastos(indiceHospede))
					
				pare
				caso 0:
					escreva("Obrigado por  usar nosso sistema. Até logo!\n")
				pare
				caso contrario:
					escreva("Opção inválida. Tente novamente.\n")
			}
		} enquanto (opcao != 0)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 11; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */