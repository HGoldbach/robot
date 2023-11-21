*** Settings ***
Documentation    Resources dos testes do Spotify
Library    SeleniumLibrary

*** Variables ***
${USUARIO_LOGIN}               spotifytesteconta@gmail.com
${USUARIO_SENHA}               Spotify123# 
${BOTAO_BUSCAR}                //span[@data-encore-id='type'][contains(.,'Buscar')]
${BOTAO_INSERIR_LOGIN}         //input[contains(@type,'text')]   
${BOTAO_INSERIR_SENHA}         //input[contains(@type,'password')]
${BOTAO_FAZER_LOGIN}           //span[@class='ButtonInner-sc-14ud5tc-0 cJdEzG encore-bright-accent-set'][contains(.,'Entrar')]
${BOTAO_PERFIL}                //div[contains(@class,'KdxlBanhDJjzmHfqhP0X Q4hOdDPRDHPhfou2xbDg m95Ymx847hCaxHjmyXKX')]
${BOTAO_IDIOMAS}               //button[@data-testid='language-selection-button'][contains(.,'Português do Brasil')]
${BOTAO_IDIOMA_INGLES}         //button[@class='Gf_hXbIvfUvlnE_jnkw8'][contains(.,'EnglishEnglish')]  
${LINK_LOGIN}                  //span[@class='ButtonInner-sc-14ud5tc-0 bzuYkS encore-inverted-light-set'][contains(.,'Entrar')] 
${TEXTO_LOGIN}                 //h1[@class='Type__TypeElement-sc-goli3j-0 jaaEvK sc-bqWxrE gmSfcE'][contains(.,'Entrar no Spotify')]
${TEXTO_PAG_INICIAL}           //a[@draggable='false'][contains(.,'Playlists do Spotify')]
${INSERIR_MUSICA}              //input[contains(@class,'Type__TypeElement-sc-goli3j-0 ieTwfQ QO9loc33XC50mMRUCIvf')]
${LINK_ARTISTA}                //div[contains(@class,'_gB1lxCfXeR8_Wze5Cx9')]
${LINK_MUSICA}                 (//div[@class='iCQtmPqY0QvkumAOuCjr'][contains(.,'Fortunate SonCreedence Clearwater Revival')])[1]
${PLAY_MUSIC}                  //span[contains(@class,'ButtonInner-sc-14ud5tc-0 fGgTkO encore-bright-accent-set')]

*** Keywords ***
Abrir browser
    Open Browser    browser=firefox
    Maximize Browser Window

Fechar browser
    Capture Page Screenshot
    Close Browser

Acessar Spotify no endereço "${URL}"
    Go To    ${URL}
    Wait Until Element Is Visible    ${TEXTO_PAG_INICIAL}

Acessar Página de Login
    Click Element    locator=${LINK_LOGIN}

Fazer o Login
    Wait Until Element Is Visible    locator=${TEXTO_LOGIN}
    Input Text    ${BOTAO_INSERIR_LOGIN}    ${USUARIO_LOGIN}
    Input Text    ${BOTAO_INSERIR_SENHA}    ${USUARIO_SENHA}
    Click Element    locator=${BOTAO_FAZER_LOGIN}


Verificar se o Login foi Efetuado
    Wait Until Element Is Visible    locator=${BOTAO_PERFIL}
    Element Should Be Visible    locator=${BOTAO_PERFIL}

Buscar Artista
    Wait Until Element Is Visible    ${TEXTO_PAG_INICIAL}
    Click Element    locator=${BOTAO_BUSCAR}
    Input Text    ${INSERIR_MUSICA}    Avenged Sevenfold

Acessar Página do Artista
    Wait Until Element Is Visible    locator=${LINK_ARTISTA}
    Click Element    locator=${LINK_ARTISTA}

Verificar se a Página do Artista é exibida
    Wait Until Element Is Visible    locator=${PLAY_MUSIC}
    Element Should Be Visible    locator=//h1[@dir='auto'][contains(.,'Avenged Sevenfold')]
    
Acessar o Modal de Idiomas
    Click Element    locator=${BOTAO_IDIOMAS}

Alterar o Idioma para Inglês
    Wait Until Element Is Visible    locator=//h1[@data-encore-id='type'][contains(.,'Escolha um idioma')]
    Click Element    locator=${BOTAO_IDIOMA_INGLES}

Verificar se a Página Alterou para Inglês
    Wait Until Element Is Visible    locator=//a[@draggable='false'][contains(.,'Spotify Playlists')]
    Element Should Be Visible    locator=//a[@draggable='false'][contains(.,'Spotify Playlists')]

Buscar Música
    Wait Until Element Is Visible    ${TEXTO_PAG_INICIAL}
    Click Element    locator=${BOTAO_BUSCAR}
    Input Text    ${INSERIR_MUSICA}    Fortunate Son

Acessar Página da Música
    Wait Until Element Is Visible    locator=${LINK_MUSICA}
    Click Element    locator=${LINK_MUSICA}

Verificar se a Página da Música é exibida
    Wait Until Element Is Visible    locator=${PLAY_MUSIC}
    Element Should Be Visible    locator=//h1[@dir='auto'][contains(.,'Fortunate Son')]
