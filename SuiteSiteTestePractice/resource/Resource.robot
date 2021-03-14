*** Settings ***
Library             SeleniumLibrary

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


Clicar no botão Pesquisar
    Click Button           css=button[name="submit_search"]


Conferir se o produto "${PRODUTO}" foi listado no site
    Wait Until Element Is Visible   css=h1[class^=page-heading]
    Title Should Be                 Search - My Store
    Page Should Contain Image       css=img[src="http://automationpractice.com/img/p/7/7-home_default.jpg"]
    Page Should Contain Link        xpath=//*[@id="center_column"]//a[@class="product-name"][contains(text(), "${PRODUTO}")]


Conferir mensagem de erro "${MENSAGEM_ALERTA}"
    Wait Until Element Is Visible   xpath=//*[@id="center_column"]//p[@class="alert alert-warning"]
    Title Should Be                 Search - My Store 
    Page Should Contain Image       css=img[src="http://automationpractice.com/img/logo.jpg"]
    Page Should Contain Element     xpath=//*[@id="center_column"]//p[@class="alert alert-warning"][contains(text(), "No results were found for your search")]




