# NodeJS

## O que é

É uma plataforma criada em cima do motor _JavaScript V8_ do Google Chrome que nos possibilita executar códigos _JavaScript_ diretamente no servidor. Ideal para o desenvolvimento de aplicações em que haja uma constante comunicação entre o ***Client*** e o ***Server***, alem de troca de dados entre dispositivos distribuídos. Exemplos de sua aplicabilidade seriam serviços de _Chats_, _Feed de notícias_ e _Web push notifications_.

## Como funciona

Ao contrário de outras linguagens como **Java** ou **Ruby**, _NodeJS_ é _single thread_, ou seja, trabalha e executa uma _Thread_ por processo iniciado. Mas existem bibliotecas e outras maneiras que permitem que essa funcionalidade seja incorporada ao **NodeJS**.

Outra forma de processamento paralelo é o conceito de _Assincronismo_. O _NodeJS_ trabalha com eventos de ***I/O não bloqueantes***, ou seja, caso a aplicação em questão necessite fazer um processo paralelo como ler um grande arquivo, essa tarefa será colocada em _background_, e após a fila de tarefas for terminada, o ***callback*** da leitura do arquivo será chamado.