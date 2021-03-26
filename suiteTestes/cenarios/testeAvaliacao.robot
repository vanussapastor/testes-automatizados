*** Settings ***
Library             String


Documentation       Cenários de testes - US: Eu como comprador da loja, desejo fazer uma avaliação dos vestidos comprados
Suite Setup         Abrir Site
Suite Teardown      Fechar navegador
Test Setup          Abrir Site
Test Teardown       Fechar navegador

Resource            ../resources/keywords.robot


*** Variables ***       
&{USER}         email=andresilva@orbia.ag      senha=987cba 

*** Test Cases ***
Cenario 11: Permitir inserção de avaliação de um produto
    [Tags]          cen11
    Dado que o usuário acesse o site Automation Practice
    E clicar no link "Sign in"
    Quando inserir credenciais válidas
    E clicar no botão "Sign in"
    E clicar no vestido comprado "Evening Dresses"
    Então deve permitir realizar avaliação da compra
    E mostrar modal informando que o comentário foi para aprovação


*** Keywords ***
Avaliacao
    Click Element                   //*[@id="criterions_list"]/li/div[1]/div[6]
    Element Should Be Enabled       //*[@id="criterions_list"]/li/div[2]                