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
    