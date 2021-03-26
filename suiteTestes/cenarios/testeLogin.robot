*** Settings ***
Library             SeleniumLibrary
Library             String


Documentation       Cenários de testes - US: Eu como usuário, preciso criar uma conta no site para realizar uma compra 
Suite Setup         Abrir Site
Suite Teardown      Fechar navegador
Test Setup          Abrir Site
Test Teardown       Fechar navegador

Resource            ../resources/keywords.robot


*** Variables ***
${EMAIL}        testesanasss@orbia.ag
${DOMINIO}      @orbia.ag
${senha}        
&{USER}         email=testes@orbia.ag       senha=KI5ab  

*** Test Cases ***
## US: Eu como usuário, preciso criar uma conta no site para realizar uma compra

Cenario 01: Realizar pré cadastro com email válido
    [Tags]          cen1
    
    Dado que o usuário acesse o site Automation Practice
    E clicar no link "Sign in"
    Quando inserir email ${EMAIL} válido
    E clicar no botão "Create an account"
    Então o sistema deve carregar a tela "YOUR PERSONAL INFORMATION"
    

Cenario 02: Validar se usuário insere email com padrão válido
    [Tags]          cen2
    
    Dado que o usuário acesse o site Automation Practice
    E clicar no link "Sign in"
    Quando inserir email ${EMAIL} válido
    Então deve validar se ${EMAIL} possui o domínio ${DOMINIO}
    

Cenario 03: Validar se email é carregado preenchido na tela de "YOUR PERSONAL INFORMATION"
    [Tags]          cen3
    Dado que o usuário acesse o site Automation Practice
    E clicar no link "Sign in"
    Quando inserir email ${EMAIL} válido
    E clicar no botão "Create an account"
    Então o sistema deve carregar a tela "YOUR PERSONAL INFORMATION"
    E validar se ${EMAIL} é carregado automaticamente 

Cenario 04: Validar preenchimento de dados obrigatórios
    [Tags]          cen4
    Dado que o usuário acesse o site Automation Practice
    E clicar no link "Sign in"
    Quando inserir email ${EMAIL} válido
    E clicar no botão "Create an account"
    E preencher o formulário com os dados obrigatórios da tela "YOUR PERSONAL INFORMATION"
    E clicar no botão "Register"
    Então o sistema redirecione para a tela "My account"
    
Cenario 05: Validar se um usuário cadastrado possui acesso ao sistema
    [Tags]          cen5
    Dado que o usuário acesse o site Automation Practice
    E clicar no link "Sign in"
    Quando inserir o endereço de email "Email adress"
    E preencher a senha no campo "password"
    E clicar no botão "Sign in"
    Então o sistema redirecione para a tela "My account" 


*** Keywords ***
## Exemplo de preenchimento Login
Login With
    [Arguments]     ${primeironome}        ${ultimonome}    ${primeironome2}        ${ultimonome2}      ${endereco}    ${cidade}       ${cep}       ${phone}

    Input Text                      id=customer_firstname                   ${primeironome}  
    Input Text                      id=customer_lastname                    ${ultimonome}    
    Password
    CheckBox
    Input Text                      id=firstname                            ${primeironome2}  
    Input Text                      id=lastname                             ${ultimonome2}
    Input Text                      id=address1                             ${endereco}  
    Input Text                      id=city                                 ${cidade}        
    Select From List By Value       id=id_state                             9
    Input Text                      id=postcode                             ${cep}  
    Input Text                      id=phone_mobile                         ${phone}
    Sleep                           10    
      
Password
    
    ${senha}=       Generate Random String    5   [LETTERS]1234567890
    Input Text      id=passwd       ${senha}                 
#validação checked

CheckBox
    Select CheckBox                 id=optin
    Checkbox Should Be Selected     id=optin   