*** Settings ***
Documentation       Documentação da API: https://fakerestapi.azurewebsites.net/swagger/v1/swagger.json
Resource            ./ResourceAPI.robot
Suite Setup   Conectar a minha API

*** Test Cases ***
Buscar a listagem de todos os livros (GET em todos os livros)
    Requisitar todos os livros
    Conferir o status code  200
    Conferir o reason       OK
    Conferir se retorna uma lista com 200 livros


#TO-DO: Buscar um livro especifico (GET em um livro especifico)
#   - Conferir se retorna todos os dados corretos do livro listado
#TO-DO: Cadastrar um novo livro (POST)
#   - Conferir se retorna todos os dados cadastrados para o livro
#TO-DO: Alterar um livro (PUT)
#   - Conferir se retorna todos os dados alterados do livro
#TO-DO: Deletar um livro (DELETE)
#   -Conferir se deleta o livro 200
