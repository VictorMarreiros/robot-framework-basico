*** Settings ***
Documentation       Exemplo de uso de variáreis como argumentos em Keywords


*** Variable ***
&{PESSOA}           nome=Victor Marreiros   email=v.marreiros@teste.com     idade=22    sexo=masculino


*** Test Cases ***
Caso de teste de exemplo 01
    Uma keyword qualquer 01


*** Keywords ***
Uma keyword qualquer 01
    Uma subkeyword com argumentos       ${PESSOA.nome}      ${PESSOA.email}
    ${MENSAGEM_ALERTA}      Uma subkeyword com retorno      ${PESSOA.nome}      ${PESSOA.idade}
    Log     ${MENSAGEM_ALERTA}


Uma subkeyword com argumentos
    [Arguments]     ${NOME_USUARIO}     ${EMAIL_USUARIO}
    Log             Nome Usuário:       ${NOME_USUARIO}
    Log             Email:              ${EMAIL_USUARIO}


Uma subkeyword com retorno
    [Arguments]     ${NOME_USUARIO}     ${IDADE_USUARIO}
    ${MENSAGEM}     Set Variable If     ${IDADE_USUARIO}<18     Não autorizado! Ousuário ${NOME_USUARIO} é menor de idade!
    [Return]        ${MENSAGEM}