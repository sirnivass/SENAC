programa
{
	/*
	*Deve ser utilizado apenas um vetor de 10 posições. Considerando que o
	*hotel tenha 10 quartos, desenvolva um algoritmo para marcar a ocupação de
	*cada quarto. Todos os quartos iniciam como livres, o usuário informará então o
	*número do quarto (de 1 a 10). Internamente o número do quarto precisa ser de
	*0 até 9, então altere o valor informado pelo usuário para respeitar isso. O
	*sistema questionará “O quarto está livre ou ocupado? (L/O)”; o usuário
	*informará L ou O e o sistema registrará essa escolha para o quarto. Existem as
	*seguintes regas:
	*•Se o quarto está livre e o usuário digita L deve ser exibida a mensagem  “quarto já está vazio”.
	*
	*•Se o quarto está livre e o usuário digita O deve ser exibida a mensagem “quarto foi ocupado” e 
	*o valor do vetor deve ser alterado.
	*
	*•Se o quarto estiver ocupado e o usuário digitar L deve ser exibida amensagem “quarto foi liberado” e 
	*o valor do vetor deve ser alterado.
	*
	*•Se o quarto estiver ocupado e o usuário digitar O deve ser exibida a mensagem “quarto já está ocupado”.
	*Pergunte ao usuário se ele deseja continuar e caso ‘S’, repita a operação.
	*Quando o usuário informar ‘N’ a repetição encerra e deve ser exibido o número
	*do quarto (1 a 10) e a ocupação deste (O ou L).
	*/
    caracter vetorQuarto[10]

    funcao vazio quartosLivres()
    {
        para (inteiro i = 0; i < 10; i++)
        {
            vetorQuarto[i] = 'L'
        }
    }

    funcao vazio exibirStatus()
    {
        para (inteiro i = 0; i < 10; i++)
        {
            se (vetorQuarto[i] == 'L')
                escreva("O ", i + 1, "º quarto está livre.\n")

            se (vetorQuarto[i] == 'O')
                escreva("O ", i + 1, "º quarto está ocupado.\n")
        }
    }
       funcao vazio exibirMenu()
    {
        escreva("========== Menu ==========\n")
        escreva("1. Ocupação dos quartos\n")
        escreva("2. Status dos quartos\n")
        escreva("==========================\n")
        escreva("Escolha uma opção: ")
    }

    funcao inicio()
    {
    	
    	caracter opcao = 'S', ocupacao
    	inteiro menu = 0
	quartosLivres()

     enquanto (opcao != 'N')
     {
     	  exibirMenu()
            leia(menu)
            

            escolha (menu)
            {
                caso 1:
                    escreva("Qual quarto você quer alterar? ")
                    inteiro i 
                    leia(i)
                    i = i - 1

                    escreva("O ", i + 1,"º quarto está livre ou ocupado? (USE L/O) ")
				leia(ocupacao)   
				se(vetorQuarto[i] == 'L' e ocupacao == 'L')
				{
					escreva("Quarto já está vazio.\n")
				}
				senao se(vetorQuarto[i] == 'L' e ocupacao == 'O')
				{
					escreva("O quarto foi ocupado.\n")
					vetorQuarto[i] = 'O'
				}
				senao se(vetorQuarto[i] == 'O' e ocupacao == 'L')
				{
					escreva("O quarto foi liberado.\n")
					vetorQuarto[i] = 'L'
				}
				senao se(vetorQuarto[i] == 'O' e ocupacao == 'O')
				{
					escreva("O quarto já está ocupado\n.")
				}
				senao
				{
					escreva("Opção Inválida, Tente novamente\n.")
				}
				escreva("Deseja continuar? (USE S/N)")
				leia(opcao)
                pare

                caso 2:
                    exibirStatus()
                pare

                // Caso a opção escolhida não esteja no menu
                caso contrario:
                    escreva("Opção inválida. Tente novamente.\n")
                pare
            }
        }
	
	exibirStatus()
    }
}



/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 3249; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {vetorQuarto, 25, 13, 11};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */