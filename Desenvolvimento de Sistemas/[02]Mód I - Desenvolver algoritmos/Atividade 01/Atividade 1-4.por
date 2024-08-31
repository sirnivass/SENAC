programa
{
	funcao inicio()
	{
	
	caracter opcao, acompanhado, exameEmDia
	real kgRoupa, valorLavanderia
	inteiro idade
	
	escreva("Escolha a opção desejada (L para lavanderia, P para piscina): ")
	leia(opcao)
			
		escolha (opcao)
		{
	
			caso 'L':
				escreva("Informe a quantidade de kg de roupa a ser lavada: ")
				leia(kgRoupa)
	
				// Verificando o valor a ser cobrado na lavanderia
				se (kgRoupa > 10)
					valorLavanderia = kgRoupa * 15
				senao
					valorLavanderia = kgRoupa * 20
					escreva("O custo da lavagem será de R$", valorLavanderia)
				pare
	
			caso 'P':
				escreva("Informe sua idade: ")
				leia(idade)
				escreva("Está acompanhado? (S ou N): ")
				leia(acompanhado)
				se (idade < 18 e acompanhado =='N')
					{
						escreva("Providencie um acompanhante maior de idade.")
						pare
					}
				escreva("Seu exame está em dia? (S ou N): ")
			     leia(exameEmDia)
	
				// Verificando se o exame está em dia
				se ((idade >= 18 e exameEmDia == 'S') ou (idade < 18 e acompanhado =='S' e  exameEmDia == 'S'))
				{	
					escreva("Você pode acessar a piscina.")
					pare
				}
				senao se ((idade >= 18 e exameEmDia == 'N') ou (idade < 18 e acompanhado =='S' e  exameEmDia == 'N'))
					escreva("Faça seu exame antes de entrar na piscina.")
				senao
					escreva("Opção inválida.")
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 633; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */