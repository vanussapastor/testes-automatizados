# Testes automatizados utilizando robot framework


**Tecnologias utilizada:**
 * Robot framework: 3.2.2
   * Mais informações disponível em https://robotframework.org/#libraries
 * Python: 3.9.2
   * Mais informações, disponível em: https://www.python.org/downloads/
 * Pip: 20.2.3
 * Node.js: 14.16.0
   * Para instalação, acesse https://nodejs.org/en/download/ 
 * SeleniumLibrary: Mais informações https://github.com/robotframework/SeleniumLibrary/
 * Baixar Webdriver: 
    * Chrome: https://chromedriver.chromium.org/home  
    * Mozilla Firefox: https://github.com/mozilla/geckodriver/releases/tag/v0.29.0 

Obs.: É recomendado o uso do nvm-windows para versionamento e instalação do node.js. Além disso, não é preciso instalar driver do firefox.


**Configurando a aplicação**

Para clonar o projeto:

`git clone git@github.com:vanussapastor/automation-practice.git`

Instalando no node.js (por causa da library robotframework browser):

 - Instalar o nvm-windows, disponível: https://github.com/coreybutler/nvm-windows
 - Executar a instalação padrão do Windows

`node -v`
`nvm install 14.16.0`

Para instalar a versão do Robot:
`pip install --upgrade robotframework==3.2.2`

Para instalar a library externa do SeleniumLibrary:
`pip install --upgrade robotframework-seleniumlibrary`

Acessar a pasta de suites de Testes
`cd automation-practice\suiteTestes`

Para rodar um determinado cenário
`robot -d ./relatorio cenarios\testeLogin.robot`

Rodar um teste específico, utilizar com nome datag específica inserir o trecho. Exemplo:
`robot -d ./relatorio -i cen4 cenarios\testeLogin.robot`
