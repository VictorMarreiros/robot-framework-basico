*** Settings ***
Documentation           Documentação da API: https://fakerestapi.azurewebsites.net/index.html
Library                 RequestsLibrary
Library                 Collections


*** Variables ***
${URL_API}                https://fakerestapi.azurewebsites.net/api/v1/
${BOOK_ID}                201  
&{BOOK_15}                id=15   title=Book 15   pageCount=1500
&{BOOK_201}               id=${BOOK_ID}    title=Test Title    description=Test Description  pageCount=0     excerpt=string
&{BOOK_201_M}             id=${BOOK_ID}    title=Test ${BOOK_ID} Title    description=Test ${BOOK_ID} Description  pageCount=0     excerpt=string


*** Keywords ***
### SETUP E TEARDOWNS
Conectar a minha API
    Create Session      fakeAPI     ${URL_API}

### Ações
Requisitar todos os livros
    ${RESPOSTA}         GET On Session    fakeAPI     Books
    Set Test Variable   ${RESPOSTA}


Conferir o status code
    [Arguments]     ${STATUSCODE_DESEJADO}
    Should Be Equal As Strings      ${RESPOSTA.status_code}     ${STATUSCODE_DESEJADO}


Conferir o reason
    [Arguments]     ${REASON_DESEJADO}
    Should Be Equal As Strings      ${RESPOSTA.reason}      ${REASON_DESEJADO}


Conferir se retorna uma lista com "${QTD_LIVROS}" livros
    Length Should Be        ${RESPOSTA.json()}      ${QTD_LIVROS}


Requisitar o livro "${BOOK_ID}"
    ${RESPOSTA}         GET On Session    fakeAPI     Books/${BOOK_ID}
    Set Test Variable   ${RESPOSTA}


Conferir se retorna todos os dados corretos do livro listado
    Dictionary Should Contain Item      ${RESPOSTA.json()}      id                 ${BOOK_15.id}
    Dictionary Should Contain Item      ${RESPOSTA.json()}      title           ${BOOK_15.title}
    Dictionary Should Contain Item      ${RESPOSTA.json()}      pageCount   ${BOOK_15.pageCount}

    Should Not Be empty                 ${RESPOSTA.json()["description"]}
    Should Not Be empty                 ${RESPOSTA.json()["excerpt"]}
    Should Not Be empty                 ${RESPOSTA.json()["publishDate"]}
    Log Dictionary                      ${RESPOSTA.json()}


Cadastrar o livro "${BOOK_ID}"
    ${HEADERS}         Create Dictionary    content-type=application/json 
    ${RESPOSTA}        POST On Session      fakeAPI     Books
    ...                                     data={"id": ${BOOK_ID}, "title": "Test Title", "description": "Test Description", "pageCount": 0, "excerpt": "string", "publishDate": "2021-03-21T05:19:37.643Z"}
    ...                                     headers=${HEADERS}
    Set Test Variable   ${RESPOSTA}


Conferir se retorna todos os dados cadastrados para o livro
    Dictionary Should Contain Item      ${RESPOSTA.json()}      id                       ${BOOK_201.id}
    Dictionary Should Contain Item      ${RESPOSTA.json()}      title                 ${BOOK_201.title}
    Dictionary Should Contain Item      ${RESPOSTA.json()}      description     ${BOOK_201.description}
    Dictionary Should Contain Item      ${RESPOSTA.json()}      pageCount         ${BOOK_201.pageCount}
    Dictionary Should Contain Item      ${RESPOSTA.json()}      excerpt             ${BOOK_201.excerpt}

    Should Not Be empty                 ${RESPOSTA.json()["publishDate"]}
    Log Dictionary                      ${RESPOSTA.json()}


Alterar o livro "${BOOK_ID}"
    ${HEADERS}          Create Dictionary    content-type=application/json 
    ${RESPOSTA}         PUT On Session       fakeAPI     Books/${BOOK_ID}
    ...                                      data={"id": ${BOOK_ID}, "title": "Test ${BOOK_ID} Title", "description": "Test ${BOOK_ID} Description", "pageCount": 0, "excerpt": "string"}
    ...                                      headers=${HEADERS}
    Set Test Variable   ${RESPOSTA}


Conferir se retorna todos os dados alterados do livro
    Dictionary Should Contain Item      ${RESPOSTA.json()}      id                       ${BOOK_201_M.id}
    Dictionary Should Contain Item      ${RESPOSTA.json()}      title                 ${BOOK_201_M.title}
    Dictionary Should Contain Item      ${RESPOSTA.json()}      description     ${BOOK_201_M.description}
    Dictionary Should Contain Item      ${RESPOSTA.json()}      pageCount         ${BOOK_201_M.pageCount}
    Dictionary Should Contain Item      ${RESPOSTA.json()}      excerpt             ${BOOK_201_M.excerpt}

    Should Not Be empty                 ${RESPOSTA.json()["publishDate"]}
    Log Dictionary                      ${RESPOSTA.json()}


Deletar o livro "${BOOK_ID}"
    ${HEADERS}          Create Dictionary   content-type=application/json 
    ${RESPOSTA}         DELETE On Session   fakeAPI     Books/${BOOK_ID}
    Set Test Variable   ${RESPOSTA}


Conferir se deleta os dados do livro "${BOOK_ID}"
    ${RESPOSTA}                                GET On Session      fakeAPI     Books/${BOOK_ID}
    Should Be Equal As Strings                 ${RESPOSTA.status_code}                      404
    Should Be Equal As Strings                 ${RESPOSTA.reason}                    Not Found
    Log Dictionary                             ${RESPOSTA.json()}