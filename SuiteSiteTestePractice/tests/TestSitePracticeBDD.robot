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

Caso de teste 4: Adicionar Produto no Carrinho
    Dado que estou na página home do site
    Quando eu pesquisar pelo produto "t-shirt"
    E clicar no botão "Add to cart" do produto
    E clicar no botão "Proceed to checkout"
    Então deve abrir a pagina do carrinho com um produto adicionado

Caso de teste 5: Remover Produto
    Dado que estou na página home do site
    Quando eu pesquisar pelo produto "t-shirt"
    E clicar no botão "Add to cart" do produto
    E clicar no botão "Proceed to checkout"
    E voltar para pagina home
    E clicar no icone carrinho de compras
    E clicar no botão de remoção de produtos "Delete" 
    Então devo ver a mensagem "Your shopping cart is empty."

Caso de teste 6: Adicionar Cliente
    Dado que estou na página home do site
    Quando clico no botão "Sign in"
    E inserir um e-mail válido
    E clicar no botão "Create an account"
    E preencher os campos obrigatórios
    E clicar em "Register" para finalizar
    Então o cadastro deve ser finalizado com sucesso


*** Keywords ***
Dado que estou na página home do site
    Acessar pagina home do site

Quando eu pesquisar pelo produto "${PRODUTO}"
    Digitar o nome do produto "${PRODUTO}" no campo de Pesquisa
    Clicar no botão Pesquisar

Quando passar o mouse por cima da categoria "${CATEGORIA}"
    Passar mouse por cima da categoria "${CATEGORIA}" no menu principal superior de categorias

E voltar para pagina home
    Voltar para pagina home do site

E clicar no icone carrinho de compras
    Clicar no icone carrinho de compras no menu superior direito

E clicar no botão de remoção de produtos "${DELETE}"
    Clicar no botão de remoção de produtos "${DELETE}" no produto do carrinho

E clicar no botão "${ADD_CARRINHO}" do produto
    Clicar no botão "${ADD_CARRINHO}" do produto

E clicar no botão "${BTN_CHECKOUT}"
    Clicar no botão "${BTN_CHECKOUT}"

E clicar na subcategoria "${SUBCATEGORIA}"
    Clicar na sub categoria "${SUBCATEGORIA}"

Então o produto "${PRODUTO}" deve ser listado na página de resultado da busca
    Conferir se o produto "${PRODUTO}" foi listado no site

Então a página deve exibir a mensagem "${MENSAGEM_ALERTA}"
    Conferir mensagem de erro "${MENSAGEM_ALERTA}"

Então deve abrir a pagina "${SUBCATEGORIA}"
    Conferir se é a pagina da subcategoria "${SUBCATEGORIA}"

Então deve abrir a pagina do carrinho com um produto adicionado
    Conferir se o produto foi adicionado ao carrinho

Então devo ver a mensagem "${MSG_EMPTY_CART}"
    Conferir mensagem "${MSG_EMPTY_CART}"