*** Settings***
Library             SeleniumLibrary
Library             String
Documentation       Documento de ações genéricas dos testes


*** Variables ***
${URL}              http://automationpractice.com
${BROWSER}          chrome
&{VALIDARNOME}      nome=testesanasss
${titulo}           Avaliacao vestido
${comment}          Comentario, nota 10!

***Keywords***

Abrir Site

    Open Browser           ${URL}              ${BROWSER}
    Maximize Browser Window

Fechar navegador
    Capture Page Screenshot
    #Close Browser
    Close All Browsers    

Dado que o usuário acesse o site Automation Practice    
    Title Should Be         My Store
    

E clicar no link "Sign in"    
    Click Element           css=.login                              
    Title Should Be         Login - My Store

Quando inserir email ${EMAIL} válido    
    Input Text                       id=email_create     ${EMAIL}
    Should Start With                ${EMAIL}            ${VALIDARNOME.nome}
    Get Regexp Matches     ${EMAIL}      pattern     /^[a-z0-9]+@[a-z0-9]+\.[a-z]+\.([a-z]+)?$/i
    Element Should Not Be Visible    id=create_account_error      

Então deve validar se ${EMAIL} possui o domínio ${DOMINIO}
    
    Should End With         ${EMAIL}            ${DOMINIO}

E clicar no botão "Create an account"    
    Click Button           id=SubmitCreate

Então o sistema deve carregar a tela "${texto}"    
    Wait Until Element Contains         css=.page-subheading      ${texto}          10

E validar se ${EMAIL} é carregado automaticamente
    Should Not Be Empty    id=email     
    #Sleep         5               

E preencher o formulário com os dados obrigatórios da tela "${texto}"
    Wait Until Element Contains         css=.page-subheading      ${texto}          10 
    Login With      maria  silva  maria  silva  AV JK,14  Lavras  24580   12546598 
    #Sleep         5       

E clicar no botão "Register"
    Click Button            id=submitAccount 

Então o sistema redirecione para a tela "My account"     
    Title Should Be         My account - My Store

Quando inserir o endereço de email "Email adress"
    Input Text              id=email        ${USER.email}
    Sleep                   5  

E preencher a senha no campo "password"
    Input Text              id=passwd        ${USER.senha}
    Sleep                   5  
    
E clicar no botão "Sign in"
    Click Button                   id=SubmitLogin 

Quando inserir credenciais válidas
    Sleep                            2
    Page Should Contain Element      id=email   
    Input Text                       id=email        ${USER.email}
    Page Should Contain Element      id=passwd  
    Input Text                       id=passwd        ${USER.senha}
    Sleep                            2  

E deseja realizar uma compra de vestidos acesse a opção do menu "Dresses"
    
    Click Element                    xpath://*[@id="block_top_menu"]/ul/li[2]/a
    Title Should Be                  Dresses - My Store
    Wait Until Element Contains      id=subcategories              Subcategories     10

E escolher a opção "${VESTIDO}"

     Click Element                  xpath://*[@id="subcategories"]/ul/li[2]  

Então o sistema deve carregar a listagem de vestidos
    Title Should Be                 Evening Dresses - My Store
    Wait Until Element Contains     class=cat-name                EVENING DRESSES      10

E adicionar ao carrinho um vestido na cor "rosa" no tamanho "M"
    Click Element                   xpath://*[@id="center_column"]//*[@src='http://automationpractice.com/img/p/1/0/10-home_default.jpg']
    Select From List By Value       name=group_1                      2
    Click Element                   xpath://*[@id="color_24"]     
    Click Button                    name=Submit  
    #Sleep                           2
    Wait Until Element Contains     class=button-container      Continue shopping   10
    Click Element                   xpath://*[@id="layer_cart"]//*[@href='http://automationpractice.com/index.php?controller=order']
    #Sleep                           2
    Title Should Be                 Order - My Store   

    
