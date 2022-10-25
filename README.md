# Projeto de teste para a Oderço!
<b>Inicialize a API com o seguinte comando: "php -S 0.0.0.0:8080 -t public/"<b>
</br>
<b>Inicialize o frontend com "ng serve"<b>
</br>
O projeto de frontend está todo na rota "localhost:4200", e as rotas do backend são, "localhost:8080/api/cotacao", cada um com seu determinado método.

O projeto foi desenvolvido utilizando o laravel 9 como framework para a API e o AngularJS para o frontend.
</br>
Início no dia 17/10 (segunda-feira), e término no dia 19/10 (Quarta-feira), o projeto foi desenvolvido com 14 horas de desenvolvimento concentrado.

Este projeto é uma terefa desenvolvida para aprimorar habilidades e para a demonstração de portfólio.

Esta tarefa tem como objetivo operar e manipular um banco de dados com 2 tabelas, uma tabela que contem os fornecedores disponíveis na aplicação, e uma outra tabela onde é possivel salvar qual o percentual e qual o valor extra que será cobrado a partir de uma das transportadoras da outra tabela, tudo isso em relação a um determinado estado.

Foi desenvolvido visando ser um teste para a empresa Oderço em Maringá.

# API

Todos os atributos e métodos criados estão na classe "ShippingController", essa se relaciona ao Model "Shipping.php", cuja a classe é "Shipping".
As rotas foram determinadas no arquivo "api.php", e seus caminhos estão conforme o determinado no teste.

Dentro da classe ShippingController temos os seguintes métodos:
* "createShippingPrice": faz a validação e inserção dos dados passados pelo usuário para a criação de uma cotação de frete no banco de dados.
* "simulatePrice": faz o calculo da cotação, recebe o valor do pedido e o estado no qual o usuário que avaliar as cotações, o método "insert_sort" ordena em ordem crescente este array que retorna de uma busca no banco a partir do estado que foi passado. E no retorno são devolvidos para o usuário as 3 melhores opções de cotação para aquele determinado estado.
Caso não existam cotações cadastradas para aquele UF, a aplicação retorna um erro.
* "listShippingPrice": faz uma busca no banco de dados a respeito de todos as cotações ja criadas e as retorna para o usuário.

# ANGULAR

Todos os métodos estão dentro do "shipping-price.component", este se relaciona com o service "shipping.service.js", que fazem contato com a API a partir das rotas criadas.

Dentro das classes referentes a ambos os arquivos citados acima temos os métodos:

* "get_shipping_price": que se relaciona ao método "listShippingPrice" da API.
* "create_shipping_price": que se relaciona ao método "createShippingPrice" da API.
* "calculate_shipping_price": que se relaciona ao método "simulatePrice" da API.
