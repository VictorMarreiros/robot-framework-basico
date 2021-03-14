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