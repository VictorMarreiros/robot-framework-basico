*** Settings ***
Library             Selenium
Test Setup          Abrir navegador
Test Teardown       Fechar navegador


*** Variables ***
${URL}          http://automationpractice.com
${BROWSER}      chrome

** Test Cases ***

Caso de teste 1: Pesquisar Produto Existentes
    Acessar pagina home do site
    Conferir se a pagina home foi exibida
    Digitar o nome do produto "Blouse" no campo de PesquisarClicar no botão Pesquisar
    Conferir se o produto "Blouse" foi listado no site

Caso de teste 2: Pesquisar Produto não Existentes
    Acessar pagina home do site
    Conferir se a pagina home foi exibida
    Digitar o nome do produto "ItemNãoExistente" no campo de PesquisarClicar no botão Pesquisar
    Conferir mensagem de erro "No results were found for your search "itemNãoExistente""

*** Keywords ***

