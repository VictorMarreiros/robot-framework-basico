*** Settings ***
Library             Selenium


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
    Input Text      css=#searchbox        ${PRODUTO}

Clicar no botão Pesquisar
    Click       name="submit_search"

Conferir se o produto "${PRODUTO}" foi listado no site
    Wait Until Element              xpath=#center_column > h1[class^=page-heading]
    Title Should Be                 Search - My Store
    Page Should Contain Image       css=img[src="http://automationpractice.com/img/p/7/7-home_default.jpg"]
    Page Should Contain Link        xpath=//*[@id="center_column"]//a[@class="product-name"][contains(text(), "${PRODUTO}")]

Conferir mensagem de erro "No results were found for your search "${PRODUTO}""
    