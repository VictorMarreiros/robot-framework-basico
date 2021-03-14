*** Settings ***
Resource            ../resource/Resource.robot
Test Setup          Abrir navegador
Test Teardown       Fechar navegador


### SETUP ele roda keyword antes da suite ou antes de um Teste
### TEARDOWN ele roda keyword depois de uma suite ou um teste


** Test Cases ***

Cenário 01: Pesquisar Produto Existentes
    Dado que estou na página home do site
    Quando eu pesquisar pelo produto "Blouse"
    Então o produto "Blouse" deve ser listado na página de resultado da busca

Caso de teste 2: Pesquisar Produto não Existentes
    Dado que estou na página home do site
    Quando eu pesquisar pelo produto "itemNãoExistente"
    Então a página deve exibir a mensagem "No results were found for your search "itemNãoExistente""

Caso de Teste 3: Listar Produtos
    Dado que estou na página home do site
    Quando passar o mouse por cima da categoria "Women"
    E clicar na subcategoria "Summer Dresses"
    Então deve abrir a pagina "Summer Dresses"

*** Keywords ***
Dado que estou na página home do site
    Acessar pagina home do site

Quando eu pesquisar pelo produto "${PRODUTO}"
    Digitar o nome do produto "${PRODUTO}" no campo de Pesquisa
    Clicar no botão Pesquisar

Quando passar o mouse por cima da categoria "${CATEGORIA}"
    Passar mouse por cima da categoria "${CATEGORIA}" no menu principal superior de categorias

E clicar na subcategoria "${SUBCATEGORIA}"
    Clicar na sub categoria "${SUBCATEGORIA}"

Então o produto "${PRODUTO}" deve ser listado na página de resultado da busca
    Conferir se o produto "${PRODUTO}" foi listado no site

Então a página deve exibir a mensagem "${MENSAGEM_ALERTA}"
    Conferir mensagem de erro "${MENSAGEM_ALERTA}"

Então deve abrir a pagina "${SUBCATEGORIA}"
    Conferir se é a pagina da subcategoria "${SUBCATEGORIA}"
    