E aceitar os termos de serviço 
    Title Should Be                 Order - My Store 
    Click Element                   xpath://*[@id="center_column"]//*[@href='http://automationpractice.com/index.php?controller=order&step=1']
    Sleep      2

    Click Element                   xpath://*[@id="center_column"]/form/p/button
    Sleep         2  
    Click Element                    xpath://*[@id="order_step"]/li[4]
    Sleep         2  
    Select CheckBox                 id=cgv
    Checkbox Should Be Selected     id=cgv 
    Click Element                   name=processCarrier
    Wait Until Element Contains     class=page-heading                     PLEASE CHOOSE YOUR PAYMENT METHOD   10

E realizar pagamento no cheque
    Click Element                   xpath://*[@id="HOOK_PAYMENT"]//*[@href='http://automationpractice.com/index.php?fc=module&module=cheque&controller=payment']
    Wait Until Element Contains     class=page-heading                     ORDER SUMMARY                       10
    Click Button                    xpath://*[@id="cart_navigation"]/button 
    Wait Until Element Contains     class=page-heading                     ORDER CONFIRMATION                  10

Então ao confirmar o pedido deve direcionar o usuário para tela "Histórico"
    Click Element                   xpath://*[@id="center_column"]//*[@href='http://automationpractice.com/index.php?controller=history']
    Wait Until Element Contains     class=info-title                        Here are the orders you've placed since your account was created.                        10


E clicar na opção "Order History and Details" para carregar dados do histórico
    Click Element                   xpath://*[@id="center_column"]//*[@href='http://automationpractice.com/index.php?controller=history']
    Wait Until Element Contains     class=info-title                        Here are the orders you've placed since your account was created.                        10
     
Então o sistema deve carregar a tela de Histórico de compras
    Title Should Be                 Order history - My Store

Então ao clicar no primeiro item da listagem o sistema deve carregar os detalhes do pedido
    Title Should Be                 Order history - My Store
    Click Element                   xpath://*[@id="order-list"]/tbody/tr[1]/td[7]/a[1]/span
    Wait Until Element Contains     xpath://*[@id="block-order-detail"]/h1                      FOLLOW YOUR ORDER'S STATUS STEP-BY-STEP                   10

E permitir retornar à tela "My Account"
    Click Element                   xpath://*[@id="center_column"]//*[@href='http://automationpractice.com/index.php?controller=my-account']
    Wait Until Element Contains     class=page-heading                      MY ACCOUNT                  10
    Title Should Be                 My account - My Store

E clicar no vestido comprado "${VESTIDO}"
    Click Element                       xpath://*[@id="block_top_menu"]/ul/li[2]/a
    Title Should Be                     Dresses - My Store
    Wait Until Element Contains         id=subcategories              Subcategories     10
    Click Element                       xpath://*[@id="subcategories"]/ul/li[2]
    Title Should Be                     Evening Dresses - My Store
    Wait Until Element Contains         class=cat-name                EVENING DRESSES      10
    Click Element                       xpath://*[@id="center_column"]//*[@src='http://automationpractice.com/img/p/1/0/10-home_default.jpg']
    
Então deve permitir realizar avaliação da compra
    Sleep                               2
    Click Link                          xpath://*[@id="product_comments_block_extra"]//*[@href='#new_comment_form']
    Page Should Contain Image           xpath://*[@id="id_new_comment_form"]//*[@src='http://automationpractice.com/img/p/1/0/10-medium_default.jpg']         
    Sleep                               3
    Element Should Be Visible           xpath://*[@id="comment_title"]
    Avaliacao
    Input Text                          id=comment_title                   ${titulo}     
    Input Text                          id=content                         ${comment}
    Click Button                        id=submitNewMessage
    Page Should Contain                 New comment

E mostrar modal informando que o comentário foi para aprovação
    Page Should Contain                 Your comment has been added and will be available once approved by a moderator
    Wait Until Element Contains         xpath://*[@id="product"]/div[2]/div/div/div/p[2]/button          OK          10
    Click Button                        xpath://*[@id="product"]/div[2]/div/div/div/p[2]/button    


