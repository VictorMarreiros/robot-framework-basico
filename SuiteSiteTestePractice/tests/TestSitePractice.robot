*** Settings ***
Resource            ../resource/Resource.robot
Test Setup         Abrir navegador
Test Teardown      Fechar navegador

### SETUP ele roda keyword antes da suite ou antes de um Teste
### TEARDOWN ele roda keyword depois de uma suite ou um teste


*** Variables ***
${URL}          http://automationpractice.com
${BROWSER}      chrome

** Test Cases ***

Caso de teste 1: Pesquisar Produto Existente
    Acessar pagina home do site
    Digitar o nome do produto "Blouse" no campo de Pesquisa
    Clicar no botão Pesquisar
    Conferir se o produto "Blouse" foi listado no site

Caso de teste 2: Pesquisar Produto não Existente
    Acessar pagina home do site
    Digitar o nome do produto "ItemNãoExistente" no campo de Pesquisa
    Clicar no botão Pesquisar
    Conferir mensagem de erro "No results were found for your search "itemNãoExistente""

Caso de teste 3: Listar Produtos
    Acessar pagina home do site
    Passar mouse por cima da categoria "Women" no menu principal superior de categorias
    Clicar na sub categoria "Summer Dresses"
    Conferir se é a pagina da subcategoria "Summer Dresses"


