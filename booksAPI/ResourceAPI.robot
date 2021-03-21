*** Settings ***
Documentation           Documentação da API: https://fakerestapi.azurewebsites.net/index.html
Library                 ResquestsLibrary
Library                 Collections


*** Variables ***
${URL_API}              https://fakerestapi.azurewebsites.net/api/v1/Books

*** Keywords ***
### SETUP E TEARDOWNS
Conectar a minha API
    Create Session      fakeAPI     ${URL_API}

### Ações
Requisitar todos os livros
    ${RESPOSTA}     Get Resquest    fakeAPI     Books
    Log             ${RESPOSTA.json()}

Conferir o status code
    [Arguments]     ${STATUSCODE_DESEJADO}
    Should Be Equal As Strings      ${RESPOSTA.status_code}     ${STATUSCODE_DESEJADO}

Conferir o reason
    [Arguments]     ${REASON_DESEJADO}
    Should Be Equal As Strings      ${RESPOSTA.reason}      ${REASON_DESEJADO}
