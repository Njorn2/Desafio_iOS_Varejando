# Varejando

## App Test iOS
Aplicativo iOS de Teste para Via Varejo.
Este aplicativo contém códigos de HTTP Request e criação de componentes de tela.

### Requisitos
* MacOS 
* XCode

### Como executar
* Abra o projeto Varejando.xcworkspace no XCode, selecione um Simulador e/ou iPhone fisico com iOS 11+
* Execute o projeto e espere o build e o attach no dispositvo.
* Caso tenha alguma dificuldade para executar o projeto, vá ao terminal e execute o comando ```pod install``` na pasta do projeto, onde está o arquivo ```Podfile```

### Ideias e Linhas de pensamento
* A ideia foi criar um App modular, leve, rapido e de facil manutenção.
* Foram usados apenas 3 frameworks, sendo eles 'SwiftLint', 'Quick' e 'Nimble'.
* A ideia era ter um controle e maior rapidez na hora de realizar o build, por isso não foram utilizados frameworks como Alamofire e/ou ObjectMapper
* Outra forma de deiar o build mais rapido, foi não utilizar XIBs e Storyboards.
* Todo o App foi feito em Swift, até mesmos componenst como CheckBox customizaveis e Slides de Imagens

### Arquiteturas e Tecnologias

#### Ao decorrer do desenvolvimento, tentei seguir o SOLID para conter uma arquitetura Limpa e Simples.
* VIPPER, Seguindo o SOLID, e como está sendo meu atual projeto de estudo, tentei seguir a risca a implementação com o padrão VIPPER.
* Quick & Nimble, Para facilicar os testes, foi utilizados os frameworks de testes Quick & Nimble.
* SwiftLint: Para realizar validações de Lint, foi utilizado o SwiftLint para ajudar.


### Solução
* Ao Implementar o modulo HTTPRequest & MockyAPI, sendo eles o core do Projeto, vemos que os modolos ficaram bem independendes, podendo ser passados para outros projetos de forma simples e com o minimo de correções.

### Problemas e Dificuldades
* Faz muito tempo que não trabalho com Front-End (UI/UX), atuando mais com Back-End criando Frameworks em COCOAPODS.
* Tempo para atuar no projeto.

### Tempo de Implementação
* Como o tempo para atuar foi pouco durante os dias/noites, e foi uma atuação com calma e zelo, foram aproximadanete uma semana e meia.

### Pontos Interessantes
* Ao londo do desenvolvimento, vemos que mesmo se perdendo um pouco da arquitetura proposta, durante o desenvolvimento dos componentes visuais, teve foi-se obtendo uma melhor forma de implement-los, abrindo um leque para melhorar seus códigos em updates futuros.

### App Usage
![](https://github.com/RuanGO/Desafio_iOS_Varejando/blob/master/VarejandoAPPScreen.gif?raw=true)
