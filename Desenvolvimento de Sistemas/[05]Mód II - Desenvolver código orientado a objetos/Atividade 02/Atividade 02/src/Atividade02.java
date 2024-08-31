/*
Atividade 2
 
Contexto
 
Atividade
No NetBeans, crie um projeto Java (tipo console) com os seguintes itens:

    Classe para transporte, com o tipo (aéreo, rodoviário, marítimo etc.) e valor
    Classe para hospedagem, com descrição e valor de diária
    Classe para pacote de viagem, com transporte, hospedagem, destino (texto), 
quantidade de dias. Essa classe ainda deve ser capaz de
        calcular o total de hospedagem a partir do número de dias e o valor da diária.
        calcular valor de lucro a partir de uma margem informada (porcentagem) 
e valor informado. O resultado retornado deve ser o valor + margem aplicada ao 
valor.
        calcular e retornar o total do pacote, somando o transporte, o total da 
hospedagem e os valores adicionais informados – margem de lucro (porcentagem) e 
taxas adicionais (valor monetário).
        Observação: os valores nesta classe serão considerados em dólar.
    Classe para venda, que contenha nome do cliente, forma de pagamento e pacote 
de viagem. A classe deve ser capaz de
        converter um valor em reais a partir de um valor informado em dólar e da 
cotação da moeda, também informada.
        mostrar na tela o total do pacote de viagem em dólar e em reais.

Na classe principal, elabore código para interação com o usuário em que seja possível “cadastrar” uma venda e

    obtenha todos os valores necessários para criar um pacote de viagem e crie esse objeto.
    mostre na tela as informações do pacote criado, incluindo o valor total. 
O usuário ainda precisará informar margem de lucro (uma porcentagem).
    obtenha do usuário também as informações para a criação de uma venda.
    mostre na tela todas as informações da venda, incluindo valor total em dólar 
e valor em reais (o usuário terá que informar a cotação do dólar no dia).

Recomenda-se o uso de construtores nas classes.
 */

import atividade.pkg02.Transporte;
import atividade.pkg02.Hospedagem;
import atividade.pkg02.Venda;
import atividade.pkg02.PacoteViagem;
import java.util.Scanner;

public class Atividade02 {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.println("Cadastro de Transporte");
        System.out.print("Tipo de Transporte: ");
        String tipoTransporte = scanner.nextLine();
        System.out.print("Valor do Transporte: ");
        double valorTransporte = scanner.nextDouble();

        Transporte transporte = new Transporte(tipoTransporte, valorTransporte);

        System.out.println("Cadastro de Hospedagem");
        System.out.print("Descrição da Hospedagem: ");
        scanner.nextLine(); // Consumir a quebra de linha
        String descricaoHospedagem = scanner.nextLine();
        System.out.print("Valor da Diária: ");
        double valorDiaria = scanner.nextDouble();

        Hospedagem hospedagem = new Hospedagem(descricaoHospedagem, valorDiaria);

        System.out.println("Cadastro de Pacote de Viagem");
        System.out.print("Destino: ");
        scanner.nextLine(); // Consumir a quebra de linha
        String destino = scanner.nextLine();
        System.out.print("Quantidade de Dias: ");
        int quantidadeDias = scanner.nextInt();
        System.out.print("Margem de Lucro (%): ");
        double margemLucro = scanner.nextDouble();
        System.out.print("Taxas Adicionais: ");
        double taxasAdicionais = scanner.nextDouble();

        PacoteViagem pacoteViagem = new PacoteViagem(transporte, hospedagem, destino, quantidadeDias);
        double totalPacote = pacoteViagem.calcularTotalPacote(margemLucro, taxasAdicionais);
        

        System.out.println("Pacote de Viagem Criado:");
        System.out.println("Destino: " + destino);
        System.out.println("Lucro $:" + pacoteViagem.calcularValorLucro(margemLucro, taxasAdicionais));
        System.out.println("Total do Pacote: " + totalPacote + " dólares");

        System.out.println("Cadastro de Venda");
        System.out.print("Nome do Cliente: ");
        scanner.nextLine(); // Consumir a quebra de linha
        String nomeCliente = scanner.nextLine();
        System.out.print("Forma de Pagamento: ");
        String formaPagamento = scanner.nextLine();
        System.out.print("Cotação do Dólar: ");
        double cotacaoDolar = scanner.nextDouble();

        Venda venda = new Venda(nomeCliente, formaPagamento, pacoteViagem, margemLucro, taxasAdicionais);
        venda.mostrarInformacoes(cotacaoDolar);

        scanner.close();
    }
}