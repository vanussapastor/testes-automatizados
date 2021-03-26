*** Settings ***
Library             String


Documentation       Cenários de testes - US: Eu como usuário logado, desejo realizar uma compra de dois vestidos na loja
Suite Setup         Abrir Site
Suite Teardown      Fechar navegador
Test Setup          Abrir Site
Test Teardown       Fechar navegador

Resource            ../resources/keywords.robot


*** Variables ***       
&{USER}         email=andresilva@orbia.ag      senha=987cba 

*** Test Cases ***
Cenario 06: Validar se o usuário cadastrado possui acesso ao sistema
    [Tags]          cen6
    Dado que o usuário acesse o site Automation Practice
    E clicar no link "Sign in"
    Quando inserir credenciais válidas
    E clicar no botão "Sign in"
    Então o sistema redirecione para a tela "My account" 

Cenario 07: Validar acesso a tela de listagem de vestido
    [Tags]          cen7    
    Dado que o usuário acesse o site Automation Practice
    E clicar no link "Sign in"
    Quando inserir credenciais válidas
    E clicar no botão "Sign in"
    E deseja realizar uma compra de vestidos acesse a opção do menu "Dresses"
    E escolher a opção "Evening Dresses"
    Então o sistema deve carregar a listagem de vestidos

Cenario 08: Realizar compra de vestido Evening Dresses
    [Tags]          cen8
    Dado que o usuário acesse o site Automation Practice
    E clicar no link "Sign in"
    Quando inserir credenciais válidas
    E clicar no botão "Sign in"
    E deseja realizar uma compra de vestidos acesse a opção do menu "Dresses"
    E escolher a opção "Evening Dresses"
    E adicionar ao carrinho um vestido na cor "rosa" no tamanho "M"
    #E adicionar ao carrinho segundo vestido na cor "cinza" tamanho "P"
    E aceitar os termos de serviço 
    E realizar pagamento no cheque
    Então ao confirmar o pedido deve direcionar o usuário para tela "Histórico"
  
Cenario 09: Consultar histórico de compras
    [Tags]          cen9
    Dado que o usuário acesse o site Automation Practice
    E clicar no link "Sign in"
    Quando inserir credenciais válidas
    E clicar no botão "Sign in"
    E clicar na opção "Order History and Details" para carregar dados do histórico
    Então o sistema deve carregar a tela de Histórico de compras

Cenario 10: Visualizar detalhes de um pedido do histórico de compras
    [Tags]          cen10
    Dado que o usuário acesse o site Automation Practice
    E clicar no link "Sign in"
    Quando inserir credenciais válidas
    E clicar no botão "Sign in"
    E clicar na opção "Order History and Details" para carregar dados do histórico
    Então ao clicar no primeiro item da listagem o sistema deve carregar os detalhes do pedido
    E permitir retornar à tela "My Account"

