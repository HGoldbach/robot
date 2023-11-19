*** Settings ***
Documentation     Demonstração do RobotFramework com o Spotify
Test Setup        Abrir browser
Test Teardown     Fechar browser
Resource          resources.robot

*** Test Cases ***

CT01: Fazer login no Spotify
    [Documentation]  Realiza o login no site Spotify
    [Tags]  login
    Acessar Spotify no endereço "https://open.spotify.com/" 
    Acessar Página de Login
    Fazer o Login
    Verificar se o Login foi Efetuado

CT02: Acessar Página de um Artista no Spotify
    [Documentation]  Verifica se a página do artista é exibida corretamente
    [Tags]  busca     
    Acessar Spotify no endereço "https://open.spotify.com/"
    Buscar Artista
    Acessar Página do Artista
    Verificar se a Página do Artista é exibida

CT03: Alterar o idioma do Spotify
    [Documentation]  Altera o idioma do Spotify
    [Tags]  configuracao
    Acessar Spotify no endereço "https://open.spotify.com/" 
    Acessar o Modal de Idiomas
    Alterar o Idioma para Inglês
    Verificar se a Página Alterou para Inglês



