*** Settings ***
Library             SeleniumLibrary
Library             FakerLibrary

*** Variables ***
${URL}          http://automationpractice.com
${BROWSER}      chrome


*** Keywords ***
### Setup and Teardown
Abrir navegador
    Open Browser        ${URL}      ${BROWSER}    

Fechar navegador
    Close Browser

### Passo-a-Passo
Acessar pagina home do site
    Title Should Be     My Store


Digitar o nome do produto "${PRODUTO}" no campo de Pesquisa
    Input Text      css=#search_query_top        ${PRODUTO}


Passar mouse por cima da categoria "${CATEGORIA}" no menu principal superior de categorias
    Mouse Over                          css=a[title="${CATEGORIA}"]

# não encontrei um meio de identificar o text 'Sign in'         to-do
Clicar no botão superior direito "Sign in"
    Title Should Be                     Login - My Store
    Click Link                          css=a[class="login"]


Clicar no icone carrinho de compras no menu superior direito
    Click Link                          css=a[title="View my shopping cart"]


Clicar no botão de remoção de produtos "${DELETE}" no produto do carrinho
    Wait Until Element Is Visible       css=h1[class^=page-heading]
    Title Should Be                     Order - My Store
    Click Link                          css=a[title="${DELETE}"]


Clicar no botão "${ADD_CARRINHO}" do produto
    Wait Until Element Is Visible       css=h1[class^=page-heading]
    Title Should Be                     Search - My Store
    Click Link                          css=a[title="${ADD_CARRINHO}"]


Clicar no botão "${BTN_CHECKOUT}"
    Wait Until Element Is Visible       xpath=//*[@id="layer_cart"]//*[@title="${BTN_CHECKOUT}"]
    Page Should Contain Element         xpath=//*[@id="layer_cart"]//*[@class="ajax_cart_product_txt "][contains(text(), "There is 1 item in your cart")]
    Click Link                          xpath=//*[@id="layer_cart"]//*[@title="${BTN_CHECKOUT}"]


Clicar na sub categoria "${SUBCATEGORIA}"
    Click Link                          css=a[title="${SUBCATEGORIA}"]


Clicar no botão Pesquisar
    Click Button                        css=button[name="submit_search"]


Inserir um e-mail válido
    ${EMAIL}=                           FakerLibrary.Email
    Input Text                          css=#email_create               ${EMAIL}      

# não encontrei um meio de identificar o text 'Create an account'         to-do
Clicar no botão "Create an account"
    Click Button                        css=button[id=#SubmitCreate]


Preencher os campos obrigatórios
    ${FIRSTNAME}=                       FakerLibrary.First Name
    Input Text                          ${CMP_CLIENTE_NOME}         ${FIRSTNAME}
    ${LASTNAME}=                        FakerLibrary.Last Name    
    Input Text                          ${CMP_CLIENTE_SOBRENOME}    ${LASTNAME}
    Input Text                          ${CMP_CLIENTE_EMAIL}        ${EMAIL}
    ${PASSWORD}=                        FakerLibrary.Password
    Input Text                          ${CMP_CLIENTE_SENHA}        ${PASSWORD}
    Input Text                          ${CMP_NOME}                 ${FIRSTNAME}   
    Input Text                          ${CMP_SOBRENOME}            ${LASTNAME}
    ${ENDERECO}=                        FakerLibrary.Address
    Input Text                          ${CMP_ENDERECO}             ${ENDERECO}
    ${CIDADE}=                          FakerLibrary.City
    Input Text                          ${CMP_CIDADE}               ${CIDADE}
    ${ESTADO}=                          FakerLibrary.State
    Input Text                          ${CMP_ESTADO}               ${ESTADO}
    ${COD_POSTAL}=                      FakerLibrary.Postcode
    Input Text                          ${CMP_COD_POSTAL}           ${COD_POSTAL}
    ${NUMERO_CEL}=
    Input Text                          ${CMP_NCELULAR}             ${NUMERO_CEL}
    Input Text                          ${CMP_ALIAS}                ${ENDERECO}


Voltar para pagina home do site
    Go To                               ${URL}


Conferir se o produto "${PRODUTO}" foi listado no site
    Wait Until Element Is Visible       css=h1[class^=page-heading]
    Title Should Be                     Search - My Store
    Page Should Contain Image           css=img[src="http://automationpractice.com/img/p/7/7-home_default.jpg"]
    Page Should Contain Link            xpath=//*[@id="center_column"]//a[@class="product-name"][contains(text(), "${PRODUTO}")]


Conferir mensagem de erro "${MENSAGEM_ALERTA}"
    Wait Until Element Is Visible       xpath=//*[@id="center_column"]//p[@class="alert alert-warning"]
    Title Should Be                     Search - My Store 
    Page Should Contain Image           css=img[src="http://automationpractice.com/img/logo.jpg"]
    Page Should Contain Element         xpath=//*[@id="center_column"]//p[@class="alert alert-warning"][contains(text(), "No results were found for your search")]


Conferir se é a pagina da subcategoria "${SUBCATEGORIA}"
    Wait Until Element Is Visible       css=h1[class^=page-heading]
    Title Should Be                     Summer Dresses - My Store
    Page Should Contain Element         xpath=//*[@id="center_column"]//div[@class="content_scene_cat_bg"]
    Page Should Contain Element         xpath=//*[@id="center_column"]//*[@class="cat-name"][contains(text(), "Summer Dresses")]


Conferir se o produto foi adicionado ao carrinho
    Wait Until Element Is Visible       css=#cart_title
    Title Should Be                     Order - My Store
    Page Should Contain Element         css=p[class="product-name"]
    Page Should Contain Element         xpath=//*[@id="product_price_1_1_0"]/span[@class="price"][contains(text(), "$16.51")]


Conferir mensagem "${MSG_EMPTY_CART}"
    Wait Until Element Is Visible       css=h1[class^=page-heading]
    Page Should Contain Element         xpath=//*[@id="center_column"]/p[@class="alert alert-warning"][contains(text(), "Your shopping cart is empty.")]
