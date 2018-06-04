# NodeJS

## O que é

É uma plataforma criada em cima do motor _JavaScript V8_ do Google Chrome que nos possibilita executar códigos _JavaScript_ diretamente no servidor. Ideal para o desenvolvimento de aplicações em que haja uma constante comunicação entre o _Client_ e o _Server_, alem de troca de dados entre dispositivos distribuídos. Exemplos de sua aplicabilidade seriam serviços de _Chats_, _Feed de notícias_ e _Web push notifications_.

## Como funciona

Ao contrário de outras linguagens como **Java** ou **Ruby**, **NodeJS** é _single thread_, ou seja, trabalha e executa uma _Thread_ por processo iniciado. Mas existem bibliotecas e outras maneiras que permitem que essa funcionalidade seja incorporada ao **NodeJS**.

Outra forma de processamento paralelo é o conceito de _Assincronismo_. O _NodeJS_ trabalha com eventos de _I/O não bloqueantes_, ou seja, caso a aplicação em questão necessite fazer um processo paralelo como ler um grande arquivo, essa tarefa será colocada em _background_, e após a fila de tarefas for terminada, o _callback_ da leitura do arquivo será chamado.

Um exemplo de uma de suas principais características é poder trabalhar com múltiplas conexões e trabalhar com cada uma, a partir da requisição, o _callback_ é acionado e a _response_ é enviada. Caso não haja processos a serem trabalhados, o **NodeJS** irá dormir.

```javascript
const http = require('http')

const hostname = 'localhost'
const port = 8000

const server = http.createServer((req, res) => {
    res.statusCode(200)
    res.json({ data: 'Hello, world!' })
})

server.listen(port, hostname, () => {
    console.log(`Server running at http://${hostname}:${port}/`)
})
```

## Por que NodeJS

Isso é um grande contraste com a maneira atual, onde operações com o sistema operacional são empregadas. Sendo _threads_ baseadas em rede relativamente difíceis e ineficientes para serem usadas. Porem usuários do **NodeJS** estão livres de processos _dead-locking_, já que quase nenhuma função no Node realiza _I/O_, então o processo nunca é interrompido.

### Entendendo _blocking_ e _non-blocking_

 _Blocking_ se refere quado a execução tem que ser interrompida pois **JavaScript** adicional teve que esperar para que operações **non-JavaScript** fossem executadas. Isso ocorre pois não se pode executar **JavaScript** enquanto um  processo _blocking_ está ocorrendo.

Em **NodeJS**, o **JavaScript** que apresenta um uso insatisfatório da _CPU_ ao invés de aguardar um processo **non-JavaScript** como _I/O_ geralmente não é referenciado como _blocking_. Métodos síncronos são os mais comuns usando operações  de _blocking_. Módulos nativos do **NodeJS** também tem métodos _blocking_.

Todos os métodos que realizam _I/O_ no **NodeJS** oferecem alternativas assíncronas sendo _non-blocking_, aceitando funções de _callback_. Para esses métodos, funções síncronas, sendo _blocking_, também são oferecidas, apresentado como sufixo _Sync_.

* Uma operação síncrona (_blocking_)

```javascript
const fs = require('fs')

const data = fs.readFileSync('./file.md')
console.log(data)
moreWork()
```

> A função _moreWork_ será executada APÓS o console.log.

* Uma operação assíncrona (_non-blocking_)

```javascript
const fs = require('fs')

fs.readFile('./file.md', (err, data) => {
    if (err) throw err
    console.log(data)
})
moreWork()
```

> A função _moreWork_ será executada ANTES do console.log

Para entender melhor, no primeiro exemplo, `moreWork()` será executada após `console.log()`, tornado a operação de leitura _blocking_ e impedindo que se continue o processamento ate que a mesma seja finalizada. Já no segundo exemplo, um _callback_ é informado para a função, que logo depois de ser concluída irá chama-lo para executa-lo, tornado-a _non-blocking_ e permitindo que a execução prossiga.

## _Event Loop_

O **NodeJS** é totalmente guiado por eventos, termo que ficou conhecido como _Event Driven_, por sua vez, esse conceito se refere a um fluxo determinado de acontecimentos, eventos ou alterações de estado que possam ocorrer, em que caso essas mudanças ocorram, _callback_ definidas para cada uma sejam ativados e chamados. Isso já em bem conhecido e popular para usuários de **JavaScript** no _front-end_ como o _onClick, _onHide_, _onHide_ que são bem comuns.

```mermaid
sequenceDiagram
participant ES as Event Stack
participant EL as Event Loop
participant TP as Thread Pool
participant TQ as Task Queue
loop Event Driven
Note over ES: Open
Note over ES: Request
Note over ES: Connect
ES->>EL:.
EL->>TP:.
Note over TP: Network
Note over TP: File System
Note over TP: Database
TP->>TQ:.
Note over TQ: Open
TQ->>ES:.
end
```